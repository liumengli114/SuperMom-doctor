//
//  UserManager.m
//  Dayo
//
//  Created by 杨志超 on 15/1/28.
//  Copyright (c) 2015年 杨志超. All rights reserved.
//

#import "UserManager.h"

static UserManager *userManager = nil;
@implementation UserManager

+(UserManager *)shareInstance
{
    if (userManager == nil) {
        userManager = [[UserManager alloc]init];
    }
    return userManager;
}
+(void)cleanUp
{
    userManager = nil;
}
-(void)setUserObject:(id)userObject forkey:(NSString *)key
{
    NSUserDefaults *userDefaults =[NSUserDefaults standardUserDefaults];
    if ([userObject isKindOfClass:[NSNull class]]) {
        return;
    }
    [userDefaults setObject:userObject forKey:key];
    [userDefaults synchronize];
}
-(id)getUserObjectForkey:(NSString *)key
{
     NSUserDefaults *userDefaults =[NSUserDefaults standardUserDefaults];
    NSString * object = [userDefaults objectForKey:key];
    [userDefaults synchronize];
    return object;
}
-(void)setLoginState:(BOOL)isLogin
{
    [[NSUserDefaults standardUserDefaults] setBool:isLogin forKey:kLoginState];

}
@end
