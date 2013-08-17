//
//  ICWelcomeViewController.h
//  iCoffee
//
//  Created by Shengzhe Chen on 8/17/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICViewController.h"

#import "ICWelcomeView.h"
#import "ICScrollViewDatasource.h"

@interface ICWelcomeViewController : ICViewController < ICScrollViewDatasource >

@property (nonatomic, strong) ICWelcomeView *view;

@end
