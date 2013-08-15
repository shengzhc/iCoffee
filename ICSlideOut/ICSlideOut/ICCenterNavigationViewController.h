//
//  ICCenterNavigationViewController.h
//  ICSlideOut
//
//  Created by Fangzhou Lu on 8/14/13.
//  Copyright (c) 2013 Fangzhou Lu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICLeftTableViewController.h"


@protocol CenterViewControllerDelegate <NSObject>

@optional
-(void)showLeftPanel;
-(void)showRightPanel;

@required
-(void)returnToCenter;

@end


@interface ICCenterNavigationViewController : UINavigationController<changeCenterViewProtocol>

@property (nonatomic, strong) UIView *centerView;
@property (nonatomic, assign) NSInteger leftFlag;
@property (nonatomic, assign) id<CenterViewControllerDelegate> centerDelegate;

@end
