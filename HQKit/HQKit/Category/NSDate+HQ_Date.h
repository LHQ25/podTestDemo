//
//  NSDate+HQ_Date.h
//  HQKit
//
//  Created by 因酷  on 2018/11/21.
//  Copyright © 2018年 LHQ. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const DATEYMDHMS = @"yyyy-MM-dd hh:mm:ss";
static NSString * const DATEHMS = @"hh:mm:ss";
static NSString * const DATEYMD = @"yyyy-MM-dd";

@interface NSDateFormatter (HQ_DateFormatter)

+(NSDateFormatter *(^)(NSString *))hq_getDateFormatterWithFormatter;

@end

@interface NSDate (HQ_Date)

/** 字符串转NSDate  */
+(NSDate *(^)(NSString *,NSDateFormatter *formatter))hq_dataFromStringWithDateFormatter;
/** date 格式化时间   没有指定时间则返回当前时间*/
-(NSString *(^)(NSDateFormatter *,NSDate *))hq_stringFromDateWithDataFormatter;
/** 当前时间是否在s指定时间段内 */
-(BOOL (^)(NSDate *,NSDate *))hq_isBetweenFromHourTEHour;
-(BOOL (^)(NSDate *))hq_isBeforFromDate;
-(BOOL (^)(NSDate *))hq_isLatterFromDate;

@end

