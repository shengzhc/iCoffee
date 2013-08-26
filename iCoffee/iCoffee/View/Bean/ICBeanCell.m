//
//  ICBeanCell.m
//  iCoffee
//
//  Created by Fangzhou Lu on 8/19/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBeanCell.h"

@implementation ICBeanCell

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _primaryLabel = [[UILabel alloc] init];
        _primaryLabel.textAlignment = NSTextAlignmentLeft;
        _primaryLabel.backgroundColor = [UIColor clearColor];
        
        _secondaryLabel = [[UILabel alloc] init];
        _secondaryLabel.textAlignment = NSTextAlignmentLeft;
        _secondaryLabel.backgroundColor = [UIColor clearColor];
        
        _primaryImageView = [[UIImageView alloc] init];
        _primaryImageView.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:_primaryLabel];
        [self.contentView addSubview:_secondaryLabel];
        [self.contentView addSubview:_primaryImageView];
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.primaryImageView.frame = [self.primaryImageView alignedRectInSuperviewForSize:self.primaryImageView.image.size
                                                                                offset:CGSizeMake(10, 0)
                                                                               options:(ICAlignmentOptionsLeft | ICAlignmentOptionsVerticalCenter)];
    [self.primaryLabel sizeToFit];
    
    self.primaryLabel.frame = [self.primaryLabel alignedRectInSuperviewForSize:self.primaryLabel.bounds.size
                                                                        offset:CGSizeMake(self.primaryImageView.horizontalEnding + 10, 10)
                                                                       options:(ICAlignmentOptionsLeft)];

    [self.secondaryLabel sizeToFit];
    self.secondaryLabel.frame = [self.secondaryLabel alignedRectInSuperviewForSize:self.secondaryLabel.bounds.size
                                                                            offset:CGSizeMake(self.primaryImageView.horizontalEnding+10, self.primaryLabel.verticalEnding+5)
                                                                           options:(ICAlignmentOptionsLeft)];
}

@end
