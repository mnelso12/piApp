//
//  practiceVC.m
//  learnPi
//
//  Created by MadelynNelson on 11/4/15.
//  Copyright (c) 2015 Madelyn Nelson. All rights reserved.
//

#import "practiceVC.h"
#import <CoreText/CoreText.h>
#import "piReal.h"
#import "colors.h"

@implementation practiceVC

NSString *pi = @"";
int currentDigit = 0;
CGFloat screenWidth;
CGFloat screenHeight;
NSString *piRealString;
colors *colorInst;
NSString *highScore;

- (void)viewDidLoad {
    [super viewDidLoad];
    pi = @"";
    
    colorInst = [[colors alloc] init];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenWidth = screenRect.size.width;
    screenHeight = screenRect.size.height;
    
    currentDigit = 0; // do I need this?
    
    // should never be nil, start with it equalling the default high score
    highScore = [[NSUserDefaults standardUserDefaults] objectForKey:@"HighScore"];
    if (highScore == (id)[NSNull null])
    {
        NSLog(@"SHOULD NEVER BE IN HERE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        highScore = @"0";
    }
    
    [self loadScoreLabels];
    [self loadKeypad];
    [self initializePiLabel];
    
    self.view.backgroundColor = colorInst.playBackgroundColor;
    
    piReal *piInst = [[piReal alloc] init];
    piRealString = piInst.piString;
    
}

- (void)initializePiLabel
{
    self.piLabel = [[UILabel alloc] initWithFrame:CGRectMake(30,50,screenWidth-60,70)];
    self.piLabel.font = [UIFont fontWithName:@"Verdana" size:60];
    self.piLabel.backgroundColor = [UIColor grayColor];
    self.piLabel.lineBreakMode = NSLineBreakByTruncatingHead;
    self.piLabel.layer.cornerRadius = 10.0f;
    self.piLabel.layer.masksToBounds = YES;
    [self.view addSubview:self.piLabel];
}

- (void)updatePiLabel
{
    self.piLabel.text = pi;
    [self updateCurrentDigit];
    [self updatePiColors];
}

- (void)updateCurrentDigit
{
    currentDigit++;
    self.currentDigitLabel.text = [NSString stringWithFormat:@"%@%d", @"Current Digit: ", currentDigit];
}

- (void)updateHighScore
{
    // fill this in
}

- (void)loadScoreLabels
{
    // should do this in terms of screen height and width

    // high score
    self.highScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(50,120+(screenWidth/10-50),200,50)];
    self.highScoreLabel.font = [UIFont fontWithName:colorInst.themeFont size:20];
    self.highScoreLabel.text = [NSString stringWithFormat:@"%@%@", @"High Score: ", highScore];
    self.highScoreLabel.layer.cornerRadius = 10.0f;
    self.highScoreLabel.textColor = [UIColor whiteColor];
    //self.highScoreLabel.backgroundColor = [UIColor grayColor];
    self.highScoreLabel.layer.masksToBounds = YES;
    self.highScoreLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.highScoreLabel];
    
    // current digit
    self.currentDigitLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth-200-50,120+(screenWidth/10-50),200,50)];
    self.currentDigitLabel.font = [UIFont fontWithName:colorInst.themeFont size:20];
    self.currentDigitLabel.text = @"Current Digit: 0";
    self.currentDigitLabel.layer.cornerRadius = 10.0f;
    self.currentDigitLabel.textColor = [UIColor whiteColor];
    //self.currentDigitLabel.backgroundColor = [UIColor grayColor];
    self.currentDigitLabel.layer.masksToBounds = YES;
    self.currentDigitLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.currentDigitLabel];
    
    // strikes (for play only)
    self.strikesLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth/2-100,120+(screenWidth/10-50),200,50)];
    self.strikesLabel.font = [UIFont fontWithName:colorInst.themeFont size:30];
    self.strikesLabel.text = [NSString stringWithFormat:@"XXX"];
    self.strikesLabel.textColor = [UIColor redColor];
    self.strikesLabel.layer.masksToBounds = YES;
    self.strikesLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.strikesLabel];
}

- (bool)isDigitCorrect:(NSString *)input
{
    NSString *tempStr = [piRealString substringWithRange:NSMakeRange(currentDigit, 1)];
    if ([tempStr isEqualToString:input])
    {
        NSLog(@"yes");
        return YES;
    }
    NSLog(@"no");
    return NO;
}

