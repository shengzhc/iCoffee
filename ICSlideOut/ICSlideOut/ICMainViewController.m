//
//  ICMainViewController.m
//  ICSlideOut
//
//  Created by Fangzhou Lu on 8/12/13.
//  Copyright (c) 2013 Fangzhou Lu. All rights reserved.
//

#import "ICMainViewController.h"
#import "ICCenterViewController.h"
#import "ICLeftPanelViewController.h"

#define SLIDE_OFFSITE 80
#define SLIDE_TIME 0.25

@interface ICMainViewController ()<CenterViewControllerDelegate>

@property (nonatomic, strong) ICCenterViewController *centerViewController;
@property (nonatomic, strong) ICLeftPanelViewController *leftViewController;

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

-(void)setupCenterViewController
{
    self.centerViewController = [[ICCenterViewController alloc] initWithNibName:Nil bundle:Nil];
    self.centerViewController.delegate = self;
    [self.view addSubview:self.centerViewController.view];
    [self addChildViewController:self.centerViewController];
    [self.centerViewController didMoveToParentViewController:self];
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

-(void)returnToCenter
{
    [UIView animateWithDuration:SLIDE_TIME delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.centerViewController.view.frame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height);
    }completion:^(BOOL finished){
        self.centerViewController.leftButton.tag = 0;
    }];
}

-(UIView *)setupLeftView
{
    if (_leftViewController == nil) {
        self.leftViewController = [[ICLeftPanelViewController alloc] initWithNibName:Nil bundle:Nil];
        
        [self.view addSubview:self.leftViewController.view];
        [self addChildViewController:_leftViewController];
        [_leftViewController didMoveToParentViewController:self];
        
    }
    
    return self.leftViewController.view;
}

-(void)showLeftPanel
{
    UIView *childView = [self setupLeftView];
    [self.view sendSubviewToBack:childView];
    
    [UIView animateWithDuration:SLIDE_TIME delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.centerViewController.view.frame = CGRectMake(self.view.frame.size.width-SLIDE_OFFSITE, 20, self.view.frame.size.width, self.view.frame.size.height);
    }completion:^(BOOL finished){
        self.centerViewController.leftButton.tag = 1;
    }];
}



@end
