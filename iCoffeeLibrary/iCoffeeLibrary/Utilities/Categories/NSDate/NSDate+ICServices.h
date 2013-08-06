//
//  NSDate+ICServices.h
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/13/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

// time stamp from 1970, all timestamp should divide 1000 to get the right timestamp

@interface NSDate (ICServices)

+ (NSDate *)dateFromTimestamp:(NSNumber *)timestamp;

+ (NSString *)stringFromTimestamp:(NSNumber *)timestamp;
+ (NSString *)timeStringFromTimestamp:(NSNumber *)timestamp;
+ (NSString *)monthDateStringFromTimestamp:(NSNumber *)timestamp;
+ (NSString *)stringFromTimestamp:(NSNumber *)timestamp dateFormat:(NSString *)dateFormat;

+ (NSDate *)dateFromFormat:(NSString *)format string:(NSString *)string;

+ (NSString *)currentDateString;
+ (NSNumber *)currentTimestamp;
+ (NSInteger)currentYear;

+ (NSInteger)yearFromDate:(NSDate *)date;
+ (NSInteger)monthFromDate:(NSDate *)date;

+ (NSInteger)yearFromTimestamp:(NSNumber *)timestamp;
+ (NSInteger)monthFromTimestamp:(NSNumber *)timestamp;

@end
