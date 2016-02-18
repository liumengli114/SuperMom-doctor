//
//  UserManager.h
//  Dayo
//
//  Created by 杨志超 on 15/1/28.
//  Copyright (c) 2015年 杨志超. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kLoginState @"loginState"
#define kUsername  @"loginName"
#define kPassword  @"password"
@interface UserManager : NSObject


+(UserManager *)shareInstance;
+(void)cleanUp;
//保存用户基本信息
- (void)setLoginState:(BOOL)isLogin;
- (void)setUserObject:(id)userObject forkey:(NSString *)key;
- (id)getUserObjectForkey:(NSString *)key;
@end
