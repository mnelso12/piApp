//
//  ViewController.m
//  learnPi
//
//  Created by MadelynNelson on 11/4/15.
//  Copyright (c) 2015 Madelyn Nelson. All rights reserved.
//

#import "ViewController.h"
#import "practiceVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor greenColor];
    
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
    
    [self.view addSubview:self.learnPiLabel];
    [self.view addSubview:self.highScoreLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
