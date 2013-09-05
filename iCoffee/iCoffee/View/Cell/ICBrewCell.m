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
        [self.contentView addSubview:self.logoImageView];
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.logoImageView.frame = [self.logoImageView alignedRectInSuperviewForSize:CGSizeMake(55, 55)
                                                                          offset:CGSizeMake(10, 0)
                                                                         options:(ICAlignmentOptionsLeft | ICAlignmentOptionsVerticalCenter)];
}

- (void)setData:(ICBrewEntity *)brewEntity
{
    self.logoImageView.image = [UIImage imageNamed:brewEntity.logo];
}

@end
