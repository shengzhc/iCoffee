//
//  ICWelcomeViewController.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/17/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICWelcomeViewController.h"

#import "ICWelcomeView.h"

@interface ICWelcomeViewController ()

@end

@implementation ICWelcomeViewController

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
    return [ICWelcomeView class];
}

@end
