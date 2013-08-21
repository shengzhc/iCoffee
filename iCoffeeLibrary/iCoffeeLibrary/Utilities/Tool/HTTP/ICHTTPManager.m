//
//  ICHTTPManager.m
//  iCoffeeLibrary
//
//  Created by Shengzhe Chen on 8/20/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import "ICHTTPManager.h"

@interface ICHTTPManager ()

@property (nonatomic, strong) ICHTTPURLConnectionDelegate *connectionDelegate;
@property (nonatomic, strong) ICHTTPURLConnection *connection;

@property (nonatomic, copy) void(^completionHandler)(ICHTTPURLResponse *response);
@end

@implementation ICHTTPManager

- (id)initWithURIString:(NSString *)uriString
                   body:(NSDictionary *)body
                  token:(NSString *)token
                 HTTPMethod:(NSString *)method
            completionHandler:(void(^)(ICHTTPURLResponse *response))completionHandler
{
    self = [super init];
    
    if (self)
    {
        ICMutableURLRequest *request = [ICMutableURLRequest requestWithURLString:uriString
                                                                      HTTPMethod:method
                                                                            body:body
                                                                           token:token];
        self.connectionDelegate = [[ICHTTPURLConnectionDelegate alloc] initWithDelegate:self];
        self.connection = [[ICHTTPURLConnection alloc] initWithRequest:request
                                                                      delegate:self.connectionDelegate];
        self.completionHandler = completionHandler;
    }
    
    return self;
}


- (void)executeCompletionHandlerWithResponse:(ICHTTPURLResponse *)response
{
    if (self.completionHandler)
    {
        self.completionHandler(response);
    }
}


- (void)start
{
    [self.connection start];
}


+ (ICHTTPManager *)GETHTTPManagerWithURLString:(NSString *)URI
                                         token:(NSString *)token
                             completionHandler:(void(^)(ICHTTPURLResponse *response))completionHandler
{
    return [[ICHTTPManager alloc] initWithURIString:URI
                                               body:nil
                                              token:token
                                         HTTPMethod:@"GET"
                                  completionHandler:completionHandler];
}


+ (ICHTTPManager *)PUTHTTPManagerWithURLString:(NSString *)URI
                                          body:(NSDictionary *)body
                                         token:(NSString *)token
                             completionHandler:(void(^)(ICHTTPURLResponse *response))completionHandler
{
    return [[ICHTTPManager alloc] initWithURIString:URI
                                               body:body
                                              token:token
                                         HTTPMethod:@"PUT"
                                  completionHandler:completionHandler];
}


+ (ICHTTPManager *)POSTHTTPManagerWithURLString:(NSString *)URI
                                           body:(NSDictionary *)body
                                         token:(NSString *)token
                             completionHandler:(void(^)(ICHTTPURLResponse *response))completionHandler
{
    return [[ICHTTPManager alloc] initWithURIString:URI
                                               body:body
                                              token:token
                                         HTTPMethod:@"POST"
                                  completionHandler:completionHandler];
}

@end
