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


@interface ICCenterNavigationViewController ()

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
        _leftFlag = 0;
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
    
    self.swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureHandler)];
    [self.view addGestureRecognizer:self.swipeGestureRecognizer];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

-(void)leftItemAction
{
    if(_leftFlag==0){
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

-(void)swipeGestureHandler
{
    [self leftItemAction];
}

@end
