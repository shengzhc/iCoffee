//
//  ICBeanDetailViewController.m
//  iCoffee
//
//  Created by Fangzhou Lu on 8/19/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBeanDetailViewController.h"
#import "ICBeanDetailView.h"

@interface ICBeanDetailViewController ()

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
//    self.view.alpha = 0.0;
//
//    CGRect destFrame = self.presentingViewController.view.frame;
//    
//    CGRect originFrame = CGRectMake(destFrame.origin.x + destFrame.size.width, destFrame.origin.y, destFrame.size.width, destFrame.size.height);
//    
//    self.view.frame = originFrame;
//    
//    [UIView animateWithDuration:.5
//                     animations:^
//    {
//        self.view.frame = self.presentingViewController.view.frame;
//        self.view.alpha = 1.0;
//    }];
}


@end
