//
//  ICFavoriteViewController.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/18/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICFavoriteViewController.h"

#import "ICFavoriteView.h"

@interface ICFavoriteViewController ()

@end

@implementation ICFavoriteViewController

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
    return [ICFavoriteView class];
}

@end
