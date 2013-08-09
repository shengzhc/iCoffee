//
//  ICTabView.m
//  SafariTabs
//
//  Created by Shengzhe Chen on 8/5/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICTabView.h"

@interface ICTabView ()

@end

@implementation ICTabView

- (id)initWithFrame:(CGRect)frame
           delegate:(id < UIScrollViewDelegate >)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    if (self)
    {
        self.backgroundColor = [UIColor grayColor];
        
        self.pageControl = [[UIPageControl alloc] init];
        [self.pageControl addTarget:delegate action:@selector(pageControlValueChanged:) forControlEvents:UIControlEventValueChanged];
        
        self.scrollView = [[UIScrollView alloc] init];
        self.scrollView.delegate = delegate;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.showsVerticalScrollIndicator = NO;
        
        self.headerLabel = [UILabel labelWithAlignment:NSTextAlignmentCenter
                                                  font:[UIFont boldFontWithSize:12]
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
                                                                      offset:CGSizeMake(0, 50)
                                                                     options:(ICAlignmentOptionsTop | ICAlignmentOptionsHorizontalCenter)];

    self.pageControl.frame = [self.pageControl alignedRectInSuperviewForSize:CGSizeMake(self.bounds.size.width, 30)
                                                                      offset:CGSizeMake(0, 50)
                                                                     options:ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsBottom];
}


- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    return !(CGRectContainsPoint(self.leftWallView.frame, point) ||
             CGRectContainsPoint(self.rightWallView.frame, point));
}



@end
