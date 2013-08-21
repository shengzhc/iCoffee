//
//  ICHTTPManager.h
//  iCoffeeLibrary
//
//  Created by Shengzhe Chen on 8/20/13.
//  Copyright (c) 2013 iCoffee. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ICHTTPURLConnectionDelegate.h"
#import "ICHTTPURLConnection.h"
#import "ICMutableURLRequest.h"
#import "ICHTTPURLResponse.h"

@interface ICHTTPManager : NSObject


+ (ICHTTPManager *)GETHTTPManagerWithURLString:(NSString *)URI
                                         token:(NSString *)token
                             completionHandler:(void(^)(ICHTTPURLResponse *response))completionHandler;


+ (ICHTTPManager *)PUTHTTPManagerWithURLString:(NSString *)URI
                                          body:(NSDictionary *)body
                                         token:(NSString *)token
                             completionHandler:(void(^)(ICHTTPURLResponse *response))completionHandler;


+ (ICHTTPManager *)POSTHTTPManagerWithURLString:(NSString *)URI
                                           body:(NSDictionary *)body
                                          token:(NSString *)token
                              completionHandler:(void(^)(ICHTTPURLResponse *response))completionHandler;


- (void)start;

@end
