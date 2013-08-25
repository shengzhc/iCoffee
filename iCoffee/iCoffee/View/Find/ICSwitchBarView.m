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

@end

@implementation ICSwitchBarView

- (id)initWithFrame:(CGRect)frame
              title:(NSString *)title
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
        
        self.switchButton = [[UISwitch alloc] init];
        self.switchButton.onTintColor = [UIColor whiteColor];
        self.switchButton.tintColor = [UIColor darkGrayColor];
        self.switchButton.thumbTintColor = [UIColor lightGrayColor];
        
        [self addSubview:self.titleLabel];
        [self addSubview:self.switchButton];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.titleLabel sizeToFit];
    self.titleLabel.frame = [self.titleLabel alignedRectInSuperviewForSize:self.titleLabel.bounds.size
                                                                    offset:CGSizeMake(10, 0)
                                                                   options:(ICAlignmentOptionsLeft | ICAlignmentOptionsVerticalCenter)];
    [self.switchButton sizeToFit];
    self.switchButton.frame = [self.switchButton alignedRectInSuperviewForSize:self.switchButton.bounds.size
                                                                        offset:CGSizeMake(10, 0)
                                                                       options:(ICAlignmentOptionsRight | ICAlignmentOptionsVerticalCenter)];
}

@end
