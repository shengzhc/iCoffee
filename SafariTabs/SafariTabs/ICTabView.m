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
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    if (self)
    {
        self.backgroundColor = [UIColor grayColor];
        self.pageControl = [[UIPageControl alloc] init];
        self.pageControl.currentPage = 0;
        self.pageControl.numberOfPages = 3;
        [self addSubview:self.pageControl];
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.pageControl.frame = [self.pageControl alignedRectInSuperviewForSize:CGSizeMake(self.bounds.size.width, 30)
                                                                      offset:CGSizeMake(0, 50)
                                                                     options:ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsBottom];
}




@end
