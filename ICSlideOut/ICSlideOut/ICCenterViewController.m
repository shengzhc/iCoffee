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
    }
    
    return self;
}

-(void)leftButtonAction
{
    if (self.leftButton.tag==0) {
        [self.delegate showLeftPanel];
    }else if(self.leftButton.tag==1){
        [self.delegate returnToCenter];
    }
}

-(UIButton *)getButton
{
    self.leftButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchDown];
    [self.leftButton setTitle:@"Left" forState:UIControlStateNormal];
    self.leftButton.frame = CGRectMake(15.0, 15.0, 40.0, 40.0);
    self.leftButton.tag = 0;
    
    return self.leftButton;
}

-(void)loadView
{
    CGRect fullScreenFrame = [[UIScreen mainScreen] applicationFrame];
    self.centerView = [[UIView alloc] initWithFrame:fullScreenFrame];
    self.centerView.backgroundColor = [UIColor lightGrayColor];
    
    //Set root view of CenterViewController
    self.view = self.centerView;
    UIButton* button = [self getButton];
    [self.view addSubview:button];
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
