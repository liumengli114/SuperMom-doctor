//
//  SMBaseViewController.m
//  SuperMom-doctor
//
//  Created by Air on 15/12/10.
//  Copyright (c) 2015年 super-Yang. All rights reserved.
//

#import "SMBaseViewController.h"
#define  TOOLHEIGHT 33

@interface SMBaseViewController ()

@end

@implementation SMBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = coloWithREAD_GREEN_BLUE(54, 172, 241);
    
    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(backButtonItemAction)];
    self.navigationItem.backBarButtonItem = backButtonItem;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    NSDictionary *dic=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dic;
    
    //    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
    //                                                       [UIColor whiteColor], UITextAttributeTextColor,
    //                                                       nil] forState:UIControlStateNormal];
    //适配ios7
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        self.navigationController.navigationBar.translucent = NO;
    }
    

}
- (void)backButtonItemAction
{
    
}
-(void)adjustView
{
    
    if(480 == ScreenHeight){
        NSArray *subviews = [self.view subviews];
        
        self.superScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
        self.superScrollView.bounces = NO;
        [self.superScrollView setContentSize:CGSizeMake(320, 568)];
        for (UIView *view in subviews) {
            [view removeFromSuperview];
            [self.superScrollView addSubview:view];
        }
        [self.view addSubview:self.superScrollView];
    }
}
-(void) keyboardwasShown:(id) sender
{
    //点击空白处结束编辑  回收键盘
    [self.view endEditing:YES];
    NSLog(@"键盘弹出");
    
}
-(void) keyboardwasHidden:(id) sender
{
    NSLog(@"键盘收回");
}
-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"键盘管理");
    [self addKeyBoardNotification];
    [self customKeyBoard];
    //自定义键盘
    
}
//自定义键盘
-(void) customKeyBoard
{
    
    itemToolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, TOOLHEIGHT)];
    UIBarButtonItem * item0 = [[UIBarButtonItem alloc] initWithTitle:@"上一行" style:UIBarButtonItemStyleDone target:self action:@selector(proviousAction:)];
    UIBarButtonItem * item1 = [[UIBarButtonItem alloc] initWithTitle:@"下一行" style:UIBarButtonItemStyleDone target:self action:@selector(nextAction:)];
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(closekeyBoard)];
    UIBarButtonItem * spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    [itemToolBar setItems:[NSArray arrayWithObjects:item0, item1, spaceItem,spaceItem, item2, nil] animated:YES];
    //找到一个视图的所有子视图  判断是不是UITextField 或者 UITextView
    for (UIView *view in [self allGrandsonViews:self.view] ) {
        //如果是TextField或者TextView
        if ([view isKindOfClass:[UITextField class]]) {
            UITextField *textField = (UITextField *) view;
            textField.inputAccessoryView = itemToolBar;
        }
        else if ([view isKindOfClass:[UITextView class]])
        {
            UITextView *textView = (UITextView *) view;
            textView.inputAccessoryView = itemToolBar;//自定义键盘
        }
    }
}
//获取所有的textField和TextView
-(NSArray *) inputArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
    //根据纵坐标进行排序后的数组
    //    NSMutableArray *SortedArray = [NSMutableArray arrayWithCapacity:10];
    
    for (UIView *aview in [self allGrandsonViews:self.view]) {
        if ([aview isKindOfClass:[UITextView class]]) {
            [array addObject:aview];
        }
        else if ([aview isKindOfClass:[UITextField class]])
        {
            [array addObject:aview];
        }
    }
    //根据纵坐标的位置进行排序(冒泡排序)
    for (int i = 0; i < array.count; i++) {
        for (int j = i + 1 ; j<array.count; j++) {
            //计算纵坐标
            UIView *aview = (UIView *) array[i];
            UIView *bView = (UIView *) array[j];
            CGPoint prePoint  = [aview convertPoint:CGPointMake(0, 0) toView:self.view];
            float pre = prePoint.y;
            CGPoint nextPoint  = [bView convertPoint:CGPointMake(0, 0) toView:self.view];
            float next = nextPoint.y;
            if (pre > next) {
                id tmp = array[i];
                array[i] =  array[j];
                array[j] =  tmp;
            }
        }
    }
    return  array;
}

