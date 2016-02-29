//
//  ViewController.m
//  learnPi
//
//  Created by MadelynNelson on 11/4/15.
//  Copyright (c) 2015 Madelyn Nelson. All rights reserved.
//

#import "ViewController.h"
#import "practiceVC.h"
#import "piRealShort.h"
#import "colors.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

@synthesize highScoreLabel;
NSMutableString *myPi2;
NSMutableDictionary *colorsDict4;
NSMutableArray *colorArr4;
NSMutableArray *CGcolorArr4;

- (void)viewDidLoad {
    [super viewDidLoad];
    
     NSLog(@"in home VC");
    
    // if first time, use default background colors
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"BackgroundColor1"])
    {
        NSData *colorData = [NSKeyedArchiver archivedDataWithRootObject:[UIColor darkGrayColor]]; // back color 1 is pi entry color
        [[NSUserDefaults standardUserDefaults] setObject:colorData forKey:@"BackgroundColor1"];
        colorData = [NSKeyedArchiver archivedDataWithRootObject:[UIColor blackColor]]; // back color 2 is play background color
        [[NSUserDefaults standardUserDefaults] setObject:colorData forKey:@"BackgroundColor2"];
        colorData = [NSKeyedArchiver archivedDataWithRootObject:[UIColor whiteColor]]; // back color 3 is words color
        [[NSUserDefaults standardUserDefaults] setObject:colorData forKey:@"BackgroundColor3"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    NSData *colorData = [NSKeyedArchiver archivedDataWithRootObject:[UIColor redColor]]; // back color 1 is pi entry color
    [[NSUserDefaults standardUserDefaults] setObject:colorData forKey:@"BackgroundColor1"];
    colorData = [NSKeyedArchiver archivedDataWithRootObject:[UIColor greenColor]]; // back color 2 is play background color
    [[NSUserDefaults standardUserDefaults] setObject:colorData forKey:@"BackgroundColor2"];
    colorData = [NSKeyedArchiver archivedDataWithRootObject:[UIColor purpleColor]]; // back color 3 is words color
    [[NSUserDefaults standardUserDefaults] setObject:colorData forKey:@"BackgroundColor3"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    
    // if first time, set default groups for learning to seven
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"LearningGroups"])
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"7" forKey:@"LearningGroups"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    // start with colors
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"ColorsDict"])
    {
        colorsDict4 = [[NSUserDefaults standardUserDefaults] objectForKey:@"ColorsDict"];
    }
    else // if colorsDict isn't in defaults (first time in app), then use this one instead
    {
        // colorsDict can ONLY take decimal values for the objects, not "140.0f/255.0f" form because that cannot be typedefed into a float
        colorsDict4 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
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
    
    colorArr4 = [[NSMutableArray alloc] initWithObjects:
                 [UIColor colorWithRed:[[colorsDict4 objectForKey:@"zeroR"] floatValue] green:[[colorsDict4 objectForKey:@"zeroG"] floatValue] blue:[[colorsDict4 objectForKey:@"zeroB"] floatValue] alpha:1.0f],
                 [UIColor colorWithRed:[[colorsDict4 objectForKey:@"oneR"] floatValue] green:[[colorsDict4 objectForKey:@"oneG"] floatValue] blue:[[colorsDict4 objectForKey:@"oneB"] floatValue] alpha:1.0f],
                 [UIColor colorWithRed:[[colorsDict4 objectForKey:@"twoR"] floatValue] green:[[colorsDict4 objectForKey:@"twoG"] floatValue] blue:[[colorsDict4 objectForKey:@"twoB"] floatValue] alpha:1.0f],
                 [UIColor colorWithRed:[[colorsDict4 objectForKey:@"threeR"] floatValue] green:[[colorsDict4 objectForKey:@"threeG"] floatValue] blue:[[colorsDict4 objectForKey:@"threeB"] floatValue] alpha:1.0f],
                 [UIColor colorWithRed:[[colorsDict4 objectForKey:@"fourR"] floatValue] green:[[colorsDict4 objectForKey:@"fourG"] floatValue] blue:[[colorsDict4 objectForKey:@"fourB"] floatValue] alpha:1.0f],
                 [UIColor colorWithRed:[[colorsDict4 objectForKey:@"fiveR"] floatValue] green:[[colorsDict4 objectForKey:@"fiveG"] floatValue] blue:[[colorsDict4 objectForKey:@"fiveB"] floatValue] alpha:1.0f],
                 [UIColor colorWithRed:[[colorsDict4 objectForKey:@"sixR"] floatValue] green:[[colorsDict4 objectForKey:@"sixG"] floatValue] blue:[[colorsDict4 objectForKey:@"sixB"] floatValue] alpha:1.0f],
                 [UIColor colorWithRed:[[colorsDict4 objectForKey:@"sevenR"] floatValue] green:[[colorsDict4 objectForKey:@"sevenG"] floatValue] blue:[[colorsDict4 objectForKey:@"sevenB"] floatValue] alpha:1.0f],
                 [UIColor colorWithRed:[[colorsDict4 objectForKey:@"eightR"] floatValue] green:[[colorsDict4 objectForKey:@"eightG"] floatValue] blue:[[colorsDict4 objectForKey:@"eightB"] floatValue] alpha:1.0f],
                 [UIColor colorWithRed:[[colorsDict4 objectForKey:@"nineR"] floatValue] green:[[colorsDict4 objectForKey:@"nineG"] floatValue] blue:[[colorsDict4 objectForKey:@"nineB"] floatValue] alpha:1.0f],
                 [UIColor colorWithRed:[[colorsDict4 objectForKey:@"dotR"] floatValue] green:[[colorsDict4 objectForKey:@"dotG"] floatValue] blue:[[colorsDict4 objectForKey:@"dotB"] floatValue] alpha:1.0f],
                 nil];
    
    CGcolorArr4 = [[NSMutableArray alloc] init];
    for (UIColor *color in colorArr4)
    {
        [CGcolorArr4 addObject:(id)color.CGColor];
    }

    
    
    
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    
    CGFloat screenWidth;
    CGFloat screenHeight;
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenWidth = screenRect.size.width;
    screenHeight = screenRect.size.height;
    
    // if high score is null, set to 0
    NSString *highScore = [[NSUserDefaults standardUserDefaults] objectForKey:@"HighScore"];
    if (highScore == nil)
    {
        NSLog(@"here instead");
        [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"HighScore"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        highScore = @"0";
        
    }
    self.highScoreLabel.text = [NSString stringWithFormat:@"%@%@", @"High Score: ", highScore];

    // make navigation bar transparent
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    // make navigation items a better color and font
    //[self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor grayColor] forKey:NSForegroundColorAttributeName]];
    //self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    
    NSShadow* shadow = [NSShadow new];
    shadow.shadowOffset = CGSizeMake(0.0f, 1.0f);
    shadow.shadowColor = [UIColor clearColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor lightGrayColor];

    [[UIBarButtonItem appearance] setTitleTextAttributes:@{
                                                           NSFontAttributeName: [UIFont fontWithName:@"Verdana" size:16],
                                                           NSForegroundColorAttributeName: [UIColor lightGrayColor],
                                                           NSShadowAttributeName: shadow,
                                                           } forState:UIControlStateNormal];
    
    // handle labels and stuff
    //self.learnPiLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    //self.highScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 200, 100, 100)];
    
    [self loadBackgroundPi];
    [self makeButtonsPretty];
    //[self.view addSubview:self.learnPiLabel];
    //[self.view addSubview:self.highScoreLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)makeButtonsPretty
{
    UIColor *buttonBackgroundColor = [UIColor blackColor]; // this can be changed to default background color
    self.learnPiLabel.backgroundColor = [buttonBackgroundColor colorWithAlphaComponent:.8f];
    self.learnLabel.backgroundColor = [buttonBackgroundColor colorWithAlphaComponent:.8f];
    self.practiceLabel.backgroundColor = [buttonBackgroundColor colorWithAlphaComponent:.8f];
    self.playLabel.backgroundColor = [buttonBackgroundColor colorWithAlphaComponent:.8f];
    self.settingsLabel.backgroundColor = [buttonBackgroundColor colorWithAlphaComponent:.8f];
    self.highScoreLabel.backgroundColor = [buttonBackgroundColor colorWithAlphaComponent:.8f];

    self.learnPiLabel.layer.masksToBounds = YES;
    self.learnLabel.layer.masksToBounds = YES;
    self.settingsLabel.layer.masksToBounds = YES;
    self.highScoreLabel.layer.masksToBounds = YES;
    self.practiceLabel.layer.masksToBounds = YES;
    self.playLabel.layer.masksToBounds = YES;
    
     self.learnPiLabel.layer.cornerRadius = 8;
     self.learnLabel.layer.cornerRadius = 8;
     self.practiceLabel.layer.cornerRadius = 8;
     self.playLabel.layer.cornerRadius = 8;
     self.settingsLabel.layer.cornerRadius = 8;
     self.highScoreLabel.layer.cornerRadius = 8;
    
    //self.learnPiLabel.layer.borderColor = [[UIColor darkGrayColor] colorWithAlphaComponent:.8f].CGColor;
    self.learnLabel.layer.borderColor = [[UIColor darkGrayColor] colorWithAlphaComponent:.8f].CGColor;
    //self.highScoreLabel.layer.borderColor = [[UIColor darkGrayColor] colorWithAlphaComponent:.8f].CGColor;
    self.practiceLabel.layer.borderColor = [[UIColor darkGrayColor] colorWithAlphaComponent:.8f].CGColor;
    self.playLabel.layer.borderColor = [[UIColor darkGrayColor] colorWithAlphaComponent:.8f].CGColor;
    self.settingsLabel.layer.borderColor = [[UIColor darkGrayColor] colorWithAlphaComponent:.8f].CGColor;

    //self.learnPiLabel.layer.borderWidth = 1.0;
    self.learnLabel.layer.borderWidth = 1.0;
    self.playLabel.layer.borderWidth = 1.0;
    self.practiceLabel.layer.borderWidth = 1.0;
    self.settingsLabel.layer.borderWidth = 1.0;
    //self.highScoreLabel.layer.borderWidth = 1.0;

}

- (void)loadBackgroundPi
{
    piRealShort *piInst = [[piRealShort alloc] init];
    myPi2 = piInst.piMutString;

    self.piDigitsLabel.backgroundColor = [UIColor clearColor];
    self.piDigitsLabel.font = [UIFont fontWithName:@"Verdana" size:35];
    //self.piLabel.backgroundColor = colorInst.playBackgroundColor;
    self.piDigitsLabel.textAlignment = NSTextAlignmentCenter;
    self.piDigitsLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.piDigitsLabel.layer.cornerRadius = 10.0f;
    self.piDigitsLabel.layer.masksToBounds = YES;
    self.piDigitsLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.piDigitsLabel.numberOfLines = 0;
    
    self.piDigitsLabel.text = myPi2;
    [self updatePiColors];
    [self.view addSubview:self.piDigitsLabel];
    [self.view sendSubviewToBack:self.piDigitsLabel];
}

- (void) updatePiColors
{
    NSMutableAttributedString *text =
    [[NSMutableAttributedString alloc]
     initWithAttributedString: self.piDigitsLabel.attributedText];
    
    int count = 0;
    while(count < (int)[myPi2 length])
    {
        NSString *tempStr = [myPi2 substringWithRange:NSMakeRange(count, 1)];
        if ([tempStr isEqualToString:@"0"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr4 objectAtIndex:0]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"1"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr4 objectAtIndex:1]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"2"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr4 objectAtIndex:2]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"3"])
        {
            //NSLog(@"count = %i", count);
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr4 objectAtIndex:3]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"4"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr4 objectAtIndex:4]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"5"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr4 objectAtIndex:5]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"6"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr4 objectAtIndex:6]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"7"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr4 objectAtIndex:7]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"8"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr4 objectAtIndex:8]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"9"])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr4 objectAtIndex:9]
                         range:NSMakeRange(count,1)];
        }
        else if ([tempStr isEqualToString:@"."])
        {
            [text addAttribute:NSForegroundColorAttributeName
                         value:[colorArr4 objectAtIndex:10]
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
    
    [self.piDigitsLabel setAttributedText: text];
}


- (IBAction)playButtonPress:(id)sender {
    //NSLog(@"play pressed");
}

- (IBAction)practiceButtonPress:(id)sender {
    //NSLog(@"practice pressed");
}

- (IBAction)learnButtonPress:(id)sender {
    //NSLog(@"learn pressed");
}

- (IBAction)settingsButtonPress:(id)sender {
    //NSLog(@"settings pressed");
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"toPractice"])
    {
        practiceVC *p = [segue destinationViewController];
        p.prevVC = @"Practice";
    }
    else if ([[segue identifier] isEqualToString:@"toPlay"])
    {
        practiceVC *p = [segue destinationViewController];
        p.prevVC = @"Play";
    }
}

@end
