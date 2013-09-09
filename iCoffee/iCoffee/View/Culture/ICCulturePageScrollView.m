//
//  ICPageScrollView.m
//  iCoffee
//
//  Created by Fangzhou Lu on 9/8/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICCulturePageScrollView.h"

@implementation ICCulturePageScrollView

- (id)initWithFrame:(CGRect)frame delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor blackColor];
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.pagingEnabled = YES;
        _scrollView.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
        _scrollView.backgroundColor = [UIColor blueColor];
        _scrollView.alpha = 0.5f;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.scrollsToTop = NO;
        [self addSubview:_scrollView];
        
    }
    return self;
}


@end
