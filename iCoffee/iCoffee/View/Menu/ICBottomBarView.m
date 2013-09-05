//
//  ICBottomBarView.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/17/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBottomBarView.h"
#import "ICMenuPanel.h"
#import <QuartzCore/QuartzCore.h>

@interface ICBottomBarView ()

@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) ICMenuPanel *menuPanelView;
@property (nonatomic, strong) UIButton *homeButton;
@property (nonatomic, strong) UIButton *settingButton;

@end

@implementation ICBottomBarView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];

    if (self)
    {
        self.arrowButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.arrowButton setBackgroundImage:[UIImage imageNamed:@"bottom_bar_arrow_up"]
                                    forState:UIControlStateNormal];
        [self.arrowButton sizeToFit];
        [self.arrowButton addTarget:delegate
                             action:@selector(bottomBarButtonClicked:)
                   forControlEvents:UIControlEventTouchUpInside];
        
        self.menuPanelView = [[ICMenuPanel alloc] initWithFrame:CGRectZero
                                                       delegate:delegate];
        
        self.homeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.homeButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.homeButton setTitle:@"Home" forState:UIControlStateNormal];
        self.homeButton.titleLabel.font = [UIFont icMediumFontWithSize:16];
        [self.homeButton addTarget:self
                            action:@selector(homeButtonClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
        [self.homeButton sizeToFit];
        
        self.settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.settingButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.settingButton setTitle:@"Setting" forState:UIControlStateNormal];
        [self.settingButton addTarget:self
                            action:@selector(settingButtonClicked:)
                  forControlEvents:UIControlEventTouchUpInside];
        
        self.settingButton.titleLabel.font = [UIFont icMediumFontWithSize:16];
        [self.settingButton sizeToFit];
        
        UISwipeGestureRecognizer *swipeUpGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:delegate
                                                                                                       action:@selector(swipeUpDidEnd:)];
        swipeUpGestureRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
        [self addGestureRecognizer:swipeUpGestureRecognizer];
        
        UISwipeGestureRecognizer *swipeDownGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:delegate
                                                                                                         action:@selector(swipeDownDidEnd:)];
        swipeDownGestureRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
        [self addGestureRecognizer:swipeDownGestureRecognizer];
        
        [self addSubview:self.backgroundImageView];
        [self addSubview:self.arrowButton];
        [self addSubview:self.menuPanelView];
        [self addSubview:self.homeButton];
        [self addSubview:self.settingButton];
        
        self.backgroundColor = [UIColor whiteColor];
        [self addShadowWithColor:[UIColor blackColor]];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    self.arrowButton.frame = [self.arrowButton alignedRectInSuperviewForSize:self.arrowButton.bounds.size
                                                                      offset:CGSizeMake(0, 5)
                                                                     options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsTop)];
    self.menuPanelView.frame = [self.menuPanelView alignedRectInSuperviewForSize:CGSizeMake(self.bounds.size.width, 200)
                                                                          offset:CGSizeMake(0, 30)
                                                                         options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsTop)];

    self.homeButton.frame = [self.homeButton alignedRectInSuperviewForSize:self.homeButton.bounds.size
                                                                    offset:CGSizeMake(10, (32 - self.homeButton.bounds.size.height)/2.0)
                                                                   options:(ICAlignmentOptionsLeft | ICAlignmentOptionsTop)];
    
    self.settingButton.frame = [self.settingButton alignedRectInSuperviewForSize:self.settingButton.bounds.size
                                                                          offset:CGSizeMake(10, (32 - self.settingButton.bounds.size.height)/2.0)
                                                                         options:(ICAlignmentOptionsRight | ICAlignmentOptionsTop)];

}


- (void)homeButtonClicked:(id)sender
{
    [self.delegate attemptPerformSelector:@selector(homeButtonClicked:)
                               withObject:sender];
}


- (void)settingButtonClicked:(id)sender
{
    [self.delegate attemptPerformSelector:@selector(settingButtonClicked:)
                               withObject:sender];
}

@end