- (void)loadKeypad
{
    colors *colorInst = [[colors alloc] init];
    CGFloat radius;
    
    NSLog(@"screen width = %f", screenWidth);
    if (screenWidth < 568.0) // is iPhone 4 or less
    {
        radius = 30; // test this
    }
    else if (screenWidth == 568.0) // is iPhone 5
    {
        radius = 35; // test this
    }
    else if (screenWidth == 667.0) // is iPhone 6
    {
        radius = 40;
    }
    else if (screenWidth == 736.0) // is iPhone 6+, WHAT ABOUT IPHONE 7??!???!
    {
        radius = 45; // test this
    }
    else if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) // is iPad
    {
        radius = 50; // test this
    }
    else if ([[UIScreen mainScreen] scale] >= 2.0) // is retina
    {
        radius = 40; // test this, idk
    }

    CGFloat diameter = 2*radius;
    CGFloat upperHeight = screenHeight*.55;
    CGFloat lowerHeight = screenHeight*.75;
    CGFloat lowerSpace = (screenWidth-(6*diameter))/7;
    CGFloat upperSpace = lowerSpace;
    
    // gross all these tap gestures, why did Apple make this so gross?!
    UITapGestureRecognizer *singleFingerTapOne =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTapOne:)];
    UITapGestureRecognizer *singleFingerTapTwo =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTapTwo:)];
    UITapGestureRecognizer *singleFingerTapThree =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTapThree:)];
    UITapGestureRecognizer *singleFingerTapFour =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTapFour:)];
    UITapGestureRecognizer *singleFingerTapZero =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTapZero:)];
    UITapGestureRecognizer *singleFingerTapFive =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTapFive:)];
    UITapGestureRecognizer *singleFingerTapSix =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTapSix:)];
    UITapGestureRecognizer *singleFingerTapSeven =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTapSeven:)];
    UITapGestureRecognizer *singleFingerTapEight =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTapEight:)];
    UITapGestureRecognizer *singleFingerTapNine =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTapNine:)];
    UITapGestureRecognizer *singleFingerTapDot =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(handleSingleTapDot:)];

    // upper row
    // 0 button
    self.zeroView = [[UIView alloc] initWithFrame:CGRectMake(.5*upperSpace+radius+upperSpace, upperHeight, diameter, diameter)];
    self.zeroView.layer.borderColor = colorInst.zeroColor.CGColor;
    self.zeroView.layer.borderWidth = 2.0f;
    self.zeroView.layer.cornerRadius = radius;
    [self.zeroView addGestureRecognizer:singleFingerTapZero];
    
    self.zeroLabel = [[UILabel alloc] initWithFrame:CGRectMake(radius/2,radius/2, radius, radius)];
    self.zeroLabel.text = @"0";
    self.zeroLabel.font = [UIFont fontWithName:colorInst.themeFont size:30];
    self.zeroLabel.textColor = colorInst.zeroColor;
    self.zeroLabel.textAlignment = NSTextAlignmentCenter;
    [self.zeroView addSubview:self.zeroLabel];
    
    // 1 button
    self.oneView = [[UIView alloc] initWithFrame:CGRectMake(.5*upperSpace+radius+2*upperSpace+diameter, upperHeight, diameter, diameter)];
    self.oneView.layer.borderColor = colorInst.oneColor.CGColor;
    self.oneView.layer.borderWidth = 2.0f;
    self.oneView.layer.cornerRadius = radius;
    [self.oneView addGestureRecognizer:singleFingerTapOne];
    
    self.oneLabel = [[UILabel alloc] initWithFrame:CGRectMake(radius/2,radius/2, radius, radius)];
    self.oneLabel.text = @"1";
    self.oneLabel.font = [UIFont fontWithName:colorInst.themeFont size:30];
    self.oneLabel.textColor = colorInst.oneColor;
    self.oneLabel.textAlignment = NSTextAlignmentCenter;
    [self.oneView addSubview:self.oneLabel];

    
    // 2 button
    self.twoView = [[UIView alloc] initWithFrame:CGRectMake(.5*upperSpace+radius+3*upperSpace+2*diameter, upperHeight, diameter, diameter)];
    self.twoView.layer.borderColor = colorInst.twoColor.CGColor;
    self.twoView.layer.borderWidth = 2.0f;
    self.twoView.layer.cornerRadius = radius;
    [self.twoView addGestureRecognizer:singleFingerTapTwo];
    
    self.twoLabel = [[UILabel alloc] initWithFrame:CGRectMake(radius/2,radius/2, radius, radius)];
    self.twoLabel.text = @"2";
    self.twoLabel.font = [UIFont fontWithName:colorInst.themeFont size:30];
    self.twoLabel.textColor = colorInst.twoColor;
    self.twoLabel.textAlignment = NSTextAlignmentCenter;
    [self.twoView addSubview:self.twoLabel];
    
    // 3 button
    self.threeView = [[UIView alloc] initWithFrame:CGRectMake(.5*upperSpace+radius+4*upperSpace+3*diameter, upperHeight, diameter, diameter)];
    self.threeView.layer.borderColor = colorInst.threeColor.CGColor;
    self.threeView.layer.borderWidth = 2.0f;
    self.threeView.layer.cornerRadius = radius;
    [self.threeView addGestureRecognizer:singleFingerTapThree];
    
    self.threeLabel = [[UILabel alloc] initWithFrame:CGRectMake(radius/2,radius/2, radius, radius)];
    self.threeLabel.text = @"3";
    self.threeLabel.font = [UIFont fontWithName:colorInst.themeFont size:30];
    self.threeLabel.textColor = colorInst.threeColor;
    self.threeLabel.textAlignment = NSTextAlignmentCenter;
    [self.threeView addSubview:self.threeLabel];
    
    // 4 button
    self.fourView = [[UIView alloc] initWithFrame:CGRectMake(.5*upperSpace+radius+5*upperSpace+4*diameter, upperHeight, diameter, diameter)];
    self.fourView.layer.borderColor = colorInst.fourColor.CGColor;
    self.fourView.layer.borderWidth = 2.0f;
    self.fourView.layer.cornerRadius = radius;
    [self.fourView addGestureRecognizer:singleFingerTapFour];
    
    self.fourLabel = [[UILabel alloc] initWithFrame:CGRectMake(radius/2,radius/2, radius, radius)];
    self.fourLabel.text = @"4";
    self.fourLabel.font = [UIFont fontWithName:colorInst.themeFont size:30];
    self.fourLabel.textColor = colorInst.fourColor;
    self.fourLabel.textAlignment = NSTextAlignmentCenter;
    [self.fourView addSubview:self.fourLabel];
    
    // lower row
    
    // 5 button
    self.fiveView = [[UIView alloc] initWithFrame:CGRectMake(lowerSpace, lowerHeight, diameter, diameter)];
    self.fiveView.layer.borderColor = colorInst.fiveColor.CGColor;
    self.fiveView.layer.borderWidth = 2.0f;
    self.fiveView.layer.cornerRadius = radius;
    [self.fiveView addGestureRecognizer:singleFingerTapFive];
    
    self.fiveLabel = [[UILabel alloc] initWithFrame:CGRectMake(radius/2,radius/2, radius, radius)];
    self.fiveLabel.text = @"5";
    self.fiveLabel.font = [UIFont fontWithName:colorInst.themeFont size:30];
    self.fiveLabel.textColor = colorInst.fiveColor;
    self.fiveLabel.textAlignment = NSTextAlignmentCenter;
    [self.fiveView addSubview:self.fiveLabel];
    
    // 6 button
    self.sixView = [[UIView alloc] initWithFrame:CGRectMake(2*lowerSpace+1*diameter, lowerHeight, diameter, diameter)];
    self.sixView.layer.borderColor = colorInst.sixColor.CGColor;
    self.sixView.layer.borderWidth = 2.0f;
    self.sixView.layer.cornerRadius = radius;
    [self.sixView addGestureRecognizer:singleFingerTapSix];
    
    self.sixLabel = [[UILabel alloc] initWithFrame:CGRectMake(radius/2,radius/2, radius, radius)];
    self.sixLabel.text = @"6";
    self.sixLabel.font = [UIFont fontWithName:colorInst.themeFont size:30];
    self.sixLabel.textColor = colorInst.sixColor;
    self.sixLabel.textAlignment = NSTextAlignmentCenter;
    [self.sixView addSubview:self.sixLabel];
    
    // 7 button
    self.sevenView = [[UIView alloc] initWithFrame:CGRectMake(3*lowerSpace+2*diameter, lowerHeight, diameter, diameter)];
    self.sevenView.layer.borderColor = colorInst.sevenColor.CGColor;
    self.sevenView.layer.borderWidth = 2.0f;
    self.sevenView.layer.cornerRadius = radius;
    [self.sevenView addGestureRecognizer:singleFingerTapSeven];
    
    self.sevenLabel = [[UILabel alloc] initWithFrame:CGRectMake(radius/2,radius/2, radius, radius)];
    self.sevenLabel.text = @"7";
    self.sevenLabel.font = [UIFont fontWithName:colorInst.themeFont size:30];
    self.sevenLabel.textColor = colorInst.sevenColor;
    self.sevenLabel.textAlignment = NSTextAlignmentCenter;
    [self.sevenView addSubview:self.sevenLabel];
    
    // 8 button
    self.eightView = [[UIView alloc] initWithFrame:CGRectMake(4*lowerSpace+3*diameter, lowerHeight, diameter, diameter)];
    self.eightView.layer.borderColor = colorInst.eightColor.CGColor;
    self.eightView.layer.borderWidth = 2.0f;
    self.eightView.layer.cornerRadius = radius;
    [self.eightView addGestureRecognizer:singleFingerTapEight];
    
    self.eightLabel = [[UILabel alloc] initWithFrame:CGRectMake(radius/2,radius/2, radius, radius)];
    self.eightLabel.text = @"8";
    self.eightLabel.font = [UIFont fontWithName:colorInst.themeFont size:30];
    self.eightLabel.textColor = colorInst.eightColor;
    self.eightLabel.textAlignment = NSTextAlignmentCenter;
    [self.eightView addSubview:self.eightLabel];
    
    // 9 button
    self.nineView = [[UIView alloc] initWithFrame:CGRectMake(5*lowerSpace+4*diameter, lowerHeight, diameter, diameter)];
    self.nineView.layer.borderColor = colorInst.nineColor.CGColor;
    self.nineView.layer.borderWidth = 2.0f;
    self.nineView.layer.cornerRadius = radius;
    [self.nineView addGestureRecognizer:singleFingerTapNine];
    
    self.nineLabel = [[UILabel alloc] initWithFrame:CGRectMake(radius/2,radius/2, radius, radius)];
    self.nineLabel.text = @"9";
    self.nineLabel.font = [UIFont fontWithName:colorInst.themeFont size:30];
    self.nineLabel.textColor = colorInst.nineColor;
    self.nineLabel.textAlignment = NSTextAlignmentCenter;
    [self.nineView addSubview:self.nineLabel];
    
    // . button
    self.dotView = [[UIView alloc] initWithFrame:CGRectMake(6*lowerSpace+5*diameter, lowerHeight, diameter, diameter)];
    self.dotView.layer.borderColor = colorInst.dotColor.CGColor;
    self.dotView.layer.borderWidth = 2.0f;
    self.dotView.layer.cornerRadius = radius;
    [self.dotView addGestureRecognizer:singleFingerTapDot];
    
    self.dotLabel = [[UILabel alloc] initWithFrame:CGRectMake(radius/2,radius/2, radius, radius)];
    self.dotLabel.text = @".";
    self.dotLabel.font = [UIFont fontWithName:colorInst.themeFont size:30];
    self.dotLabel.textColor = colorInst.dotColor;
    self.dotLabel.textAlignment = NSTextAlignmentCenter;
    [self.dotView addSubview:self.dotLabel];
   


    [self.view addSubview:self.zeroView];
    [self.view addSubview:self.oneView];
    [self.view addSubview:self.twoView];
    [self.view addSubview:self.threeView];
    [self.view addSubview:self.fourView];
    [self.view addSubview:self.fiveView];
    [self.view addSubview:self.sixView];
    [self.view addSubview:self.sevenView];
    [self.view addSubview:self.eightView];
    [self.view addSubview:self.nineView];
    [self.view addSubview:self.dotView];

}

