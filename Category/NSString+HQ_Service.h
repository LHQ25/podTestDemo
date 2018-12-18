//
//  NSString+HQ_Service.h
//  HQKit
//
//  Created by 因酷  on 2018/11/21.
//  Copyright © 2018年 LHQ. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (HQ_Service)

-(NSDate *(^)(NSString *))hq_dateFromStringWithFormatter;

@end

