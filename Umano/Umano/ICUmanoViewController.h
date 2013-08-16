//
//  ICUmanoViewController.h
//  Umano
//
//  Created by Shengzhe Chen on 8/10/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICViewController.h"
#import "ICUmanoView.h"

#import "ICHeaderTableViewController.h"

@interface ICUmanoViewController : ICViewController < ICHeaderTableViewDelegate >

@property (nonatomic, strong) ICUmanoView *view;

@property (nonatomic, strong) ICHeaderTableViewController *headerTableViewController;

- (CGSize)headerSize;


@end
