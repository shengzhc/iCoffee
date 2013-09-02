//
//  ICBeanView.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/18/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBeanView.h"

@implementation ICBeanView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];

    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                      style:UITableViewStylePlain];
        _tableView.dataSource = delegate;
        _tableView.delegate = delegate;
        [self addSubview:_tableView];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    CGRect frame = self.bounds;
    frame.size = CGSizeMake(frame.size.width, frame.size.height - 32);  //Deduct the height of the bottom bar.    
    self.tableView.frame = frame;
    
}

@end
