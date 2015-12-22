//
//  practiceVC.h
//  learnPi
//
//  Created by MadelynNelson on 11/4/15.
//  Copyright (c) 2015 Madelyn Nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface practiceVC : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *highScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *currentDigitLabel;
@property (strong, nonatomic) IBOutlet UILabel *piLabel;
@property (strong, nonatomic) IBOutlet UILabel *strikesLabel;

@property (strong, nonatomic) IBOutlet NSString *prevVC;

@property (strong, nonatomic) IBOutlet UILabel *zeroLabel;
@property (strong, nonatomic) IBOutlet UILabel *oneLabel;
@property (strong, nonatomic) IBOutlet UILabel *twoLabel;
@property (strong, nonatomic) IBOutlet UILabel *threeLabel;
@property (strong, nonatomic) IBOutlet UILabel *fourLabel;
@property (strong, nonatomic) IBOutlet UILabel *fiveLabel;
@property (strong, nonatomic) IBOutlet UILabel *sixLabel;
@property (strong, nonatomic) IBOutlet UILabel *sevenLabel;
@property (strong, nonatomic) IBOutlet UILabel *eightLabel;
@property (strong, nonatomic) IBOutlet UILabel *nineLabel;
@property (strong, nonatomic) IBOutlet UILabel *dotLabel;

@property (strong, nonatomic) IBOutlet UIView *zeroView;
@property (strong, nonatomic) IBOutlet UIView *oneView;
@property (strong, nonatomic) IBOutlet UIView *twoView;
@property (strong, nonatomic) IBOutlet UIView *threeView;
@property (strong, nonatomic) IBOutlet UIView *fourView;
@property (strong, nonatomic) IBOutlet UIView *fiveView;
@property (strong, nonatomic) IBOutlet UIView *sixView;
@property (strong, nonatomic) IBOutlet UIView *sevenView;
@property (strong, nonatomic) IBOutlet UIView *eightView;
@property (strong, nonatomic) IBOutlet UIView *nineView;
@property (strong, nonatomic) IBOutlet UIView *dotView;

@end
