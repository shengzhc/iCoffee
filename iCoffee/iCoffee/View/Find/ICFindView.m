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

@end

@implementation ICFindView

- (id)initWithFrame:(CGRect)frame
           delegate:(id)delegate
{
    self = [super initWithFrame:frame
                       delegate:delegate];
    
    if (self)
    {
        self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
        self.searchBar.barStyle = UIBarStyleBlackOpaque;
        self.searchBar.placeholder = @"Search";
        self.searchBar.delegate = delegate;
        self.searchBar.showsSearchResultsButton = YES;
        self.mapView = [[MKMapView alloc] initWithFrame:CGRectZero];
        self.mapView.showsUserLocation = YES;
    
        [self addSubview:self.searchBar];
        [self addSubview:self.mapView];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.searchBar.frame = [self.searchBar alignedRectInSuperviewForSize:CGSizeMake(self.bounds.size.width, 50)
                                                                  offset:CGSizeMake(0, 0)
                                                                 options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsTop)];
    
    self.mapView.frame = [self.mapView alignedRectInSuperviewForSize:CGSizeMake(self.bounds.size.width, self.bounds.size.height - self.searchBar.bounds.size.height)
                                                              offset:CGSizeMake(0, self.searchBar.verticalEnding)
                                                             options:(ICAlignmentOptionsHorizontalCenter | ICAlignmentOptionsTop)];;
}

@end
