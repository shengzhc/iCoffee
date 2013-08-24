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
    
    [self mapView:self.mapView showCoordinate:self.mapView.userLocation.coordinate width:10000 height:10000];
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
#pragma mark MKMapViewDelegate
///////////////////////////////////////////
///////////////////////////////////////////
- (MKAnnotationView *)mapView:(MKMapView *)mapView
            viewForAnnotation:(id <MKAnnotation>)annotation
{
    
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
        return nil;
    }
    
    NSString *pinAnnotationViewIdentifier = @"PinAnnotationViewIdentifier";
    
    MKPinAnnotationView *pinAnnotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:pinAnnotationViewIdentifier];
    
    if (!pinAnnotationView)
    {
        pinAnnotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                            reuseIdentifier:pinAnnotationViewIdentifier];
    
        pinAnnotationView.pinColor = MKPinAnnotationColorPurple;
    }
    
    return pinAnnotationView;
}


- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    for (MKAnnotationView *annotationView in views)
    {
        CGRect endFrame = annotationView.frame;
        annotationView.frame = CGRectOffset(endFrame, 0, -30);
        
        [UIView animateWithDuration:0.2
                         animations:^
        {
            annotationView.frame = endFrame;
        }];
    }
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}


- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}


- (void)mapViewWillStartLocatingUser:(MKMapView *)mapView
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
}


- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    [self mapView:mapView showCoordinate:userLocation.coordinate width:5000 height:5000];
    NSLog(@"%@", NSStringFromSelector(_cmd));
}


- (void)mapView:(MKMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
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
                [self.places removeAllObjects];
                
                NSArray *results = [jsonObject valueForKey:@"results"];
                
                for (id result in results)
                {
                    ICMapPlaceEntity *placeEntity = [ICMapPlaceEntityMapper map:result error:nil];
                    
                    if (![self.places objectForKey:placeEntity.id])
                    {
                        [self.places setObject:placeEntity forKey:placeEntity.id];
                    }
                }
                
                [self.mapView removeAnnotations:self.mapView.annotations];
                
                [self.mapView addAnnotations:[self.places allValues]];
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
