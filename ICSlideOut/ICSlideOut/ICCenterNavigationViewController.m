//
//  ICCenterNavigationViewController.m
//  ICSlideOut
//
//  Created by Fangzhou Lu on 8/14/13.
//  Copyright (c) 2013 Fangzhou Lu. All rights reserved.
//

#import "ICCenterNavigationViewController.h"
#import "ICFirstViewController.h"

@interface ICCenterNavigationViewController ()

@property (nonatomic, strong) ICFirstViewController *firstViewController;

@end

@implementation ICCenterNavigationViewController

@synthesize firstViewController;

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
    self.viewControllers = [NSArray arrayWithObject:firstViewController];
    
    firstViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Left" style:UIBarButtonItemStyleBordered target:self action:@selector(leftItemAction)];;

    
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

@end
