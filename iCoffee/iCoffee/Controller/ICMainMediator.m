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

#import "ICHeaderBarView.h"
#import "ICBottomBarView.h"

@interface ICMainMediator ()

@property (nonatomic, strong) ICBottomBarView *bottomBarView;

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


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.bottomBarView = [[ICBottomBarView alloc] initWithFrame:CGRectZero
                                                       delegate:self];
    
    self.bottomBarView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - [self bottomBarSize].height, [self bottomBarSize].width, [self bottomBarSize].height);
    
    UISwipeGestureRecognizer *swipeDownGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                                     action:@selector(swipeDownDidEnd:)];
    swipeDownGestureRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    [self.bottomBarView addGestureRecognizer:swipeDownGestureRecognizer];
    
    UISwipeGestureRecognizer *swipeUpGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                                   action:@selector(swipeUpDidEnd:)];
    swipeUpGestureRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    [self.bottomBarView addGestureRecognizer:swipeUpGestureRecognizer];
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.navigationController.title = @"iCoffee";
    
    if (!self.bottomBarView.superview)
    {
        [[UIApplication sharedApplication].keyWindow addSubview:self.bottomBarView];
    }
    
    [self.navigationController pushViewController:self.welcomeViewController animated:NO];
}
///////////////////////////////////////////
///////////////////////////////////////////
#pragma mark Configuration
///////////////////////////////////////////
///////////////////////////////////////////
- (CGSize)bottomBarSize
{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 32);
}


- (CGSize)bottomBarExpandSize
{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 230);
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
- (void)toggleBottomBarView
{
    BOOL isOpen = self.bottomBarView.frame.size.height > [self bottomBarSize].height+1;
    
    if (isOpen)
    {
        
        [UIView animateWithDuration:.2
                         animations:^
         {
             self.bottomBarView.frame = [self.bottomBarView alignedRectInSuperviewForSize:[self bottomBarSize]
                                                                                   offset:CGSizeMake(0, 0)
                                                                                  options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsBottom)];
         }
                         completion:^(BOOL finished)
         {
             [self.bottomBarView.arrowButton setBackgroundImage:[UIImage imageNamed:@"bottom_bar_arrow_up"]
                                                       forState:UIControlStateNormal];
         }];
    }
    else
    {
        
        [UIView animateWithDuration:.2
                         animations:^
         {
             self.bottomBarView.frame = [self.bottomBarView alignedRectInSuperviewForSize:[self bottomBarExpandSize]
                                                                                   offset:CGSizeMake(0, 0)
                                                                                  options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsBottom)];
         }
                         completion:^(BOOL finished)
         {
             [self.bottomBarView.arrowButton setBackgroundImage:[UIImage imageNamed:@"bottom_bar_arrow_down"]
                                                       forState:UIControlStateNormal];
         }];
    }
}

///////////////////////////////////////////
///////////////////////////////////////////
#pragma mark Touch
///////////////////////////////////////////
///////////////////////////////////////////
- (void)bottomBarButtonClicked:(id)sender
{
    [self toggleBottomBarView];
}

- (void)beanButtonClicked:(id)sender
{
    [self bottomBarButtonClicked:nil];
    [self.navigationController popToViewController:self.welcomeViewController animated:NO];
    [self.navigationController pushViewController:self.beanViewController animated:YES];
}


- (void)brewButtonClicked:(id)sender
{
    [self bottomBarButtonClicked:nil];
    [self.navigationController popToViewController:self.welcomeViewController animated:NO];
    [self.navigationController pushViewController:self.brewViewController animated:YES];
}


- (void)cultureButtonClicked:(id)sender
{
    [self bottomBarButtonClicked:nil];
    [self.navigationController popToViewController:self.welcomeViewController animated:NO];
    [self.navigationController pushViewController:self.cultureViewController animated:YES];
}


- (void)favoriteButtonClicked:(id)sender
{
    [self bottomBarButtonClicked:nil];
    [self.navigationController popToViewController:self.welcomeViewController animated:NO];
    [self.navigationController pushViewController:self.favoriteViewController animated:YES];
}

- (void)findButtonClicked:(id)sender
{
    [self bottomBarButtonClicked:nil];
    [self.navigationController popToViewController:self.welcomeViewController animated:NO];
    [self.navigationController pushViewController:self.findViewController animated:YES];
}


- (void)settingButtonClicked:(id)sender
{
    [self bottomBarButtonClicked:nil];
    [self.navigationController popToViewController:self.welcomeViewController animated:NO];
    [self.navigationController pushViewController:self.settingViewController animated:YES];
}


- (void)swipeUpDidEnd:(UISwipeGestureRecognizer *)swipeGesetureRecognizer
{
    BOOL isOpen = self.bottomBarView.frame.size.height > [self bottomBarSize].height+1;
    
    if (!isOpen)
    {
        [self bottomBarButtonClicked:nil];
    }
}


- (void)swipeDownDidEnd:(UISwipeGestureRecognizer *)swipeGestureRecognizer
{
    BOOL isOpen = self.bottomBarView.frame.size.height > [self bottomBarSize].height+1;
    
    if (isOpen)
    {
        [self bottomBarButtonClicked:nil];
    }
}

@end
