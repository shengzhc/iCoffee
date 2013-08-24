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
    self.view.foreView.frame = self.view.bounds;
    self.view.backView.frame = self.view.bounds;
    
    [self mapView:self.mapView showCoordinate:self.mapView.userLocation.coordinate
            width:[self visibleRegionSize].width
           height:[self visibleRegionSize].height
          animated:NO];
}

///////////////////////////////////////////
///////////////////////////////////////////
#pragma mark Configuration
///////////////////////////////////////////
///////////////////////////////////////////
- (CGSize)visibleRegionSize
{
    return CGSizeMake(1000, 1000);
}


- (CGRect)foldForeViewFrame
{
    return CGRectMake(260, 0, self.view.bounds.size.width,
                      self.view.bounds.size.height);
    
}

///////////////////////////////////////////
///////////////////////////////////////////
#pragma mark Convenient
///////////////////////////////////////////
///////////////////////////////////////////
- (void)mapView:(MKMapView *)mapView showCoordinate:(CLLocationCoordinate2D)coordinate
          width:(CGFloat)width
         height:(CGFloat)height
       animated:(BOOL)animated
{
    [mapView setRegion:MKCoordinateRegionMakeWithDistance(coordinate, height, width)
              animated:animated];
}


- (void)togglePanView:(BOOL)enable
{
    const int PAN_TAG = 10000;
    
    if (enable)
    {
        UIView *panView = [[UIView alloc] initWithFrame:self.mapView.frame];
        
        panView.tag = PAN_TAG;
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                               action:@selector(panGestureDidMoved:)];
        [panView addGestureRecognizer:panGestureRecognizer];
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureDidTapped:)];
        [panView addGestureRecognizer:tapGestureRecognizer];
        
        [self.view.foreView addSubview:panView];
    }
    else
    {
        [[self.view viewWithTag:PAN_TAG] removeFromSuperview];
    }
}


- (void)toggleBackView
{
    CGRect destRect, interRect;
    CGFloat destDuration, interDuration;
    CGFloat xOffset = 20;
    BOOL enablePanView;
    
    if (self.view.foreView.frame.origin.x > 1)
    {
        destRect = self.view.bounds;
        interRect = CGRectOffset(self.view.foreView.frame, xOffset, 0);
        interDuration = 0.05;
        destDuration = 0.3;
        enablePanView = NO;
    }
    else
    {
        destRect = [self foldForeViewFrame];
        interRect = CGRectOffset(destRect, xOffset, 0);
        interDuration = 0.3;
        destDuration = 0.05;
        enablePanView = YES;
    }
    
    [UIView animateWithDuration:interDuration
                     animations:^
     {
         self.view.foreView.frame = interRect;
     }
                     completion:^(BOOL finished)
     {
         [UIView animateWithDuration:destDuration
                          animations:^
          {
              self.view.foreView.frame = destRect;
          }
                          completion:^(BOOL finished)
          {
              [self togglePanView:enablePanView];
          }];
     }];
}
///////////////////////////////////////////
///////////////////////////////////////////
#pragma mark Button
///////////////////////////////////////////
///////////////////////////////////////////
- (void)locationButtonClicked:(id)sender
{
    [self mapView:self.mapView showCoordinate:self.mapView.userLocation.coordinate
            width:[self visibleRegionSize].width
           height:[self visibleRegionSize].height
         animated:YES
     ];
}

- (void)settingButtonClicked:(id)sender
{
    [self toggleBackView];
}


- (void)panGestureDidMoved:(UIPanGestureRecognizer *)panGestureRecognizer
{
    static CGPoint previousLocation;
    static NSDate *timestamp;
    
    CGPoint currentLocation = [panGestureRecognizer translationInView:self.view];
    
    if (!timestamp)
    {
        previousLocation = currentLocation;
    }

    timestamp = [NSDate date];

    if (panGestureRecognizer.state == UIGestureRecognizerStateEnded ||
             panGestureRecognizer.state == UIGestureRecognizerStateCancelled ||
             panGestureRecognizer.state == UIGestureRecognizerStateFailed)
    {
        timestamp = nil;
        
        if (self.view.foreView.frame.origin.x <= self.view.bounds.size.width/2.0)
        {
            panGestureRecognizer.enabled = NO;
            
            CGFloat duration = fabs(self.view.foreView.frame.origin.x - 0)/500;
            CGRect frame = self.view.foreView.frame;
            frame.origin.x = 0;
            
            [UIView animateWithDuration:duration
                             animations:^
            {
                self.view.foreView.frame = frame;
            }
                             completion:^(BOOL finished)
            {
                [self togglePanView:NO];
            }];
        }
        else
        {
            CGFloat duration = fabs(self.view.foreView.frame.origin.x - [self foldForeViewFrame].origin.x)/500;
            
            [UIView animateWithDuration:duration
                             animations:^
            {
                self.view.foreView.frame = [self foldForeViewFrame];
            }];
        }
    }
    else
    {
        CGFloat xOffset = currentLocation.x - previousLocation.x;
        CGRect frame = CGRectOffset(self.view.foreView.frame, xOffset, 0);
        
        if (frame.origin.x <= 0)
        {
            panGestureRecognizer.enabled = NO;
            
            CGFloat duration = fabs(self.view.foreView.frame.origin.x - 0)/500;
            CGRect frame = self.view.foreView.frame;
            frame.origin.x = 0;
            
            [UIView animateWithDuration:duration
                             animations:^
             {
                 self.view.foreView.frame = frame;
             }
                             completion:^(BOOL finished)
             {
                 timestamp = nil;
                 [self togglePanView:NO];
             }];
        }
        else if (frame.origin.x < [self foldForeViewFrame].origin.x)
        {
            self.view.foreView.frame = frame;
        }
    }

    previousLocation = currentLocation;
}


- (void)tapGestureDidTapped:(UITapGestureRecognizer *)tapGestureRecognizer
{
    [self toggleBackView];
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
