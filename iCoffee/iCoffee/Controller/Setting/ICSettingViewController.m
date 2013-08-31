//
//  ICSettingViewController.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/18/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICSettingViewController.h"

#import "ICSettingView.h"

@interface ICSettingViewController ()

@property (nonatomic, strong) NSArray *datasource;

@end

@implementation ICSettingViewController

- (id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self)
    {
        self.datasource = [ICLocalizable jsonArrayWithFileName:@"settings" type:@"json"];
    }
    
    return self;
}


- (Class)viewClass
{
    return [ICSettingView class];
}


- (UILabel *)titleLabel
{
    UILabel *titleLabel = [UILabel labelWithFrame:CGRectZero
                                             text:@"Setting"
                                        alignment:NSTextAlignmentCenter
                                             font:[UIFont icBoldFontWithSize:20]
                                        textColor:[UIColor blackColor]];
    [titleLabel sizeToFit];
    return titleLabel;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.datasource count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.datasource[section] valueForKey:@"rows"] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ICSettingCell *cell = (ICSettingCell *)[ICCellFactory cellWithCellType:CellTypeSettingCell forTableView:tableView];
    [cell setData:[[self.datasource[indexPath.section] valueForKey:@"rows"] objectAtIndex:indexPath.row]];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 44.0)];

    UILabel *sectionHeaderLabel = [UILabel labelWithFrame:CGRectZero
                                                     text:[[self.datasource[section] valueForKey:@"header"] uppercaseString]
                                                alignment:NSTextAlignmentLeft
                                                     font:[UIFont icRegularFontWithSize:14]
                                                textColor:[UIColor blackColor]];
    [sectionHeaderLabel sizeToFit];
    [headerView addSubview:sectionHeaderLabel];
    sectionHeaderLabel.frame = [sectionHeaderLabel alignedRectInSuperviewForSize:sectionHeaderLabel.bounds.size
                                                                          offset:CGSizeMake(12, 10)
                                                                         options:(ICAlignmentOptionsLeft | ICAlignmentOptionsBottom)];
    
    
    return headerView;
}

@end
