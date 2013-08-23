//
//  ICMapPlaceEntity.m
//  iCoffee
//
//  Created by Shengzhe Chen on 8/22/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICMapPlaceEntity.h"

@implementation ICMapPlaceEntity


- (NSString *)title
{
    return [NSString stringWithFormat:@"%f", self.coordinate.latitude];
}


- (NSString *)subtitle
{
    return [NSString stringWithFormat:@"%f", self.coordinate.longitude];
}


@end
