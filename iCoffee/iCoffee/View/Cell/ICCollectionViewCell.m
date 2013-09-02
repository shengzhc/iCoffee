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
    self.backgroundImageView.frame = [self.backgroundImageView alignedRectInSuperviewForSize:self.bounds.size offset:CGSizeMake(0, 0) options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsVerticalCenter)];
}


- (void)drawRect:(CGRect)rect
{
    CGRect circleRect = CGRectInset(rect, 1, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, .5);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextStrokeRect(context, circleRect);
    CGContextStrokePath(context);
    UIGraphicsEndImageContext();
}


- (void)setBackgroundImage:(UIImage *)image
{
    self.backgroundImageView.image = image;
}

@end
