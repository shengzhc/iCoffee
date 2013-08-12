//
//  ICHeaderTableViewController.h
//  Umano
//
//  Created by Shengzhe Chen on 8/11/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICViewController.h"
#import "ICHeaderTableView.h"

@interface ICHeaderTableViewController : ICViewController < UITableViewDataSource, UITableViewDelegate >

@property (nonatomic, strong) ICHeaderTableView *view;

@end
