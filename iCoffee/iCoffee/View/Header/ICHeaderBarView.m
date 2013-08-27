//
//  ICHeaderBarView.m
//
//  Created by Fangzhou Lu on 8/18/13.
//  Copyright (c) 2013 Fangzhou Lu. All rights reserved.
//

#import "ICHeaderBarView.h"
#import <QuartzCore/QuartzCore.h>


@implementation ICHeaderBarView

- (void)drawRect:(CGRect)rect
{
    UIImage *image = [UIImage imageNamed:@"personalize_bar"];
    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addShadowWithColor:[UIColor blackColor]];
}


@end
