//
//  SMBaseViewController.h
//  SuperMom-doctor
//
//  Created by Air on 15/12/10.
//  Copyright (c) 2015年 super-Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMBaseViewController : UIViewController
{
    CGRect  keyBoardHeight;//键盘的高度
    UIToolbar *itemToolBar;
    CGPoint startCenter;//子视图移动前的中心点
    CGPoint dimissCenter;//子视图最终消失以及最开始生成时的位置中心点
    
}
@property(nonatomic,assign) BOOL registManager;//是否开启键盘管理
@property(nonatomic,assign) BOOL tapForCloseKeyBoard;//是否开启点击空白处关闭键盘
//@property(nonatomic,strong) SCLoadingView *loadingView;
@property(nonatomic,strong) UIScrollView *superScrollView;

- (void) closekeyBoard;//关闭键盘

- (void)addLoadingView;
- (void)removeLoadingView;
//- (void)addRequestFailedView;


//添加一个控制器(实际添加的是控制器的 view),第一个参数是视图生成时的位置,第二个参数是视图最终出现的位置
-(void)addChildViewWithController:(UIViewController *)childController fromBeganFrame:(CGRect)beganFrame toAppearFrame:(CGRect)appearFrame;
//为新增视图添加平移手势
-(void)addPanRecognizerOnTheChildView:(UIView *)childView action:(SEL)sel;
//实现该视图上手势触发的事件
-(void)panGestureRecognizerAction:(UIPanGestureRecognizer *)pan onTheChildView:(UIView *)childView;

- (void)adjustView;

@end
