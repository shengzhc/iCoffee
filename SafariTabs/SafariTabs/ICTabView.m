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
        self.scrollView = [[UIScrollView alloc] init];
        self.scrollView.delegate = delegate;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.showsVerticalScrollIndicator = NO;
        
        self.headerLabel = [UILabel labelWithAlignment:NSTextAlignmentCenter
                                                  font:[UIFont boldFontWithSize:12]
                                             textColor:[UIColor blackColor]];
        
        
        [self addSubview:self.headerLabel];
        [self addSubview:self.scrollView];
        [self addSubview:self.pageControl];
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




@end
