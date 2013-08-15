//
//  ICLeftNavigationViewController.h
//  ICSlideOut
//
//  Created by Fangzhou Lu on 8/13/13.
//  Copyright (c) 2013 Fangzhou Lu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICLeftTableViewController.h"


@interface ICLeftNavigationViewController : UINavigationController

@property (nonatomic, strong) ICLeftTableViewController *leftTableViewController;

@end
