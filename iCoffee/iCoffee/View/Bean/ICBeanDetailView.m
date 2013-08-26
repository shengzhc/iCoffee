//
//  ICBeanDetailView.m
//  iCoffee
//
//  Created by Fangzhou Lu on 8/19/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBeanDetailView.h"

@interface ICBeanDetailView()


@end


@implementation ICBeanDetailView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        
        CGRect bounds = self.bounds;
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, bounds.size.width, 100)];
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _imageView.verticalEnding+10, bounds.size.width, 30)];
        _nameLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _nameLabel.numberOfLines = 0;
        
        _categoryLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _nameLabel.verticalEnding+10, bounds.size.width, 30)];

        _regionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _categoryLabel.verticalEnding+10, bounds.size.width, 30)];
        _regionLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _regionLabel.numberOfLines = 0;

        _rateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _regionLabel.verticalEnding+10, bounds.size.width, 30)];

        
        _description = [[UILabel alloc] initWithFrame:CGRectMake(0, _rateLabel.verticalEnding+10, bounds.size.width, 200)];
        _description.lineBreakMode = NSLineBreakByWordWrapping;
        _description.numberOfLines = 0;
        
        
        [self addSubview:_imageView];
        [self addSubview:_nameLabel];
        [self addSubview:_categoryLabel];
        [self addSubview:_regionLabel];
        [self addSubview:_rateLabel];
        [self addSubview:_description];
        
        
        UIPanGestureRecognizer *panGesturerRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureHandler:)];
        panGesturerRecognizer.delegate = self;
        [self addGestureRecognizer:panGesturerRecognizer];
        
        [self addShadowWithColor:[UIColor blackColor]
                         opacity:0.2
                          radius:0.0f
                          offset:CGSizeMake(-3, 0)];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
}


-(void)panGestureHandler:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation = [recognizer translationInView:self];
    
    if ([recognizer state] == UIGestureRecognizerStateEnded)
    {
        [self.delegate moveDetailViewWithTranslation:translation.x withGestureState:true];
    }
    else
    {
        [self.delegate moveDetailViewWithTranslation:translation.x withGestureState:false];
    }
}

@end
