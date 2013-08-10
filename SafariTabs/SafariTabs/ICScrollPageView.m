//
//  ICScrollPageView.m
//  SafariTabs
//
//  Created by Shengzhe Chen on 8/10/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICScrollPageView.h"

@implementation ICScrollPageView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];

    if (self)
    {
        
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    return [super hitTest:point withEvent:event];
}

@end
