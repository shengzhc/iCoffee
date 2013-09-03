//
//  ICCollectionViewCell.m
//  iCoffee
//
//  Created by Shengzhe Chen on 9/1/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICCollectionViewCell.h"
#import <QuartzCore/QuartzCore.h>

@interface ICCollectionViewCell ()

@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UILabel *descriptionLabel;

@end

@implementation ICCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        self.backgroundImageView = [[UIImageView alloc] init];
        self.backgroundImageView.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:self.backgroundImageView];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.backgroundImageView.frame = self.bounds;
}


- (void)setBackgroundImage:(UIImage *)image
{
    self.backgroundImageView.image = image;
}

@end
