//
//  ICMainMediator.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/17/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICMainMediator.h"

#import "ICWelcomeViewController.h"

@interface ICMainMediator ()

@property (nonatomic, strong) ICWelcomeViewController *welcomeViewController;

@end

@implementation ICMainMediator

- (id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self)
    {
        
    }
    
    return self;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController pushViewController:self.welcomeViewController
                                         animated:NO];
}


- (ICWelcomeViewController *)welcomeViewController
{
    if (!_welcomeViewController)
    {
        _welcomeViewController = [[ICWelcomeViewController alloc] initWithDelegate:self];
    }
    
    return _welcomeViewController;
}

@end
