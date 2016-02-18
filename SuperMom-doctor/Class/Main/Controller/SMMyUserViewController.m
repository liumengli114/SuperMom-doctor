//
//  SMMyUserViewController.m
//  SuperMom-doctor
//
//  Created by Air on 15/12/11.
//  Copyright (c) 2015年 super-Yang. All rights reserved.
//

#import "SMMyUserViewController.h"
#import "SMScreen.h"
@interface SMMyUserViewController ()<UISearchBarDelegate>
{
    UISearchBar *search;

}
@end

@implementation SMMyUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = coloWithREAD_GREEN_BLUE(205, 237, 255);
    [self addSubViews];

}
- (void)addSubViews{
    search =[[UISearchBar alloc] initWithFrame:CGRectMake(0, 7.5, ScreenWidth, 48)];
    search.backgroundColor = coloWithREAD_GREEN_BLUE(205, 237, 255);
    search.placeholder = @"搜索地点";
    search.showsScopeBar =YES;
    search.keyboardType =UIKeyboardTypeNamePhonePad;
    search.delegate = self;
    [self.view addSubview:search];
    
    CGFloat height = MMHFloat(50);
    SMScreen *nameBtn = [[SMScreen alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(search.frame), MMHFloat(110)-1, height)];
    [nameBtn setTitle:@"姓名" textColor:coloWithREAD_GREEN_BLUE(54, 172, 241) font:[UIFont systemFontOfSize:14.f] backgroundColor:[UIColor whiteColor] target:self action:@selector(nameBtnAction)];
    [self.view addSubview:nameBtn];
    
    NSArray *titleArray = @[@"年龄",@"孕周",@"高危"];
    CGFloat middleWidth = (ScreenWidth -MMHFloat(110)*2)/3;
    for (int i = 0; i< 3; i++) {
        SMScreen *button = [[SMScreen alloc] initWithFrame:CGRectMake(CGRectGetMaxX(nameBtn.frame)+i*middleWidth+1, CGRectGetMaxY(search.frame), middleWidth-1, height)];
        [button setTitle:titleArray[i] textColor:coloWithREAD_GREEN_BLUE(54, 172, 241) font:[UIFont systemFontOfSize:14.f] backgroundColor:[UIColor whiteColor] target:self action:@selector(buttonAction:)];
        button.tag = 1000 +i;
        [self.view addSubview:button];
    }
   
    SMScreen *trendBtn = [[SMScreen alloc] initWithFrame:CGRectMake(ScreenWidth - MMHFloat(110), CGRectGetMaxY(search.frame), MMHFloat(110), height)];
    [trendBtn setTitle:@"动态" textColor:coloWithREAD_GREEN_BLUE(54, 172, 241) font:[UIFont systemFontOfSize:14.f] backgroundColor:[UIColor whiteColor] target:self action:@selector(trendBtnAction)];
    [self.view addSubview:trendBtn];
    

}
- (void)nameBtnAction
{
    
}
- (void)buttonAction:(SMScreen *)button
{
    
}
- (void)trendBtnAction
{
    
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
