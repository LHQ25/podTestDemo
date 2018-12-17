//
//  SetController.m
//  HQKit
//
//  Created by 因酷  on 2018/12/13.
//  Copyright © 2018年 LHQ. All rights reserved.
//

#import "SetController.h"
#import "HQCategory.h"
@interface SetController ()


@end

@implementation SetController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.cyanColor;
    
    
    UIButton *btn = [UIButton hq_createBtnWithSupperView:self.view];
    btn.hq_nomalStateTitleAndColor(@"设置界面" , UIColor.redColor).hq_otherStateTitleAndColor(@"设置",UIColor.blackColor,UIControlStateHighlighted);
    btn.backgroundColor = UIColor.blueColor;
    btn.frame = CGRectMake(100, 100, 100, 40);
    btn.hq_clickWithDefaultEvent(^(UIButton *sender){
        
            if (@available(iOS 10.0, *)) {
                NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                [[UIApplication sharedApplication]openURL:url options:@{} completionHandler:^(BOOL success) {
                    
                }];
            } else {
                NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"prefs:root=%@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]]];
                [[UIApplication sharedApplication]openURL:url];
            }
    });
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
