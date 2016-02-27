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
#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation practiceVC

NSString *pi = @"";
int currentDigit = 0;
CGFloat screenWidth;
CGFloat screenHeight;
NSString *piRealString;
colors *colorInst;
NSString *highScore;
BOOL isPlay;
NSMutableDictionary *colorsDict2;
NSMutableArray *colorArr2;
NSMutableArray *CGcolorArr2;
NSArray *arr2;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // start with colors, coordinate with defaults
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"ColorsDict"])
    {
        colorsDict2 = [[NSUserDefaults standardUserDefaults] objectForKey:@"ColorsDict"];
    }
    else // if colorsDict isn't in defaults (first time in app), then use this one instead
    {
        // colorsDict can ONLY take decimal values for the objects, not "140.0f/255.0f" form because that cannot be typedefed into a float
        colorsDict2 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                      @".1234", @"zeroR", @".213", @"zeroB", @".982", @"zeroG",
                      @".14", @"oneR", @".99", @"oneB", @".6", @"oneG",
                      @".5", @"twoR", @".2", @"twoB", @".4", @"twoG",
                      @"0.", @"threeR", @".1", @"threeB", @".4", @"threeG",
                      @"0.", @"fourR", @".9", @"fourB", @".312", @"fourG",
                      @".12", @"fiveR", @".9", @"fiveB", @".23", @"fiveG",
                      @".2", @"sixR", @".4", @"sixB", @".1", @"sixG",
                      @".1", @"sevenR", @".1", @"sevenB", @".4", @"sevenG",
                      @".8", @"eightR", @".1", @"eightB", @".4", @"eightG",
                      @".2917", @"nineR", @".123", @"nineB", @".13", @"nineG",
                      @".324", @"dotR", @".2398", @"dotB", @".13", @"dotG",
                      nil];
    }

    arr2 = [[NSArray alloc] initWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @".", nil];
    
    colorArr2 = [[NSMutableArray alloc] initWithObjects:
                [UIColor colorWithRed:[[colorsDict2 objectForKey:@"zeroR"] floatValue] green:[[colorsDict2 objectForKey:@"zeroG"] floatValue] blue:[[colorsDict2 objectForKey:@"zeroB"] floatValue] alpha:1.0f],
                [UIColor colorWithRed:[[colorsDict2 objectForKey:@"oneR"] floatValue] green:[[colorsDict2 objectForKey:@"oneG"] floatValue] blue:[[colorsDict2 objectForKey:@"oneB"] floatValue] alpha:1.0f],
                [UIColor colorWithRed:[[colorsDict2 objectForKey:@"twoR"] floatValue] green:[[colorsDict2 objectForKey:@"twoG"] floatValue] blue:[[colorsDict2 objectForKey:@"twoB"] floatValue] alpha:1.0f],
                [UIColor colorWithRed:[[colorsDict2 objectForKey:@"threeR"] floatValue] green:[[colorsDict2 objectForKey:@"threeG"] floatValue] blue:[[colorsDict2 objectForKey:@"threeB"] floatValue] alpha:1.0f],
                [UIColor colorWithRed:[[colorsDict2 objectForKey:@"fourR"] floatValue] green:[[colorsDict2 objectForKey:@"fourG"] floatValue] blue:[[colorsDict2 objectForKey:@"fourB"] floatValue] alpha:1.0f],
                [UIColor colorWithRed:[[colorsDict2 objectForKey:@"fiveR"] floatValue] green:[[colorsDict2 objectForKey:@"fiveG"] floatValue] blue:[[colorsDict2 objectForKey:@"fiveB"] floatValue] alpha:1.0f],
                [UIColor colorWithRed:[[colorsDict2 objectForKey:@"sixR"] floatValue] green:[[colorsDict2 objectForKey:@"sixG"] floatValue] blue:[[colorsDict2 objectForKey:@"sixB"] floatValue] alpha:1.0f],
                [UIColor colorWithRed:[[colorsDict2 objectForKey:@"sevenR"] floatValue] green:[[colorsDict2 objectForKey:@"sevenG"] floatValue] blue:[[colorsDict2 objectForKey:@"sevenB"] floatValue] alpha:1.0f],
                [UIColor colorWithRed:[[colorsDict2 objectForKey:@"eightR"] floatValue] green:[[colorsDict2 objectForKey:@"eightG"] floatValue] blue:[[colorsDict2 objectForKey:@"eightB"] floatValue] alpha:1.0f],
                [UIColor colorWithRed:[[colorsDict2 objectForKey:@"nineR"] floatValue] green:[[colorsDict2 objectForKey:@"nineG"] floatValue] blue:[[colorsDict2 objectForKey:@"nineB"] floatValue] alpha:1.0f],
                [UIColor colorWithRed:[[colorsDict2 objectForKey:@"dotR"] floatValue] green:[[colorsDict2 objectForKey:@"dotG"] floatValue] blue:[[colorsDict2 objectForKey:@"dotB"] floatValue] alpha:1.0f],
                nil];
    
    CGcolorArr2 = [[NSMutableArray alloc] init];
    for (UIColor *color in colorArr2)
    {
        [CGcolorArr2 addObject:(id)color.CGColor];
    }
    
    // remember what button (practice or play) sent it here
    NSLog(@"came from %@ button", self.prevVC);
    [self setTitle:self.prevVC];
    if ([self.prevVC isEqualToString:@"Play"])
    {
        isPlay = true;
    }
    else
    {
        isPlay = false;
    }
    
    
    pi = @"";
    
    colorInst = [[colors alloc] init];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenWidth = screenRect.size.width;
    screenHeight = screenRect.size.height;
    
    currentDigit = 0; // do I need this?
    
    // should never be nil, start with it equalling the default high score
    highScore = [[NSUserDefaults standardUserDefaults] objectForKey:@"HighScore"];
    if (highScore == nil)
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
    [self updateHighScore];
    [self updatePiColors];
}

