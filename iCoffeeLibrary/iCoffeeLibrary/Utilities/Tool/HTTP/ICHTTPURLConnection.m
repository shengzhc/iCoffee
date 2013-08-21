//
//  ICURLConnection.m
//  iCoffeeLibrary
//
//  Created by Shengzhe Chen on 8/20/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICHTTPURLConnection.h"

@interface ICHTTPURLConnection ()

@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *httpMethod;

@end

@implementation ICHTTPURLConnection

- (id)initWithRequest:(ICMutableURLRequest *)request
             delegate:(id)delegate
{
    self = [super initWithRequest:request
                         delegate:delegate
                 startImmediately:NO];

    if (self)
    {
        self.url = [request URL].description;
        self.httpMethod = [request HTTPMethod];
    }
    
    return self;
}


- (void)start
{
    [super start];
    
    NSLog(@"Start %@ Connection : %@", self.httpMethod, self.url);
}

@end
