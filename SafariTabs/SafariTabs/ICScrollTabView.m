//
//  ICTabView.m
//  SafariTabs
//
//  Created by Shengzhe Chen on 8/5/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICScrollTabView.h"

@interface ICScrollTabView ()

@end

@implementation ICScrollTabView

- (id)initWithFrame:(CGRect)frame
           delegate:(id < UIScrollViewDelegate >)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    if (self)
    {
        self.backgroundColor = [UIColor grayColor];
        
        self.pageControl = [[UIPageControl alloc] init];
        
        self.scrollView = [[UIScrollView alloc] init];
        self.scrollView.delegate = delegate;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.showsVerticalScrollIndicator = NO;
        
        self.headerLabel = [UILabel labelWithAlignment:NSTextAlignmentCenter
                                                  font:[UIFont boldFontWithSize:20]
                                             textColor:[UIColor blackColor]];
        
        self.leftWallView = [[UIView alloc] initWithFrame:CGRectZero];
        self.rightWallView = [[UIView alloc] initWithFrame:CGRectZero];
        
        [self addSubview:self.headerLabel];
        [self addSubview:self.scrollView];
        [self addSubview:self.pageControl];
        [self addSubview:self.leftWallView];
        [self addSubview:self.rightWallView];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.headerLabel.frame = [self.headerLabel alignedRectInSuperviewForSize:CGSizeMake(self.bounds.size.width, 20)
                                                                      offset:CGSizeMake(0, 35)
                                                                     options:(ICAlignmentOptionsTop | ICAlignmentOptionsHorizontalCenter)];

    self.pageControl.frame = [self.pageControl alignedRectInSuperviewForSize:CGSizeMake(self.bounds.size.width, 30)
                                                                      offset:CGSizeMake(0, 50)
                                                                     options:ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsBottom];
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if ([self.leftWallView pointInside:point withEvent:event])
    {
        return self;
    }
    else if ([self.leftWallView pointInside:point withEvent:event])
    {
        return self;
    }
 
    CGRect scrollRect = CGRectMake(0, self.scrollView.frame.origin.y, self.bounds.size.width, self.scrollView.frame.size.height);
    
    if (CGRectContainsPoint(scrollRect, point))
    {
        for (UIView *subview in self.scrollView.subviews)
        {
            CGPoint subPoint = [subview convertPoint:point fromView:self];
            if (CGRectContainsPoint(subview.bounds, subPoint))
            {
                UIView *t = [subview hitTest:subPoint withEvent:event];
                return t;
            }
        }
        return self.scrollView;
    }
    
    return [super hitTest:point withEvent:event];
}


@end
