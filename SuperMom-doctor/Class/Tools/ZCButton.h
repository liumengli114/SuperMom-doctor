//
//  ZCButton.h
//  SuperMom-doctor
//
//  Created by Air on 15/12/11.
//  Copyright (c) 2015年 super-Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ZCButton : UIButton
@property(nonatomic,strong)UILabel *TitleLabel;
@property(nonatomic,strong)UILabel *valueLabel;

- (void)setTextColor:(UIColor *)textColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor target:(id)target action:(SEL)action;

@end
