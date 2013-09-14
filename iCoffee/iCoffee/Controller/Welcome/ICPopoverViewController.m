//
//  ICPopoverViewController.m
//  iCoffee
//
//  Created by Shengzhe Chen on 9/14/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICPopoverViewController.h"
#import "ICPopoverView.h"

@interface ICPopoverViewController ()

@end

@implementation ICPopoverViewController

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
    return [ICPopoverView class];
}

@end
