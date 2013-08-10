//
//  ICScrollPageViewController.m
//  SafariTabs
//
//  Created by Shengzhe Chen on 8/10/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICScrollPageViewController.h"

@interface ICScrollPageViewController ()

@end

@implementation ICScrollPageViewController

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
    return [ICScrollPageView class];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    NSLog(@"%@", NSStringFromSelector(_cmd));
}
@end
