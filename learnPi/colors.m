//
//  colors.m
//  learnPi
//
//  Created by MadelynNelson on 11/9/15.
//  Copyright (c) 2015 Madelyn Nelson. All rights reserved.
//

#import "colors.h"

@implementation colors

+ (id) alloc
{
    return [super alloc];
}

+ (id) init
{
    [super init];
    
    if (self)
    {
        
    }
    return self;
}

-(UIColor*)zeroColor
{
    return [UIColor colorWithRed:11.0f/255.0f
                           green:19.0f/255.0f
                            blue:82.0f/255.0f
                           alpha:.75f];
}

-(UIColor*)oneColor
{
    return [UIColor whiteColor];
}

-(UIColor*)twoColor
{
    return [UIColor blueColor];
}

-(UIColor*)threeColor
{
    return [UIColor yellowColor];
}
-(UIColor*)fourColor
{
    return [UIColor redColor];
}
-(UIColor*)fiveColor
{
    return [UIColor greenColor];
}
-(UIColor*)sixColor
{
    return [UIColor greenColor];
}
-(UIColor*)sevenColor
{
    return [UIColor purpleColor];
}
-(UIColor*)eightColor
{
    return [UIColor blueColor];
}
-(UIColor*)nineColor
{
    return [UIColor brownColor];
}
-(UIColor*)dotColor
{
    return [UIColor darkGrayColor];
}
-(UIColor*)playBackgroundColor
{
    return [UIColor blackColor];
}


-(NSString *)themeFont
{
    NSString *fontName = @"Verdana";
    //HiraMinProN-W6, Georgia-Bold
    return fontName;
}
 @end