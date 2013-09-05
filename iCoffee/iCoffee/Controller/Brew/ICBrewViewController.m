//
//  ICBrewViewController.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/18/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBrewViewController.h"
#import "ICBrewView.h"
#import "ICPopButtonViewController.h"
#import "ICBrewEntityMapper.h"
#import "ICBrewDetailViewController.h"

@interface ICBrewViewController ()

@property (nonatomic, strong) NSMutableArray *brews;
@property (nonatomic, strong) ICBrewView *view;

@end

@implementation ICBrewViewController

- (id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self)
    {
        self.brews = [NSMutableArray new];
        NSArray *datasource = [ICLocalizable jsonArrayWithFileName:@"coffee_brew"
                                                              type:@"json"];
        for (NSDictionary *object in datasource)
        {
            [self.brews addObject:[ICBrewEntityMapper map:object
                                                   error:nil]];
        }
    }
    
    return self;
}

- (Class)viewClass
{
    return [ICBrewView class];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view.tableView reloadData];
}


- (UILabel *)titleLabel
{
    UILabel *titleLabel = [UILabel labelWithFrame:CGRectZero
                                             text:@"Brew"
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.brews count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ICBrewCell *cell = (ICBrewCell *)[ICCellFactory cellWithCellType:CellTypeBrewCell
                                                        forTableView:tableView];
    [cell setData:(ICBrewEntity *)[self.brews objectAtIndex:indexPath.row]];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.navigationController pushViewController:[[ICBrewDetailViewController alloc] initWithDelegate:self brewEntity:[self.brews objectAtIndex:indexPath.row]]
                                         animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75.0;
}

@end
