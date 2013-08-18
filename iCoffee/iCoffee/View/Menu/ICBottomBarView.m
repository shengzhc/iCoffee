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

@end

@implementation ICBottomBarView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];

    if (self)
    {
        self.backgroundColor = [UIColor colorWithRed:236/255.0
                                               green:236/255.0
                                                blue:236/255.0
                                               alpha:1.0];
        [self addShadowWithColor:[UIColor blackColor] opacity:0.2 radius:0.8 offset:CGSizeMake(0, -2)];
        self.backgroundImageView = [[UIImageView alloc] init];
        self.backgroundImageView.userInteractionEnabled = YES;
        
        self.arrowButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.arrowButton setBackgroundImage:[UIImage imageNamed:@"bottom_bar_arrow_up"]
                                    forState:UIControlStateNormal];
        [self.arrowButton sizeToFit];
        [self.arrowButton addTarget:delegate
                             action:@selector(bottomBarButtonClicked:)
                   forControlEvents:UIControlEventTouchUpInside];
        
        self.menuPanelView = [[ICMenuPanel alloc] initWithFrame:CGRectZero
                                                       delegate:delegate];
        
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
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.backgroundImageView.frame = [self.backgroundImageView alignedRectInSuperviewForSize:CGSizeMake(self.bounds.size.width, 30)
                                                                                      offset:CGSizeMake(0, 0)
                                                                                     options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsTop)];
    
    self.arrowButton.frame = [self.arrowButton alignedRectInSuperviewForSize:self.arrowButton.bounds.size
                                                                      offset:CGSizeMake(0, 5)
                                                                     options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsTop)];
    self.menuPanelView.frame = [self.menuPanelView alignedRectInSuperviewForSize:CGSizeMake(self.bounds.size.width, 200)
                                                                          offset:CGSizeMake(0, 30)
                                                                         options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsTop)];
}




@end