- (void) updatePiColors
{
    colors *colorInst = [[colors alloc] init];
    
    NSMutableAttributedString *text =
    [[NSMutableAttributedString alloc]
     initWithAttributedString: self.piLabel.attributedText];
    
    int count = 0;
    while(count < (int)[pi length])
    {
        NSString *tempStr = [pi substringWithRange:NSMakeRange(count, 1)];
        if ([tempStr isEqualToString:@"0"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:colorInst.zeroColor
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"1"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:colorInst.oneColor
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"2"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:colorInst.twoColor
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"3"])
        {
            NSLog(@"count = %i", count);
            [text addAttribute:NSForegroundColorAttributeName
                         value:colorInst.threeColor
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"4"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:colorInst.fourColor
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"5"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:colorInst.fiveColor
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"6"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:colorInst.sixColor
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"7"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:colorInst.sevenColor
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"8"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:colorInst.eightColor
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"9"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:colorInst.nineColor
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"."])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:colorInst.dotColor
                         range:NSMakeRange(count,1)];
        }
        else
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[UIColor blackColor]
                         range:NSMakeRange(count,1)];
        }
        count++;
    }
    
    [self.piLabel setAttributedText: text];
    
}

- (void)recolorViews
{
    self.zeroView.backgroundColor = [UIColor clearColor];
    self.zeroView.layer.borderColor = colorInst.zeroColor.CGColor;
    self.zeroLabel.textColor = colorInst.zeroColor;
    
    self.oneView.backgroundColor = [UIColor clearColor];
    self.oneView.layer.borderColor = colorInst.oneColor.CGColor;
    self.oneLabel.textColor = colorInst.oneColor;
    
    self.twoView.backgroundColor = [UIColor clearColor];
    self.twoView.layer.borderColor = colorInst.twoColor.CGColor;
    self.twoLabel.textColor = colorInst.twoColor;
    
    self.threeView.backgroundColor = [UIColor clearColor];
    self.threeView.layer.borderColor = colorInst.threeColor.CGColor;
    self.threeLabel.textColor = colorInst.threeColor;
    
    self.fourView.backgroundColor = [UIColor clearColor];
    self.fourView.layer.borderColor = colorInst.fourColor.CGColor;
    self.fourLabel.textColor = colorInst.fourColor;
    
    self.fiveView.backgroundColor = [UIColor clearColor];
    self.fiveView.layer.borderColor = colorInst.fiveColor.CGColor;
    self.fiveLabel.textColor = colorInst.fiveColor;
    
    self.sixView.backgroundColor = [UIColor clearColor];
    self.sixView.layer.borderColor = colorInst.sixColor.CGColor;
    self.sixLabel.textColor = colorInst.sixColor;
    
    self.sevenView.backgroundColor = [UIColor clearColor];
    self.sevenView.layer.borderColor = colorInst.sevenColor.CGColor;
    self.sevenLabel.textColor = colorInst.sevenColor;
    
    self.eightView.backgroundColor = [UIColor clearColor];
    self.eightView.layer.borderColor = colorInst.eightColor.CGColor;
    self.eightLabel.textColor = colorInst.eightColor;
    
    self.nineView.backgroundColor = [UIColor clearColor];
    self.nineView.layer.borderColor = colorInst.nineColor.CGColor;
    self.nineLabel.textColor = colorInst.nineColor;
    
    self.dotView.backgroundColor = [UIColor clearColor];
    self.dotView.layer.borderColor = colorInst.dotColor.CGColor;
    self.dotLabel.textColor = colorInst.dotColor;

    
}

