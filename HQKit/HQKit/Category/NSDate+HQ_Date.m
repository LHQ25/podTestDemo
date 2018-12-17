//
//  NSDate+HQ_Date.m
//  HQKit
//
//  Created by 因酷  on 2018/11/21.
//  Copyright © 2018年 LHQ. All rights reserved.
//

#import "NSDate+HQ_Date.h"
@implementation NSDateFormatter (HQ_DateFormatter)

+(NSDateFormatter *(^)(NSString *))hq_getDateFormatterWithFormatter{
    return ^(NSString *formatter){
        NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
        dateformatter.dateFormat = formatter;
        return dateformatter;
    };
}

@end

@implementation NSDate (HQ_Date)

+(NSDate *(^)(NSString *, NSDateFormatter *))hq_dataFromStringWithDateFormatter{
    return ^(NSString *dateTime , NSDateFormatter *formatter){
        return [formatter dateFromString:dateTime];
    };
}

-(NSString *(^)(NSDateFormatter *,NSDate *))hq_stringFromDateWithDataFormatter{
    return ^(NSDateFormatter *formatter,NSDate *date){
        if (date == nil) {
            return [formatter stringFromDate:[NSDate date]];
        }
        return [formatter stringFromDate:date];
    };
}

-(BOOL (^)(NSDate *, NSDate *))hq_isBetweenFromHourTEHour{
    return ^(NSDate *formDate , NSDate *toDate){
        if ([self compare:formDate] == NSOrderedDescending && [self compare:toDate] == NSOrderedAscending) {
            return YES;
        }
        return NO;
    };
}
-(BOOL (^)(NSDate *))hq_isBeforFromDate{
    return ^(NSDate *date){
        if ([self compare:date] == NSOrderedAscending) {
            return YES;
        }
        return NO;
    };
}
-(BOOL (^)(NSDate *))hq_isLatterFromDate{
    return ^(NSDate *date){
        if ([self compare:date] == NSOrderedDescending) {
            return YES;
        }
        return NO;
    };
}

@end
