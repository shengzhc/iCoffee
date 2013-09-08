//
//  ICBrewCell.m
//  iCoffee
//
//  Created by Shengzhe Chen on 9/4/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBrewCell.h"
#import "ICBrewEntity.h"

@interface ICBrewCell ()

@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ICBrewCell

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.logoImageView = [[UIImageView alloc] init];
        self.logoImageView.contentMode = UIViewContentModeScaleToFill;
        [self.logoImageView addCorners];
        
        self.titleLabel = [UILabel labelWithFrame:CGRectZero
                                             text:@""
                                        alignment:NSTextAlignmentCenter
                                             font:[UIFont icRegularFontWithSize:18]
                                        textColor:[UIColor blackColor]];
        
        [self.contentView addSubview:self.logoImageView];
        [self.contentView addSubview:self.titleLabel];
        
        UIImageView *accessoryView = [UIImageView imageViewWithImageNamed:@"button_right"];
        accessoryView.bounds = CGRectMake(0, 0, 20, 20);
        self.accessoryView = accessoryView;
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.logoImageView.frame = [self.logoImageView alignedRectInSuperviewForSize:CGSizeMake(55, 55)
                                                                          offset:CGSizeMake(10, 0)
                                                                         options:(ICAlignmentOptionsLeft | ICAlignmentOptionsVerticalCenter)];
    [self.titleLabel sizeToFit];
    self.titleLabel.frame = [self.titleLabel alignedRectInSuperviewForSize:self.titleLabel.bounds.size
                                                                    offset:CGSizeMake(self.logoImageView.horizontalEnding + 10, 0)
                                                                   options:(ICAlignmentOptionsLeft | ICAlignmentOptionsVerticalCenter)];
}

- (void)setData:(ICBrewEntity *)brewEntity
{
    self.logoImageView.image = [UIImage imageNamed:brewEntity.logo];
    self.titleLabel.text = brewEntity.name;
}

@end
