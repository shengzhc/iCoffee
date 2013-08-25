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

-(void)loadView
{
    [super loadView];
    
    if (!_popButtonViewController) {
        CGRect frame = self.viewFrame;
        CGPoint widgetCenter = CGPointMake(frame.size.width-50, frame.size.height-100);
        _popButtonViewController = [[ICPopButtonViewController alloc] initWithDelegate:self andWidgetCenter:widgetCenter];
    }
    
    [self.view addSubview:_popButtonViewController.view];
    
}


@end
