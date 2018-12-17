//
//  UIView+HQ_Service.h
//  HQKit
//
//  Created by 因酷  on 2018/12/13.
//  Copyright © 2018年 LHQ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (HQ_Service)

-(void (^)(UIGestureRecognizer *))hq_addGestureRecognizer;

@end

NS_ASSUME_NONNULL_END
