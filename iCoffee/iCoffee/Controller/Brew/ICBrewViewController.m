//
//  ICBrewViewController.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/18/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBrewViewController.h"
#import "ICBrewView.h"
#import "ICPopButtonViewController.h"


@interface ICBrewViewController ()

@property (nonatomic, strong) ICPopButtonViewController *popButtonViewController;

@end

@implementation ICBrewViewController

- (id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self)
    {
        
    }
    
    return self;
}

- (Class)viewClass
{
    return [ICBrewView class];
}


- (NSString *)headerBarTitle
{
    return @"Brew";
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.popButtonViewController.view];
}


- (ICPopButtonViewController *)popButtonViewController
{
    if (!_popButtonViewController)
    {
        CGRect frame = self.viewFrame;
        CGPoint widgetCenter = CGPointMake(frame.size.width - 50, frame.size.height - 100);
        _popButtonViewController = [[ICPopButtonViewController alloc] initWithDelegate:self
                                                                       widgetCenter:widgetCenter];
    }
    
    return _popButtonViewController;
}


@end