//前一项
-(void)proviousAction:(id) sender
{
    NSArray *array = [self inputArray];
    for (int i = 0; i< [array count]; i++) {
        UIView *view = array[i];
        if ([view isFirstResponder]) {
            //前一项变成第一相应者
            if (i > 0) {
                int j = i - 1 ;
                [array[j] becomeFirstResponder];
                [self animationView:YES textField:array[j] heightForKeyBorad:(keyBoardHeight.size.height + TOOLHEIGHT)];
            }
        }
    }
}

//后一项
-(void) nextAction:(id) sender
{
    NSArray *array = [self inputArray];
    for (int i = 0; i< [array count]; i++) {
        UIView *view = array[i];
        if ([view isFirstResponder]) {
            //前一项变成第一相应真
            if (i < ([array count] - 1)) {
                int j = i + 1 ;
                [array[j] becomeFirstResponder];
                [self animationView:YES textField:array[j] heightForKeyBorad:(keyBoardHeight.size.height + TOOLHEIGHT)];
                break;
            }
            
        }
    }
    
}
//找出所有的subview
-(NSArray *) allGrandsonViews:(UIView *)theView
{
    NSArray *results  = [theView subviews];
    for (UIView *eachView in results) {
        NSArray *riz = [self allGrandsonViews:eachView];
        if (riz) {
            results = [results arrayByAddingObjectsFromArray:riz];
        }
    }
    return   results;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)closekeyBoard
{
    //关闭键盘
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}
#pragma mark ----点击空白处 隐藏键盘
-(void)setRegistManager:(BOOL)registManager
{
    _registManager =  registManager;
    if (_registManager == YES) {
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closekeyBoard)];
        //创建一个线程池
        NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserverForName:UIKeyboardWillShowNotification object:nil queue:mainQueue usingBlock:^(NSNotification *note) {
            [self.view addGestureRecognizer:tap];
        }];
        [nc addObserverForName:UIKeyboardWillHideNotification object:nil queue:mainQueue usingBlock:^(NSNotification *note) {
            [self.view removeGestureRecognizer:tap];
        }];
    }
}
//监听键盘隐藏和显示事件
- (void)addKeyBoardNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShowOrHide:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShowOrHide:) name:UIKeyboardWillHideNotification object:nil];
}
-(void) keyboardWillShowOrHide:(NSNotification *)notification
{
    
    
    BOOL show = [[notification name] isEqualToString:UIKeyboardWillShowNotification]?YES:NO;
    //找到当前获取焦点的控件
    NSValue *keyBoardValue = [[notification userInfo] objectForKey:UIKeyboardBoundsUserInfoKey];
    [keyBoardValue getValue:&keyBoardHeight];
    //    [itemToolBar.items[1] setEnabled:YES];
    //    [itemToolBar.items[0] setEnabled:YES];
    if ([self firstResponder]) {
        //        NSUInteger index = [[self inputArray] indexOfObject:[self firstResponder]];
        
        //        if (index == 0) {
        //            [itemToolBar.items[1] setEnabled:YES];
        //            [itemToolBar.items[0] setEnabled:NO];
        //        }
        //       else if (index == [[self inputArray] count] -1) {
        //            [itemToolBar.items[1] setEnabled:NO];
        //            [itemToolBar.items[0] setEnabled:YES];
        //        }
        
        //移动视图
        [ self animationView:show textField:[self firstResponder] heightForKeyBorad:keyBoardHeight.size.height + TOOLHEIGHT];
    }
}
//视图移动
-(void) animationView:(BOOL) show textField:(id) textField heightForKeyBorad:(CGFloat) keyBoard
{
    CGRect rect  = self.view.frame;
    [UIView beginAnimations:@"keyBoardManager" context:nil];
    [UIView setAnimationDuration:0.3];
    if (show) {
        if ([textField isKindOfClass:[UITextField class]] || [textField isKindOfClass:[UITextView class]]) {
            UITextField *filed ;
            UITextView  *textView ;
            CGPoint textPoint ;
            if ([textField isKindOfClass:[UITextField class]]) {
                filed = (UITextField *) textField;
                textPoint = [filed convertPoint:CGPointMake(0, filed.frame.size.height ) toView:self.view];
                
            }
            else
            {
                textView = (UITextView *) textField;
                textPoint = [textView convertPoint:CGPointMake(0, textView.frame.size.height ) toView:self.view];
                
            }
            //如果控件高度加上键盘的高度 超出了self.view的高度
            if (rect.size.height - textPoint.y < keyBoard)
            {
                rect.origin.y = rect.size.height - textPoint.y - keyBoard;
                self.view.frame  = rect;
            }
            else
            {
                rect.origin.y = 64;
                self.view.frame = rect;
            }
        }
        
    }
    else
    {
        rect.origin.y = 64;
        self.view.frame = rect;
    }
    [UIView commitAnimations];//提交动画
    
}
- (id)firstResponder
{
    for (id aview in [self allGrandsonViews:self.view]) {
        if ([aview isKindOfClass:[UITextField class]] && [(UITextField *)aview isFirstResponder]) {
            return (UITextField *)aview;
        }
        else if ([aview isKindOfClass:[UITextView class]] && [(UITextView *)aview isFirstResponder]) {
            return (UITextView *)aview;
        }
    }
    return NO;
}
#pragma mark - LoadingView

