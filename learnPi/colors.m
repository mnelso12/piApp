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
    return [UIColor colorWithRed:11.0f/255.0f
                           green:19.0f/255.0f
                            blue:82.0f/255.0f
                           alpha:.75f];
}

-(UIColor*)twoColor
{
    return [UIColor colorWithRed:11.0f/255.0f
                           green:19.0f/255.0f
                            blue:82.0f/255.0f
                           alpha:.75f];
}

-(UIColor*)threeColor
{
    return [UIColor colorWithRed:11.0f/255.0f
                           green:19.0f/255.0f
                            blue:82.0f/255.0f
                           alpha:.75f];
}



-(NSString *)themeFont
{
    NSString *fontName = @"Superclarendon-Regular";
    //HiraMinProN-W6, Georgia-Bold
    return fontName;
}

@end