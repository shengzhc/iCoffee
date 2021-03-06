//
//  ICUmanoView.m
//  Umano
//
//  Created by Shengzhe Chen on 8/10/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICUmanoView.h"
@interface ICUmanoView ()

@property (nonatomic, strong) UINavigationBar *navigationBar;

@end

@implementation ICUmanoView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    
    if (self)
    {
        self.contentView = [[UIView alloc] initWithFrame:frame];
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        self.navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0.1, frame.size.width, 30)];
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbg"]
                                 forBarMetrics:UIBarMetricsDefault];
        
        UINavigationItem *menuItem = [[UINavigationItem alloc] initWithTitle:@""];
        
        [menuItem setTitleView:[UILabel labelWithFrame:CGRectMake(0, 0, 20, 20)
                                                  text:@"iCoffee"
                                             alignment:NSTextAlignmentCenter
                                                  font:[UIFont boldSystemFontOfSize:20]
                                             textColor:[UIColor blackColor]]];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"bbmenu"] forState:UIControlStateNormal];
        [button addTarget:delegate action:@selector(settingButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [button sizeToFit];
        UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:button];
        [self.navigationBar setItems:[NSArray arrayWithObject:menuItem]];
        self.navigationBar.topItem.leftBarButtonItem = leftButton;
        [self.contentView addSubview:self.navigationBar];
        [self addSubview:self.contentView];
        [self.contentView addCornersWithRadius:10];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.contentView.frame = self.bounds;
}


@end
