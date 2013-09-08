//
//  ICBrewView.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/18/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICBrewView.h"

@interface ICBrewView ()

@end

@implementation ICBrewView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];

        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                      style:UITableViewStylePlain];
        self.tableView.delegate = delegate;
        self.tableView.dataSource = delegate;
        [self addSubview:self.tableView];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.tableView.frame = [self alignedRectInSuperviewForSize:CGSizeMake(self.bounds.size.width, self.bounds.size.height - 32)
                                                        offset:CGSizeMake(0, 0)
                                                       options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsTop)];
}

@end
