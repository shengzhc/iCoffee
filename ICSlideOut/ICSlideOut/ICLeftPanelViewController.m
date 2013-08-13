//
//  ICLeftPanelViewController.m
//  ICSlideOut
//
//  Created by Fangzhou Lu on 8/12/13.
//  Copyright (c) 2013 Fangzhou Lu. All rights reserved.
//

#import "ICLeftPanelViewController.h"

@interface ICLeftPanelViewController ()

@property (nonatomic, strong) UIView *leftPanelView;

@end

@implementation ICLeftPanelViewController

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
    CGRect fullScreenFrame = [[UIScreen mainScreen] applicationFrame];
    _leftPanelView = [[UIView alloc] initWithFrame:fullScreenFrame];
    _leftPanelView.backgroundColor = [UIColor whiteColor];
    self.view = _leftPanelView;
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
