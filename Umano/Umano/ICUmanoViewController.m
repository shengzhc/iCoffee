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
    self.view.backgroundColor = [UIColor blackColor];
    self.headerTableViewController.view.frame = CGRectMake(0, -[self headerSize].height,
                                                           self.view.bounds.size.width, [self headerSize].height);
    
    self.overlayView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.overlayView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    self.overlayView.hidden = YES;
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]
                                                    initWithTarget:self
                                                    action:@selector(scrollDown)];
    [self.overlayView addGestureRecognizer:tapGestureRecognizer];
    
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

- (UIColor *)colorForIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
            return [UIColor cyanColor];
            break;
        case 1:
            return [UIColor redColor];
            break;
        case 2:
            return [UIColor greenColor];
            break;
        case 3:
            return [UIColor purpleColor];
            break;
        case 4:
            return [UIColor yellowColor];
            break;
        case 5:
            return [UIColor magentaColor];
            break;
        case 6:
            return [UIColor orangeColor];
            break;
        case 7:
            return [UIColor brownColor];
            break;
        default:
            break;
    }
    
    return [UIColor whiteColor];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.view.contentView.backgroundColor = [self colorForIndexPath:indexPath];
    [self scrollDown];
}


- (void)scrollUp
{
    self.overlayView.hidden = NO;
    self.headerTableViewController.view.hidden = NO;
    [UIView animateWithDuration:.3 animations:^
    {
        self.overlayView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.5];
        self.headerTableViewController.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, [self headerSize].height);
        self.view.contentView.frame = CGRectMake(0, [self headerSize].height + 5, self.view.bounds.size.width, self.view.bounds.size.height);
    }
                     completion:^(BOOL finished)
    {

        
    }];
    
}


-(void)scrollDown
{
    [UIView animateWithDuration:.1
                     animations:^
     {
         self.headerTableViewController.view.frame = CGRectMake(0, 20, self.view.bounds.size.width, [self headerSize].height);
         self.view.contentView.frame = CGRectMake(0, [self headerSize].height + 20, self.view.bounds.size.width, self.view.bounds.size.height);
     }
                     completion:^(BOOL finished)
     {
         [UIView animateWithDuration:.3
                          animations:^{
             self.overlayView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
             self.headerTableViewController.view.frame = CGRectMake(0, -[self headerSize].height, self.view.bounds.size.width, [self headerSize].height);
             self.view.contentView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
         }
                          completion:^(BOOL finished)
         {
             self.overlayView.hidden = YES;
             self.headerTableViewController.view.hidden = YES;
         }];
     }];
}


- (void)clicked:(id)sender
{
    [self scrollUp];
}

@end
