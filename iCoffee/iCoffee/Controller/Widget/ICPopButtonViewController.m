//
//  ICPopButtonViewController.m
//  iCoffee
//
//  Created by Fangzhou Lu on 8/23/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICPopButtonViewController.h"
#import "ICPopButtonView.h"

@interface ICPopButtonViewController ()

@end

@implementation ICPopButtonViewController

-(id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    if (self) {
        //Custom
    }
    
    return self;
}

- (void)loadView
{
    CGRect frame = CGRectMake(40, 40, 50, 50);
    
    self.view = [[[self viewClass] alloc] initWithFrame:frame
                                               delegate:self];
    [self.view sizeToFit];
}

-(Class)viewClass
{
    return [ICPopButtonView class];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


@end
