//
//  ICUView.h
//  iCoffee
//
//  Created by Shengzhe Chen on 8/17/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICView.h"

@interface ICUView : ICView

@property (nonatomic, strong) ICView *headerBarView;
@property (nonatomic, strong) ICView *contentView;
@property (nonatomic, strong) ICView *bottomBarView;

@end