-(void) handleSingleTapZero:(UITapGestureRecognizer *)gr
{
    [self recolorViews];
    self.zeroView.backgroundColor = colorInst.zeroColor;
    self.zeroLabel.textColor = colorInst.playBackgroundColor;
    self.zeroView.layer.borderColor = colorInst.playBackgroundColor.CGColor;
    if ([self isDigitCorrect:@"0"])
    {
        NSLog(@"0 is correct");
    pi = [pi stringByAppendingString:@"0"];
    [self updatePiLabel];
    }
}

-(void) handleSingleTapOne:(UITapGestureRecognizer *)gr
{
    [self recolorViews];
    self.oneView.backgroundColor = colorInst.oneColor;
    self.oneLabel.textColor = colorInst.playBackgroundColor; // use black or white????????
    self.oneView.layer.borderColor = colorInst.playBackgroundColor.CGColor;
    if ([self isDigitCorrect:@"1"])
    {
        NSLog(@"1 is correct");
        pi = [pi stringByAppendingString:@"1"];
        [self updatePiLabel];
    }
}

-(void) handleSingleTapTwo:(UITapGestureRecognizer *)gr
{
    [self recolorViews];
    self.twoView.backgroundColor = colorInst.twoColor;
    self.twoLabel.textColor = colorInst.playBackgroundColor;
    self.twoView.layer.borderColor = colorInst.playBackgroundColor.CGColor;
    if ([self isDigitCorrect:@"2"])
    {
        NSLog(@"2 is correct");
    pi = [pi stringByAppendingString:@"2"];
    [self updatePiLabel];
    }
}

