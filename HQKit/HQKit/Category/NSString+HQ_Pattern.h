//
//  NSString+HQ_Pattern.h
//  HQKit
//
//  Created by 因酷  on 2018/11/19.
//  Copyright © 2018年 LHQ. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (HQ_Pattern)

/** 字符串是否符合指定正则表达式 */
-(BOOL (^)(NSString *))hq_validatePatternString;

@end

