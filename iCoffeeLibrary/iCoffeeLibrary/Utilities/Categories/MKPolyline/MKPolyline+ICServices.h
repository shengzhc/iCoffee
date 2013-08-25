//
//  MKPolyline+ICServices.h
//  iCoffeeLibrary
//
//  Created by Shengzhe Chen on 8/25/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MKPolyline (ICServices)

+ (MKPolyline *)polylineWithEncodedString:(NSString *)encodedString;

@end
