//
//  ICTabViewController.h
//  SafariTabs
//
//  Created by Shengzhe Chen on 8/5/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICViewController.h"

@interface ICScrollTabViewController : ICViewController < UIScrollViewDelegate >

- (UINavigationController *)modalViewControllerForPageIndex:(NSUInteger)pageIndex;

@end
