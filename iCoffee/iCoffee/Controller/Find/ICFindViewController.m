//
//  ICFindViewController.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/18/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICFindViewController.h"

#import "ICFindView.h"

@interface ICFindViewController ()

@end

@implementation ICFindViewController

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
    return [ICFindView class];
}


- (NSString *)headerBarTitle
{
    return @"Find";
}
@end
