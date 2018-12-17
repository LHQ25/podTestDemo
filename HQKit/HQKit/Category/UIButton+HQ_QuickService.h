//
//  UIButton+HQ_QuickService.h
//  HQKit
//
//  Created by 因酷  on 2018/12/13.
//  Copyright © 2018年 LHQ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (HQ_QuickService)


+(UIButton *)hq_createBtnWithSupperView:(UIView *)superView;

/** 默认点击事件  Block*/
-(void (^)(void (^)(id)))hq_clickWithDefaultEvent;
/** 自选事件  点击事件 Block*/
-(void (^)(UIControlEvents,void (^)(id)))hq_clickWithEvent;

/** 正常状态下的文字和文字颜色  */
-(UIButton * (^)(NSString *,UIColor *))hq_nomalStateTitleAndColor;
/** 其它状态下的文字和文字颜色  */
-(UIButton * (^)(NSString *,UIColor *, UIControlState))hq_otherStateTitleAndColor;

@end

NS_ASSUME_NONNULL_END
