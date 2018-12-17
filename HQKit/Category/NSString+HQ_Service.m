//
//  NSString+HQ_Service.m
//  HQKit
//
//  Created by 因酷  on 2018/11/21.
//  Copyright © 2018年 LHQ. All rights reserved.
//

#import "NSString+HQ_Service.h"
#import "NSDate+HQ_Date.h"
@implementation NSString (HQ_Service)

-(NSDate *(^)(NSString *))hq_dateFromStringWithFormatter{
    return ^(NSString *formatter){
        NSDateFormatter *matter = NSDateFormatter.hq_getDateFormatterWithFormatter(DATEYMDHMS);
        return NSDate.hq_dataFromStringWithDateFormatter(self,matter);
    };
}

@end
