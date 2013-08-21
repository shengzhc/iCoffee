//
//  ICURLResponse.m
//  iCoffeeLibrary
//
//  Created by Shengzhe Chen on 8/20/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICHTTPURLResponse.h"

@implementation ICHTTPURLResponse

- (id)init
{
    self = [super init];
    
    if (self)
    {
        self.errors = [NSMutableArray new];
    }
    
    return self;
}

@end
