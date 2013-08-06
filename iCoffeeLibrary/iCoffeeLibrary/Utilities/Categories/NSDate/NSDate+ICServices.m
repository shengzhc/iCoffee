//
//  NSDate+ICServices.m
//  ICLibrary
//
//  Created by Shengzhe Chen on 7/13/13.
//  Copyright (c) 2013 Shengzhe Chen. All rights reserved.
//

#import "NSDate+ICServices.h"

@implementation NSDate (ICServices)


+ (NSDate *)dateFromTimestamp:(NSNumber *)timestamp
{
    long long correctedTimestamp = [timestamp floatValue]/1000;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:correctedTimestamp];
    return date;
}

+ (NSString *)stringFromTimestamp:(NSNumber *)timestamp
{
    return [self stringFromTimestamp:timestamp dateFormat:@"M/d/YY"];
}

+ (NSString *)timeStringFromTimestamp:(NSNumber *)timestamp
{
    return [self stringFromTimestamp:timestamp dateFormat:@"M/d/yy h:mm a"];
}

+ (NSString *)monthDateStringFromTimestamp:(NSNumber *)timestamp
{
    return [self stringFromTimestamp:timestamp dateFormat:@"MMMM y"];
}

+ (NSString *)stringFromTimestamp:(NSNumber *)timestamp dateFormat:(NSString *)dateFormat
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormat];
    
    long long correctedTimestamp = [timestamp floatValue]/1000;
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:correctedTimestamp];
    return [formatter stringFromDate:date];
}

+ (NSDate *)dateFromFormat:(NSString *)format string:(NSString *)string
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    return [formatter dateFromString:string];
}

+ (NSString *)currentDateString
{
    return [self stringFromTimestamp:[self currentTimestamp]
                          dateFormat:@"M/d/YY"];
}

+ (NSNumber *)currentTimestamp
{
    long long timestamp = [[NSDate date] timeIntervalSince1970] * 1000;
    return [NSNumber numberWithLongLong:timestamp];
}

+ (NSInteger)currentYear
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSYearCalendarUnit
                                                fromDate:[NSDate date]];
    return [components year];
}

+ (NSInteger)yearFromDate:(NSDate *)date
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSYearCalendarUnit fromDate:date];
    return [components year];
}

+ (NSInteger)monthFromDate:(NSDate *)date
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorian components:NSMonthCalendarUnit fromDate:date];
    return [components month];
}

+ (NSInteger)yearFromTimestamp:(NSNumber *)timestamp
{
    return [self yearFromDate:[NSDate dateFromTimestamp:timestamp]];
}

+ (NSInteger)monthFromTimestamp:(NSNumber *)timestamp
{
    return [self monthFromDate:[self dateFromTimestamp:timestamp]];
}

@end
