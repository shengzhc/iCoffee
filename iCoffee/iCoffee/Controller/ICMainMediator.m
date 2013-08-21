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
#import "ICBeanDetailViewController.h"

#import "ICMainMediatorView.h"
#import "ICHeaderBarView.h"

#define GooglePlacesAPIKey @"AIzaSyAuT1uZmu4lmGxS-DxCioCedbfcIBBqm5M"

@interface ICMainMediator ()

@property (nonatomic, strong) ICMainMediatorView *view;
@property (nonatomic, strong) ADBannerView *banner;

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
        if ([ADBannerView instancesRespondToSelector:@selector(initWithAdType:)])
        {
            self.banner = [[ADBannerView alloc] initWithAdType:ADAdTypeBanner];
        }
        else
        {
            self.banner = [[ADBannerView alloc] init];
        }
        
        [self.banner cancelBannerViewAction];
        self.banner.delegate = self;

        ICHTTPManager *manager = [ICHTTPManager POSTHTTPManagerWithURLString:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json"
                                                                        body:@
                                  {
                                      @"key":GooglePlacesAPIKey,
                                      @"location":@"-33.8670522,151.1957362",
                                      @"radius":@10,
                                      @"sensor":@"false"
                                  }
                                                                       token:nil
                                                           completionHandler:^(ICHTTPURLResponse *response)
        {
            NSString *string = [[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding];
            NSLog(@"%@", string);
        }];
        
        [manager start];
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


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
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
    
    if ([self.currentViewController isKindOfClass:[ICWelcomeViewController class]])
    {
        self.banner.delegate = nil;
        [self.banner cancelBannerViewAction];
        [self.banner removeFromSuperview];
    }
    
    NSString *headerBarTitle = @"";
    if ([viewController respondsToSelector:@selector(headerBarTitle)])
    {
        headerBarTitle = [viewController performSelector:@selector(headerBarTitle)];
    }
    
    CGRect destFrame = self.view.contentView.bounds;
    CGRect originFrame = CGRectMake(destFrame.size.width, 0, destFrame.size.width, destFrame.size.height);

    CGRect fadeFrame = UIEdgeInsetsInsetRect(destFrame, UIEdgeInsetsMake(25, 50, -25, -50));
    
    viewController.view.frame = originFrame;
    [self.view.contentView addSubview:viewController.view];
    [self.view.headerBarView setTitleLabelText:headerBarTitle];
    
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

        if([self.currentViewController respondsToSelector:@selector(resetView)])
        {
            [self.currentViewController performSelector:@selector(resetView)];
        }
        
        
        [self.currentViewController.view removeFromSuperview];
        self.currentViewController = viewController;
        
        if ([viewController isKindOfClass:[ICWelcomeViewController class]])
        {
            self.banner.delegate = self;
            [self.view insertSubview:self.banner
                        aboveSubview:self.view.contentView];
            [self layoutBannerView:self.banner];
        }
        
        [self cleanupViewController];
     
    }];
}


- (void)layoutBannerView:(ADBannerView *)banner
{
    CGSize size = banner.bounds.size;
    
    if (banner.bannerLoaded)
    {
        banner.frame = [banner alignedRectInSuperviewForSize:size
                                                      offset:CGSizeMake(0, 32)
                                                     options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsBottom)];
    }
    else
    {
        banner.frame = [banner alignedRectInSuperviewForSize:size
                                                      offset:CGSizeMake(0, 32)
                                                     options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsBottom)];
    }

}


- (void)cleanupViewController
{
    if (_welcomeViewController != self.currentViewController)
    {
        _welcomeViewController = nil;
    }
    
    if (_beanViewController != self.currentViewController)
    {
        _beanViewController = nil;
    }
    
    if (_brewViewController != self.currentViewController)
    {
        _brewViewController = nil;
    }
    
    if (_cultureViewController != self.currentViewController)
    {
        _cultureViewController = nil;
    }
    
    if (_favoriteViewController != self.currentViewController)
    {
        _favoriteViewController = nil;
    }
    
    if (_findViewController != self.currentViewController)
    {
        _findViewController = nil;
    }
    
    if (_settingViewController != self.currentViewController)
    {
        _settingViewController = nil;
    }
}
///////////////////////////////////////////
///////////////////////////////////////////
#pragma mark ADBannerViewDelegate
///////////////////////////////////////////
///////////////////////////////////////////
- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    [self layoutBannerView:banner];
}


- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    [self layoutBannerView:banner];
}


- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
{
    return YES;
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


- (void)homeButtonClicked:(id)sender
{
    [self showViewController:self.welcomeViewController];
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
    [self showViewController:self.settingViewController];
}


@end
