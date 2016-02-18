//
//  SMMainViewController.m
//  SuperMom-doctor
//
//  Created by Air on 15/12/10.
//  Copyright (c) 2015年 super-Yang. All rights reserved.
//

#import "SMMainViewController.h"
#import "ZCButton.h"
#import "SMMyUserViewController.h"



@interface SMMainViewController ()
{
    NSDictionary *userInfo;
    ZCButton *myUserBtn;
    ZCButton *newUserBtn;
    ZCButton *EmergencyCallBtn;
    ZCButton *unusualSymptomsBtn;
    ZCButton *signsReportBtn;
    ZCButton *serviceRequestsBtn;
    ZCButton *integrationBtn;
    UIButton * QRCodeBtn;
    UIButton *informationBtn;
    dispatch_queue_t animationQueue;
}
@end

@implementation SMMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addSubViews];
    //[self getData];
}
- (void)addSubViews
{
    CGFloat height = ScreenHeight - 64;

    myUserBtn = [[ZCButton alloc] initWithFrame:CGRectMake(-ScreenWidth, 0, ScreenWidth/3, height*3/5)];
    [myUserBtn setTextColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:15.f] backgroundColor:coloWithREAD_GREEN_BLUE(67, 89, 181) target:self action:@selector(myUserBtnAction)];
    myUserBtn.TitleLabel.text = @"我的用户";
    myUserBtn.valueLabel.text = @"(12/123)";
    [self.view addSubview:myUserBtn];
    
    
  
    newUserBtn = [[ZCButton alloc] initWithFrame:CGRectMake(-ScreenWidth, CGRectGetMaxY(myUserBtn.frame), ScreenWidth/3, height/5)];
     [newUserBtn setTextColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:15.f] backgroundColor:coloWithREAD_GREEN_BLUE(0, 169, 247) target:self action:@selector(newUserBtnAction)];
    newUserBtn.TitleLabel.text = @"新用户建档";
    newUserBtn.valueLabel.text = @"(8)";
    [self.view addSubview:newUserBtn];
    
    QRCodeBtn = [UIButton systemButtonWithFrame:CGRectMake(-ScreenWidth, CGRectGetMaxY(newUserBtn.frame), ScreenWidth/3, height/5) title:@"我的二微码" textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:15.f] backgroundColor:coloWithREAD_GREEN_BLUE(157, 55, 176) target:self action:@selector(QRCodeBtnAction)];
    QRCodeBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    QRCodeBtn.layer.borderWidth = 2;
    [self.view addSubview:QRCodeBtn];
   
 
   
    
    //    dispatch_async([self animationQueue], ^{
