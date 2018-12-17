//
//  MyStackViewController.m
//  HQKit
//
//  Created by 因酷  on 2018/12/5.
//  Copyright © 2018年 LHQ. All rights reserved.
//

#import "MyStackViewController.h"

@interface MyStackViewController ()
@property (nonatomic , strong) UIStackView *stackView;
@property (nonatomic , strong) NSMutableArray *array;
@end

@implementation MyStackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.cyanColor;
    
    
    self.array = [NSMutableArray array];
    for (int i = 0; i< 5; i++) {
        UILabel *btn1 = [[UILabel alloc] init];;
        btn1.layer.cornerRadius = 3;
        btn1.layer.backgroundColor = UIColor.redColor.CGColor;
        btn1.layer.borderWidth = 1;
        btn1.layer.masksToBounds = YES;
        btn1.text = [NSString stringWithFormat:@"第%d个",i];
        btn1.textColor = UIColor.blackColor;
        btn1.textAlignment = NSTextAlignmentCenter;
        [self.array addObject:btn1];
    }
    
    [self.view addSubview:self.stackView];
    
}

-(UIStackView *)stackView{
    if (!_stackView) {
        _stackView = [[UIStackView alloc] initWithArrangedSubviews:self.array];
        _stackView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 300);
        _stackView.backgroundColor = UIColor.groupTableViewBackgroundColor;
//        配置布局
        _stackView.alignment = UIStackViewAlignmentFill;//排列的子视图的对齐垂直于堆栈视图的轴
        _stackView.axis = UILayoutConstraintAxisHorizontal; //布置视图的轴线
        _stackView.distribution = UIStackViewDistributionEqualSpacing; //沿堆栈视图轴排列的视图的分布。
        _stackView.layoutMarginsRelativeArrangement = NO;
        _stackView.baselineRelativeArrangement = NO; //视图之间的垂直间距是否从其基线开始测量
        _stackView.spacing = 5;
        
    }
    return _stackView;
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