-(void) handleSingleTapThree:(UITapGestureRecognizer *)gr
{
    [self recolorViews];
    self.threeView.backgroundColor = colorInst.threeColor;
    self.threeLabel.textColor = colorInst.playBackgroundColor;
    self.threeView.layer.borderColor = colorInst.playBackgroundColor.CGColor;
    if ([self isDigitCorrect:@"3"])
    {
        NSLog(@"3 is correct");
    pi = [pi stringByAppendingString:@"3"];
    [self updatePiLabel];
    }
}

-(void) handleSingleTapFour:(UITapGestureRecognizer *)gr
{
    [self recolorViews];
    self.fourView.backgroundColor = colorInst.fourColor;
    self.fourLabel.textColor = colorInst.playBackgroundColor;
    self.fourView.layer.borderColor = colorInst.playBackgroundColor.CGColor;
    if ([self isDigitCorrect:@"4"])
    {
        NSLog(@"4 is correct");
    pi = [pi stringByAppendingString:@"4"];
    [self updatePiLabel];
    }
}

-(void) handleSingleTapFive:(UITapGestureRecognizer *)gr
{
    [self recolorViews];
    self.fiveView.backgroundColor = colorInst.fiveColor;
    self.fiveLabel.textColor = colorInst.playBackgroundColor;
    self.fiveView.layer.borderColor = colorInst.playBackgroundColor.CGColor;
    if ([self isDigitCorrect:@"5"])
    {
        NSLog(@"5 is correct");
    pi = [pi stringByAppendingString:@"5"];
    [self updatePiLabel];
    }
}

