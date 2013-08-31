//
//  ICMenuPanel.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/17/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICMenuPanel.h"
#import "ICMenuButton.h"

@interface ICMenuPanel ()

@property (nonatomic, strong) ICMenuButton *beanButton;
@property (nonatomic, strong) ICMenuButton *brewButton;
@property (nonatomic, strong) ICMenuButton *cultureButton;
@property (nonatomic, strong) ICMenuButton *findButton;
@property (nonatomic, strong) ICMenuButton *homeButton;
@property (nonatomic, strong) ICMenuButton *settingButton;

@end

@implementation ICMenuPanel

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    
    if (self)
    {
        self.beanButton = [[ICMenuButton alloc] initWithFrame:CGRectZero
                                                     delegate:self
                                                    imageName:@"menu_bean"
                                                         text:@"Bean"];
        [self.beanButton sizeToFit];
    
        self.brewButton = [[ICMenuButton alloc] initWithFrame:CGRectZero
                                                     delegate:self
                                                    imageName:@"menu_brew"
                                                         text:@"Brew"];
        [self.brewButton sizeToFit];
        
        self.cultureButton = [[ICMenuButton alloc] initWithFrame:CGRectZero
                                                     delegate:self
                                                    imageName:@"menu_culture"
                                                         text:@"Culture"];
        [self.cultureButton sizeToFit];;
        
        self.findButton = [[ICMenuButton alloc] initWithFrame:CGRectZero
                                                        delegate:self
                                                       imageName:@"menu_find"
                                                            text:@"Find"];
        [self.findButton sizeToFit];
        
        self.homeButton = [[ICMenuButton alloc] initWithFrame:CGRectZero
                                                     delegate:self
                                                    imageName:@"menu_home"
                                                         text:@"Home"];
        [self.homeButton sizeToFit];
        
        self.settingButton = [[ICMenuButton alloc] initWithFrame:CGRectZero
                                                        delegate:self
                                                       imageName:@"menu_setting"
                                                            text:@"Setting"];
        [self.settingButton sizeToFit];
        
        [self addSubview:self.beanButton];
        [self addSubview:self.brewButton];
        [self addSubview:self.cultureButton];
        [self addSubview:self.findButton];
        
        [self addSubview:self.homeButton];
        [self addSubview:self.settingButton];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat topping = 1;
    
    self.beanButton.frame = [self.beanButton alignedRectInSuperviewForSize:[self buttonSize]
                                                                    offset:CGSizeMake(16, topping)
                                                                   options:(ICAlignmentOptionsLeft | ICAlignmentOptionsTop)];
    self.brewButton.frame = [self.brewButton alignedRectInSuperviewForSize:[self buttonSize]
                                                                    offset:CGSizeMake(self.beanButton.horizontalEnding + 16, topping)
                                                                   options:(ICAlignmentOptionsLeft | ICAlignmentOptionsTop)];
    self.cultureButton.frame = [self.cultureButton alignedRectInSuperviewForSize:[self buttonSize]
                                                                    offset:CGSizeMake(self.brewButton.horizontalEnding + 16, topping)
                                                                   options:(ICAlignmentOptionsLeft | ICAlignmentOptionsTop)];

    self.findButton.frame = [self.cultureButton alignedRectInSuperviewForSize:[self buttonSize]
                                                                          offset:CGSizeMake(self.cultureButton.horizontalEnding + 16, topping)
                                                                         options:(ICAlignmentOptionsLeft | ICAlignmentOptionsTop)];
    
    self.homeButton.frame = [self.homeButton alignedRectInSuperviewForSize:[self buttonSize]
                                                                    offset:CGSizeMake(self.beanButton.frame.origin.x, self.beanButton.verticalEnding + 10)
                                                                   options:(ICAlignmentOptionsLeft | ICAlignmentOptionsTop)];
    
    self.settingButton.frame = [self.settingButton alignedRectInSuperviewForSize:[self buttonSize]
                                                                          offset:CGSizeMake(self.findButton.frame.origin.x, self.findButton.verticalEnding + 10)
                                                                         options:(ICAlignmentOptionsLeft | ICAlignmentOptionsTop)];
}


///////////////////////////////////////////
///////////////////////////////////////////
#pragma mark Configuration
///////////////////////////////////////////
///////////////////////////////////////////
- (CGSize)buttonSize
{
    return CGSizeMake(60, 80);
}
///////////////////////////////////////////
///////////////////////////////////////////
#pragma mark Touch
///////////////////////////////////////////
///////////////////////////////////////////
- (void)menuButtonClicked:(id)sender
{
    if (sender == self.beanButton)
    {
        [self.delegate attemptPerformSelector:@selector(beanButtonClicked:)
                                   withObject:sender];
    }
    else if (sender == self.brewButton)
    {
        [self.delegate attemptPerformSelector:@selector(brewButtonClicked:)
                                   withObject:sender];
    }
    else if (sender == self.cultureButton)
    {
        [self.delegate attemptPerformSelector:@selector(cultureButtonClicked:)
                                   withObject:sender];
    }
    else if (sender == self.findButton)
    {
        [self.delegate attemptPerformSelector:@selector(findButtonClicked:)
                                   withObject:sender];
    }
    else if (sender == self.homeButton)
    {
        [self.delegate attemptPerformSelector:@selector(homeButtonClicked:)
                                   withObject:sender];
    }
    else if (sender == self.settingButton)
    {
        [self.delegate attemptPerformSelector:@selector(settingButtonClicked:)
                                   withObject:sender];
    }
}


@end
