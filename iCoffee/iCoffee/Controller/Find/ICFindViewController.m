//
//  ICFindViewController.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/18/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICFindViewController.h"
#import "ICHTTPManager.h"

#import "ICFindView.h"

#import "ICMapPlaceEntityMapper.h"

@interface ICFindViewController ()

@property (nonatomic, strong) ICFindView *view;
@property (nonatomic, weak) MKMapView *mapView;

@property (nonatomic, strong) NSMutableDictionary *places;

@end

@implementation ICFindViewController

- (id)initWithDelegate:(id)delegate
{
    self = [super initWithDelegate:delegate];
    
    if (self)
    {
        self.places = [NSMutableDictionary new];
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
    self.mapView = self.view.mapView;
    
    [self mapView:self.mapView showCoordinate:self.mapView.userLocation.coordinate width:100 height:100];
}


///////////////////////////////////////////
///////////////////////////////////////////
#pragma mark Convenient
///////////////////////////////////////////
///////////////////////////////////////////
- (void)mapView:(MKMapView *)mapView showCoordinate:(CLLocationCoordinate2D)coordinate
          width:(CGFloat)width
         height:(CGFloat)height
{
    mapView.region = MKCoordinateRegionMakeWithDistance(coordinate, height, width);
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
    static NSDate *lastSearchTime = nil;
    
    if (!lastSearchTime || fabs([lastSearchTime timeIntervalSinceNow]) > 5.0)
    {
        NSDictionary *parameters = @{
                                     @"key":GooglePlacesAPIKey,
                                     @"location":[NSString stringWithFormat:@"%f,%f", self.mapView.userLocation.coordinate.latitude, self.mapView.userLocation.coordinate.longitude],
                                     @"radius":@10000,
                                     @"sensor":@"false",
                                     @"keyword":searchBar.text,
                                     @"name":searchBar.text,
                                     @"types":@"cafe"
                                     };
        
        ICHTTPManager *httpManager = [ICHTTPManager POSTHTTPManagerWithURLString:@"https://maps.googleapis.com/maps/api/place/radarsearch/json"
                                                                            body:parameters
                                                                           token:nil
                                                               completionHandler:^(ICHTTPURLResponse *response)
        {
            NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:response.data
                                                                       options:NSJSONReadingMutableContainers
                                                                         error:nil];
            
            if (jsonObject)
            {
                NSArray *results = [jsonObject valueForKey:@"results"];
                
                for (id result in results)
                {
                    ICMapPlaceEntity *placeEntity = [ICMapPlaceEntityMapper map:result error:nil];
                    
                    if (![self.places objectForKey:placeEntity.id])
                    {
                        [self.places setObject:placeEntity forKey:placeEntity.id];
                    }
                }
            }

            [searchBar resignFirstResponder];
        }];
        
        [httpManager start];
    }
    
    lastSearchTime = [NSDate date];
}


- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    [searchBar resignFirstResponder];
}


@end
