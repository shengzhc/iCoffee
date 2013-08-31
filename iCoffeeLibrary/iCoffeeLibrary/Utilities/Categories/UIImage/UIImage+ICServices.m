//
//  UIImage+ICServices.m
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/19/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "UIImage+ICServices.h"
#import "ICGeometry.h"

@implementation UIImage (ICServices)


+ (CGGradientRef)gradientRefWithColors:(NSArray *)colors
                             locations:(NSArray *)locations
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    float *locationsPrimitiveArray = malloc([locations count] * sizeof(float));
    [locations enumerateObjectsWithOptions:NSEnumerationConcurrent
                                usingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         locationsPrimitiveArray[idx] = [obj floatValue];
     }];
    
    NSMutableArray *CGColorArray = [NSMutableArray array];
    for (UIColor *color in colors)
    {
        [CGColorArray addObject:(id)[color CGColor]];
    }
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)CGColorArray, locationsPrimitiveArray);
    CGColorSpaceRelease(colorSpace);
    free(locationsPrimitiveArray);
    
    return gradient;
}

+ (UIImage *)imageWithGradientColors:(NSArray *)colors
                           locations:(NSArray *)locations
                                size:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (!context)
    {
        return nil;
    }
    
    CGGradientRef gradient = [self gradientRefWithColors:colors
                                               locations:locations];
    
    CGContextDrawLinearGradient(context,
                                gradient,
                                ICPointMake(size.width*0.5, 0.0),
                                ICPointMake(size.width*0.5, size.height),
                                0);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


+ (UIImage *)imageWithColor:(UIColor *)color
                       size:(CGSize)size
{
    if (!color)
    {
        return nil;
    }
    
    CGRect rect = ICRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)imageWithOverlayColor:(UIColor *)color
{
    if (!color)
    {
        return self;
    }
    
    CGRect rect = ICRectMake(0, 0, self.size.width, self.size.height);
    
    UIGraphicsBeginImageContext(self.size);
    [self drawInRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetBlendMode(context, kCGBlendModeSourceIn);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


- (UIImage *)imageWithBorderColor:(UIColor *)color
{
    if (!color)
    {
        return self;
    }
    
    CGRect rect = ICRectMake(5, 5, self.size.width, self.size.height);
    CGRect outRect = CGRectMake(0, 0, rect.size.width + 10 , rect.size.height + 10);
    
    UIGraphicsBeginImageContextWithOptions(outRect.size, NO, 2.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:outRect
                                                    cornerRadius:10.0];
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextSetLineWidth(context, 1.0);
    CGContextAddPath(context, path.CGPath);
    CGContextStrokePath(context);
    [self drawInRect:rect];
    UIImage *ret = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return ret;
}

@end
