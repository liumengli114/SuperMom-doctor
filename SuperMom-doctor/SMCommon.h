//
//  SMCommon.h
//  SuperMom-doctor
//
//  Created by Air on 15/12/10.
//  Copyright (c) 2015年 super-Yang. All rights reserved.
//

#ifndef SuperMom_doctor_SMCommon_h
#define SuperMom_doctor_SMCommon_h

//------------------手机系统版本--------------------------------------------
//获取当前设备系统版本
#define SystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]
//判断是否是IOS7
#define IOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
//判断是否是IOS8
#define IOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)
#define UM_IOS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define UM_IOS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define UM_IOS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
//------------4s,5,6,6+屏幕尺寸--------------------------------------------
//适配
#define CGRECT_NO_NAV(x,y,w,h) CGRectMake((x), (y+(IsIOS7?20:0)), (w), (h))
#define CGRECT_HAVE_NAV(x,y,w,h) CGRectMake((x), (y+(IsIOS7?64:0)), (w), (h))
//
#define ScreenSize ScreenSize [[UIScreen mainScreen] bounds]
//获取设备物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//获取设备物理宽度
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
//设配屏幕物理高度
#define isiPhone6p  736
#define isiPhone6    667
#define isiPhone5    568
#define isiPhone4s  480


//-----------color---------------------------------------------------------
#define coloWithREAD_GREEN_BLUE(r,g,b)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define kUIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//获取AppDelegate的代理方法
#define APPDEL (AppDelegate *)[[UIApplication sharedApplication] delegate]

#define iPhone5 ([[UIScreen mainScreen] bounds].size.height)==568
#define iPhone4 ([[UIScreen mainScreen] bounds].size.height)==480
#define iPhone6 ([[UIScreen mainScreen] bounds].size.height)==667
#define iPhone6Plus ([[UIScreen mainScreen] bounds].size.height)==736


#define kSpace  20
#define kDoubleSpace  40
#define kScreenScale                ([UIScreen instancesRespondToSelector:@selector(scale)]?[[UIScreen mainScreen] scale]:(1.0f))
#define kScreenIs35InchRetina       (([UIScreen mainScreen].scale == 2.0f) && (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(320.0f, 480.0f))))
#define kScreenIs4InchRetina        (([UIScreen mainScreen].scale == 2.0f) && (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(320.0f, 568.0f))))
#define kScreenIs47InchRetina       (([UIScreen mainScreen].scale == 2.0f) && (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(375.0f, 667.0f))))
#define kScreenIs55InchRetinaHD     (([UIScreen mainScreen].scale == 3.0f) && (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(414.0f, 736.0f))))

#endif