- (void)updateCurrentDigit
{
    currentDigit++;
    self.currentDigitLabel.text = [NSString stringWithFormat:@"%@%d", @"Current Digit: ", currentDigit];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if (self.isMovingFromParentViewController || self.isBeingDismissed) {
        if (isPlay)
        {
            // update high score
            [[NSUserDefaults standardUserDefaults] setObject:highScore forKey:@"HighScore"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            // make home vc reflect this new high score
            [self.parentViewController viewDidLoad];
        }
    }
}

- (void)updateHighScore
{
    NSLog(@"current = %i, high score = %@, isPlay = %i", currentDigit, highScore, isPlay);
    if ((currentDigit > [highScore intValue]) && (isPlay))
    {
        highScore = [NSString stringWithFormat:@"%i",currentDigit];
        NSLog(@"updating high score now");
    }
    self.highScoreLabel.text = [NSString stringWithFormat:@"%@%@", @"High Score: ", highScore];
    NSLog(@"new high score: %@", highScore);
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
    
    /*
    // strikes (for play only)
    self.strikesLabel = [[UILabel alloc] initWithFrame:CGRectMake(screenWidth/2-100,120+(screenWidth/10-50),200,50)];
    self.strikesLabel.font = [UIFont fontWithName:colorInst.themeFont size:30];
    self.strikesLabel.text = [NSString stringWithFormat:@"XXX"];
    self.strikesLabel.textColor = [UIColor redColor];
    self.strikesLabel.layer.masksToBounds = YES;
    self.strikesLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.strikesLabel];
     */
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
    
    //NSLog(@"screen width = %f", screenWidth);
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
    self.zeroView.layer.borderColor = (__bridge CGColorRef)([CGcolorArr2 objectAtIndex:0]);
    self.zeroView.layer.borderWidth = 2.0f;
    self.zeroView.layer.cornerRadius = radius;
    [self.zeroView addGestureRecognizer:singleFingerTapZero];
    
    self.zeroLabel = [[UILabel alloc] initWithFrame:CGRectMake(radius/2,radius/2, radius, radius)];
    self.zeroLabel.text = @"0";
    self.zeroLabel.font = [UIFont fontWithName:colorInst.themeFont size:30];
    self.zeroLabel.textColor = [colorArr2 objectAtIndex:0];
    self.zeroLabel.textAlignment = NSTextAlignmentCenter;
    [self.zeroView addSubview:self.zeroLabel];
    
    // 1 button
    self.oneView = [[UIView alloc] initWithFrame:CGRectMake(.5*upperSpace+radius+2*upperSpace+diameter, upperHeight, diameter, diameter)];
    self.oneView.layer.borderColor = (__bridge CGColorRef)([CGcolorArr2 objectAtIndex:1]);
    self.oneView.layer.borderWidth = 2.0f;
    self.oneView.layer.cornerRadius = radius;
    [self.oneView addGestureRecognizer:singleFingerTapOne];
    
    self.oneLabel = [[UILabel alloc] initWithFrame:CGRectMake(radius/2,radius/2, radius, radius)];
    self.oneLabel.text = @"1";
    self.oneLabel.font = [UIFont fontWithName:colorInst.themeFont size:30];
    self.oneLabel.textColor = [colorArr2 objectAtIndex:1];
    self.oneLabel.textAlignment = NSTextAlignmentCenter;
    [self.oneView addSubview:self.oneLabel];

    
    // 2 button
    self.twoView = [[UIView alloc] initWithFrame:CGRectMake(.5*upperSpace+radius+3*upperSpace+2*diameter, upperHeight, diameter, diameter)];
    self.twoView.layer.borderColor = (__bridge CGColorRef)([CGcolorArr2 objectAtIndex:2]);
    self.twoView.layer.borderWidth = 2.0f;
    self.twoView.layer.cornerRadius = radius;
    [self.twoView addGestureRecognizer:singleFingerTapTwo];
    
    self.twoLabel = [[UILabel alloc] initWithFrame:CGRectMake(radius/2,radius/2, radius, radius)];
    self.twoLabel.text = @"2";
    self.twoLabel.font = [UIFont fontWithName:colorInst.themeFont size:30];
    self.twoLabel.textColor = [colorArr2 objectAtIndex:2];
    self.twoLabel.textAlignment = NSTextAlignmentCenter;
    [self.twoView addSubview:self.twoLabel];
    
    // 3 button
    self.threeView = [[UIView alloc] initWithFrame:CGRectMake(.5*upperSpace+radius+4*upperSpace+3*diameter, upperHeight, diameter, diameter)];
    self.threeView.layer.borderColor = (__bridge CGColorRef)([CGcolorArr2 objectAtIndex:3]);
    self.threeView.layer.borderWidth = 2.0f;
    self.threeView.layer.cornerRadius = radius;
    [self.threeView addGestureRecognizer:singleFingerTapThree];
    
    self.threeLabel = [[UILabel alloc] initWithFrame:CGRectMake(radius/2,radius/2, radius, radius)];
    self.threeLabel.text = @"3";
    self.threeLabel.font = [UIFont fontWithName:colorInst.themeFont size:30];
    self.threeLabel.textColor = [colorArr2 objectAtIndex:3];
    self.threeLabel.textAlignment = NSTextAlignmentCenter;
    [self.threeView addSubview:self.threeLabel];
    
    // 4 button
    self.fourView = [[UIView alloc] initWithFrame:CGRectMake(.5*upperSpace+radius+5*upperSpace+4*diameter, upperHeight, diameter, diameter)];
    self.fourView.layer.borderColor = (__bridge CGColorRef)([CGcolorArr2 objectAtIndex:4]);
    self.fourView.layer.borderWidth = 2.0f;
    self.fourView.layer.cornerRadius = radius;
    [self.fourView addGestureRecognizer:singleFingerTapFour];
    
    self.fourLabel = [[UILabel alloc] initWithFrame:CGRectMake(radius/2,radius/2, radius, radius)];
    self.fourLabel.text = @"4";
    self.fourLabel.font = [UIFont fontWithName:colorInst.themeFont size:30];
    self.fourLabel.textColor = [colorArr2 objectAtIndex:4];
    self.fourLabel.textAlignment = NSTextAlignmentCenter;
    [self.fourView addSubview:self.fourLabel];
    
    // lower row
    
    // 5 button
    self.fiveView = [[UIView alloc] initWithFrame:CGRectMake(lowerSpace, lowerHeight, diameter, diameter)];
    self.fiveView.layer.borderColor = (__bridge CGColorRef)([CGcolorArr2 objectAtIndex:5]);
    self.fiveView.layer.borderWidth = 2.0f;
    self.fiveView.layer.cornerRadius = radius;
    [self.fiveView addGestureRecognizer:singleFingerTapFive];
    
    self.fiveLabel = [[UILabel alloc] initWithFrame:CGRectMake(radius/2,radius/2, radius, radius)];
    self.fiveLabel.text = @"5";
    self.fiveLabel.font = [UIFont fontWithName:colorInst.themeFont size:30];
    self.fiveLabel.textColor = [colorArr2 objectAtIndex:5];
    self.fiveLabel.textAlignment = NSTextAlignmentCenter;
    [self.fiveView addSubview:self.fiveLabel];
    
    // 6 button
    self.sixView = [[UIView alloc] initWithFrame:CGRectMake(2*lowerSpace+1*diameter, lowerHeight, diameter, diameter)];
    self.sixView.layer.borderColor = (__bridge CGColorRef)([CGcolorArr2 objectAtIndex:6]);
    self.sixView.layer.borderWidth = 2.0f;
    self.sixView.layer.cornerRadius = radius;
    [self.sixView addGestureRecognizer:singleFingerTapSix];
    
    self.sixLabel = [[UILabel alloc] initWithFrame:CGRectMake(radius/2,radius/2, radius, radius)];
    self.sixLabel.text = @"6";
    self.sixLabel.font = [UIFont fontWithName:colorInst.themeFont size:30];
    self.sixLabel.textColor = [colorArr2 objectAtIndex:6];
    self.sixLabel.textAlignment = NSTextAlignmentCenter;
    [self.sixView addSubview:self.sixLabel];
    
    // 7 button
    self.sevenView = [[UIView alloc] initWithFrame:CGRectMake(3*lowerSpace+2*diameter, lowerHeight, diameter, diameter)];
    self.sevenView.layer.borderColor = (__bridge CGColorRef)([CGcolorArr2 objectAtIndex:7]);
    self.sevenView.layer.borderWidth = 2.0f;
    self.sevenView.layer.cornerRadius = radius;
    [self.sevenView addGestureRecognizer:singleFingerTapSeven];
    
    self.sevenLabel = [[UILabel alloc] initWithFrame:CGRectMake(radius/2,radius/2, radius, radius)];
    self.sevenLabel.text = @"7";
    self.sevenLabel.font = [UIFont fontWithName:colorInst.themeFont size:30];
    self.sevenLabel.textColor = [colorArr2 objectAtIndex:7];
    self.sevenLabel.textAlignment = NSTextAlignmentCenter;
    [self.sevenView addSubview:self.sevenLabel];
    
    // 8 button
    self.eightView = [[UIView alloc] initWithFrame:CGRectMake(4*lowerSpace+3*diameter, lowerHeight, diameter, diameter)];
    self.eightView.layer.borderColor = (__bridge CGColorRef)([CGcolorArr2 objectAtIndex:8]);
    self.eightView.layer.borderWidth = 2.0f;
    self.eightView.layer.cornerRadius = radius;
    [self.eightView addGestureRecognizer:singleFingerTapEight];
    
    self.eightLabel = [[UILabel alloc] initWithFrame:CGRectMake(radius/2,radius/2, radius, radius)];
    self.eightLabel.text = @"8";
    self.eightLabel.font = [UIFont fontWithName:colorInst.themeFont size:30];
    self.eightLabel.textColor = [colorArr2 objectAtIndex:8];
    self.eightLabel.textAlignment = NSTextAlignmentCenter;
    [self.eightView addSubview:self.eightLabel];
    
    // 9 button
    self.nineView = [[UIView alloc] initWithFrame:CGRectMake(5*lowerSpace+4*diameter, lowerHeight, diameter, diameter)];
    self.nineView.layer.borderColor = (__bridge CGColorRef)([CGcolorArr2 objectAtIndex:9]);
    self.nineView.layer.borderWidth = 2.0f;
    self.nineView.layer.cornerRadius = radius;
    [self.nineView addGestureRecognizer:singleFingerTapNine];
    
    self.nineLabel = [[UILabel alloc] initWithFrame:CGRectMake(radius/2,radius/2, radius, radius)];
    self.nineLabel.text = @"9";
    self.nineLabel.font = [UIFont fontWithName:colorInst.themeFont size:30];
    self.nineLabel.textColor = [colorArr2 objectAtIndex:9];
    self.nineLabel.textAlignment = NSTextAlignmentCenter;
    [self.nineView addSubview:self.nineLabel];
    
    // . button
    self.dotView = [[UIView alloc] initWithFrame:CGRectMake(6*lowerSpace+5*diameter, lowerHeight, diameter, diameter)];
    self.dotView.layer.borderColor = (__bridge CGColorRef)([CGcolorArr2 objectAtIndex:10]);
    self.dotView.layer.borderWidth = 2.0f;
    self.dotView.layer.cornerRadius = radius;
    [self.dotView addGestureRecognizer:singleFingerTapDot];
    
    self.dotLabel = [[UILabel alloc] initWithFrame:CGRectMake(radius/2,radius/2, radius, radius)];
    self.dotLabel.text = @".";
    self.dotLabel.font = [UIFont fontWithName:colorInst.themeFont size:30];
    self.dotLabel.textColor = [colorArr2 objectAtIndex:10];
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
                         value:[colorArr2 objectAtIndex:0]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"1"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr2 objectAtIndex:1]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"2"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr2 objectAtIndex:2]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"3"])
        {
            NSLog(@"count = %i", count);
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr2 objectAtIndex:3]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"4"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr2 objectAtIndex:4]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"5"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr2 objectAtIndex:5]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"6"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr2 objectAtIndex:6]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"7"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr2 objectAtIndex:7]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"8"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr2 objectAtIndex:8]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"9"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr2 objectAtIndex:9]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"."])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr2 objectAtIndex:10]
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
    self.zeroView.layer.borderColor = (__bridge CGColorRef)([CGcolorArr2 objectAtIndex:0]);
    self.zeroLabel.textColor = [colorArr2 objectAtIndex:0];
    
    self.oneView.backgroundColor = [UIColor clearColor];
    self.oneView.layer.borderColor = (__bridge CGColorRef)([CGcolorArr2 objectAtIndex:1]);
    self.oneLabel.textColor = [colorArr2 objectAtIndex:1];
    
    self.twoView.backgroundColor = [UIColor clearColor];
    self.twoView.layer.borderColor = (__bridge CGColorRef)([CGcolorArr2 objectAtIndex:2]);
    self.twoLabel.textColor = [colorArr2 objectAtIndex:2];
    
    self.threeView.backgroundColor = [UIColor clearColor];
    self.threeView.layer.borderColor = (__bridge CGColorRef)([CGcolorArr2 objectAtIndex:3]);
    self.threeLabel.textColor = [colorArr2 objectAtIndex:3];
    
    self.fourView.backgroundColor = [UIColor clearColor];
    self.fourView.layer.borderColor = (__bridge CGColorRef)([CGcolorArr2 objectAtIndex:4]);
    self.fourLabel.textColor = [colorArr2 objectAtIndex:4];
    
    self.fiveView.backgroundColor = [UIColor clearColor];
    self.fiveView.layer.borderColor = (__bridge CGColorRef)([CGcolorArr2 objectAtIndex:5]);
    self.fiveLabel.textColor = [colorArr2 objectAtIndex:5];
    
    self.sixView.backgroundColor = [UIColor clearColor];
    self.sixView.layer.borderColor = (__bridge CGColorRef)([CGcolorArr2 objectAtIndex:6]);
    self.sixLabel.textColor = [colorArr2 objectAtIndex:6];
    
    self.sevenView.backgroundColor = [UIColor clearColor];
    self.sevenView.layer.borderColor = (__bridge CGColorRef)([CGcolorArr2 objectAtIndex:7]);
    self.sevenLabel.textColor = [colorArr2 objectAtIndex:7];
    
    self.eightView.backgroundColor = [UIColor clearColor];
    self.eightView.layer.borderColor = (__bridge CGColorRef)([CGcolorArr2 objectAtIndex:8]);
    self.eightLabel.textColor = [colorArr2 objectAtIndex:8];
    
    self.nineView.backgroundColor = [UIColor clearColor];
    self.nineView.layer.borderColor = (__bridge CGColorRef)([CGcolorArr2 objectAtIndex:9]);
    self.nineLabel.textColor = [colorArr2 objectAtIndex:9];
    
    self.dotView.backgroundColor = [UIColor clearColor];
    self.dotView.layer.borderColor = (__bridge CGColorRef)([CGcolorArr2 objectAtIndex:10]);
    self.dotLabel.textColor = [colorArr2 objectAtIndex:10];

    
}

-(void) handleSingleTapZero:(UITapGestureRecognizer *)gr
{
    [self recolorViews];
    self.zeroView.backgroundColor = [colorArr2 objectAtIndex:0];
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
    self.oneView.backgroundColor = [colorArr2 objectAtIndex:1];
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
    self.twoView.backgroundColor = [colorArr2 objectAtIndex:2];
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
    self.threeView.backgroundColor = [colorArr2 objectAtIndex:3];
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
    self.fourView.backgroundColor = [colorArr2 objectAtIndex:4];
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
    self.fiveView.backgroundColor = [colorArr2 objectAtIndex:5];
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
    self.sixView.backgroundColor = [colorArr2 objectAtIndex:6];
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
    self.sevenView.backgroundColor = [colorArr2 objectAtIndex:7];
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
    self.eightView.backgroundColor = [colorArr2 objectAtIndex:8];
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
    self.nineView.backgroundColor = [colorArr2 objectAtIndex:9];
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
    self.dotView.backgroundColor = [colorArr2 objectAtIndex:10];
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
