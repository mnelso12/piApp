//
//  learnVC.m
//  learnPi
//
//  Created by MadelynNelson on 11/4/15.
//  Copyright (c) 2015 Madelyn Nelson. All rights reserved.
//

#import "learnVC.h"
#import "piReal.h"
#import "colors.h"

@implementation learnVC

CGFloat screenWidth2;
CGFloat screenHeight2;
NSMutableString *myPi;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    colors *colorInst = [[colors alloc] init];
    
    piReal *piInst = [[piReal alloc] init];
    myPi = piInst.piMutString;
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenWidth2 = screenRect.size.width;
    screenHeight2 = screenRect.size.height;
    
    self.view.backgroundColor = colorInst.playBackgroundColor;
    
    self.textView.text = @"lalalal";
    
    [self loadPiLabel];
    [self loadScroller];
    [self addSpaces];
    [self updatePiLabel];
}

- (void)loadScroller
{
    colors *colorInst = [[colors alloc] init];
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 40, screenWidth2-40, screenHeight2-40)];
    /*
    self.textView.font = [UIFont fontWithName:@"Verdana" size:20];
    //self.textView.text = myPi;
    self.textView.textAlignment = NSTextAlignmentCenter;
    //self.textView.lineBreakMode = NSLineBreakByTruncatingTail;
    self.textView.layer.cornerRadius = 10.0f;
    self.textView.layer.masksToBounds = YES;
    //self.textView.lineBreakMode = NSLineBreakByWordWrapping;
    //self.textView.numberOfLines = 0;
    [self.view addSubview:self.textView];
    [self.view addSubview:self.piLabel];
     */
    self.textView.backgroundColor = colorInst.playBackgroundColor;
    self.textView.editable = NO;
    [self.view addSubview:self.textView];
}

- (void)loadPiLabel
{
    
    colors *colorInst = [[colors alloc] init];

    //self.piLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, screenWidth2-40, screenHeight2-40)];
    self.piLabel.text = @"pi!!!";
    self.piLabel.font = [UIFont fontWithName:@"Verdana" size:20];
    //self.piLabel.backgroundColor = colorInst.playBackgroundColor;
    self.piLabel.textAlignment = NSTextAlignmentCenter;
    self.piLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.piLabel.layer.cornerRadius = 10.0f;
    self.piLabel.layer.masksToBounds = YES;
    self.piLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.piLabel.numberOfLines = 0;

    //[self.textView addSubview:self.piLabel];
    //[self.view addSubview:self.textView];
    //[self.view addSubview:self.piLabel];
    
}

- (void)addSpaces
{
    int count = 0;
    int groupNum = 7;
    while (count < (10000+(10000/groupNum)))
    {
        if ((count%(groupNum+1)) == 0) // replace 8 with (groupNum+1) in future
        {
            [myPi insertString:@" " atIndex:count];
        }
        count++;
    }
}

- (void)updatePiLabel
{
    self.piLabel.text = myPi;
    [self updatePiColors];
    [self.view addSubview:self.piLabel];
    
    /*
    self.textView.text = myPi;
    [self updatePiColors];
    [self.view addSubview:self.textView];
     */
}

- (void) updatePiColors
{
    NSMutableAttributedString *text =
    [[NSMutableAttributedString alloc]
     initWithAttributedString: self.piLabel.attributedText];
    
    colors *colorInst = [[colors alloc] init];
    
    int count = 0;
    while(count < (int)[myPi length])
    {
        NSString *tempStr = [myPi substringWithRange:NSMakeRange(count, 1)];
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
        else if ([tempStr isEqualToString:@" "])
        {
        }
        else
        {
            NSLog(@"gross using default text colors for %@", tempStr);
            [text addAttribute:NSForegroundColorAttributeName
                         value:[UIColor blackColor]
                         range:NSMakeRange(count,1)];
        }
        count++;
    }
    
    //[self.piLabel setAttributedText: text];
    [self.textView setAttributedText: text];
}

@end
