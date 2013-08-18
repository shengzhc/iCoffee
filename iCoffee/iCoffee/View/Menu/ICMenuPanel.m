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
@property (nonatomic, strong) ICMenuButton *favoriteButton;
@property (nonatomic, strong) ICMenuButton *findButton;
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
        [self.cultureButton sizeToFit];

        
        self.favoriteButton = [[ICMenuButton alloc] initWithFrame:CGRectZero
                                                        delegate:self
                                                       imageName:@"menu_favorite"
                                                            text:@"Favorite"];
        [self.favoriteButton sizeToFit];
        
        self.findButton = [[ICMenuButton alloc] initWithFrame:CGRectZero
                                                        delegate:self
                                                       imageName:@"menu_find"
                                                            text:@"Find"];
        [self.findButton sizeToFit];
        
        self.settingButton = [[ICMenuButton alloc] initWithFrame:CGRectZero
                                                        delegate:self
                                                       imageName:@"menu_setting"
                                                            text:@"Setting"];
        [self.settingButton sizeToFit];
        
        
        [self addSubview:self.beanButton];
        [self addSubview:self.brewButton];
        [self addSubview:self.cultureButton];
        [self addSubview:self.favoriteButton];
        [self addSubview:self.findButton];
        [self addSubview:self.settingButton];
        
        [self addShadowWithColor:[UIColor blackColor]];
    }
    
    return self;
}

- (CGSize)buttonSize
{
    return CGSizeMake(100, 80);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat topping = 1;
    
    self.beanButton.frame = [self.beanButton alignedRectInSuperviewForSize:[self buttonSize]
                                                                    offset:CGSizeMake(10, topping)
                                                                   options:(ICAlignmentOptionsLeft | ICAlignmentOptionsTop)];
    self.brewButton.frame = [self.brewButton alignedRectInSuperviewForSize:[self buttonSize]
                                                                    offset:CGSizeMake(self.beanButton.horizontalEnding, topping)
                                                                   options:(ICAlignmentOptionsLeft | ICAlignmentOptionsTop)];
    self.cultureButton.frame = [self.cultureButton alignedRectInSuperviewForSize:[self buttonSize]
                                                                    offset:CGSizeMake(self.brewButton.horizontalEnding, topping)
                                                                   options:(ICAlignmentOptionsLeft | ICAlignmentOptionsTop)];
    self.favoriteButton.frame = [self.cultureButton alignedRectInSuperviewForSize:[self buttonSize]
                                                                          offset:CGSizeMake(10, self.beanButton.verticalEnding + topping)
                                                                         options:(ICAlignmentOptionsLeft | ICAlignmentOptionsTop)];
    self.findButton.frame = [self.cultureButton alignedRectInSuperviewForSize:[self buttonSize]
                                                                          offset:CGSizeMake(self.favoriteButton.horizontalEnding, self.brewButton.verticalEnding + topping)
                                                                         options:(ICAlignmentOptionsLeft | ICAlignmentOptionsTop)];
    self.settingButton.frame = [self.cultureButton alignedRectInSuperviewForSize:[self buttonSize]
                                                                          offset:CGSizeMake(self.findButton.horizontalEnding, self.cultureButton.verticalEnding + topping)
                                                                         options:(ICAlignmentOptionsLeft | ICAlignmentOptionsTop)];

    
}


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
    else if (sender == self.favoriteButton)
    {
        [self.delegate attemptPerformSelector:@selector(favoriteButtonClicked:)
                                   withObject:sender];
    }
    else if (sender == self.findButton)
    {
        [self.delegate attemptPerformSelector:@selector(findButtonClicked:)
                                   withObject:sender];
    }
    else if (sender == self.settingButton)
    {
        [self.delegate attemptPerformSelector:@selector(settingButtonClicked:)
                                   withObject:sender];
    }
}


@end
