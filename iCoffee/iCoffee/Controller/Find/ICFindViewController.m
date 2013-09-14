//
//  ICFindViewController.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/18/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICFindViewController.h"
#import "ICHTTPManager.h"
#import "MKPolyline+ICServices.h"

#import "ICFindView.h"
#import "ICFindBackView.h"
#import "ICDataButton.h"
#import <SDWebImage/UIImageView+WebCache.h>

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

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.mapView = self.view.mapView;
    self.view.foreView.frame = self.view.bounds;
    self.view.backView.frame = CGRectMake(0, 0, 280, self.view.bounds.size.height);
    
    [self mapView:self.mapView showCoordinate:self.mapView.userLocation.coordinate
            width:[self visibleRegionSize].width
           height:[self visibleRegionSize].height
          animated:NO];
}

- (void)cleanupMapView
{
    switch (self.mapView.mapType)
    {
        case MKMapTypeHybrid:
            self.mapView.mapType = MKMapTypeStandard;
            break;
        case MKMapTypeStandard:
            self.mapView.mapType = MKMapTypeHybrid;
            break;
        default:
            break;
    }

    [self.mapView removeAnnotations:self.mapView.annotations];
    [self.mapView removeOverlays:self.mapView.overlays];
    self.mapView.showsUserLocation = NO;
    self.mapView.delegate = nil;
    [self.mapView removeFromSuperview];
    self.mapView = nil;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self cleanupMapView];
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


- (CGFloat)radius
{
    return 5000;
}


- (UILabel *)titleLabel
{
    UILabel *titleLabel = [UILabel labelWithFrame:CGRectZero
                                             text:@"Find"
                                        alignment:NSTextAlignmentCenter
                                             font:[UIFont icBoldFontWithSize:20]
                                        textColor:[UIColor blackColor]];
    [titleLabel sizeToFit];
    return titleLabel;
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
    BOOL hideBackView = NO;
    
    if (self.view.foreView.frame.origin.x > 1)
    {
        destRect = self.view.bounds;
        interRect = CGRectOffset(self.view.foreView.frame, xOffset, 0);
        interDuration = 0.05;
        destDuration = 0.2;
        enablePanView = NO;
        hideBackView = YES;
    }
    else
    {
        destRect = [self foldForeViewFrame];
        interRect = CGRectOffset(destRect, xOffset, 0);
        interDuration = 0.2;
        destDuration = 0.05;
        enablePanView = YES;
        self.view.backView.hidden = hideBackView;
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
              if (hideBackView)
              {
                  self.view.backView.hidden = hideBackView;
              }
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
    [self.view endEditing:YES];
    [self toggleBackView];
}


- (void)directionButtonClicked:(id)sender
{
    ICDataButton *button = (ICDataButton *)sender;
    ICMapPlaceEntity *placeEntity = (ICMapPlaceEntity *)button.object;
    
    ICHTTPManager *httpManager = [ICHTTPManager POSTHTTPManagerWithURLString:@"http://maps.googleapis.com/maps/api/directions/json"
                                                                        body:@{
                                  @"origin":[NSString stringWithFormat:@"%f,%f", self.mapView.userLocation.coordinate.latitude, self.mapView.userLocation.coordinate.longitude],
                                  @"destination":[NSString stringWithFormat:@"%f,%f", placeEntity.coordinate.latitude, placeEntity.coordinate.longitude],
                                  @"sensor":@"false",
                                  @"mode":@"driving",
                                  @"avoid":[self.view.backView avoid]
                                  }
                                                                       token:nil
                                                           completionHandler:^(ICHTTPURLResponse *response)
    {
        NSArray *routes = [[NSJSONSerialization JSONObjectWithData:response.data options:NSJSONReadingMutableContainers error:nil] objectForKey:@"routes"];
        if ([routes count] == 0)
        {
            return;
        }
        
        [self.mapView removeOverlays:self.mapView.overlays];
        
        NSMutableArray *overlays = [NSMutableArray new];
        
        for (id route in routes)
        {
            NSString *encodedPolyline = [route valueForKeyPath:@"overview_polyline.points"];
            MKPolyline *polyline = [MKPolyline polylineWithEncodedString:encodedPolyline];
            [overlays addObject:polyline];
        }
        [self.mapView addOverlays:overlays];

    }];
    [httpManager start];
}


- (void)panGestureDidMoved:(UIPanGestureRecognizer *)panGestureRecognizer
{
    static CGPoint previousLocation;
    static NSDate *timestamp;
    
    float speed = 2500.0;
    
    
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
            
            CGFloat duration = fabs(self.view.foreView.frame.origin.x - 0)/speed;
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
                self.view.backView.hidden = YES;
            }];
        }
        else
        {
            CGFloat duration = fabs(self.view.foreView.frame.origin.x - [self foldForeViewFrame].origin.x)/speed;
            
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
            
            CGFloat duration = fabs(self.view.foreView.frame.origin.x - 0)/speed;
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
                 self.view.backView.hidden = YES;
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
    
        pinAnnotationView.canShowCallout = YES;
        ICDataButton *direction = [ICDataButton buttonWithType:UIButtonTypeCustom];
        [direction setImage:[UIImage imageNamed:@"find_direction_inactive"] forState:UIControlStateNormal];
        [direction setImage:[UIImage imageNamed:@"find_direction_active"] forState:UIControlStateHighlighted];
        [direction sizeToFit];
        [direction addTarget:self
                      action:@selector(directionButtonClicked:)
            forControlEvents:UIControlEventTouchUpInside];
        direction.object = annotation;
        
        pinAnnotationView.rightCalloutAccessoryView = direction;
        UIImageView *logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        [logoImageView setImageWithURL:[NSURL URLWithString:((ICMapPlaceEntity *)annotation).iconURL]
                      placeholderImage:[UIImage imageNamed:@"find_direction_active"]];
        logoImageView.contentMode = UIViewContentModeScaleToFill;
        logoImageView.backgroundColor = [UIColor whiteColor];
        [logoImageView addCorners];
        [logoImageView addBorderWithColor:[UIColor blackColor]];
        pinAnnotationView.leftCalloutAccessoryView = logoImageView;
    }
    else
    {
        UIImageView *logoImageView = (UIImageView *)pinAnnotationView.leftCalloutAccessoryView;
        [logoImageView setImageWithURL:[NSURL URLWithString:((ICMapPlaceEntity *)annotation).iconURL]
                      placeholderImage:[UIImage imageNamed:@"find_direction_active"]];
    
        ICDataButton *direction = (ICDataButton *)pinAnnotationView.rightCalloutAccessoryView;
        direction.object = annotation;
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

}


- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view
{
    
}


- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay
{
    if ([overlay isKindOfClass:[MKPolyline class]])
    {
        MKPolylineView *polylineView = [[MKPolylineView alloc] initWithPolyline:overlay];
        [polylineView setStrokeColor:[UIColor blueColor]];
        return polylineView;
    }
    
    return nil;
}


- (void)mapView:(MKMapView *)mapView didAddOverlayViews:(NSArray *)overlayViews
{
    
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
        [self.mapView removeAnnotations:self.mapView.annotations];
        [self.mapView removeOverlays:self.mapView.overlays];
        
        NSDictionary *parameters = @{
                                     @"key":GooglePlacesAPIKey,
                                     @"location":[NSString stringWithFormat:@"%f,%f", self.mapView.userLocation.coordinate.latitude, self.mapView.userLocation.coordinate.longitude],
                                     @"radius":[NSNumber numberWithFloat:[self radius]],
                                     @"sensor":@"false",
                                     @"keyword":searchBar.text,
                                     @"name":searchBar.text,
                                     @"types":[self.view.backView types],
                                     @"opennow":[self.view.backView opennow]
                                     };

        
        ICHTTPManager *httpManager = [ICHTTPManager POSTHTTPManagerWithURLString:@"https://maps.googleapis.com/maps/api/place/nearbysearch/json"
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
            [self mapView:self.mapView showCoordinate:self.mapView.userLocation.coordinate
                    width:2 * [self radius]
                   height:2 * [self radius]
                 animated:YES];
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
