//
//  ICHeaderTableView.m
//  Umano
//
//  Created by Shengzhe Chen on 8/11/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICHeaderTableView.h"

@implementation ICHeaderTableView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    
    if (self)
    {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                      style:UITableViewStylePlain];
        self.tableView.delegate = delegate;
        self.tableView.dataSource = delegate;
        self.tableView.backgroundColor = [UIColor blackColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.bounces = NO;
        [self addSubview:self.tableView];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.tableView.frame = self.bounds;
}

@end
