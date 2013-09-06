//
//  ICCultureCell.m
//  iCoffee
//
//  Created by Fangzhou Lu on 9/4/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICCultureCell.h"

@implementation ICCultureCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _flagImageView = [[UIImageView alloc] init];
        _flagImageView.backgroundColor = [UIColor clearColor];
        
        _countryLabel = [[UILabel alloc] init];
        _countryLabel.backgroundColor = [UIColor clearColor];
        _countryLabel.font = [UIFont icMediumFontWithSize:20];
        
        [self addSubview:_flagImageView];
        [self addSubview:_countryLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect frame = self.bounds;
    self.flagImageView.frame = CGRectMake(frame.origin.x, frame.origin.y, 100, frame.size.height);

    [self.countryLabel sizeToFit]; //Call sizeToFit first so that the frame will be set properly.
    self.countryLabel.frame = [self.countryLabel alignedRectInSuperviewForSize:self.countryLabel.bounds.size
                                                                        offset:CGSizeMake(self.flagImageView.horizontalEnding+20,frame.size.height/2)
                                                                       options:ICAlignmentOptionsVerticalCenter];
    
}

@end
