//
//  ICMenuButton.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/17/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICMenuButton.h"
#import <QuartzCore/QuartzCore.h>

@interface ICMenuButton ()

@property (nonatomic, strong) UIImageView *buttonImageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ICMenuButton

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
          imageName:(NSString *)imageName
               text:(NSString *)text
{
    self = [super initWithFrame:frame
                       delegate:delegate];

    if (self)
    {
        UIImage *normalImage = [UIImage imageNamed:imageName];
        UIImage *hightlightedImage = [normalImage imageWithOverlayColor:[self hightlightColor]];
        self.buttonImageView = [[UIImageView alloc] initWithImage:normalImage
                                                 highlightedImage:hightlightedImage];
        self.buttonImageView.layer.masksToBounds = YES;
        [self.buttonImageView addCornersWithRadius:10.0];
        [self.buttonImageView sizeToFit];
        self.buttonImageView.userInteractionEnabled = YES;
        
        self.titleLabel = [UILabel labelWithFrame:CGRectZero
                                             text:text
                                        alignment:NSTextAlignmentCenter
                                                 font:[UIFont fontWithSize:12]
                                            textColor:[UIColor whiteColor]];
        [self.titleLabel setHighlightedTextColor:[self hightlightColor]];
        
        [self.titleLabel sizeToFit];
        self.titleLabel.userInteractionEnabled = YES;
        [self addSubview:self.buttonImageView];
        [self addSubview:self.titleLabel];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.buttonImageView.frame = [self.buttonImageView alignedRectInSuperviewForSize:self.buttonImageView.image.size
                                                                              offset:CGSizeMake(0, 5)
                                                                             options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsTop)];
    
    self.titleLabel.frame = [self.titleLabel alignedRectInSuperviewForSize:self.titleLabel.bounds.size
                                                                    offset:CGSizeMake(0, self.buttonImageView.verticalEnding + 5)
                                                                   options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsTop)];
}


- (UIColor *)hightlightColor
{
    return [[UIColor blackColor] colorWithAlphaComponent:.2];
}

- (void)setPressedState:(BOOL)pressed
{
    self.buttonImageView.highlighted = pressed;
    self.titleLabel.highlighted = pressed;
}

- (void)menuButtonClicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(menuButtonClicked:)])
    {
        [self.delegate performSelector:@selector(menuButtonClicked:)
                            withObject:self];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if (touch.view == self.titleLabel || touch.view == self.buttonImageView)
    {
        [self setPressedState:YES];
    }
    else
    {
        [self setPressedState:NO];
    }
}


- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setPressedState:NO];
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setPressedState:NO];
    UITouch *touch = [touches anyObject];
    if (touch.view == self.titleLabel || touch.view == self.buttonImageView)
    {
        [self menuButtonClicked:self];
    }
}

@end
