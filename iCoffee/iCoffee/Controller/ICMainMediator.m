//
//  ICMainMediator.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/17/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICMainMediator.h"

#import "ICWelcomeViewController.h"
#import "ICBeanViewController.h"
#import "ICBrewViewController.h"
#import "ICCultureViewController.h"
#import "ICFavoriteViewController.h"
#import "ICFindViewController.h"
#import "ICSettingViewController.h"

#import "ICMainMediatorView.h"

@interface ICMainMediator ()

@property (nonatomic, strong) ICMainMediatorView *view;

@property (nonatomic, strong) ICViewController *currentViewController;

@property (nonatomic, strong) ICWelcomeViewController *welcomeViewController;
@property (nonatomic, strong) ICBeanViewController *beanViewController;
@property (nonatomic, strong) ICBrewViewController *brewViewController;
@property (nonatomic, strong) ICCultureViewController *cultureViewController;
@property (nonatomic, strong) ICFavoriteViewController *favoriteViewController;
@property (nonatomic, strong) ICFindViewController *findViewController;
@property (nonatomic, strong) ICSettingViewController *settingViewController;

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

///////////////////////////////////////////
///////////////////////////////////////////
#pragma mark ViewControllers
///////////////////////////////////////////
///////////////////////////////////////////
- (ICWelcomeViewController *)welcomeViewController
{
    if (!_welcomeViewController)
    {
        _welcomeViewController = [[ICWelcomeViewController alloc] initWithDelegate:self];
    }
    
    return _welcomeViewController;
}


- (ICBeanViewController *)beanViewController
{
    if (!_beanViewController)
    {
        _beanViewController = [[ICBeanViewController alloc] initWithDelegate:self];
    }
    
    return _beanViewController;
}


- (ICBrewViewController *)brewViewController
{
    if (!_brewViewController)
    {
        _brewViewController = [[ICBrewViewController alloc] initWithDelegate:self];
    }
    
    return _brewViewController;
}


- (ICCultureViewController *)cultureViewController
{
    if (!_cultureViewController)
    {
        _cultureViewController = [[ICCultureViewController alloc] initWithDelegate:self];
    }
    
    return _cultureViewController;
}


- (ICFavoriteViewController *)favoriteViewController
{
    if (!_favoriteViewController)
    {
        _favoriteViewController = [[ICFavoriteViewController alloc] initWithDelegate:self];
    }
    
    return _favoriteViewController;
}


- (ICFindViewController *)findViewController
{
    if (!_findViewController)
    {
        _findViewController = [[ICFindViewController alloc] initWithDelegate:self];
    }
    
    return _findViewController;
}


- (ICSettingViewController *)settingViewController
{
    if (!_settingViewController)
    {
        _settingViewController = [[ICSettingViewController alloc] initWithDelegate:self];
    }
    
    return _settingViewController;
}


///////////////////////////////////////////
///////////////////////////////////////////
#pragma mark Convenient
///////////////////////////////////////////
///////////////////////////////////////////
- (void)showViewController:(ICViewController *)viewController
{
    if (viewController == self.currentViewController)
    {
        return;
    }
    
    CGRect destFrame = self.view.contentView.bounds;
    CGRect originFrame = CGRectMake(destFrame.size.width, 0, destFrame.size.width, destFrame.size.height);

    CGRect fadeFrame = UIEdgeInsetsInsetRect(destFrame, UIEdgeInsetsMake(25, 50, -25, -50));
    
    viewController.view.frame = originFrame;
    [self.view.contentView addSubview:viewController.view];
    [UIView animateWithDuration:.5
                     animations:^
    {
        self.currentViewController.view.alpha = .3;
        self.currentViewController.view.frame = fadeFrame;
        viewController.view.frame = destFrame;
    }
                    completion:^(BOOL finished)
    {
        self.currentViewController.view.frame = destFrame;
        self.currentViewController.view.alpha = 1.0;
        [self.currentViewController.view removeFromSuperview];
        self.currentViewController = viewController;
    }];
}


///////////////////////////////////////////
///////////////////////////////////////////
#pragma mark Touch
///////////////////////////////////////////
///////////////////////////////////////////
- (void)bottomBarButtonClicked:(id)sender
{
    [self.view toggleBottomBarView];
}


- (void)beanButtonClicked:(id)sender
{
    [self bottomBarButtonClicked:nil];
    [self showViewController:self.beanViewController];
}


- (void)brewButtonClicked:(id)sender
{
    [self bottomBarButtonClicked:nil];
    [self showViewController:self.brewViewController];
}


- (void)cultureButtonClicked:(id)sender
{
    [self bottomBarButtonClicked:nil];
    [self showViewController:self.cultureViewController];
}


- (void)favoriteButtonClicked:(id)sender
{
    [self bottomBarButtonClicked:nil];
    [self showViewController:self.favoriteViewController];
}


- (void)findButtonClicked:(id)sender
{
    [self bottomBarButtonClicked:nil];
    [self showViewController:self.findViewController];
}


- (void)settingButtonClicked:(id)sender
{
    [self bottomBarButtonClicked:nil];
    //[self showViewController:self.settingViewController];
    [self showViewController:self.welcomeViewController];
}

@end
