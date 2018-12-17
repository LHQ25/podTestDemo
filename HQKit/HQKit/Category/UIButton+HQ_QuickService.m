//
//  UIButton+HQ_QuickService.m
//  HQKit
//
//  Created by 因酷  on 2018/12/13.
//  Copyright © 2018年 LHQ. All rights reserved.
//

#import "UIButton+HQ_QuickService.h"

#import <objc/runtime.h>
@interface ButtonTarget : NSObject
@property (nonatomic , copy) void (^click)(id);
@end

@implementation ButtonTarget

-(instancetype)initWithClickBlock:(void (^)(id))clickBlock{
    self =  [super init];
    if (self) {
        _click = clickBlock;
    }
    return self;
}

-(void)clickAction:(UIButton *)sender{
    if (self.click)
        self.click(sender);
}

@end

@implementation UIButton (HQ_QuickService)


+(UIButton *)hq_createBtnWithSupperView:(UIView *)superView{

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [superView addSubview:btn];
    return btn;
}



-(void (^)(UIControlEvents , void (^)(id)))hq_clickWithEvent{
    return ^(UIControlEvents event , void (^clickBlock)(id)){
        
        ButtonTarget *btnTarget = objc_getAssociatedObject(self, _cmd);
        if (!btnTarget) {
            btnTarget = [[ButtonTarget alloc] initWithClickBlock:clickBlock];
            objc_setAssociatedObject(self, _cmd, btnTarget, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        [self addTarget:btnTarget action:@selector(clickAction:) forControlEvents:event];
        
    };
}

-(void (^)(void (^)(id)))hq_clickWithDefaultEvent{
    
    return ^(void (^clickBlock)(id)){
        
      self.hq_clickWithEvent(UIControlEventTouchUpInside,clickBlock);
        
    };
}

-(UIButton * (^)(NSString * _Nonnull, UIColor * _Nonnull))hq_nomalStateTitleAndColor{
    return ^(NSString *title , UIColor *color){
        self.hq_otherStateTitleAndColor(title,color,UIControlStateNormal);
        return self;
    };
}

-(UIButton * _Nonnull (^)(NSString * _Nonnull, UIColor * _Nonnull, UIControlState))hq_otherStateTitleAndColor{
    return ^(NSString *title , UIColor *color , UIControlState state){
        [self setTitleColor:color forState:state];
        [self setTitle:title forState:state];
        return self;
    };
}

@end
