//
//  ICMainViewController.m
//  ICSlideOut
//
//  Created by Fangzhou Lu on 8/12/13.
//  Copyright (c) 2013 Fangzhou Lu. All rights reserved.
//

#import "ICMainViewController.h"
#import "ICCenterViewController.h"
#import "ICLeftNavigationViewController.h"
#import <QuartzCore/QuartzCore.h>

#define SLIDE_OFFSITE 60
#define SLIDE_TIME 0.25
#define CORNER_RADIUS 4

@interface ICMainViewController ()<CenterViewControllerDelegate>

@property (nonatomic, strong) ICCenterViewController *centerViewController;
@property (nonatomic, strong) ICLeftNavigationViewController *leftNavigationViewController;

@end

@implementation ICMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Do any additional setup after loading the view.
    [self setupCenterViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupCenterViewController
{
    self.centerViewController = [[ICCenterViewController alloc] initWithNibName:Nil bundle:Nil];
    self.centerViewController.delegate = self;
    [self.view addSubview:self.centerViewController.view];
    [self addChildViewController:self.centerViewController];
    [self.centerViewController didMoveToParentViewController:self];
}

-(void)returnToCenter
{
    [UIView animateWithDuration:SLIDE_TIME delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.centerViewController.view.frame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height);
    }completion:^(BOOL finished){
        [self resetMainView];
    }];
}


-(void)resetMainView
{
    if(_leftNavigationViewController!=nil)
    {
        [self.leftNavigationViewController.view removeFromSuperview];
        self.leftNavigationViewController = nil;
        _centerViewController.leftFlag = 0;
        [self addShadowsToCenterView:NO withOffset:0.0f];
    }
}

-(UIView *)setupLeftView
{
    if (_leftNavigationViewController == nil) {
        _leftNavigationViewController = [[ICLeftNavigationViewController alloc] init];
        
        [self.view addSubview:self.leftNavigationViewController.view];
        [self addChildViewController:_leftNavigationViewController];
        [_leftNavigationViewController didMoveToParentViewController:self];
    }
    
    return _leftNavigationViewController.view;
}

-(void)showLeftPanel
{
    UIView *childView = [self setupLeftView];
    [self.view sendSubviewToBack:childView];
    
    [self addShadowsToCenterView:YES withOffset:-2];
    
    [UIView animateWithDuration:SLIDE_TIME delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.centerViewController.view.frame = CGRectMake(self.view.frame.size.width-SLIDE_OFFSITE, 20, self.view.frame.size.width, self.view.frame.size.height);
    }completion:^(BOOL finished){
        self.centerViewController.leftFlag = 1;
    }];
}

-(void)addShadowsToCenterView:(BOOL)status withOffset:(double)offset
{
    if (status) {
        [_centerViewController.view.layer setCornerRadius:CORNER_RADIUS];
        [_centerViewController.view.layer setShadowColor:[UIColor blackColor].CGColor];
        [_centerViewController.view.layer setShadowOpacity:0.8];
        [_centerViewController.view.layer setShadowOffset:CGSizeMake(offset, offset)];
    }else{
        [_centerViewController.view.layer setCornerRadius:0.0f];
        [_centerViewController.view.layer setShadowOffset:CGSizeMake(offset, offset)];
    }
}



@end
