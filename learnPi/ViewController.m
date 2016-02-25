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

@interface ViewController ()

@end

@implementation ViewController

NSMutableString *myPi2;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    
    CGFloat screenWidth;
    CGFloat screenHeight;
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenWidth = screenRect.size.width;
    screenHeight = screenRect.size.height;
    
    // if high score is null, set to 0
    NSString *highScore = [[NSUserDefaults standardUserDefaults] objectForKey:@"HighScore"];
    if ([highScore isEqualToString:nil])
    {
        NSLog(@"high score is nil, making it 0");
        [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"HighScore"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }

    // make navigation bar transparent
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    // make navigation items a better color and font
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor grayColor] forKey:NSForegroundColorAttributeName]];
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    
    NSShadow* shadow = [NSShadow new];
    shadow.shadowOffset = CGSizeMake(0.0f, 1.0f);
    shadow.shadowColor = [UIColor clearColor];
    [[UINavigationBar appearance] setTitleTextAttributes: @{
                                                            NSForegroundColorAttributeName: [UIColor clearColor],
                                                            NSFontAttributeName: [UIFont fontWithName:@"Helvetica" size:20.0f],
                                                            NSShadowAttributeName: shadow
                                                            }];

    
    // handle labels and stuff
    self.learnPiLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.highScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 200, 100, 100)];
    
    [self loadBackgroundPi];
    [self.view addSubview:self.learnPiLabel];
    [self.view addSubview:self.highScoreLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)

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
    
    colors *colorInst = [[colors alloc] init];
    
    int count = 0;
    while(count < (int)[myPi2 length])
    {
        NSString *tempStr = [myPi2 substringWithRange:NSMakeRange(count, 1)];
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
