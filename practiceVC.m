//
//  practiceVC.m
//  learnPi
//
//  Created by MadelynNelson on 11/4/15.
//  Copyright (c) 2015 Madelyn Nelson. All rights reserved.
//

#import "practiceVC.h"
#import "digitButton.h"
#import <CoreText/CoreText.h>

@implementation practiceVC

NSString *pi = @"";
int currentDigit = 0;
CGFloat screenWidth;
CGFloat screenHeight;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenWidth = screenRect.size.width;
    screenHeight = screenRect.size.height;
    
    currentDigit = 0; // do I need this?
    
    [self loadScoreLabels];
    [self loadKeypad];
    [self initializePiLabel];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)initializePiLabel
{
    self.piLabel = [[UILabel alloc] initWithFrame:CGRectMake(50,50,500,70)];
    self.piLabel.font = [UIFont fontWithName:@"Verdana" size:60];
    self.piLabel.backgroundColor = [UIColor grayColor];
    self.piLabel.lineBreakMode = NSLineBreakByTruncatingHead;
    [self.view addSubview:self.piLabel];
}

- (void)updatePiLabel
{
    self.piLabel.text = pi;
    //NSLog(@"self.pi = %@", pi);
    [self updateCurrentDigit];
    [self updatePiColors];
}

- (void)updateCurrentDigit
{
    currentDigit++;
    self.currentDigitLabel.text = [NSString stringWithFormat:@"%d", currentDigit];
}

- (void)loadScoreLabels
{
    // should do this in terms of screen height and width
    
    // high score
    self.highScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(100,200,50,50)];
    self.highScoreLabel.text = @"382";
    self.highScoreLabel.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.highScoreLabel];
    
    // current digit
    self.currentDigitLabel = [[UILabel alloc] initWithFrame:CGRectMake(300,200,50,50)];
    self.currentDigitLabel.text = @"0";
    self.currentDigitLabel.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.currentDigitLabel];
}

- (void)loadKeypad
{

    CGFloat buttonHeight = screenHeight/6;
    CGFloat upperButtonWidth = screenWidth/5;
    CGFloat lowerButtonWidth = screenWidth/6;
    
    
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

    
    /*
    digitButton *testButton = [[digitButton alloc] initWithFrame:CGRectMake(100, 200, 80, 80)];
    testButton.hexColor = @"#00ffff";
    testButton.number = [NSNumber numberWithInt:2];
    [self.view addSubview:testButton];
     */
    
    // upper row
    // 0 button
    UIView *zeroButton = [[UIView alloc] initWithFrame:CGRectMake(0,screenHeight/2+50, upperButtonWidth, buttonHeight)];
    zeroButton.layer.borderColor = [UIColor yellowColor].CGColor;
    zeroButton.layer.borderWidth = 2.0f;
    [zeroButton addGestureRecognizer:singleFingerTapZero];
    
    // 1 button
    UIView *oneButton = [[UIView alloc] initWithFrame:CGRectMake(upperButtonWidth, screenHeight/2+50, upperButtonWidth, buttonHeight)];
    oneButton.layer.borderColor = [UIColor yellowColor].CGColor;
    oneButton.layer.borderWidth = 2.0f;
    [oneButton addGestureRecognizer:singleFingerTapOne];
    
    // 2 button
    UIView *twoButton = [[UIView alloc] initWithFrame:CGRectMake(upperButtonWidth*2, screenHeight/2+50, upperButtonWidth, buttonHeight)];
    twoButton.layer.borderColor = [UIColor yellowColor].CGColor;
    twoButton.layer.borderWidth = 2.0f;
    [twoButton addGestureRecognizer:singleFingerTapTwo];
    
    // 3 button
    UIView *threeButton = [[UIView alloc] initWithFrame:CGRectMake(upperButtonWidth*3, screenHeight/2+50, upperButtonWidth, buttonHeight)];
    threeButton.layer.borderColor = [UIColor yellowColor].CGColor;
    threeButton.layer.borderWidth = 2.0f;
    [threeButton addGestureRecognizer:singleFingerTapThree];
    
    // 4 button
    UIView *fourButton = [[UIView alloc] initWithFrame:CGRectMake(upperButtonWidth*4, screenHeight/2+50, upperButtonWidth, buttonHeight)];
    fourButton.layer.borderColor = [UIColor yellowColor].CGColor;
    fourButton.layer.borderWidth = 2.0f;
    [fourButton addGestureRecognizer:singleFingerTapFour];
    
    
    // lower row
    // 5 button
    UIView *fiveButton = [[UIView alloc] initWithFrame:CGRectMake(0, screenHeight/2+50+buttonHeight, lowerButtonWidth, buttonHeight)];
    fiveButton.layer.borderColor = [UIColor yellowColor].CGColor;
    fiveButton.layer.borderWidth = 2.0f;
    [fiveButton addGestureRecognizer:singleFingerTapFive];
    
    // 6 button
    UIView *sixButton = [[UIView alloc] initWithFrame:CGRectMake(lowerButtonWidth, screenHeight/2+50+buttonHeight, lowerButtonWidth, buttonHeight)];
    sixButton.layer.borderColor = [UIColor yellowColor].CGColor;
    sixButton.layer.borderWidth = 2.0f;
    [sixButton addGestureRecognizer:singleFingerTapSix];
    
    // 7 button
    UIView *sevenButton = [[UIView alloc] initWithFrame:CGRectMake(lowerButtonWidth*2, screenHeight/2+50+buttonHeight, lowerButtonWidth, buttonHeight)];
    sevenButton.layer.borderColor = [UIColor yellowColor].CGColor;
    sevenButton.layer.borderWidth = 2.0f;
    [sevenButton addGestureRecognizer:singleFingerTapSeven];
    
    // 8 button
    UIView *eightButton = [[UIView alloc] initWithFrame:CGRectMake(lowerButtonWidth*3, screenHeight/2+50+buttonHeight, lowerButtonWidth, buttonHeight)];
    eightButton.layer.borderColor = [UIColor yellowColor].CGColor;
    eightButton.layer.borderWidth = 2.0f;
    [eightButton addGestureRecognizer:singleFingerTapEight];
    
    // 9 button
    UIView *nineButton = [[UIView alloc] initWithFrame:CGRectMake(lowerButtonWidth*4, screenHeight/2+50+buttonHeight, lowerButtonWidth, buttonHeight)];
    nineButton.layer.borderColor = [UIColor yellowColor].CGColor;
    nineButton.layer.borderWidth = 2.0f;
    [nineButton addGestureRecognizer:singleFingerTapNine];
    
    // . button
    UIView *dotButton = [[UIView alloc] initWithFrame:CGRectMake(lowerButtonWidth*5, screenHeight/2+50+buttonHeight, lowerButtonWidth, buttonHeight)];
    dotButton.layer.borderColor = [UIColor yellowColor].CGColor;
    dotButton.layer.borderWidth = 2.0f;
    [dotButton addGestureRecognizer:singleFingerTapDot];
    

    [self.view addSubview:zeroButton];
    [self.view addSubview:oneButton];
    [self.view addSubview:twoButton];
    [self.view addSubview:threeButton];
    [self.view addSubview:fourButton];
    [self.view addSubview:fiveButton];
    [self.view addSubview:sixButton];
    [self.view addSubview:sevenButton];
    [self.view addSubview:eightButton];
    [self.view addSubview:nineButton];
    [self.view addSubview:dotButton];
}

