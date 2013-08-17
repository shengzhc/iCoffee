//
//  ICScrollImageView.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/17/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICScrollImageView.h"

#import <QuartzCore/QuartzCore.h>

@interface ICScrollImageView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation ICScrollImageView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
          imageName:(NSString *)imageName
               text:(NSString *)text
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    
    if (self)
    {
        self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        [self.imageView addCornersWithRadius:[self cornerRadius]];
        self.imageView.layer.masksToBounds = YES;
        [self.imageView sizeToFit];
        
        self.textLabel = [UILabel labelWithFrame:CGRectZero
                                            text:text
                                       alignment:NSTextAlignmentCenter
                                            font:[self textFont]
                                       textColor:[UIColor whiteColor]];
        self.textLabel.numberOfLines = 0;
        self.textLabel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
        
        [self addSubview:self.imageView];
        [self.imageView addSubview:self.textLabel];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = [self.imageView alignedRectInSuperviewForSize:self.imageView.image.size
                                           offset:CGSizeMake(0, 0)
                                          options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsVerticalCenter)];
    
    CGFloat maxWidth = self.imageView.frame.size.width;
    CGFloat maxHeight = [self.textLabel labelHeightWithMaxWidth:maxWidth];
    
    self.textLabel.frame = [self.textLabel alignedRectInSuperviewForSize:CGSizeMake(maxWidth, maxHeight)
                                                                  offset:CGSizeMake(0, 0)
                                                                 options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsBottom)];
}


- (CGFloat)cornerRadius
{
    return 5.0;
}


- (UIFont *)textFont
{
    return [UIFont systemFontOfSize:14];
}

@end
