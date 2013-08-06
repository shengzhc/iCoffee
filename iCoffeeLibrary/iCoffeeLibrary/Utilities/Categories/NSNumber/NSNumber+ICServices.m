//
//  NSNumber+ICServices.m
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/14/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "NSNumber+ICServices.h"

@implementation NSNumber (ICServices)


- (BOOL)compare:(NSNumber *)number comparisonResult:(NSComparisonResult)comparisonResult
{
    if (!number)
    {
        number = @0;
    }
    
    if (![number isKindOfClass:[NSNumber class]])
    {
        return NO;
    }
    
    return [self compare:number] == comparisonResult;
}

- (BOOL)isGreaterThan:(NSNumber *)number
{
    return [self compare:number
        comparisonResult:NSOrderedDescending];
}

- (BOOL)isLessThan:(NSNumber *)number
{
    return [self compare:number
        comparisonResult:NSOrderedAscending];
}

- (BOOL)isGreaterThanOrEqualTo:(NSNumber *)number
{
    return ![self isLessThan:number];
}

- (BOOL)isLessThanOrEqualTo:(NSNumber *)number
{
    return ![self isGreaterThan:number];
}

@end
