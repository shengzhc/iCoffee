//
//  ICBeanViewController.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/18/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBeanViewController.h"
#import "ICBeanView.h"

@interface ICBeanViewController ()

@end

@implementation ICBeanViewController

- (id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self)
    {
        
    }
    
    return self;
}

- (Class)viewClass
{
    return [ICBeanView class];
}


- (NSString *)headerBarTitle
{
    return @"Bean";
}

@end
