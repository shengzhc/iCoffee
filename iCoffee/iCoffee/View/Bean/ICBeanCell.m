//
//  ICBeanCell.m
//  iCoffee
//
//  Created by Fangzhou Lu on 8/19/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBeanCell.h"

@implementation ICBeanCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        _primaryLabel = [[UILabel alloc] init];
        _primaryLabel.textAlignment = NSTextAlignmentLeft;
        
        _secondaryLabel = [[UILabel alloc] init];
        _secondaryLabel.textAlignment = NSTextAlignmentLeft;
        
        _primaryImageView = [[UIImageView alloc] init];
        
        [self.contentView addSubview:_primaryLabel];
        [self.contentView addSubview:_secondaryLabel];
        [self.contentView addSubview:_primaryImageView];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect contenctRect = self.contentView.bounds;
    CGFloat x = contenctRect.origin.x;
    CGRect frame;
    
    frame = CGRectMake(x+10, 0, 50, 50);
    self.primaryImageView.frame = frame;
    
    frame = CGRectMake(x+70, 5, 200, 25);
    self.primaryLabel.frame = frame;
    
    frame = CGRectMake(x+70, 30, 100, 15);
    self.secondaryLabel.frame = frame;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
