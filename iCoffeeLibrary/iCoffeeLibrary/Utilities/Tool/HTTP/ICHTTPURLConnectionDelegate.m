//
//  ICConnectionDelegate.m
//  iCoffeeLibrary
//
//  Created by Shengzhe Chen on 8/20/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICHTTPURLConnectionDelegate.h"
#import "ICHTTPURLResponse.h"

@interface ICHTTPURLConnectionDelegate ()

@property (nonatomic, strong) ICHTTPURLResponse *response;

@end

@implementation ICHTTPURLConnectionDelegate

- (id)initWithDelegate:(id)delegate
{
    self = [super init];
    
    if (self)
    {
        self.delegate = delegate;
        self.response = [[ICHTTPURLResponse alloc] init];
    }
    
    return self;
}

////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
#pragma mark NSURLConnectionDataDelegate
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
- (NSURLRequest *)connection:(NSURLConnection *)connection
             willSendRequest:(NSURLRequest *)request
            redirectResponse:(NSURLResponse *)response
{
    return request;
}


- (void)connection:(NSURLConnection *)connection
didReceiveResponse:(NSURLResponse *)response
{
    if ([response isKindOfClass:[NSHTTPURLResponse class]])
    {
        NSLog(@"Received Response, Response Code:%@", [response valueForKey:@"statusCode"]);
        self.response.response = (NSHTTPURLResponse *)response;
    }
    
    if (!self.data)
    {
        self.data = [[NSMutableData alloc] init];
    }
    
    [self.data setLength:0];
}


- (void)connection:(NSURLConnection *)connection
    didReceiveData:(NSData *)data
{
    NSLog(@"Received data %i bytes", data.length);
   
    [self.data appendData:data];
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Finshed receiving data %i bytes", self.data.length);
    
    self.response.data = self.data;
    
    if ([self.delegate respondsToSelector:@selector(executeCompletionHandlerWithResponse:)])
    {
        [self.delegate performSelector:@selector(executeCompletionHandlerWithResponse:)
                            withObject:self.response];
    }
}

////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
#pragma mark NSURLConnectionDelegate
////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Connection Failed: %@", error);
}

@end
