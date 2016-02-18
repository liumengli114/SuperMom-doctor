//
//  ViewController.m
//  SuperMom-doctor
//
//  Created by Air on 15/12/10.
//  Copyright (c) 2015年 super-Yang. All rights reserved.
//

#import "ViewController.h"
#import "SMMainViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)login:(id)sender {
    
//
//    NSString *paramsStr = [@{@"phone":@"18210218950",@"userpwd":@"w2lshml"} JSONString];
//    
//    NSDictionary *params = @{@"params":paramsStr,@"timestamp":dateStr(),@"appClient":@"ios",@"dev":deviceUID(),@"msgtype":@"NOTIFY",@"appSign":appSign(),@"net":@"4G",@"protocolVersion":@"1.0.0",@"appVersion":@"1.0"};
//    
//    
//    [[AFHTTPRequestOperationManager manager]POST:@"http://120.55.195.172:8896/login" parameters:params  success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        //doctorid  DR20151211100000026    userstat 4
//        [[UserManager shareInstance]setUserObject:responseObject[@"data"] forkey:@"loginReturn"];
//
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//    }];

    SMMainViewController *mainVC = [[SMMainViewController alloc] init];
    [self.navigationController pushViewController:mainVC animated:YES];

}
- (IBAction)regist:(id)sender {
    NSString *paramsStr = [@{@"phone":@"18210218950",@"userpwd":@"w2lshml",@"phonecheckcode":@"8212"} JSONString];
    
    NSDictionary *params = @{@"params":paramsStr,@"timestamp":dateStr(),@"appClient":@"ios",@"dev":deviceUID(),@"msgtype":@"NOTIFY",@"appSign":appSign(),@"net":@"4G",@"protocolVersion":@"1.0.0",@"appVersion":@"1.0"};
    
    
    [[AFHTTPRequestOperationManager manager]POST:@"http://120.55.195.172:8896/bind_tel" parameters:params  success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

- (IBAction)identifyCode:(id)sender {
//    NSString *deviceUID = [[NSString alloc] initWithString:[UIDevice currentDevice].model];
//    NSString *dateStr =  [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]];
//    
//    NSString *appSign = [[NSString stringWithFormat:@"supMM%@",dateStr ] md5String];
    NSString *paramsStr = [@{@"phone":@"18210218950"} JSONString];
    
    NSDictionary *params = @{@"params":paramsStr,@"timestamp":dateStr(),@"appClient":@"ios",@"dev":deviceUID(),@"msgtype":@"NOTIFY",@"appSign":appSign(),@"net":@"4G",@"protocolVersion":@"1.0.0",@"appVersion":@"1.0"};
    
    
    [[AFHTTPRequestOperationManager manager]POST:@"http://120.55.195.172:8896/send_msg1" parameters:params  success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
