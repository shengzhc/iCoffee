//
//  ICMainMediatorVIew.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/17/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICMainMediatorView.h"
#import "ICBottomBarView.h"

@interface ICMainMediatorView ()

@end

@implementation ICMainMediatorView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    
    if (self)
    {
        self.contentView = [[ICView alloc] initWithFrame:CGRectZero
                                                delegate:delegate];
        
        self.bottomBarView = [[ICBottomBarView alloc] initWithFrame:CGRectZero
                                                           delegate:delegate];

        [self addSubview:self.contentView];
        [self addSubview:self.bottomBarView];
        
        self.bottomBarView.frame = [self.bottomBarView alignedRectInSuperviewForSize:[self bottomBarSize]
                                                                              offset:CGSizeMake(0, 0)
                                                                             options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsBottom)];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.contentView.frame = [self.contentView alignedRectInSuperviewForSize:self.bounds.size
                                                                      offset:CGSizeMake(0, 0)
                                                                     options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsTop)];
}


- (CGSize)bottomBarSize
{
    return CGSizeMake(self.bounds.size.width, 30);
}


- (CGSize)bottomBarExpandSize
{
    return CGSizeMake(self.bounds.size.width, 230);
}


- (void)toggleBottomBarView
{
    BOOL isOpen = self.bottomBarView.frame.size.height > [self bottomBarSize].height+1;
    
    if (isOpen)
    {
        [self.bottomBarView.arrowButton setBackgroundImage:[UIImage imageNamed:@"bottom_bar_arrow_up"]
                          forState:UIControlStateNormal];
        
        [UIView animateWithDuration:.5
                         animations:^
        {
            self.bottomBarView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0];
            self.bottomBarView.frame = [self.bottomBarView alignedRectInSuperviewForSize:[self bottomBarSize]
                                                                                  offset:CGSizeMake(0, 0)
                                                                                 options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsBottom)];
        }
                         completion:^(BOOL finished)
        {
        }];
    }
    else
    {
        [self.bottomBarView.arrowButton setBackgroundImage:[UIImage imageNamed:@"bottom_bar_arrow_down"]
                                                  forState:UIControlStateNormal];
        
        [UIView animateWithDuration:.5
                         animations:^
         {
             self.bottomBarView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.2];
             self.bottomBarView.frame = [self.bottomBarView alignedRectInSuperviewForSize:[self bottomBarExpandSize]
                                                                                   offset:CGSizeMake(0, 0)
                                                                                  options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsBottom)];

         }
                         completion:^(BOOL finished)
         {
             
         }];
    }
}

@end
