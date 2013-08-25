//
//  ICPopButtonItems.m
//  iCoffee
//
//  Created by Fangzhou Lu on 8/23/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICPopButtonItem.h"


@interface ICPopButtonItem()

@property (nonatomic, strong) UITapGestureRecognizer *tapRecognizer;
@property CGPoint initialCenter;

@end


@implementation ICPopButtonItem

- (id)initWithImage:(UIImage *)image withPosition:(CGPoint)center
{
    self = [super initWithImage:image];
    if (self) {
        // Initialization code
        [self sizeToFit];
        _initialCenter = center;
        _isLarge = false;
        self.center = center;
        self.userInteractionEnabled = YES;
        
        _tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandler:)];
        _tapRecognizer.numberOfTouchesRequired = 1;
        _tapRecognizer.numberOfTapsRequired = 1;
        [self addGestureRecognizer:_tapRecognizer];
    }
    return self;
}

-(void)tapHandler:(UITapGestureRecognizer *)recognizer
{
    
    [self.delegate getTouchedAtItem:self.tag];
}

-(void)resetItem
{
    if (self.isLarge==TRUE) {
        CGAffineTransform transform = CGAffineTransformScale(self.transform, 0.5, 0.5);
        self.transform = transform;
    }
    
    self.center = self.initialCenter;
    self.alpha = 1.0f;
    [self sizeToFit];
    [self removeFromSuperview];
    
}

@end