- (void) updatePiColors
{
    NSMutableAttributedString *text =
    [[NSMutableAttributedString alloc]
     initWithAttributedString: self.piLabel.attributedText];
    
    int count = 0;
    NSString *tempStr = [[NSString alloc] init]; // char at index
    while(count < (int)[pi length])
    {
        NSString *tempStr = [pi substringWithRange:NSMakeRange(count, 1)];
        if ([tempStr isEqualToString:@"0"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[UIColor blueColor]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"1"])
        {
        [text addAttribute:NSForegroundColorAttributeName
                     value:[UIColor whiteColor]
                     range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"2"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[UIColor blueColor]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"3"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[UIColor yellowColor]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"4"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[UIColor redColor]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"5"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[UIColor greenColor]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"6"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[UIColor greenColor]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"7"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[UIColor blackColor]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"8"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[UIColor blueColor]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"9"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[UIColor brownColor]
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

-(void) handleSingleTapZero:(UITapGestureRecognizer *)gr
{
    pi = [pi stringByAppendingString:@"0"];
    [self updatePiLabel];
}

-(void) handleSingleTapOne:(UITapGestureRecognizer *)gr
{
    pi = [pi stringByAppendingString:@"1"];
    [self updatePiLabel];
}

-(void) handleSingleTapTwo:(UITapGestureRecognizer *)gr
{
    pi = [pi stringByAppendingString:@"2"];
    [self updatePiLabel];
}

-(void) handleSingleTapThree:(UITapGestureRecognizer *)gr
{
    pi = [pi stringByAppendingString:@"3"];
    [self updatePiLabel];
}

-(void) handleSingleTapFour:(UITapGestureRecognizer *)gr
{
    pi = [pi stringByAppendingString:@"4"];
    [self updatePiLabel];
}

-(void) handleSingleTapFive:(UITapGestureRecognizer *)gr
{
    pi = [pi stringByAppendingString:@"5"];
    [self updatePiLabel];
}

-(void) handleSingleTapSix:(UITapGestureRecognizer *)gr
{
    pi = [pi stringByAppendingString:@"6"];
    [self updatePiLabel];
}

-(void) handleSingleTapSeven:(UITapGestureRecognizer *)gr
{
    pi = [pi stringByAppendingString:@"7"];
    [self updatePiLabel];
}

-(void) handleSingleTapEight:(UITapGestureRecognizer *)gr
{
    pi = [pi stringByAppendingString:@"8"];
    [self updatePiLabel];
}

-(void) handleSingleTapNine:(UITapGestureRecognizer *)gr
{
    pi = [pi stringByAppendingString:@"9"];
    [self updatePiLabel];
}

-(void) handleSingleTapDot:(UITapGestureRecognizer *)gr
{
    pi = [pi stringByAppendingString:@"."];
    [self updatePiLabel];
}

@end
