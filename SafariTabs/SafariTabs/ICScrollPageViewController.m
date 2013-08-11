//
//  ICScrollPageViewController.m
//  SafariTabs
//
//  Created by Shengzhe Chen on 8/10/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICScrollPageViewController.h"

@interface ICScrollPageViewController ()

@property (nonatomic, assign) CGRect originRect;
@property (nonatomic, assign) CGRect originRectInScreen;

@property (nonatomic, weak) UIView *originSuperview;

@end

@implementation ICScrollPageViewController

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
    return [ICScrollPageView class];
}
//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
#pragma mark Button
//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
- (void)pageClicked:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(pageClicked:)])
    {
        [self.delegate performSelector:@selector(pageClicked:)
                            withObject:self];
    }
}

@end
