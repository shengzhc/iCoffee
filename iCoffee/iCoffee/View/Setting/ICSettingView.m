//
//  ICSettingView.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/18/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICSettingView.h"

@interface ICSettingView ()

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ICSettingView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        self.tableView.delegate = delegate;
        self.tableView.dataSource = delegate;
        self.tableView.backgroundView = nil;
        self.tableView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.tableView];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.tableView.frame = [self.tableView alignedRectInSuperviewForSize:CGSizeMake(self.bounds.size.width, self.bounds.size.height)
                                                                  offset:CGSizeMake(0, 30)
                                                                 options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsTop)];
}

@end
