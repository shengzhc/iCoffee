//
//  ICUmanoViewController.m
//  Umano
//
//  Created by Shengzhe Chen on 8/10/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICUmanoViewController.h"

@interface ICUmanoViewController ()



@end

@implementation ICUmanoViewController

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
    return [ICUmanoView class];
}

@end
