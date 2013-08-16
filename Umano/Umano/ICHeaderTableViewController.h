//
//  ICHeaderTableViewController.h
//  Umano
//
//  Created by Shengzhe Chen on 8/11/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICViewController.h"
#import "ICHeaderTableView.h"

@protocol ICHeaderTableViewDelegate <NSObject>

@optional

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface ICHeaderTableViewController : ICViewController < UITableViewDataSource, UITableViewDelegate >

@property (nonatomic, strong) ICHeaderTableView *view;
@property (nonatomic, weak) id < ICHeaderTableViewDelegate > delegate;

@end
