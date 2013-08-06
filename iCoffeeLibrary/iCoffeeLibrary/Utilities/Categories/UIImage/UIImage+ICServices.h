//
//  UIImage+ICServices.h
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/19/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ICServices)

+ (UIImage *)imageWithGradientColors:(NSArray *)colors
                           locations:(NSArray *)locations
                                size:(CGSize)size;

+ (UIImage *)imageWithColor:(UIColor *)color
                       size:(CGSize)size;

- (UIImage *)imageWithOverlayColor:(UIColor *)color;


@end
