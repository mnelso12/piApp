//
//  ViewController.h
//  learnPi
//
//  Created by MadelynNelson on 11/4/15.
//  Copyright (c) 2015 Madelyn Nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *playButtonPress;
@property (strong, nonatomic) IBOutlet UIButton *practiceButtonPress;
@property (strong, nonatomic) IBOutlet UIButton *learnButtonPress;
@property (strong, nonatomic) IBOutlet UIButton *settingsButtonPress;

- (IBAction)playButtonPress:(id)sender;
- (IBAction)practiceButtonPress:(id)sender;
- (IBAction)learnButtonPress:(id)sender;
- (IBAction)settingsButtonPress:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *highScoreLabel;

@end
