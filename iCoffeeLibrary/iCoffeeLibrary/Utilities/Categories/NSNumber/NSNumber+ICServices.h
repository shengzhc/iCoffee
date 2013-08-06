//
//  NSNumber+ICServices.h
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/14/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (ICServices)

- (BOOL)isGreaterThan:(NSNumber *)number;

- (BOOL)isLessThan:(NSNumber *)number;

- (BOOL)isGreaterThanOrEqualTo:(NSNumber *)number;

- (BOOL)isLessThanOrEqualTo:(NSNumber *)number;

@end
