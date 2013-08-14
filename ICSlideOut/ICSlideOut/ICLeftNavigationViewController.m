//
//  ICLeftNavigationViewController.m
//  ICSlideOut
//
//  Created by Fangzhou Lu on 8/13/13.
//  Copyright (c) 2013 Fangzhou Lu. All rights reserved.
//

#import "ICLeftNavigationViewController.h"
#import "ICLeftTableViewController.h"

@interface ICLeftNavigationViewController ()

@property (nonatomic, strong) ICLeftTableViewController *leftTableViewController;

@end

@implementation ICLeftNavigationViewController

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
        
    self.leftTableViewController = [[ICLeftTableViewController alloc] initWithStyle:UITableViewScrollPositionNone];
    self.viewControllers = [NSArray arrayWithObject:self.leftTableViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
