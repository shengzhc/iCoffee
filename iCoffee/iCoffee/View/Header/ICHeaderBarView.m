//
//  ICHeaderBarView.m
//
//  Created by Fangzhou Lu on 8/18/13.
//  Copyright (c) 2013 Fangzhou Lu. All rights reserved.
//

#import "ICHeaderBarView.h"
#import <QuartzCore/QuartzCore.h>


#define ICALPHA 1


@interface ICHeaderBarView()

@property (nonatomic, strong) UIButton *homeButton;

@end

@implementation ICHeaderBarView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
          imageName:(NSString *)imageName
               text:(NSString *)text
{
    self = [super initWithFrame:frame
                       delegate:delegate];

    if (self)
    {
        self.backgroundColor = [UIColor colorWithRed:240/255.0
                                               green:240/255.0
                                                blue:240/255.0
                                               alpha:1.0];
        
        [self addShadowWithColor:[UIColor blackColor]
                         opacity:0.3
                          radius:0.8
                          offset:CGSizeMake(0, 3)];
        
        self.homeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.homeButton setBackgroundImage:[UIImage imageNamed:imageName]
                                   forState:UIControlStateNormal];
        [self.homeButton addTarget:delegate
                            action:@selector(homeButtonClicked:)
                  forControlEvents:UIControlEventTouchDown];
        
        self.titleLabel = [UILabel labelWithFrame:CGRectZero
                                             text:text
                                        alignment:NSTextAlignmentCenter
                                             font:[self textFont]
                                        textColor:[UIColor blackColor]];
        [self.titleLabel sizeToFit];
        
        [self addSubview:self.homeButton];
        [self addSubview:self.titleLabel];
        
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.homeButton sizeToFit];
    self.homeButton.frame = [self.homeButton alignedRectInSuperviewForSize:self.homeButton.bounds.size
                                                                    offset:CGSizeMake(15, 0)
                                                                   options:(ICAlignmentOptionsLeft | ICAlignmentOptionsVerticalCenter)];
    [self.titleLabel sizeToFit];
    self.titleLabel.frame = [self.titleLabel alignedRectInSuperviewForSize:self.titleLabel.bounds.size
                                                                    offset:CGSizeMake(0, 0)
                                                                   options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsVerticalCenter)];
}


- (UIFont *)textFont
{
    return [UIFont fontWithName:@"FunRaiser" size:20];
}


- (void)setTitleLabelText:(NSString *)text
{
    self.titleLabel.text = text;
    [self setNeedsLayout];
}


@end
