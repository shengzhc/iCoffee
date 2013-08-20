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

@interface ICBeanViewController ()

@property (nonatomic, strong) NSArray *beans;
@property (nonatomic, strong) ICBeanDetailViewController *beanDetailViewController;

@end

@implementation ICBeanViewController

- (id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self)
    {
        self.beans = [ICLocalizable jsonArrayWithFileName:@"bean"
                                                 type:@"json"];
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

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
#pragma mark TableViewDatasource & Delegate
//////////////////////////////////////////////////////////////////////////////////////
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

    NSDictionary *cellData = [self.beans objectAtIndex:indexPath.row];
    cell.primaryLabel.text = [cellData objectForKey:@"title"];
    cell.secondaryLabel.text = [cellData objectForKey:@"detail"];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CGRect endFrame = self.view.frame;
    CGRect startFrame = CGRectMake(endFrame.origin.x+endFrame.size.width, endFrame.origin.y, endFrame.size.width, endFrame.size.height);
    
    if (self.beanDetailViewController == nil) {
        self.beanDetailViewController = [[ICBeanDetailViewController alloc] init];
    }
    
    self.beanDetailViewController.view.frame = startFrame;
    
    [self.view addSubview:self.beanDetailViewController.view];
    
    [UIView animateWithDuration:0.5f animations:^{
        self.beanDetailViewController.view.frame = endFrame;
    }completion:^(BOOL finished){
        
    }];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75.0;
}

-(void)resetView
{
    [self.beanDetailViewController.view removeFromSuperview];
}

@end
