//
//  ICCultureView.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/18/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICCultureView.h"

@implementation ICCultureView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    
    if (self)
    {
        self.backgroundColor = [UIColor yellowColor];
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = delegate;
        _tableView.dataSource = delegate;
        [self addSubview:_tableView];
        
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect frame = self.bounds;
    frame = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height - 32);
    self.tableView.frame = frame;
}

@end
