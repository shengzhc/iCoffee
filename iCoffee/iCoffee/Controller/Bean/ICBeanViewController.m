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
#import <QuartzCore/QuartzCore.h>

@interface ICBeanViewController ()

@property (nonatomic, strong) NSMutableArray *beans;

@end

@implementation ICBeanViewController

- (id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self)
    {
        NSArray *data = [ICLocalizable jsonArrayWithFileName:@"coffee_category"
                                                        type:@"json"];
        
        _beans = [NSMutableArray new];
        
        for (id bean in data)
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
    ICBeanCell *cell = (ICBeanCell *)[ICCellFactory cellWithCellType:CellTypeBeanCell
                                                        forTableView:tableView];
    ICBeanEntity *beanEntity = [self.beans objectAtIndex:indexPath.row];
    [cell setData:beanEntity];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ICBeanEntity *beanEntity = [self.beans objectAtIndex:indexPath.row];
    ICBeanDetailViewController *beanDetailViewController = [[ICBeanDetailViewController alloc] initWithDelegate:self
                                                                                                     beanEntity:beanEntity];
    beanDetailViewController.screenShot = [self capture];  //Use a screenshot as a fake view.
    [self.navigationController pushViewController:beanDetailViewController animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75.0;
}

- (UIImage *)capture
{
    UIGraphicsBeginImageContextWithOptions([UIScreen mainScreen].applicationFrame.size, self.view.opaque, 0.0);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
