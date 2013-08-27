//
//  UIFont+ICFont.h
//  iCoffeeLibrary
//
//  Created by Shengzhe Chen on 8/26/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (ICFont)

+ (UIFont *)icBoldFontWithSize:(CGFloat)size;
+ (UIFont *)icLightFontWithSize:(CGFloat)size;
+ (UIFont *)icMediumFontWithSize:(CGFloat)size;
+ (UIFont *)icRegularFontWithSize:(CGFloat)size;
+ (UIFont *)icThinFontWithSize:(CGFloat)size;

@end
