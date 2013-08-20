//
//  ICBeanDetailView.m
//  iCoffee
//
//  Created by Fangzhou Lu on 8/19/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBeanDetailView.h"

@implementation ICBeanDetailView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        
        _testLabel = [UILabel labelWithFrame:CGRectMake(0, 0, 150 ,44 ) text:@"Test View" alignment:NSTextAlignmentCenter];
        [self addSubview:_testLabel];
        
        UIPanGestureRecognizer *panGesturerRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureHandler:)];
        panGesturerRecognizer.delegate = self;
        [self addGestureRecognizer:panGesturerRecognizer];

    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

#pragma Gesture
-(void)panGestureHandler:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation = [recognizer translationInView:self];
    
    if ([recognizer state] == UIGestureRecognizerStateEnded) {
        [self.delegate moveDetailViewWithTranslation:translation.x withGestureState:true];
    }else{
        [self.delegate moveDetailViewWithTranslation:translation.x withGestureState:false];
    }
}

@end
