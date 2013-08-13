//
//  ICCenterViewController.m
//  ICSlideOut
//
//  Created by Fangzhou Lu on 8/12/13.
//  Copyright (c) 2013 Fangzhou Lu. All rights reserved.
//

#import "ICCenterViewController.h"

@interface ICCenterViewController ()

@end

@implementation ICCenterViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadView
{
    CGRect fullScreenFrame = [[UIScreen mainScreen] applicationFrame];
    self.centerView = [[UIView alloc] initWithFrame:fullScreenFrame];
    self.centerView.backgroundColor = [UIColor lightGrayColor];
    
    //Set root view of CenterViewController
    self.view = self.centerView;
    
    
    //Set up navigation bar
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0,0, fullScreenFrame.size.width, 44)];
    [self.view addSubview:navigationBar];
    
    UIBarButtonItem *showLeftPanleItem = [[UIBarButtonItem alloc] initWithTitle:@"Left" style:UIBarButtonItemStyleBordered target:self action:@selector(leftItemAction)];
    
    UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@"Center View"];
    navigationItem.leftBarButtonItem = showLeftPanleItem;
    
    navigationBar.items = [NSArray arrayWithObjects:navigationItem, nil];
}

-(void)leftItemAction
{
    if(_leftFlag==0){
        [self.delegate showLeftPanel];
    }else{
        [self.delegate returnToCenter];
    }
}
@end
