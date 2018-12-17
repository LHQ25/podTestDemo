//
//  UITapGestureRecognizer+HQ_TapService.m
//  HQKit
//
//  Created by 因酷  on 2018/12/13.
//  Copyright © 2018年 LHQ. All rights reserved.
//

#import "UITapGestureRecognizer+HQ_TapService.h"
#import <objc/runtime.h>
@interface TapGargetObject : NSObject

@property (nonatomic , copy) void (^tap)(id);

@end

@implementation TapGargetObject

-(instancetype)initWithTapBlock:(void (^)(id))tapBlock{
    self = [super init];
    if (self) {
        _tap = tapBlock;
    }
    return self;
}

-(void)invokeTapMethod:(UITapGestureRecognizer *)sender{
    if (self.tap)
        self.tap(sender);
}

@end

@implementation UITapGestureRecognizer (HQ_TapService)


-(instancetype)initWithTapBlock:(void (^)(id _Nonnull))tapBlock{
    self = [super init];
    if (self) {
        [self addTapBlock:tapBlock];
    }
    return self;
    
}

-(void)addTapBlock:(void (^)(id))tapBock{

    TapGargetObject *ob = objc_getAssociatedObject(self, _cmd);
    if (!ob) {
        ob = [[TapGargetObject alloc] initWithTapBlock:tapBock];
        objc_setAssociatedObject(self, _cmd, ob, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self addTarget:ob action:@selector(invokeTapMethod:)];
}
@end
