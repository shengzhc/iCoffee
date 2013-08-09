//
//  ICTabView.h
//  SafariTabs
//
//  Created by Shengzhe Chen on 8/5/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICView.h"

@interface ICTabView : ICView

@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *headerLabel;

@property (nonatomic, strong) UIView *leftWallView;
@property (nonatomic, strong) UIView *rightWallView;

@end
