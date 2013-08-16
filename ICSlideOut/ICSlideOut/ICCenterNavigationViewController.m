//
//  ICCenterNavigationViewController.m
//  ICSlideOut
//
//  Created by Fangzhou Lu on 8/14/13.
//  Copyright (c) 2013 Fangzhou Lu. All rights reserved.
//

#import "ICCenterNavigationViewController.h"
#import "ICFirstViewController.h"
#import "ICSecondViewController.h"
#import "ICThirdViewController.h"

#define CENTER 0
#define RIGHT 1
#define LEFT 2

@interface ICCenterNavigationViewController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) ICFirstViewController *firstViewController;
@property (nonatomic, strong) ICSecondViewController *secondViewController;
@property (nonatomic, strong) ICThirdViewController *thirdViewController;
@property (nonatomic, strong) NSArray *controllerArray;
@property (nonatomic, strong) UISwipeGestureRecognizer *swipeGestureRecognizer;

@end

@implementation ICCenterNavigationViewController

@synthesize firstViewController;
@synthesize secondViewController;
@synthesize thirdViewController;
@synthesize controllerArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _leftFlag = CENTER;
        self.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
  
    firstViewController = [[ICFirstViewController alloc] init];
    secondViewController = [[ICSecondViewController alloc] init];
    thirdViewController = [[ICThirdViewController alloc] init];
    
    controllerArray = [NSArray arrayWithObjects:firstViewController,secondViewController,thirdViewController,nil];
    
    self.viewControllers = [NSArray arrayWithObject:[controllerArray objectAtIndex:0]];
    
    self.visibleViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Left" style:UIBarButtonItemStyleBordered target:self action:@selector(leftItemAction)];
    
    UIPanGestureRecognizer *panGesturerRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureHandler:)];
    panGesturerRecognizer.delegate = self;
    [self.view addGestureRecognizer:panGesturerRecognizer];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

-(void)leftItemAction
{
    if(_leftFlag==CENTER){
        [self.centerDelegate showLeftPanel];
    }else{
        [self.centerDelegate returnToCenter];
    }
}

-(void)changeCenterView:(NSInteger)atRow
{
    self.viewControllers = [NSArray arrayWithObject:[controllerArray objectAtIndex:atRow]];
    self.visibleViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Left" style:UIBarButtonItemStyleBordered target:self action:@selector(leftItemAction)];
    
    [self.centerDelegate returnToCenter];
}

-(void)panGestureHandler:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation = [recognizer translationInView:self.view];
    
    if ([recognizer state]==UIGestureRecognizerStateEnded) {
        [self.centerDelegate showLeftPanelWithPanGesture:translation.x stateEnd:true];
    }
    else{
        [self.centerDelegate showLeftPanelWithPanGesture:translation.x stateEnd:false];
    }
}

@end
