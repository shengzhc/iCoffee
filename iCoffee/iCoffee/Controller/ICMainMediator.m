//
//  ICMainMediator.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/17/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICMainMediator.h"
#import "ICWelcomeViewController.h"

#import "ICMainMediatorView.h"

@interface ICMainMediator ()

@property (nonatomic, strong) ICMainMediatorView *view;

@property (nonatomic, strong) ICViewController *currentViewController;
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


- (Class)viewClass
{
    return [ICMainMediatorView class];
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self showViewController:self.welcomeViewController];
}


- (ICWelcomeViewController *)welcomeViewController
{
    if (!_welcomeViewController)
    {
        _welcomeViewController = [[ICWelcomeViewController alloc] initWithDelegate:self];
    }
    
    return _welcomeViewController;
}


- (void)showViewController:(ICViewController *)viewController
{
    [self.currentViewController.view removeFromSuperview];
    self.currentViewController = viewController;

    viewController.view.frame = self.view.contentView.bounds;
    [self.view.contentView addSubview:viewController.view];
}


- (void)bottomBarButtonClicked:(id)sender
{
    [self.view toggleBottomBarView];
}


@end
