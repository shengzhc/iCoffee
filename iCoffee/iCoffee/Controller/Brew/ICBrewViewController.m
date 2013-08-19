//
//  ICBrewViewController.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/18/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBrewViewController.h"

#import "ICBrewView.h"

@interface ICBrewViewController ()

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
@end
