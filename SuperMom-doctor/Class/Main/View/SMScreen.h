//
//  SMScreen.h
//  SuperMom-doctor
//
//  Created by Air on 15/12/11.
//  Copyright (c) 2015年 super-Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMScreen : UIButton
@property(nonatomic,strong)UIImageView *trianglesImage;


-(void)setTitle:(NSString *)title textColor:(UIColor *)textColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor target:(id)target action:(SEL)action;
@end
