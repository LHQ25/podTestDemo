//
//  UIView+HQ_Service.m
//  HQKit
//
//  Created by 因酷  on 2018/12/13.
//  Copyright © 2018年 LHQ. All rights reserved.
//

#import "UIView+HQ_Service.h"

@implementation UIView (HQ_Service)

-(void (^)(UIGestureRecognizer * _Nonnull))hq_addGestureRecognizer{
    return ^(UIGestureRecognizer *ges){
        if (!self.isUserInteractionEnabled) {
            self.userInteractionEnabled = YES;
        }
        
//        self addGestureRecognizer:<#(nonnull UIGestureRecognizer *)#>
    };
}

@end
