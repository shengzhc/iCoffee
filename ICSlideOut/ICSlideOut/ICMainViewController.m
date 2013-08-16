//
//  ICMainViewController.m
//  ICSlideOut
//
//  Created by Fangzhou Lu on 8/12/13.
//  Copyright (c) 2013 Fangzhou Lu. All rights reserved.
//

#import "ICMainViewController.h"
#import "ICLeftNavigationViewController.h"
#import "ICCenterNavigationViewController.h"
#import <QuartzCore/QuartzCore.h>

#define SLIDE_OFFSITE 60
#define SLIDE_TIME 0.25
#define CORNER_RADIUS 4
#define CENTER 0
#define RIGHT 1
#define LEFT 2

@interface ICMainViewController ()<CenterViewControllerDelegate>

@property (nonatomic, strong) ICCenterNavigationViewController * centerNavigationViewController;
@property (nonatomic, strong) ICLeftNavigationViewController *leftNavigationViewController;
@property (nonatomic, assign) BOOL isLeftPanelLive;

@end

@implementation ICMainViewController

@synthesize centerNavigationViewController;
@synthesize leftNavigationViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.isLeftPanelLive = false;
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
    self.centerNavigationViewController = [[ICCenterNavigationViewController alloc] init];
    self.centerNavigationViewController.centerDelegate = self;
    
    [self.view addSubview:self.centerNavigationViewController.view];
    [self addChildViewController:self.centerNavigationViewController];
    [self.centerNavigationViewController didMoveToParentViewController:self];
}

-(void)returnToCenter
{
   [UIView animateWithDuration:SLIDE_TIME/2 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.centerNavigationViewController.view.frame = CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    }completion:^(BOOL finished){
        [UIView animateWithDuration:SLIDE_TIME delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.centerNavigationViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        }completion:^(BOOL finished){
            [self resetMainView];
        }];
    }];
}

-(void)returnToCenterByGesture{
    [UIView animateWithDuration:SLIDE_TIME delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.centerNavigationViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }completion:^(BOOL finished){
        [self resetMainView];
    }];
}

-(void)resetMainView
{
    if(leftNavigationViewController!=nil)
    {
        [self.leftNavigationViewController.view removeFromSuperview];
        self.leftNavigationViewController = nil;
        centerNavigationViewController.leftFlag = CENTER;
        [self addShadowsToCenterView:NO withOffset:0.0f];
        self.isLeftPanelLive = false;
    }
}

-(UIView *)setupLeftView
{
    if (leftNavigationViewController == nil) {
        leftNavigationViewController = [[ICLeftNavigationViewController alloc] init];
        
        leftNavigationViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        
        [self.view addSubview:self.leftNavigationViewController.view];
        [self addChildViewController:leftNavigationViewController];
        [leftNavigationViewController didMoveToParentViewController:self];
        leftNavigationViewController.leftTableViewController.myDelegate = self.centerNavigationViewController;
    }
    
    return leftNavigationViewController.view;
}

-(void)showLeftPanel
{
    UIView *childView = [self setupLeftView];
    [self.view sendSubviewToBack:childView];
    
    [self addShadowsToCenterView:YES withOffset:-2];
    [UIView animateWithDuration:SLIDE_TIME delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        self.centerNavigationViewController.view.frame=CGRectMake(self.view.frame.size.width-SLIDE_OFFSITE, 0, self.view.frame.size.width, self.view.frame.size.height);
    }completion:^(BOOL finished){
        self.centerNavigationViewController.leftFlag = RIGHT;
    }];
}

-(void)showLeftPanelWithPanGesture:(double)offset stateEnd:(BOOL)state
{
    CGPoint position = self.centerNavigationViewController.view.frame.origin;
    CGSize size = self.view.frame.size;
    BOOL viewState = centerNavigationViewController.leftFlag;
    
    if (offset<0&&viewState==CENTER) {
        return;
    }
    
    if(viewState==CENTER){
        if(self.isLeftPanelLive==false){
            UIView *childView = [self setupLeftView];
            [self.view sendSubviewToBack:childView];
            [self addShadowsToCenterView:YES withOffset:-2];
            self.isLeftPanelLive = true;
        }
   
        if(state==true) {
            if (position.x<size.width/4) {
                [self returnToCenterByGesture];
            }
            else{
                [UIView animateWithDuration:SLIDE_TIME delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                    self.centerNavigationViewController.view.frame = CGRectMake(size.width - SLIDE_OFFSITE, 0, size.width, size.height);
                }completion:^(BOOL finished){
                    self.centerNavigationViewController.leftFlag = RIGHT;
                }];
            }
        }
        else if(state==false){
            if (position.x<size.width-SLIDE_OFFSITE) {
                [UIView animateWithDuration:0.0f animations:^{
                    self.centerNavigationViewController.view.frame = CGRectMake(offset, 0, self.view.frame.size.width, self.view.frame.size.height);
                }];
            }else{
                [UIView animateWithDuration:SLIDE_TIME delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                    self.centerNavigationViewController.view.frame = CGRectMake(size.width - SLIDE_OFFSITE, 0, size.width, size.height);
                }completion:^(BOOL finished){
                    self.centerNavigationViewController.leftFlag = RIGHT;
                }];
            }
        }
    }else if(viewState==RIGHT){
        if (state==true) {
            if (position.x>size.width-SLIDE_OFFSITE-30) {
                [UIView animateWithDuration:0.0f delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                    self.centerNavigationViewController.view.frame = CGRectMake(size.width - SLIDE_OFFSITE, 0, size.width, size.height);
                }completion:^(BOOL finished){
                    
                }];
            }else{
                [self returnToCenterByGesture];
            }
        }else{
            if(position.x>0){
                [UIView animateWithDuration:0.0f animations:^{
                    self.centerNavigationViewController.view.frame = CGRectMake(size.width-SLIDE_OFFSITE+offset, 0, size.width, size.height);
                }];
            }else{
                [self returnToCenterByGesture];
            }
        }
    }
}

-(void)addShadowsToCenterView:(BOOL)status withOffset:(double)offset
{
    if(status){
        [centerNavigationViewController.view.layer setCornerRadius:CORNER_RADIUS];
        [centerNavigationViewController.view.layer setShadowColor:[UIColor blackColor].CGColor];
        [centerNavigationViewController.view.layer setShadowOpacity:0.8];
        [centerNavigationViewController.view.layer setShadowOffset:CGSizeMake(offset, offset)];
    }else{
        [centerNavigationViewController.view.layer setCornerRadius:0.0f];
        [centerNavigationViewController.view.layer setShadowOffset:CGSizeMake(offset, offset)];
    }
}

@end