-(void) handleSingleTapSix:(UITapGestureRecognizer *)gr
{
    [self recolorViews];
    self.sixView.backgroundColor = colorInst.sixColor;
    self.sixLabel.textColor = colorInst.playBackgroundColor;
    self.sixView.layer.borderColor = colorInst.playBackgroundColor.CGColor;
    if ([self isDigitCorrect:@"6"])
    {
        NSLog(@"6 is correct");
    pi = [pi stringByAppendingString:@"6"];
    [self updatePiLabel];
    }
}

-(void) handleSingleTapSeven:(UITapGestureRecognizer *)gr
{
    [self recolorViews];
    self.sevenView.backgroundColor = colorInst.sevenColor;
    self.sevenLabel.textColor = colorInst.playBackgroundColor;
    self.sevenView.layer.borderColor = colorInst.playBackgroundColor.CGColor;
    if ([self isDigitCorrect:@"7"])
    {
        NSLog(@"7 is correct");
    pi = [pi stringByAppendingString:@"7"];
    [self updatePiLabel];
    }
}

-(void) handleSingleTapEight:(UITapGestureRecognizer *)gr
{
    [self recolorViews];
    self.eightView.backgroundColor = colorInst.eightColor;
    self.eightLabel.textColor = colorInst.playBackgroundColor;
    self.eightView.layer.borderColor = colorInst.playBackgroundColor.CGColor;
    if ([self isDigitCorrect:@"8"])
    {
        NSLog(@"8 is correct");
    pi = [pi stringByAppendingString:@"8"];
    [self updatePiLabel];
    }
}

-(void) handleSingleTapNine:(UITapGestureRecognizer *)gr
{
    [self recolorViews];
    self.nineView.backgroundColor = colorInst.nineColor;
    self.nineLabel.textColor = colorInst.playBackgroundColor;
    self.nineView.layer.borderColor = colorInst.playBackgroundColor.CGColor;
    if ([self isDigitCorrect:@"9"])
    {
        NSLog(@"9 is correct");
    pi = [pi stringByAppendingString:@"9"];
    [self updatePiLabel];
    }
}

-(void) handleSingleTapDot:(UITapGestureRecognizer *)gr
{
    [self recolorViews];
    self.dotView.backgroundColor = colorInst.dotColor;
    self.dotLabel.textColor = colorInst.playBackgroundColor;
    self.dotView.layer.borderColor = colorInst.playBackgroundColor.CGColor;
    if ([self isDigitCorrect:@"."])
    {
        NSLog(@". is correct");
    pi = [pi stringByAppendingString:@"."];
    [self updatePiLabel];
    }
}

@end
