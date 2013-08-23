//
//  ICFindViewController.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/18/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICFindViewController.h"

#import "ICFindView.h"

@interface ICFindViewController ()

@property (nonatomic, strong) ICFindView *view;

@end

@implementation ICFindViewController

- (id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self)
    {
        
    }
    
    return self;
}

- (Class)viewClass
{
    return [ICFindView class];
}


- (NSString *)headerBarTitle
{
    return @"Find";
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.view.mapView.region = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(37.785834, -122.406417), 500, 500);

}


///////////////////////////////////////////
///////////////////////////////////////////
#pragma mark UISearchBarDelegate
///////////////////////////////////////////
///////////////////////////////////////////
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
}


- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:NO animated:YES];
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{

}


- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    [searchBar resignFirstResponder];
}


@end
