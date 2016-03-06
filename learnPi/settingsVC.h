//
//  settingsVC.h
//  learnPi
//
//  Created by MadelynNelson on 11/4/15.
//  Copyright (c) 2015 Madelyn Nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface settingsVC : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UIButton *saveColorButton;
- (IBAction)saveColorButtonPress:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *groupsTextField;
- (IBAction)back1Pressed:(id)sender;
- (IBAction)back2Pressed:(id)sender;
- (IBAction)back3Pressed:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *back1Button;
@property (strong, nonatomic) IBOutlet UIButton *back2Button;
@property (strong, nonatomic) IBOutlet UIButton *back3Button;

@property (strong, nonatomic) IBOutlet UILabel *learnInGroupsLabel;
@property (strong, nonatomic) IBOutlet UILabel *backgroundLabel;


@end
