//
//  ICWelcomeView.h
//  iCoffee
//
//  Created by Shengzhe Chen on 8/17/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICView.h"
#import "ICScrollViewDatasource.h"

@interface ICWelcomeView : ICView < UIScrollViewDelegate >

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, weak) id < ICScrollViewDatasource > delegate;

@end
