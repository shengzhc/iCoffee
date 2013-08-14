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
    
    self.leftTableViewController = [[ICLeftTableViewController alloc] initWithStyle:UITableViewStylePlain];
    //self.leftTableViewController.tableView.frame = CGRectMake(0,44, self.view.frame.size.width, self.view.frame.size.height);
    self.viewControllers = [NSArray arrayWithObject:self.leftTableViewController];
    //NSLog(@"%f", self.leftTableViewController.tableView.frame.origin.y);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