//- (void)addLoadingView
//{
//    
//    _loadingView = [[SCLoadingView alloc] initWithFrame:CGRectMake(0,0, ScreenWidth, ScreenHeight)];
//    [self.view addSubview:_loadingView];
//    [_loadingView startAnimating];
//    
//}
//
//- (void)removeLoadingView
//{
//    dispatch_async(dispatch_get_main_queue(), ^{
//        if (_loadingView != nil)
//        {
//            [UIView animateWithDuration:0.01f animations:^{
//                _loadingView.alpha = 0;
//                
//            } completion:^(BOOL completed) {
//                _loadingView = nil;
//                [_loadingView stopAnimating];
//                [_loadingView removeFromSuperview];
//            }];
//        }
//        
//    });
//    //    NSLog(@"over");
//}

//-(void)addRequestFailedView
//{
//    //if (!_loadingView) {
//    _loadingView = [[SCLoadingView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
//    [self.view addSubview:_loadingView];
//    [_loadingView stopAnimatingWithRequestFailed];
//    //}
//    NSLog(@"2");
//
//}
#pragma mark  ---- Drawer   ----
//添加一个控制器(实际添加的是控制器的 view),第一个参数是视图生成时的位置,第二个参数是视图最终出现的位置
-(void)addChildViewWithController:(UIViewController *)childController fromBeganFrame:(CGRect)beganFrame toAppearFrame:(CGRect)appearFrame
{
    //定义所添加视图的初始位置
    childController.view.frame = beganFrame;
    //定义 dimissCenter ,作为未来视图消失的位置
    dimissCenter = childController.view.center;
    //添加子视图
    [self.view addSubview:childController.view];
    //利用动画平移效果,使子视图从初始位置平移到我们需要他出现的最终位置
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        childController.view.frame = appearFrame;
        //当子视图到达最终位置时,获取其中心点,作为平移手势的起始点
        startCenter = childController.view.center;
    } completion:nil];
}
//为新增视图添加平移手势以及相关事件
-(void)addPanRecognizerOnTheChildView:(UIView *)childView action:(SEL)sel
{
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:sel];
    [childView addGestureRecognizer:panRecognizer];
}
////实现该视图上手势触发的事件
-(void)panGestureRecognizerAction:(UIPanGestureRecognizer *)pan onTheChildView:(UIView *)childView
{
    {
        //当平移手势运行中,我们需要做的事情
        if (pan.state == UIGestureRecognizerStateChanged) {
            CGPoint dPoint = [pan translationInView:childView];
            //通过定义子视图中心点的方式确保视图在水平方向上移动
            childView.center = CGPointMake(childView.center.x, childView.center.y+dPoint.y);
            //通过判断中心点坐标,确保子视图在规定范围内移动
            if (childView.center.y < startCenter.y) {
                childView.center = startCenter;
            }
            [pan setTranslation:CGPointZero inView:childView];
        }
        //当平移手势结束时,我们需要做的事情
        if (pan.state == UIGestureRecognizerStateEnded) {
            //如果子视图中心点 x 坐标 小于父视图的右边界,则让子视图回弹到 startcenter 的位置(即出现位置)
            if (childView.center.y < self.view.bounds.size.height) {
                [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
                    childView.center = startCenter;
                } completion:nil];
            }else{
                //反之,中心点坐标超过父视图右边界,则让子视图消失
                [UIView animateWithDuration:0.5 animations:^{
                    childView.center = dimissCenter;
                    [[NSNotificationCenter defaultCenter]postNotificationName:@"removeBackGroundOfBlack" object:nil];
                } completion:^(BOOL finished) {
                    [childView removeFromSuperview];
                }];
            }
        }
    }
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
