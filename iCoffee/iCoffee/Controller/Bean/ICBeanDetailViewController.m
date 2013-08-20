//
//  ICBeanDetailViewController.m
//  iCoffee
//
//  Created by Fangzhou Lu on 8/19/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBeanDetailViewController.h"
#import "ICBeanDetailView.h"

@interface ICBeanDetailViewController ()

@end

@implementation ICBeanDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(Class)viewClass
{
    return [ICBeanDetailView class];
}

-(NSString*)headerBarTitle
{
    return @"Bean Detail";
}

-(void)viewWillAppear:(BOOL)animated
{
    ICBeanDetailView *beanDetailView = (ICBeanDetailView *)self.view;
    beanDetailView.testLabel.text = [[NSString alloc] initWithFormat:@"Label %d",self.rowNumber];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end