//        // 并行执行的线程1
//        //sleep(0.1);
//        dispatch_sync([self animationQueue], ^{
//        [self animateFromPoint:CGPointMake(-ScreenWidth, myUserBtn.height/2) toPoint:CGPointMake(myUserBtn.width/2, myUserBtn.height/2) direction:left andView:myUserBtn];
//         });
//        dispatch_sync([self animationQueue], ^{
//            // 并行执行的线程2
//            //sleep(0.1);
//            [self animateFromPoint:CGPointMake(-ScreenWidth, myUserBtn.height+newUserBtn.height/2) toPoint:CGPointMake(newUserBtn.width/2, myUserBtn.height+newUserBtn.height/2) direction:left andView:newUserBtn];
//            
//        });
//        dispatch_sync([self animationQueue], ^{
//            // 3
//            //sleep(0.2);
//            [self animateFromPoint:CGPointMake(-ScreenWidth, CGRectGetMaxY(newUserBtn.frame)+QRCodeBtn.height/2) toPoint:CGPointMake(QRCodeBtn.width/2, CGRectGetMaxY(newUserBtn.frame)+QRCodeBtn.height/2) direction:left andView:QRCodeBtn];
//        });
//
//    });
    
    EmergencyCallBtn =  [[ZCButton alloc] initWithFrame:CGRectMake(ScreenWidth+1, 0, ScreenWidth*2/3, height/5)];
    [EmergencyCallBtn setTextColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:15.f] backgroundColor:coloWithREAD_GREEN_BLUE(236, 57, 44) target:self action:@selector(EmergencyCallBtnAction)];
    EmergencyCallBtn.TitleLabel.text = @"紧急呼叫";
    EmergencyCallBtn.valueLabel.text = @"(1)";
    [self.view addSubview:EmergencyCallBtn];
    
    unusualSymptomsBtn = [[ZCButton alloc] initWithFrame:CGRectMake(ScreenWidth+1, CGRectGetMaxY(EmergencyCallBtn.frame), ScreenWidth*2/3, height/5)];
    [unusualSymptomsBtn setTextColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:15.f] backgroundColor:coloWithREAD_GREEN_BLUE(206, 108, 0) target:self action:@selector(unusualSymptomsBtnAction)];
    unusualSymptomsBtn.TitleLabel.text = @"异常症状";
    unusualSymptomsBtn.valueLabel.text = @"(3)";
    [self.view addSubview:unusualSymptomsBtn];
    
    
   
    signsReportBtn = [[ZCButton alloc] initWithFrame:CGRectMake(ScreenWidth+1,CGRectGetMaxY(unusualSymptomsBtn.frame), ScreenWidth*2/3, height/5)];
     [signsReportBtn setTextColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:15.f] backgroundColor:coloWithREAD_GREEN_BLUE(69, 149, 0) target:self action:@selector(signsReportBtnAction)];
    signsReportBtn.TitleLabel.text = @"体征报告";
    signsReportBtn.valueLabel.text = @"(1)";
    [self.view addSubview:signsReportBtn];
    
  
    serviceRequestsBtn = [[ZCButton alloc] initWithFrame:CGRectMake(ScreenWidth+1,CGRectGetMaxY(signsReportBtn.frame), ScreenWidth*2/3, height/5)];
     [serviceRequestsBtn setTextColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:15.f] backgroundColor:coloWithREAD_GREEN_BLUE(0, 106, 166) target:self action:@selector(serviceRequestsBtnAction)];
    serviceRequestsBtn.TitleLabel.text = @"服务请求";
    serviceRequestsBtn.valueLabel.text = @"(8)";
    [self.view addSubview:serviceRequestsBtn];
    
    integrationBtn = [[ZCButton alloc] initWithFrame:CGRectMake(ScreenWidth/3, ScreenHeight+1, ScreenWidth/3, height/5)];
    [integrationBtn setTextColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:15.f] backgroundColor:coloWithREAD_GREEN_BLUE(255, 191, 0) target:self action:@selector(integrationBtnAction)];
    integrationBtn.TitleLabel.text = @"积分";
    integrationBtn.valueLabel.text = @"888";
    [self.view addSubview:integrationBtn];
    
    informationBtn = [UIButton systemButtonWithFrame:CGRectMake(ScreenWidth+1, CGRectGetMaxY(serviceRequestsBtn.frame), ScreenWidth/3, height/5) title:@"资讯" textColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:15.f] backgroundColor:coloWithREAD_GREEN_BLUE(98, 126, 139) target:self  action:@selector(informationBtnAction)];
    informationBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    informationBtn.layer.borderWidth = 2;
    [self.view addSubview:informationBtn];
    
    [self animationProcess];
}
- (void)animationProcess
{
    [self animateFromPoint:CGPointMake(-ScreenWidth, myUserBtn.height/2) toPoint:CGPointMake(myUserBtn.width/2, myUserBtn.height/2) direction:left andView:myUserBtn];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //延迟执行的方法
        [self animateFromPoint:CGPointMake(-ScreenWidth, myUserBtn.height+newUserBtn.height/2) toPoint:CGPointMake(newUserBtn.width/2, myUserBtn.height+newUserBtn.height/2) direction:left andView:newUserBtn];
        
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //延迟执行的方法
        [self animateFromPoint:CGPointMake(-ScreenWidth, CGRectGetMaxY(newUserBtn.frame)+QRCodeBtn.height/2) toPoint:CGPointMake(QRCodeBtn.width/2, CGRectGetMaxY(newUserBtn.frame)+QRCodeBtn.height/2) direction:left andView:QRCodeBtn];
        
        
    });
    
    [self animateFromPoint:CGPointMake(ScreenWidth+100, EmergencyCallBtn.height/2) toPoint:CGPointMake(myUserBtn.width+EmergencyCallBtn.width/2, EmergencyCallBtn.height/2) direction:right andView:EmergencyCallBtn];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //延迟执行的方法
        [self animateFromPoint:CGPointMake(ScreenWidth+100, EmergencyCallBtn.height+unusualSymptomsBtn.height/2) toPoint:CGPointMake(unusualSymptomsBtn.width/2+ScreenWidth/3, EmergencyCallBtn.height+unusualSymptomsBtn.height/2) direction:right andView:unusualSymptomsBtn];
        
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //延迟执行的方法
        [self animateFromPoint:CGPointMake(ScreenWidth+100, CGRectGetMaxY(unusualSymptomsBtn.frame)+signsReportBtn.height/2) toPoint:CGPointMake(signsReportBtn.width/2+ScreenWidth/3, CGRectGetMaxY(unusualSymptomsBtn.frame)+signsReportBtn.height/2) direction:right andView:signsReportBtn];
        
        
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //延迟执行的方法
        [self animateFromPoint:CGPointMake(ScreenWidth+100, CGRectGetMaxY(signsReportBtn.frame)+serviceRequestsBtn.height/2) toPoint:CGPointMake(serviceRequestsBtn.width/2+ScreenWidth/3, CGRectGetMaxY(signsReportBtn.frame)+serviceRequestsBtn.height/2) direction:right andView:serviceRequestsBtn];
        
        
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //延迟执行的方法
        [self animateFromPoint:CGPointMake(ScreenWidth+100, CGRectGetMaxY(serviceRequestsBtn.frame)+informationBtn.height/2) toPoint:CGPointMake(informationBtn.width/2+ScreenWidth*2/3, CGRectGetMaxY(serviceRequestsBtn.frame)+informationBtn.height/2) direction:right andView:informationBtn];
        
        
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //延迟执行的方法
        [self animateFromPoint:CGPointMake(integrationBtn.width/2+ScreenWidth/3, ScreenHeight+100) toPoint:CGPointMake(integrationBtn.width/2+ScreenWidth/3, CGRectGetMaxY(serviceRequestsBtn.frame)+integrationBtn.height/2) direction:down andView:integrationBtn];
        
        
    });

}
-(dispatch_queue_t)animationQueue
{
    if (!animationQueue) {
        animationQueue = dispatch_get_global_queue(0, 0);
    }
    return animationQueue;
}
- (void)animateFromPoint:(CGPoint )fromPoint toPoint:(CGPoint )toPoint direction:(Direction)direction  andView:(UIButton *)zcButton
{

    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 1.0;
    animation.delegate = self;
    CGFloat deviation;
    CGFloat smallDeviation;

    if (direction != down) {
        deviation = (direction == left)? -30:30;
        smallDeviation = (direction == left)?10:-10;
    animation.values = @[ [NSValue valueWithCGPoint:fromPoint],
                         [NSValue valueWithCGPoint:CGPointMake(toPoint.x, toPoint.y)],
                         [NSValue valueWithCGPoint:CGPointMake(toPoint.x+deviation, toPoint.y)],
                         [NSValue valueWithCGPoint:CGPointMake(toPoint.x+deviation+smallDeviation, toPoint.y)],
                         //[NSValue valueWithCGPoint:CGPointMake(toPoint.x+deviation+smallDeviation*2, toPoint.y)],
                         [NSValue valueWithCGPoint:CGPointMake(toPoint.x, toPoint.y)]];
    }else{
        
        animation.values = @[ [NSValue valueWithCGPoint:fromPoint],
                              [NSValue valueWithCGPoint:CGPointMake(toPoint.x, toPoint.y)],
                              [NSValue valueWithCGPoint:CGPointMake(toPoint.x, toPoint.y+30)],
                              [NSValue valueWithCGPoint:CGPointMake(toPoint.x, toPoint.y+20)],
                             // [NSValue valueWithCGPoint:CGPointMake(toPoint.x, toPoint.y+10)],
                              [NSValue valueWithCGPoint:CGPointMake(toPoint.x, toPoint.y)]];

    }
    

    animation.timingFunctions = @[
                                      [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseIn],
                                      [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut],
                                      [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseIn],
                                      [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut],
                                      [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseIn],
                                      [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseOut],
                                      ];
        animation.keyTimes = @[@0.0,@0.3,@0.6,@0.8,@1.0];

        zcButton.layer.position = toPoint;
        [zcButton.layer addAnimation:animation forKey:nil];
    
    
}
- (void)getData
{
    NSString *api = [NSString stringWithFormat:@"%@%@",Url,kHomePage];
    userInfo = [[UserManager shareInstance]getUserObjectForkey:@"loginReturn"];
    NSString *paramsStr = [@{@"doctorid":userInfo[@"doctorid"]} JSONString];
    NSDictionary *params = @{@"params":paramsStr,@"timestamp":dateStr(),@"appClient":@"ios",@"dev":deviceUID(),@"msgtype":@"NOTIFY",@"appSign":appSign(),@"net":@"4G",@"protocolVersion":@"1.0.0",@"appVersion":@"1.0"};

    [[AFHTTPRequestOperationManager manager]POST:api parameters:params  success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject[@"msg"] isEqualToString:@"成功"]) {
            if ([responseObject[@"data"] notNilOrEmpty]) {
                NSString *myUser = [NSString stringWithFormat:@"%@/%@",responseObject[@"data"][@"activityuser"],responseObject[@"data"][@"alluser"]];
                [myUserBtn.valueLabel setText:myUser];
                [newUserBtn.valueLabel setText:responseObject[@"data"][@"newuser"]];
                [EmergencyCallBtn.valueLabel setText:responseObject[@"data"][@"emergnum"]];
                [unusualSymptomsBtn.valueLabel setText:responseObject[@"data"][@"symptomnum"]];
                [signsReportBtn.valueLabel setText:responseObject[@"data"][@"normalmnum"]];
                [serviceRequestsBtn.valueLabel setText:responseObject[@"data"][@"questionnum"]];
                [integrationBtn.valueLabel setText:responseObject[@"data"][@"totalpoint"]];

            }
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

}
- (void)myUserBtnAction
{
    SMMyUserViewController *myUserVC = [[SMMyUserViewController alloc] init];
    [self.navigationController pushViewController:myUserVC animated:YES];
}
- (void)newUserBtnAction
{
    NSLog(@"2");

}
- (void)QRCodeBtnAction
{
    NSLog(@"3");

}
- (void)EmergencyCallBtnAction
{
    NSLog(@"4");

}
- (void)unusualSymptomsBtnAction
{
    NSLog(@"5");

}
- (void)signsReportBtnAction
{
    NSLog(@"6");

}
-(void)serviceRequestsBtnAction
{
    NSLog(@"7");

}
-(void)integrationBtnAction
{
    NSLog(@"8");

}
- (void)informationBtnAction
{
    NSLog(@"9");

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
