//
//  ICFindView.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/18/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICFindView.h"

@interface ICFindView ()

@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UIButton *locationButton;
@property (nonatomic, strong) UIButton *settingButton;

@end

@implementation ICFindView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        
        self.foreView = [[UIView alloc] initWithFrame:CGRectZero];
        [self.foreView addShadowWithColor:[UIColor blackColor]
                                  opacity:.3
                                   radius:.8
                                   offset:CGSizeMake(-1.5, 0)];
        self.backView = [[UIView alloc] initWithFrame:CGRectZero];
        self.backView.backgroundColor = [UIColor whiteColor];
        
        UIView *headerToolBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 50)];
        self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
        [self.searchBar setBackgroundImage:[UIImage new]];
        [self.searchBar setTranslucent:YES];
        self.searchBar.placeholder = @"Search";
        self.searchBar.delegate = delegate;
        self.searchBar.tintColor = [self headerToolBarColor];
        headerToolBarView.backgroundColor = [self headerToolBarColor];
        [headerToolBarView addShadowWithColor:[UIColor whiteColor]
                                      opacity:0.7
                                       radius:0.8
                                       offset:CGSizeMake(0, 3)];
        
        self.locationButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.locationButton setImage:[UIImage imageNamed:@"button_my_location"]
                             forState:UIControlStateNormal];
        [self.locationButton setImage:[UIImage imageNamed:@"button_my_location_pressed"]
                             forState:UIControlStateHighlighted];
        
        [self.locationButton addTarget:delegate
                                action:@selector(locationButtonClicked:)
                      forControlEvents:UIControlEventTouchUpInside];
        [self.locationButton sizeToFit];

        self.settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.settingButton setImage:[UIImage imageNamed:@"button_menu_setting"]
                            forState:UIControlStateNormal];
        [self.settingButton setImage:[[UIImage imageNamed:@"button_menu_setting"]
                                      imageWithOverlayColor:[UIColor lightGrayColor]]
                            forState:UIControlStateHighlighted];
        [self.settingButton addTarget:delegate action:@selector(settingButtonClicked:)
                     forControlEvents:UIControlEventTouchUpInside];
        [self.settingButton sizeToFit];
        
        self.mapView = [[MKMapView alloc] initWithFrame:CGRectZero];
        self.mapView.showsUserLocation = YES;
        self.mapView.delegate = delegate;
        
        [headerToolBarView addSubview:self.settingButton];
        [headerToolBarView addSubview:self.searchBar];
        [self.foreView addSubview:headerToolBarView];
        [self.foreView addSubview:self.locationButton];
        [self.foreView insertSubview:self.mapView atIndex:0];

        [self addSubview:self.foreView];
        [self insertSubview:self.backView belowSubview:self.foreView];
        
        self.foreView.frame = self.bounds;
        self.backView.frame = self.bounds;

    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];

    self.settingButton.frame = [self.settingButton alignedRectInSuperviewForSize:self.settingButton.bounds.size
                                                                          offset:CGSizeMake(0, 0)
                                                                         options:(ICAlignmentOptionsLeft | ICAlignmentOptionsVerticalCenter)];
    
    self.searchBar.frame = [self.searchBar alignedRectInSuperviewForSize:CGSizeMake(self.bounds.size.width - self.settingButton.horizontalEnding, 50)
                                                                  offset:CGSizeMake(self.settingButton.horizontalEnding, 0)
                                                                 options:(ICAlignmentOptionsLeft | ICAlignmentOptionsTop)];
    
    self.locationButton.frame = [self.locationButton alignedRectInSuperviewForSize:self.locationButton.bounds.size
                                                                            offset:CGSizeMake(20, 30)
                                                                           options:(ICAlignmentOptionsLeft | ICAlignmentOptionsBottom)];
    
    self.mapView.frame = [self.mapView alignedRectInSuperviewForSize:CGSizeMake(self.bounds.size.width, self.bounds.size.height - self.searchBar.bounds.size.height)
                                                              offset:CGSizeMake(0, self.searchBar.verticalEnding)
                                                             options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsTop)];
}


- (UIColor *)headerToolBarColor
{
    return [[UIColor blackColor] colorWithAlphaComponent:.8];
}

@end
