//
//  ICSwitchBarView.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/24/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICSwitchBarView.h"

@interface ICSwitchBarView ()

@property (nonatomic, strong) UISwitch *switchButton;
@property (nonatomic, strong) UIImageView *logoImageView;

@end

@implementation ICSwitchBarView

- (id)initWithFrame:(CGRect)frame
              title:(NSString *)title
              image:(NSString *)imageURL
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];

    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        
        self.titleLabel = [UILabel labelWithFrame:CGRectZero
                                             text:title
                                        alignment:NSTextAlignmentLeft
                                             font:[UIFont boldFontWithSize:14]
                                        textColor:[UIColor darkTextColor]];
        
        self.logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageURL]];
        [self.logoImageView addCorners];
        self.logoImageView.clipsToBounds = YES;
        [self.logoImageView addShadowWithColor:[UIColor blackColor]];
        
        self.switchButton = [[UISwitch alloc] init];
        self.switchButton.onTintColor = [UIColor whiteColor];
        self.switchButton.tintColor = [UIColor blackColor];
        self.switchButton.thumbTintColor = [UIColor lightGrayColor];
        
        [self addSubview:self.logoImageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.switchButton];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.logoImageView.frame = [self.logoImageView alignedRectInSuperviewForSize:[self logoImageViewSize]
                                                                          offset:CGSizeMake(5, 0)
                                                                         options:(ICAlignmentOptionsLeft | ICAlignmentOptionsVerticalCenter)];
    
    [self.titleLabel sizeToFit];
    self.titleLabel.frame = [self.titleLabel alignedRectInSuperviewForSize:self.titleLabel.bounds.size
                                                                    offset:CGSizeMake(self.logoImageView.horizontalEnding + 5, 0)
                                                                   options:(ICAlignmentOptionsLeft | ICAlignmentOptionsVerticalCenter)];
    [self.switchButton sizeToFit];
    self.switchButton.frame = [self.switchButton alignedRectInSuperviewForSize:self.switchButton.bounds.size
                                                                        offset:CGSizeMake(10, 0)
                                                                       options:(ICAlignmentOptionsRight | ICAlignmentOptionsVerticalCenter)];
}


- (CGSize)logoImageViewSize
{
    return CGSizeMake(30, 30);
}

@end
