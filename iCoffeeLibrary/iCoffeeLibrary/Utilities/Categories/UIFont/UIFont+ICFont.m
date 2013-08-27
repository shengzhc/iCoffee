//
//  UIFont+ICFont.m
//  iCoffeeLibrary
//
//  Created by Shengzhe Chen on 8/26/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "UIFont+ICFont.h"

@implementation UIFont (ICFont)

+ (UIFont *)icBoldFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"Roboto-Bold" size:size];
}


+ (UIFont *)icLightFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"Roboto-Light" size:size];
}


+ (UIFont *)icMediumFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"Roboto-Medium" size:size];
}


+ (UIFont *)icRegularFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"Roboto-Regular" size:size];
}


+ (UIFont *)icThinFontWithSize:(CGFloat)size
{
    return [UIFont fontWithName:@"Roboto-Thin" size:size];
}

@end
