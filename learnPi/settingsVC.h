//
//  settingsVC.h
//  learnPi
//
//  Created by MadelynNelson on 11/4/15.
//  Copyright (c) 2015 Madelyn Nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface settingsVC : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UIButton *updateColorsButton;
- (IBAction)updateColorsButtonPress:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *saveColorButton;
- (IBAction)saveColorButtonPress:(id)sender;

@end
