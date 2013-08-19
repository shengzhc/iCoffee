//
//  ICMainMediatorVIew.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/17/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICMainMediatorView.h"
#import "ICBottomBarView.h"
#import "ICHeaderBarView.h"

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
        self.backgroundColor = [UIColor blackColor];
        
        self.headerBarView = [[ICHeaderBarView alloc] initWithFrame:CGRectZero
                                                           delegate:self
                                                          imageName:@"icon_home"
                                                               text:@""];
        
        self.contentView = [[ICView alloc] initWithFrame:CGRectZero
                                                delegate:delegate];
        self.contentView.backgroundColor = [UIColor blackColor];
        
        self.bottomBarView = [[ICBottomBarView alloc] initWithFrame:CGRectZero
                                                           delegate:self];

        [self addSubview:self.contentView];
        [self addSubview:self.headerBarView];
        [self addSubview:self.bottomBarView];
        
        self.headerBarView.frame = [self.headerBarView alignedRectInSuperviewForSize:[self headerBarSize]
                                                                              offset:CGSizeMake(0, 0)
                                                                             options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsTop)];
        
        self.bottomBarView.frame = [self.bottomBarView alignedRectInSuperviewForSize:[self bottomBarSize]
                                                                              offset:CGSizeMake(0, 0)
                                                                             options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsBottom)];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.contentView.frame = [self.contentView alignedRectInSuperviewForSize:CGSizeMake(self.bounds.size.width, self.bounds.size.height - [self headerBarSize].height)
                                                                      offset:CGSizeMake(0, self.headerBarView.verticalEnding)
                                                                     options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsTop)];
}


///////////////////////////////////////////
///////////////////////////////////////////
#pragma mark Configuration
///////////////////////////////////////////
///////////////////////////////////////////
- (CGSize)bottomBarSize
{
    return CGSizeMake(self.bounds.size.width, 30);
}


- (CGSize)bottomBarExpandSize
{
    return CGSizeMake(self.bounds.size.width, 230);
}


- (CGSize)headerBarSize
{
    return CGSizeMake(self.bounds.size.width, 30);
}


- (CGFloat)animationDuration
{
    return 0.2;
}
///////////////////////////////////////////
///////////////////////////////////////////
#pragma mark Convenient
///////////////////////////////////////////
///////////////////////////////////////////
- (void)toggleBottomBarView
{
    BOOL isOpen = self.bottomBarView.frame.size.height > [self bottomBarSize].height+1;
    
    if (isOpen)
    {
        
        [UIView animateWithDuration:[self animationDuration]
                         animations:^
        {
            self.bottomBarView.frame = [self.bottomBarView alignedRectInSuperviewForSize:[self bottomBarSize]
                                                                                  offset:CGSizeMake(0, 0)
                                                                                 options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsBottom)];
        }
                         completion:^(BOOL finished)
        {
            [self.bottomBarView.arrowButton setBackgroundImage:[UIImage imageNamed:@"bottom_bar_arrow_up"]
                                                      forState:UIControlStateNormal];
        }];
    }
    else
    {
        
        [UIView animateWithDuration:[self animationDuration]
                         animations:^
         {
             self.bottomBarView.frame = [self.bottomBarView alignedRectInSuperviewForSize:[self bottomBarExpandSize]
                                                                                   offset:CGSizeMake(0, 0)
                                                                                  options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsBottom)];
         }
                         completion:^(BOOL finished)
         {
             [self.bottomBarView.arrowButton setBackgroundImage:[UIImage imageNamed:@"bottom_bar_arrow_down"]
                                                       forState:UIControlStateNormal];
         }];
    }
}

///////////////////////////////////////////
///////////////////////////////////////////
#pragma mark Touch
///////////////////////////////////////////
///////////////////////////////////////////
- (void)homeButtonClicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(homeButtonClicked:)])
    {
        [self.delegate performSelector:@selector(homeButtonClicked:)
                            withObject:sender];
    }
}


- (void)bottomBarButtonClicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(bottomBarButtonClicked:)])
    {
        [self.delegate performSelector:@selector(bottomBarButtonClicked:)
                            withObject:sender];
    }
}


- (void)beanButtonClicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(beanButtonClicked:)])
    {
        [self.delegate performSelector:@selector(beanButtonClicked:)
                            withObject:sender];
    }
}


- (void)brewButtonClicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(brewButtonClicked:)])
    {
        [self.delegate performSelector:@selector(brewButtonClicked:)
                            withObject:sender];
    }}


- (void)cultureButtonClicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(cultureButtonClicked:)])
    {
        [self.delegate performSelector:@selector(cultureButtonClicked:)
                            withObject:sender];
    }
}


- (void)favoriteButtonClicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(favoriteButtonClicked:)])
    {
        [self.delegate performSelector:@selector(favoriteButtonClicked:)
                            withObject:sender];
    }
}


- (void)findButtonClicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(findButtonClicked:)])
    {
        [self.delegate performSelector:@selector(findButtonClicked:)
                            withObject:sender];
    }
}


- (void)settingButtonClicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(settingButtonClicked:)])
    {
        [self.delegate performSelector:@selector(settingButtonClicked:)
                            withObject:sender];
    }
}


- (void)swipeUpDidEnd:(UISwipeGestureRecognizer *)swipeGesetureRecognizer
{
    BOOL isOpen = self.bottomBarView.frame.size.height > [self bottomBarSize].height+1;

    if (!isOpen)
    {
        [self bottomBarButtonClicked:nil];
    }
}


- (void)swipeDownDidEnd:(UISwipeGestureRecognizer *)swipeGestureRecognizer
{
    BOOL isOpen = self.bottomBarView.frame.size.height > [self bottomBarSize].height+1;
    
    if (isOpen)
    {
        [self bottomBarButtonClicked:nil];
    }
}


@end
