//
//  ICModalViewController.m
//  SafariTabs
//
//  Created by Shengzhe Chen on 8/10/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICModalViewController.h"
#import "ICModalView.h"

@interface ICModalViewController ()

@end

@implementation ICModalViewController

- (id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self)
    {
        
    }
    
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [UIView animateWithDuration:0.5
                     animations:^
     {
         self.view.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
     }];
    
}


- (Class)viewClass
{
    return [ICModalView class];
}


- (void)clicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(cancelModalViewController:)])
    {
        [self.delegate performSelector:@selector(cancelModalViewController:)
                            withObject:self];
    }
}


@end
