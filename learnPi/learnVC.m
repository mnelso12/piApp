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
NSMutableDictionary *colorsDict3;
NSMutableArray *colorArr3;
NSMutableArray *CGcolorArr3;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"in learn VC");
    
    colors *colorInst = [[colors alloc] init];
    
    // start with colors from defaults
    // start with colors, coordinate with defaults
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"ColorsDict"])
    {
        colorsDict3 = [[NSUserDefaults standardUserDefaults] objectForKey:@"ColorsDict"];
    }
    else // if colorsDict isn't in defaults (first time in app), then use this one instead
    {
        // colorsDict can ONLY take decimal values for the objects, not "140.0f/255.0f" form because that cannot be typedefed into a float
        colorsDict3 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
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
    
    colorArr3 = [[NSMutableArray alloc] initWithObjects:
                 [UIColor colorWithRed:[[colorsDict3 objectForKey:@"zeroR"] floatValue] green:[[colorsDict3 objectForKey:@"zeroG"] floatValue] blue:[[colorsDict3 objectForKey:@"zeroB"] floatValue] alpha:1.0f],
                 [UIColor colorWithRed:[[colorsDict3 objectForKey:@"oneR"] floatValue] green:[[colorsDict3 objectForKey:@"oneG"] floatValue] blue:[[colorsDict3 objectForKey:@"oneB"] floatValue] alpha:1.0f],
                 [UIColor colorWithRed:[[colorsDict3 objectForKey:@"twoR"] floatValue] green:[[colorsDict3 objectForKey:@"twoG"] floatValue] blue:[[colorsDict3 objectForKey:@"twoB"] floatValue] alpha:1.0f],
                 [UIColor colorWithRed:[[colorsDict3 objectForKey:@"threeR"] floatValue] green:[[colorsDict3 objectForKey:@"threeG"] floatValue] blue:[[colorsDict3 objectForKey:@"threeB"] floatValue] alpha:1.0f],
                 [UIColor colorWithRed:[[colorsDict3 objectForKey:@"fourR"] floatValue] green:[[colorsDict3 objectForKey:@"fourG"] floatValue] blue:[[colorsDict3 objectForKey:@"fourB"] floatValue] alpha:1.0f],
                 [UIColor colorWithRed:[[colorsDict3 objectForKey:@"fiveR"] floatValue] green:[[colorsDict3 objectForKey:@"fiveG"] floatValue] blue:[[colorsDict3 objectForKey:@"fiveB"] floatValue] alpha:1.0f],
                 [UIColor colorWithRed:[[colorsDict3 objectForKey:@"sixR"] floatValue] green:[[colorsDict3 objectForKey:@"sixG"] floatValue] blue:[[colorsDict3 objectForKey:@"sixB"] floatValue] alpha:1.0f],
                 [UIColor colorWithRed:[[colorsDict3 objectForKey:@"sevenR"] floatValue] green:[[colorsDict3 objectForKey:@"sevenG"] floatValue] blue:[[colorsDict3 objectForKey:@"sevenB"] floatValue] alpha:1.0f],
                 [UIColor colorWithRed:[[colorsDict3 objectForKey:@"eightR"] floatValue] green:[[colorsDict3 objectForKey:@"eightG"] floatValue] blue:[[colorsDict3 objectForKey:@"eightB"] floatValue] alpha:1.0f],
                 [UIColor colorWithRed:[[colorsDict3 objectForKey:@"nineR"] floatValue] green:[[colorsDict3 objectForKey:@"nineG"] floatValue] blue:[[colorsDict3 objectForKey:@"nineB"] floatValue] alpha:1.0f],
                 [UIColor colorWithRed:[[colorsDict3 objectForKey:@"dotR"] floatValue] green:[[colorsDict3 objectForKey:@"dotG"] floatValue] blue:[[colorsDict3 objectForKey:@"dotB"] floatValue] alpha:1.0f],
                 nil];
    
    CGcolorArr3 = [[NSMutableArray alloc] init];
    for (UIColor *color in colorArr3)
    {
        [CGcolorArr3 addObject:(id)color.CGColor];
    }
    
    
    
    
    
    
    piReal *piInst = [[piReal alloc] init];
    NSString *piMutableString = piInst.piMutString;
    piMutableString = [NSString stringWithFormat:@"%@%@",@"3.",piMutableString]; // because the piReal starts at 1415926...
    myPi = piMutableString.mutableCopy;
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenWidth2 = screenRect.size.width;
    screenHeight2 = screenRect.size.height;
    
    self.view.backgroundColor = colorInst.playBackgroundColor;
    
    [self loadPiLabel];
    [self loadScroller];
    [self addSpaces];
    [self updatePiLabel];
}

- (void)loadScroller
{
    colors *colorInst = [[colors alloc] init];
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 40, screenWidth2-40, screenHeight2-40)];
    
    self.textView.font = [UIFont fontWithName:@"Verdana" size:20];
    /*
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

- (int)numCharsPerLine // this doesn't work
{
    UITextView *tempView = [[UITextView alloc] initWithFrame:CGRectMake(20, 40, screenWidth2-40, 20)]; // same as self.textView, except height is only one line
    UILabel *tempLabel = [[UILabel alloc] init];
    tempLabel.lineBreakMode = NSLineBreakByCharWrapping;
    tempLabel.text = @"1029381092831092830192380110293810293810928301928309182039810918309182039812313192835048792834710293801298301928301892";
    tempLabel.textColor = [UIColor clearColor]; // just for seeing how many char per line
    [tempView addSubview:tempLabel];
    [self.view addSubview:tempView];
     NSLog(@"\n\n\n count %lu \n\n\n",(unsigned long)[tempLabel.text length]);
    return 0; // fix this
}

- (void)loadPiLabel
{
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
    int groupNum = 8;
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
    
    int count = 0;
    while(count < (int)[myPi length])
    {
        NSString *tempStr = [myPi substringWithRange:NSMakeRange(count, 1)];
        if ([tempStr isEqualToString:@"0"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr3 objectAtIndex:0]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"1"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr3 objectAtIndex:1]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"2"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr3 objectAtIndex:2]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"3"])
        {
            //NSLog(@"count = %i", count);
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr3 objectAtIndex:3]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"4"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr3 objectAtIndex:4]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"5"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr3 objectAtIndex:5]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"6"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr3 objectAtIndex:6]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"7"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr3 objectAtIndex:7]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"8"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr3 objectAtIndex:8]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"9"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr3 objectAtIndex:9]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"."])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr3 objectAtIndex:10]
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
    
    //[self.piLabel setAttributedText: text];
    [self.textView setAttributedText: text];
}

@end
