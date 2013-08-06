//
//  UIView+QuartzCore.h
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/12/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (QuartzCore)

+ (UIView *)backgroundViewWithColor:(UIColor *)color;
+ (UIView *)shadowViewWithFrame:(CGRect)frame
                    shadowColor:(UIColor *)shadowColor;

- (void)addShadowWithColor:(UIColor *)shadowColor;
- (void)addShadowWithColor:(UIColor *)shadowColor
                   opacity:(CGFloat)opacity
                    radius:(CGFloat)radius
                    offset:(CGSize)offset;

- (void)addBorderWithColor:(UIColor *)borderColor;
- (void)addBorderWithColor:(UIColor *)borderColor width:(CGFloat)width;

- (void)addCorners;
- (void)addCornersWithRadius:(CGFloat)radius;

@end
