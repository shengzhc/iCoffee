//
//  ICBeanDetailViewController.m
//  iCoffee
//
//  Created by Fangzhou Lu on 8/19/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBeanDetailViewController.h"
#import "ICBeanDetailView.h"

@interface ICBeanDetailViewController ()<gestureProtocol>

@end

@implementation ICBeanDetailViewController

- (id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self)
    {
        
    }
    
    return self;
}


-(Class)viewClass
{
    return [ICBeanDetailView class];
}


-(NSString*)headerBarTitle
{
    return @"Bean Detail";
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


#pragma gesture
-(void)moveDetailViewWithTranslation:(CGFloat)translationX withGestureState:(BOOL)state
{
    if (translationX<0) {
        return;
    }
    
    CGRect frame = [self.view superview].frame;
    
    if (state == false ) {
        [UIView animateWithDuration:0.0f animations:^{
            CGRect stopFrame = CGRectMake(translationX, frame.origin.y, frame
                                         .size.height, frame.size.height);
            self.view.frame = stopFrame;
        }];
    }else{
        if (translationX<frame.size.width/5) {
            [UIView animateWithDuration:0.5f animations:^{
                self.view.frame = frame;
            }];
        }else{
            [UIView animateWithDuration:0.5f animations:^{
                self.view.frame = CGRectMake(frame.size.width, frame.origin.x, frame.size.width, frame.size.height);
            } completion:^(BOOL finished){
                [self.view removeFromSuperview];
            }];
        }
    }
}

@end
