//
//  ViewController.h
//  learnPi
//
//  Created by MadelynNelson on 11/4/15.
//  Copyright (c) 2015 Madelyn Nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UILabel *highScoreLabel;
}
@property (strong, nonatomic) IBOutlet UIButton *playButtonPress; // what are these four things?
@property (strong, nonatomic) IBOutlet UIButton *practiceButtonPress;
@property (strong, nonatomic) IBOutlet UIButton *learnButtonPress;
@property (strong, nonatomic) IBOutlet UIButton *settingsButtonPress;

@property (strong, nonatomic) IBOutlet UILabel *learnPiLabel;
@property (strong, nonatomic) IBOutlet UILabel *practiceLabel;
//@property (strong, nonatomic) IBOutlet UIButton *learnLabel; // button wtf
//@property (strong, nonatomic) IBOutlet UIButton *playLabel; // button wtf
@property (strong, nonatomic) IBOutlet UILabel *learnLabel;
@property (strong, nonatomic) IBOutlet UILabel *playLabel;
@property (strong, nonatomic) IBOutlet UILabel *settingsLabel;
@property (strong, nonatomic) IBOutlet UILabel *highScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *piDigitsLabel;

- (IBAction)playButtonPress:(id)sender;
- (IBAction)practiceButtonPress:(id)sender;
- (IBAction)learnButtonPress:(id)sender;
- (IBAction)settingsButtonPress:(id)sender;

@end

