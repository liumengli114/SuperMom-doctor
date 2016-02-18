//
//  ZCButton.m
//  SuperMom-doctor
//
//  Created by Air on 15/12/11.
//  Copyright (c) 2015年 super-Yang. All rights reserved.
//

#import "ZCButton.h"

@implementation ZCButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initMainButton];
        
    }
    return self;
}
- (void)initMainButton
{
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 2;
    
    _TitleLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width - MMHFloat(100))/2, (self.frame.size.height - MMHFloat(60))/2, MMHFloat(100), MMHFloat(30))];
    [self addSubview:_TitleLabel];
    
    _valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(_TitleLabel.frame), CGRectGetMaxY(_TitleLabel.frame)-5, MMHFloat(100), MMHFloat(70) - MMHFloat(30))];

    [self addSubview:_valueLabel];

}
-(void)setTextColor:(UIColor *)textColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor target:(id)target action:(SEL)action
{
    _TitleLabel.textColor = textColor;
    _TitleLabel.font = font;
    _TitleLabel.textAlignment = NSTextAlignmentCenter;
    _valueLabel.textColor = textColor;
    _valueLabel.font = font;
    _valueLabel.textAlignment = NSTextAlignmentCenter;
    self.backgroundColor = backgroundColor;
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}
@end
