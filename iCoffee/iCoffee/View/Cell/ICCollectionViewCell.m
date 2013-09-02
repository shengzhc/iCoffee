//
//  ICCollectionViewCell.m
//  iCoffee
//
//  Created by Shengzhe Chen on 9/1/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICCollectionViewCell.h"

@implementation ICCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGRect circleRect = CGRectInset(rect, 1, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, .5);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextStrokeRect(context, circleRect);
    CGContextStrokePath(context);
    UIGraphicsEndImageContext();
}

@end
