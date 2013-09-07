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

#import <AVFoundation/AVFoundation.h>

@interface ICMainMediator ()

@property (nonatomic, strong) ICBottomBarView *bottomBarView;

@property (nonatomic, strong) ICWelcomeViewController *welcomeViewController;

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@end

@implementation ICMainMediator

- (id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self)
    {
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"coffee_noise" withExtension:@"mp3"];
        
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        _audioPlayer.numberOfLoops = -1;
        [_audioPlayer prepareToPlay];
        //[_audioPlayer play];
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
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 122);
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
    
    if ([self.navigationController.visibleViewController isKindOfClass:[ICBeanViewController class]])
    {
        return;
    }
    
    [self.navigationController popToViewController:self.welcomeViewController animated:NO];
    [self.navigationController pushViewController:[[ICBeanViewController alloc] initWithDelegate:self] animated:YES];
}


- (void)brewButtonClicked:(id)sender
{
    [self bottomBarButtonClicked:nil];
    
    
    if ([self.navigationController.visibleViewController isKindOfClass:[ICBrewViewController class]])
    {
        return;
    }

    [self.navigationController popToViewController:self.welcomeViewController animated:NO];
    [self.navigationController pushViewController:[[ICBrewViewController alloc] initWithDelegate:self] animated:YES];
}


- (void)cultureButtonClicked:(id)sender
{
    [self bottomBarButtonClicked:nil];
    
    
    if ([self.navigationController.visibleViewController isKindOfClass:[ICCultureViewController class]])
    {
        return;
    }

    [self.navigationController popToViewController:self.welcomeViewController animated:NO];
    [self.navigationController pushViewController:[[ICCultureViewController alloc] initWithDelegate:self] animated:YES];
}


- (void)findButtonClicked:(id)sender
{
    [self bottomBarButtonClicked:nil];
    
    if ([self.navigationController.visibleViewController isKindOfClass:[ICFindViewController class]])
    {
        return;
    }

    
    [self.navigationController popToViewController:self.welcomeViewController animated:NO];
    [self.navigationController pushViewController:[[ICFindViewController alloc] initWithDelegate:self] animated:YES];
}


- (void)homeButtonClicked:(id)sender
{
    [self.navigationController popToViewController:self.welcomeViewController animated:YES];
}

- (void)settingButtonClicked:(id)sender
{
    
    if ([self.navigationController.visibleViewController isKindOfClass:[ICSettingViewController class]])
    {
        return;
    }

    [self.navigationController popToViewController:self.welcomeViewController animated:NO];
    [self.navigationController pushViewController:[[ICSettingViewController alloc] initWithDelegate:self] animated:YES];
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
