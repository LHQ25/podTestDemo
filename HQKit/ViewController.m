//
//  ViewController.m
//  HQKit
//
//  Created by 因酷  on 2018/11/19.
//  Copyright © 2018年 LHQ. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()<UITableViewDelegate , UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic , strong) NSArray *titleArray;
@property (nonatomic , strong) NSArray *vcArray;
@property (nonatomic , strong) UITextField *tf;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.tf = [[UITextField alloc] initWithFrame:CGRectMake(140, 100, 200, 40)];
//    self.tf.borderStyle = UITextBorderStyleRoundedRect;
//    [self.view addSubview:self.tf];
    
    NSArray *arr = @[@"111",@"222",@"333"];
    @try {
        NSLog(@"%@",arr[10]);
    } @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }
    
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self. navigationController pushViewController:[[NSClassFromString(self.vcArray[indexPath.row]) alloc] init] animated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celliD"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"celliD"];
    }
    cell.textLabel.text = self.titleArray[indexPath.row];
    return cell;
}
- (NSArray *)vcArray{
    if (!_vcArray) {
        _vcArray = @[@"MyStackViewController",@"BlueToothController",@"AnimationController",@"SetController"];
    }
    return _vcArray;
}
- (NSArray *)titleArray{
    if (!_titleArray) {
        _titleArray = @[@"UIStackView",@"蓝牙",@"动画",@"跳转设置"];
    }
    return _titleArray;
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//
//    self.tf.text.hq_validatePatternString(@"^[a-zA-Z]{3,10}$");
//    self.tf.text.hq_validatePatternString(@"^[\u4e00-\u9fa5]{2,7}$");
//
//}


@end
