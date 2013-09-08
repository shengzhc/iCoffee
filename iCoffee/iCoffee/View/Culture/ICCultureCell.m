//
//  ICCultureCell.m
//  iCoffee
//
//  Created by Fangzhou Lu on 9/4/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICCultureCell.h"
#import <QuartzCore/QuartzCore.h>

#define BASICCOLORVALUE 255.0f
#define COLORVALUE 250.0f
#define VERTICALDIFF 10.0f
#define HORIZONALDIFF 30.0f
#define IMAGEHEIGHT 60.0f
#define IMAGEWIDTH 90.0f
#define CELLCORNER 10.0f

@implementation ICCultureCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        _cellBackgroundView = [[UIView alloc] initWithFrame:CGRectZero];
        _cellBackgroundView.backgroundColor = [UIColor colorWithRed:COLORVALUE/BASICCOLORVALUE
                                                              green:COLORVALUE/BASICCOLORVALUE
                                                               blue:COLORVALUE/BASICCOLORVALUE
                                                              alpha:1.0f];
        _cellBackgroundView.layer.cornerRadius = CELLCORNER;
        _cellBackgroundView.clipsToBounds = YES;
        
        _cellBackgroundView.layer.borderColor = [UIColor colorWithRed:105.0f/BASICCOLORVALUE
                                                                green:75.0f/BASICCOLORVALUE
                                                                 blue:35.0f/BASICCOLORVALUE
                                                                alpha:1.0f].CGColor;
        _cellBackgroundView.layer.borderWidth = 1.0f;
//        [_cellBackgroundView.layer setShadowColor:[UIColor blackColor].CGColor];
//        [_cellBackgroundView.layer setShadowOpacity:0.8f];
//        [_cellBackgroundView.layer setShadowOffset:CGSizeMake(0, 3.0f)];
        
        _flagImageView = [[UIImageView alloc] init];
        _flagImageView.backgroundColor = [UIColor clearColor];
        
        _countryLabel = [[UILabel alloc] init];
        _countryLabel.backgroundColor = [UIColor clearColor];
        _countryLabel.font = [UIFont icMediumFontWithSize:20];
        
        [self addSubview:_cellBackgroundView];
        [_cellBackgroundView addSubview:_flagImageView];
        [_cellBackgroundView addSubview:_countryLabel];
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
    self.cellBackgroundView.frame = CGRectMake(HORIZONALDIFF/2, VERTICALDIFF/2, frame.size.width - HORIZONALDIFF, frame.size.height - VERTICALDIFF);
    
    frame = self.cellBackgroundView.bounds;
    
    self.flagImageView.frame = CGRectMake(frame.origin.x + 20, (frame.size.height-IMAGEHEIGHT)/2, IMAGEWIDTH, IMAGEHEIGHT);

    [self.countryLabel sizeToFit]; //Call sizeToFit first so that the frame will be set properly.
    self.countryLabel.frame = [self.countryLabel alignedRectInSuperviewForSize:self.countryLabel.bounds.size
                                                                        offset:CGSizeMake(self.flagImageView.horizontalEnding+20,frame.size.height/2)
                                                                       options:ICAlignmentOptionsVerticalCenter];
}

@end
