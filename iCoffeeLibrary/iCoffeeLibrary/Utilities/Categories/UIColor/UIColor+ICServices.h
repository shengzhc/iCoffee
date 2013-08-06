//
//  UIColor+ICServices.h
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/21/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ICServices)

+ (UIColor *)colorWithHex:(UInt32)hex;

+ (UIColor *)colorWithHex:(UInt32)hex
                    alpha:(CGFloat)alpha;

- (UIColor *)colorWithLighterFactor:(CGFloat)factor;

- (UIColor *)colorWithDarkerFactor:(CGFloat)factor;

@end
