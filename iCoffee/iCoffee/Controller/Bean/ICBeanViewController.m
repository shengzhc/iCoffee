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

@end

@implementation ICBeanViewController

- (id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self)
    {
        NSDictionary *jsonObject = [ICLocalizable jsonObjectWithFileName:@"coffee_category"
                                                                    type:@"json"];
        
        _beans = [NSMutableArray new];
        
        for (id bean in jsonObject.allValues)
        {
            [_beans addObject:[ICBeanEntityMapper map:bean error:nil]];
        }
    }
    
    return self;
}


- (Class)viewClass
{
    return [ICBeanView class];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
}

//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
#pragma mark Configuration
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
- (UILabel *)titleLabel
{
    UILabel *titleLabel = [UILabel labelWithFrame:CGRectZero
                                             text:@"Beans"
                                        alignment:NSTextAlignmentCenter
                                             font:[UIFont icBoldFontWithSize:20]
                                        textColor:[UIColor blackColor]];
    [titleLabel sizeToFit];
    return titleLabel;
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
    
    ICBeanEntity *beanEntity = [self.beans objectAtIndex:indexPath.row];
    NSString *row = [[NSString alloc] initWithFormat:@"Row num: %d",indexPath.row];
    
    cell.primaryLabel.text = beanEntity.name;
    cell.secondaryLabel.text = row;
    
    UIImage *image = [UIImage imageNamed:@"bean_fake.png" ];
    cell.primaryImageView.image = image;
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ICBeanEntity *beanEntity = [self.beans objectAtIndex:indexPath.row];
    ICBeanDetailViewController *beanDetailViewController = [[ICBeanDetailViewController alloc] initWithDelegate:self
                                                                                                     beanEntity:beanEntity];
    
    [self.navigationController pushViewController:beanDetailViewController animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75.0;
}

@end
