//
//  ICMainMediatorVIew.h
//  iCoffee
//
//  Created by Shengzhe Chen on 8/17/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICView.h"

@class ICBottomBarView;
@class ICHeaderBarView;

@interface ICMainMediatorView : ICView

@property (nonatomic, strong) ICHeaderBarView *headerBarView;
@property (nonatomic, strong) ICBottomBarView *bottomBarView;
@property (nonatomic, strong) ICView *contentView;

- (void)toggleBottomBarView;

@end
