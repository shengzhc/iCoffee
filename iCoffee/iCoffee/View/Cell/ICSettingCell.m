//
//  ICSettingCell.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/30/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICSettingCell.h"

@interface ICSettingCell ()

@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, strong) UILabel *settingTextLabel;

@end

@implementation ICSettingCell

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.logoImageView = [[UIImageView alloc] init];
        self.settingTextLabel = [UILabel labelWithFrame:CGRectZero
                                            text:@""
                                       alignment:NSTextAlignmentLeft
                                            font:[UIFont icRegularFontWithSize:14]
                                       textColor:[UIColor blackColor]];
        [self.contentView addSubview:self.logoImageView];
        [self.contentView addSubview:self.settingTextLabel];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.logoImageView sizeToFit];
    self.logoImageView.frame = [self.logoImageView alignedRectInSuperviewForSize:self.logoImageView.image.size
                                                                          offset:CGSizeMake(10, 0)
                                                                         options:(ICAlignmentOptionsLeft | ICAlignmentOptionsVerticalCenter)];
    
    [self.settingTextLabel sizeToFit];
    self.settingTextLabel.frame = [self.settingTextLabel alignedRectInSuperviewForSize:self.settingTextLabel.bounds.size
                                                                   offset:CGSizeMake(self.logoImageView.horizontalEnding + 10, 0)
                                                                 options:(ICAlignmentOptionsLeft | ICAlignmentOptionsVerticalCenter)];
}

- (void)setData:(NSDictionary *)data
{
    self.logoImageView.image = [UIImage imageNamed:[data valueForKey:@"image"]];
    self.settingTextLabel.text = [data valueForKey:@"text"];
    [self setNeedsLayout];
}


@end
