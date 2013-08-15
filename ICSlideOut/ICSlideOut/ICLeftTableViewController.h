//
//  ICLeftTableViewController.h
//  ICSlideOut
//
//  Created by Fangzhou Lu on 8/13/13.
//  Copyright (c) 2013 Fangzhou Lu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol changeCenterViewProtocol <NSObject>

-(void)changeCenterView:(NSInteger)atRow;

@end

@interface ICLeftTableViewController : UITableViewController

@property (nonatomic, assign) id<changeCenterViewProtocol> myDelegate;

@end
