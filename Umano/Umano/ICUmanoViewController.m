//
//  ICUmanoViewController.m
//  Umano
//
//  Created by Shengzhe Chen on 8/10/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICUmanoViewController.h"
#import "ICOverlayViewController.h"

#import "ICHeaderTableView.h"

@interface ICUmanoViewController ()

@property (nonatomic, strong) ICOverlayViewController *overlayViewController;

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


- (ICOverlayViewController *)overlayViewController
{
    if (!_overlayViewController)
    {
        _overlayViewController = [[ICOverlayViewController alloc] initWithDelegate:self];
    }
    
    return _overlayViewController;
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
    self.overlayViewController.view.hidden = NO;
    self.headerTableViewController.view.hidden = NO;
    [UIView animateWithDuration:.3 animations:^
    {
        self.overlayViewController.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:[self maximalAlaph]];
        self.headerTableViewController.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, [self headerSize].height);
        self.view.contentView.frame = CGRectMake(0, [self headerSize].height, self.view.bounds.size.width, self.view.bounds.size.height);
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
             self.overlayViewController.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
             self.headerTableViewController.view.frame = CGRectMake(0, -[self headerSize].height, self.view.bounds.size.width, [self headerSize].height);
             self.view.contentView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
         }
                          completion:^(BOOL finished)
         {
             self.overlayViewController.view.hidden = YES;
             self.headerTableViewController.view.hidden = YES;
             [self scrollEnd];
         }];
     }];
}

- (CGFloat)maximalAlaph
{
    return 0.9;
}

- (UIColor *)overlayColorWithRect:(CGRect)rect
{
    float distance = rect.origin.y;
    float maximal = [self headerSize].height;
    return [[UIColor blackColor] colorWithAlphaComponent:([self maximalAlaph] * distance / maximal)];
}

- (void)overlayView:(ICOverlayView *)overlayView didChangeOffset:(CGPoint)offset
{
    CGRect contentFrame = self.view.contentView.frame;
    CGRect headerTableFrame = self.headerTableViewController.view.frame;
    contentFrame.origin.y += offset.y;
    headerTableFrame.origin.y += offset.y;
    
    if (contentFrame.origin.y > [self headerSize].height)
    {
        contentFrame.origin.y = [self headerSize].height;
        headerTableFrame.origin.y = 0;
    }
    else if (contentFrame.origin.y <= 0)
    {
        contentFrame.origin.y = 0;
        headerTableFrame.origin.y = -[self headerSize].height;
    }
    
    self.view.contentView.frame = contentFrame;
    self.headerTableViewController.view.frame = headerTableFrame;
    self.overlayViewController.view.backgroundColor = [self overlayColorWithRect:contentFrame];
}

- (void)overlayViewDidEndTouch:(ICOverlayView *)overlayView
{
    CGRect contentFrame = self.view.contentView.frame;
    CGRect headerTableFrame = self.headerTableViewController.view.frame;
    
    __block BOOL isShow = YES;
    
    if (contentFrame.origin.y > self.view.bounds.size.height/2.0 - [UIApplication sharedApplication].statusBarFrame.size.height/2.0)
    {
        contentFrame.origin.y = [self headerSize].height;
        headerTableFrame.origin.y = 0;
        isShow = YES;
    }
    else
    {
        contentFrame.origin.y = 0;
        headerTableFrame.origin.y = -[self headerSize].height;
        isShow = NO;
    }
    
    [UIView animateWithDuration:.3
                     animations:^
    {
        if (isShow)
        {
            self.overlayViewController.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:[self maximalAlaph]];
        }
        else
        {
            self.overlayViewController.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
        }
        self.headerTableViewController.view.frame = headerTableFrame;
        self.view.contentView.frame = contentFrame;
    }
                     completion:^(BOOL finished)
    {
        if (!isShow)
        {
            self.overlayViewController.view.hidden = YES;
            self.headerTableViewController.view.hidden = YES;
            [self scrollEnd];
        }
    }];
}

- (void)settingButtonClicked:(id)sender
{
    self.overlayViewController.view.frame = self.view.bounds;
    self.overlayViewController.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.0];
    self.overlayViewController.view.hidden = YES;
    [self.view addSubview:self.overlayViewController.view];
    
    
    self.headerTableViewController.view.frame = CGRectMake(0, -[self headerSize].height,
                                                           self.view.bounds.size.width, [self headerSize].height);
    
    self.headerTableViewController.view.hidden = YES;
    [self.view addSubview:self.headerTableViewController.view];
    
    double delayInSeconds = .1;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self scrollUp];
    });
    
}


- (void)scrollEnd
{
    [self.overlayViewController.view removeFromSuperview];
    _overlayViewController = nil;
    [self.headerTableViewController.view removeFromSuperview];
    _headerTableViewController = nil;
}





@end
