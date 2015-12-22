//
//  ViewController.m
//  learnPi
//
//  Created by MadelynNelson on 11/4/15.
//  Copyright (c) 2015 Madelyn Nelson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor greenColor];
    
    // if high score is null, set to 0
    NSString *highScore = [[NSUserDefaults standardUserDefaults] objectForKey:@"HighScore"];
    if (highScore == nil)
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:@"HighScore"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
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
@end
