//
//  digitButton.m
//  learnPi
//
//  Created by MadelynNelson on 11/9/15.
//  Copyright (c) 2015 Madelyn Nelson. All rights reserved.
//

#import "digitButton.h"

@implementation digitButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        // initilize all your UIView components
        //UILabel *digitLabel = [[UILabel alloc]initWithFrame:CGRectMake(20,30, 200, 44)];
        UILabel *digitLabel = [[UILabel alloc] init];
        
        // this number's color
        UIColor *themeColor = [UIColor colorWithRed:((float)(([self.hexColor intValue] & 0xFF0000) >> 16))/255.0 \
                        green:((float)(([self.hexColor intValue] & 0x00FF00) >>  8))/255.0 \
                         blue:((float)(([self.hexColor intValue] & 0x0000FF) >>  0))/255.0 \
                        alpha:1.0];
        
        digitLabel.text = [self.number stringValue];
        digitLabel.textColor = themeColor;
        self.layer.borderColor = themeColor.CGColor;
        self.backgroundColor = [UIColor whiteColor]; // temporary
        self.layer.borderWidth = 3.0;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 15;
        
        [self addSubview:digitLabel]; //add label1 to your custom view
    }
    return self;
}

@end
