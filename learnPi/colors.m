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
    return [UIColor colorWithRed:10.0f/255.0f
                           green:0.0f/255.0f
                            blue:209.0f/255.0f
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
    return [UIColor colorWithRed:17.0f/255.0f
                           green:122.0f/255.0f
                            blue:11.0f/255.0f
                           alpha:.75f];
}
-(UIColor*)sixColor
{
    return [UIColor greenColor];
}
-(UIColor*)sevenColor
{
    return [UIColor colorWithRed:255.0f/255.0f
                           green:60.0f/255.0f
                            blue:181.0f/255.0f
                           alpha:.75f];
}
-(UIColor*)eightColor
{
    return  [UIColor colorWithRed:10.0f/255.0f
                                   green:0.0f/255.0f
                                    blue:209.0f/255.0f
                                   alpha:.75f];
}
-(UIColor*)nineColor
{
    return [UIColor colorWithRed:72.0f/255.0f
                           green:93.0f/255.0f
                            blue:78.0f/255.0f
                           alpha:.75f];
}

-(UIColor*)dotColor
{
    return [UIColor darkGrayColor];
}
-(UIColor*)playBackgroundColor
{
    return [UIColor orangeColor];
}
-(UIColor*)numBackgroundColor
{
    return [UIColor darkGrayColor];
}



-(NSString *)themeFont
{
    NSString *fontName = @"Verdana";
    //HiraMinProN-W6, Georgia-Bold
    return fontName;
}
 @end