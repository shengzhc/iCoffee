//
//  ICBeanViewController.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/18/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBeanViewController.h"
#import "ICBeanDetailViewController.h"

#import "ICBeanView.h"
#import "ICBeanCell.h"
#import "ICBeanDetailView.h"

#import "ICBeanEntityMapper.h"

@interface ICBeanViewController ()

@property (nonatomic, strong) NSMutableArray *beans;
@property (nonatomic, strong) ICBeanDetailViewController *beanDetailViewController;

@end

@implementation ICBeanViewController

- (id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self)
    {
        NSDictionary *jsonObject = [ICLocalizable jsonObjectWithFileName:@"coffee_category"
                                                                    type:@"json"];
        
        self.beans = [NSMutableArray new];
        
        for (id bean in jsonObject.allValues)
        {
            [self.beans addObject:[ICBeanEntityMapper map:bean error:nil]];
        }
    }
    
    return self;
}


- (Class)viewClass
{
    return [ICBeanView class];
}


- (NSString *)headerBarTitle
{
    return @"Bean";
    
}


- (ICBeanDetailViewController *)beanDetailViewController
{
    if (!_beanDetailViewController)
    {
        _beanDetailViewController = [[ICBeanDetailViewController alloc] initWithDelegate:self];
    }
    
    return _beanDetailViewController;
}

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
#pragma mark TableViewDatasource & Delegate
//////////////////////////////////////////////////////////////////////////////////////

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.beans count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"beanCellIdentifier";
    
    ICBeanCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell)
    {
        cell = [[ICBeanCell alloc] initWithStyle:UITableViewCellStyleDefault
                                 reuseIdentifier:cellIdentifier];
    }
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CGRect endFrame = self.view.frame;
    CGRect startFrame = CGRectMake(endFrame.origin.x+endFrame.size.width, endFrame.origin.y, endFrame.size.width, endFrame.size.height);
    
    self.beanDetailViewController.view.frame = startFrame;
    
    [self.view addSubview:self.beanDetailViewController.view];
    
    [UIView animateWithDuration:.3f
                     animations:^
    {
        self.beanDetailViewController.view.frame = endFrame;
    }
                     completion:^(BOOL finished)
    {
    }];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75.0;
}


- (void)resetView
{
    [_beanDetailViewController.view removeFromSuperview];
    _beanDetailViewController = nil;
}

@end
