//
//  ICSettingViewController.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/18/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICSettingViewController.h"

#import "ICSettingView.h"

@interface ICSettingViewController ()

@end

@implementation ICSettingViewController

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
    return [ICSettingView class];
}



- (NSString *)headerBarTitle
{
    return @"Setting";
}
@end
