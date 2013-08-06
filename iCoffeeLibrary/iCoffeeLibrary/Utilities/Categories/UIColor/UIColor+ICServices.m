//
//  UIColor+ICServices.m
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/21/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "UIColor+ICServices.h"

@implementation UIColor (ICServices)

+ (UIColor *)colorWithHex:(UInt32)hex
{
    return [UIColor colorWithHex:hex
                           alpha:1.0f];
}


+ (UIColor *)colorWithHex:(UInt32)hex
                    alpha:(CGFloat)alpha
{
    float r = ((hex & 0xFF0000) >> 16);
    float g = ((hex & 0x00FF00) >> 8);
    float b = ((hex & 0x0000FF));
    
    return [UIColor colorWithRed:r/255.0
                           green:g/255.0
                            blue:b/255.0
                           alpha:alpha];
}

- (UIColor *)colorWithLighterFactor:(CGFloat)factor
{
    float r = self.CIColor.red;
    float g = self.CIColor.green;
    float b = self.CIColor.blue;
    float a = self.CIColor.alpha;
    
    float total = r + g + b;
    if (total >= 255.0 * 3)
    {
        r = g = b = 255.0;
    }
    else
    {
        float adjust = (255.0 * 3 - total) / 3.0;
        r = r + adjust * factor;
        g = g + adjust * factor;
        b = b + adjust * factor;
    }
    
    return [UIColor colorWithRed:(r > 255.0 ? 255.0 : r)/255.0
                           green:(g > 255.0 ? 255.0 : g)/255.0
                            blue:(b > 255.0 ? 255.0 : b)/255.0
                           alpha:a];
}

- (UIColor *)colorWithDarkerFactor:(CGFloat)factor
{
    float r = self.CIColor.red;
    float g = self.CIColor.green;
    float b = self.CIColor.blue;
    float a = self.CIColor.alpha;
    
    float total = r + g + b;
    if (total >= 255.0 * 3)
    {
        r = g = b = 255.0;
    }
    else
    {
        float adjust = (255.0 * 3 - total) / 3.0;
        r = r - adjust * factor;
        g = g - adjust * factor;
        b = b - adjust * factor;
    }
    
    return [UIColor colorWithRed:(r > 0 ? r : 0)/255.0
                           green:(g > 0 ? g : 0)/255.0
                            blue:(b > 0 ? b : 0)/255.0
                           alpha:a];
}

@end

