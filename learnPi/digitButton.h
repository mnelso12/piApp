//
//  digitButton.h
//  learnPi
//
//  Created by MadelynNelson on 11/9/15.
//  Copyright (c) 2015 Madelyn Nelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface digitButton : UIView
@property (strong, nonatomic) IBOutlet UILabel *digitLabel; // label inside view
@property (strong, nonatomic) IBOutlet NSNumber *number; // which number it is
@property (strong, nonatomic) IBOutlet NSString *hexColor; // color of that number

@end


