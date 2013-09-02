//
//  ICCollectionViewCell.m
//  iCoffee
//
//  Created by Shengzhe Chen on 9/1/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICCollectionViewCell.h"

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
        self.backgroundColor = [UIColor whiteColor];
        self.backgroundImageView = [[UIImageView alloc] init];
        self.backgroundImageView.contentMode = UIViewContentModeScaleToFill;
        
        [self addSubview:self.backgroundImageView];
        [self addShadowWithColor:[UIColor blackColor]];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect frame = CGRectInset(self.bounds, 4, 4);
    self.backgroundImageView.frame = frame;
}


- (void)setBackgroundImage:(UIImage *)image
{
    self.backgroundImageView.image = image;
}

@end
