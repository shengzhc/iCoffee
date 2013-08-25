//
//  ICPopButtonItems.m
//  iCoffee
//
//  Created by Fangzhou Lu on 8/23/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICPopButtonItem.h"


@interface ICPopButtonItem()

@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;
@property CGPoint initialCenter;

@end


@implementation ICPopButtonItem

- (id)initWithDelegate:(id < ICPopButtonDelegate >) delegate
                 image:(UIImage *)image
                center:(CGPoint)center
{
    self = [super initWithImage:image];
    
    if (self)
    {
        [self sizeToFit];
        self.delegate = delegate;
        self.initialCenter = center;
        self.isLarge = NO;
        self.center = center;
        self.userInteractionEnabled = YES;

        self.tapGestureRecognizer= [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                           action:@selector(tapHandler:)];
        self.tapGestureRecognizer.numberOfTouchesRequired = 1;
        self.tapGestureRecognizer.numberOfTapsRequired = 1;
        [self addGestureRecognizer:self.tapGestureRecognizer];
    }
    
    return self;
}


-(void)tapHandler:(UITapGestureRecognizer *)recognizer
{
    [self.delegate getTouchedAtItem:self.tag];
}


-(void)resetItem
{
    if (self.isLarge)
    {
        CGAffineTransform transform = CGAffineTransformScale(self.transform, 0.5, 0.5);
        self.transform = transform;
        self.isLarge = NO;
    }
    
    self.center = self.initialCenter;
    self.alpha = 1.0f;
    [self removeFromSuperview];
}
@end
