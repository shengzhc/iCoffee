//
//  ICViewController.m
//  iCoffeeLibrary
//
//  Created by Shengzhe Chen on 8/4/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICViewController.h"
#import "ICView.h"

@interface ICViewController ()
@property (nonatomic, strong) ICView *view;
@end

@implementation ICViewController

- (id)initWithDelegate:(id)delegate
{
    self = [super init];
    if (self)
    {
        self.delegate = delegate;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.titleView = [self titleLabel];
}


- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.view removeFromSuperview];
}

- (void)loadView
{
    self.view = [[[self viewClass] alloc] initWithFrame:[self viewFrame]
                                               delegate:self];
}

- (UILabel *)titleLabel
{
    return nil;
}

- (UIImage *)backBarButtonImage
{
    return [UIImage imageNamed:@"nav_back"];
}

- (Class)viewClass
{
    return [ICView class];
}

- (CGRect)viewFrame
{
    return [UIScreen mainScreen].applicationFrame;
}

@end
