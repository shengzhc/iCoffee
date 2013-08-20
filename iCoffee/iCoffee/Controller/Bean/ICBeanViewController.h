//
//  ICBeanTableViewController.h
//  iCoffee
//
//  Created by Shengzhe Chen on 8/18/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICViewController.h"

@protocol selectRowProtocol <NSObject>

-(void)tableSelectedAtRow:(NSInteger)row;

@end


@interface ICBeanViewController : ICViewController  < UITableViewDelegate,UITableViewDataSource >

@property (nonatomic, assign) id<selectRowProtocol> delegate;

@end
