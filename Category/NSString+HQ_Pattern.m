//
//  NSString+HQ_Pattern.m
//  HQKit
//
//  Created by 因酷  on 2018/11/19.
//  Copyright © 2018年 LHQ. All rights reserved.
//

#import "NSString+HQ_Pattern.h"

@implementation NSString (HQ_Pattern)

-(BOOL (^)(NSString *))hq_validatePatternString{
    return ^(NSString *pat){
        return [self _validateWithpatternString:pat];
    };
}
-(BOOL)_validateWithpatternString:( NSString * )pattern{
    NSAssert(pattern.length > 0, @"正则表达式不能为空");
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self matches %@",pattern];
    return [predicate evaluateWithObject:self];
}

-(void)errorAction:(NSAssertionHandler *)handle{
    
}

@end
