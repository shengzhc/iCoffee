//
//  NSArray+ICServices.m
//  ICLibrary
//
//  Created by Shengzhe Chen on 6/22/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "NSArray+ICServices.h"

@implementation NSArray (ICServices)


+ (NSArray *)array:(NSArray *)origin addingArray:(NSArray *)adding
{
    if (!origin && !adding)
    {
        return nil;
    }
    else if (!origin)
    {
        return [adding copy];
    }
    else if (!adding)
    {
        return [origin copy];
    }
    
    NSMutableArray *array = [origin mutableCopy];
    [array addObjectsFromArray:adding];
    return array;
}

- (id)firstObject
{
    if (self && self.count > 0)
    {
        return [self objectAtIndex:0];
    }
    
    return nil;
}

- (id)lastObject
{
    if (self && self.count > 0)
    {
        return [self objectAtIndex:self.count-1];
    }
    
    return nil;
}

- (NSArray *)arrayByAddingArray:(NSArray *)arr
{
    if (!arr)
    {
        return self;
    }
    
    NSMutableArray *array = [self copy];
    [array addObjectsFromArray:arr];
    return array;
}

- (NSString *)stringWithEnum:(NSUInteger)enumerator
{
    return [self objectAtIndex:enumerator];
}

- (NSUInteger)enumFrmoString:(NSString *)string
{
    NSUInteger enumIndex = [self indexOfObject:string];
    if (enumIndex == NSNotFound)
    {
        return 0;
    }
    
    return enumIndex;
}

@end
