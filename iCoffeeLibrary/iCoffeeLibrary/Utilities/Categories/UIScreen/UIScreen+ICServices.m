//
//  UIScreen+ICServices.m
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/14/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "UIScreen+ICServices.h"
#import "ICGeometry.h"

@implementation UIScreen (ICServices)


+ (BOOL)isRetina
{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] &&
        [UIScreen mainScreen].scale == 2.0)
    {
        return YES;
    }
    
    return NO;
}

+ (CGFloat)screenHeigth
{
    return [[UIScreen mainScreen] applicationFrame].size.height +
    [UIApplication sharedApplication].statusBarFrame.size.height;
}

+ (CGFloat)screenWidth
{
    return [[UIScreen mainScreen] applicationFrame].size.width;
}

+ (CGFloat)statusBarHeight
{
    return [UIApplication sharedApplication].statusBarFrame.size.height;
}

@end
