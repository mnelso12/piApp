//
//  colors.h
//  learnPi
//
//  Created by MadelynNelson on 11/9/15.
//  Copyright (c) 2015 Madelyn Nelson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface colors : NSObject

+ (id) init;
+ (id) alloc;

- (UIColor *)zeroColor;
- (UIColor *)oneColor;
- (UIColor *)twoColor;
- (UIColor *)threeColor;
- (UIColor *)fourColor;
- (UIColor *)fiveColor;
- (UIColor *)sixColor;
- (UIColor *)sevenColor;
- (UIColor *)eightColor;
- (UIColor *)nineColor;
- (UIColor *)dotColor;
- (UIColor *)playBackgroundColor;

- (NSString *)themeFont;

@end