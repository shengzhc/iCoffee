//
//  UIView+QuartzCore.m
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/12/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "UIView+QuartzCore.h"
#import <QuartzCore/QuartzCore.h>
#import "UIView+ICServices.h"


@implementation UIView (QuartzCore)

+ (UIView *)backgroundViewWithColor:(UIColor *)color
{
    UIView *view = [[UIView alloc]
                    initWithFrame:CGRectZero];
    view.backgroundColor = color;
    return view;
}

+ (UIView *)shadowViewWithFrame:(CGRect)frame
                    shadowColor:(UIColor *)shadowColor
{
    UIView *shadowView = [[UIView alloc] initWithFrame:frame];
    [shadowView addShadowWithColor:shadowColor];
    return shadowView;
}

- (void)addShadowWithColor:(UIColor *)shadowColor
{
    [self addShadowWithColor:shadowColor
                     opacity:0.8
                      radius:3.0
                      offset:ICSizeMake(0, 0)];
}

- (void)addShadowWithColor:(UIColor *)shadowColor
                   opacity:(CGFloat)opacity
                    radius:(CGFloat)radius
                    offset:(CGSize)offset
{
    [self.layer setShadowColor:shadowColor.CGColor];
    [self.layer setShadowOpacity:opacity];
    [self.layer setShadowRadius:radius];
    [self.layer setShadowOffset:offset];
}

- (void)addBorderWithColor:(UIColor *)borderColor
{
    [self addBorderWithColor:borderColor
                       width:1.0f];
}

- (void)addBorderWithColor:(UIColor *)borderColor
                     width:(CGFloat)width
{
    [self.layer setBorderColor:borderColor.CGColor];
    [self.layer setBorderWidth:width];
}

- (void)addCorners
{
    [self addCornersWithRadius:5];
}

- (void)addCornersWithRadius:(CGFloat)radius
{
    [self.layer setCornerRadius:radius];
    self.layer.masksToBounds = YES;
}


@end
