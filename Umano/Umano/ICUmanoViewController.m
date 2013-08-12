//
//  ICUmanoViewController.m
//  Umano
//
//  Created by Shengzhe Chen on 8/10/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICUmanoViewController.h"
#import "ICHeaderTableView.h"

@interface ICUmanoViewController ()

@property (nonatomic, strong) UIView *overlayView;

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


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.headerTableViewController.view.frame = CGRectMake(0, -[self headerSize].height,
                                                           self.view.bounds.size.width, [self headerSize].height);
    
    self.overlayView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.overlayView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    self.overlayView.hidden = YES;
    self.headerTableViewController.view.hidden = YES;
    [self.view addSubview:self.overlayView];
    [self.view addSubview:self.headerTableViewController.view];
}


- (CGSize)headerSize
{
    return CGSizeMake(self.view.bounds.size.width, 315);
}


- (ICHeaderTableViewController *)headerTableViewController
{
    if (!_headerTableViewController)
    {
        _headerTableViewController = [[ICHeaderTableViewController alloc] initWithDelegate:self];
    }
    
    return _headerTableViewController;
}


- (void)scrollUp
{
    self.overlayView.hidden = NO;
    self.headerTableViewController.view.hidden = NO;
    [UIView animateWithDuration:.3 animations:^
    {
        self.overlayView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.2];
        self.headerTableViewController.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, [self headerSize].height);
        self.view.contentView.frame = CGRectMake(0, [self headerSize].height + 5, self.view.bounds.size.width, self.view.bounds.size.height);
    }
                     completion:^(BOOL finished)
    {

        
    }];
    
}


-(void)scrollDown
{
    
}


- (void)clicked:(id)sender
{
    [self scrollUp];
}

@end
