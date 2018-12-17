//
//  BlueToothController.m
//  HQKit
//
//  Created by 因酷  on 2018/12/7.
//  Copyright © 2018年 LHQ. All rights reserved.
//

#import "BlueToothController.h"

#import <CoreBluetooth/CoreBluetooth.h>

@interface BlueToothController ()<CBCentralManagerDelegate>

@property (nonatomic , strong) CBCentralManager *centeralManager;

@end

@implementation BlueToothController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //    CBCentralManagerScanOptionAllowDuplicatesKey : 指定扫描是否应在没有重复过滤的情况下运行 default : NO
//    CBCentralManagerScanOptionSolicitedServiceUUIDsKey   要扫描的服务UUID（由CBUUID对象表示）的数组（NSArray实例）
    [self.centeralManager scanForPeripheralsWithServices:nil options:nil];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(30 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.centeralManager stopScan];
    });
    
}

//MARK: - CBCentralManagerDelegate;
//MARK: - 必须实现代理

- (void)centralManagerDidUpdateState:(CBCentralManager *)central{
    NSLog(@"状态发生变化");
}
//MARK: - 可选
- (void)centralManager:(CBCentralManager *)central willRestoreState:(NSDictionary<NSString *, id> *)dict{
    NSLog(@"状态发生变化 --  %@",dict);
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *, id> *)advertisementData RSSI:(NSNumber *)RSSI{
    NSLog(@"发现 %@",advertisementData);
    
}
- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral{
    NSLog(@"连接");
}

- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(nullable NSError *)error{
    NSLog(@"连接失败");
}

- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(nullable NSError *)error{
    NSLog(@"断开连接");
}

-(CBCentralManager *)centeralManager{
    if (!_centeralManager) {
        //        如果蓝牙关闭，系统是否应向用户显示警告对话框。 CBCentralManagerOptionShowPowerAlertKey  默认为NO
//        唯一标识： CBCentralManagerOptionRestoreIdentifierKey
 
        _centeralManager = [[CBCentralManager alloc] initWithDelegate:self queue:dispatch_get_main_queue() options:@{CBCentralManagerOptionShowPowerAlertKey:@(YES),CBCentralManagerOptionRestoreIdentifierKey:@"onlyOne"}];
    }
    return _centeralManager;
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
