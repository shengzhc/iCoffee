//
//  ICSecondViewController.m
//  ICSlideOut
//
//  Created by Fangzhou Lu on 8/14/13.
//  Copyright (c) 2013 Fangzhou Lu. All rights reserved.
//

#import "ICSecondViewController.h"

@interface ICSecondViewController ()

@end

@implementation ICSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView
{
    CGRect frame = [[UIScreen mainScreen] applicationFrame];
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor redColor];
    self.view = view;
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

@end
