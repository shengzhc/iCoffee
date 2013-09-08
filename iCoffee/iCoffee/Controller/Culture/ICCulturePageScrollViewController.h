//
//  ICPageScrollViewController.h
//  iCoffee
//
//  Created by Fangzhou Lu on 9/8/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICViewController.h"
#import "ICCultureEntity.h"

@interface ICCulturePageScrollViewController : ICViewController<UIScrollViewDelegate>

@property (nonatomic, strong) ICCultureEntity *entity;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *cultures;
@property (nonatomic, assign) NSInteger *pathRow;

@end
