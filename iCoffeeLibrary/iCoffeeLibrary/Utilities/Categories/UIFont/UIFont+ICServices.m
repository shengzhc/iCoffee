//
//  UIFont+ICServices.m
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/19/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "UIFont+ICServices.h"

@implementation UIFont (ICServices)

+ (UIFont *)fontWithSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"ArialMT"
                           size:fontSize];
}

+ (UIFont *)boldFontWithSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"Arial-BoldMT"
                           size:fontSize];
}

+ (UIFont *)italicFontWithSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"Arial-ItalicMT"
                           size:fontSize];
}

@end
