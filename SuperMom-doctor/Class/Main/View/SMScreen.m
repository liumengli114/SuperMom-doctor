//
//  SMScreen.m
//  SuperMom-doctor
//
//  Created by Air on 15/12/11.
//  Copyright (c) 2015年 super-Yang. All rights reserved.
//

#import "SMScreen.h"

@implementation SMScreen

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
    _trianglesImage = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width - 20)/2, self.frame.size.height-15, 20, 15)];
    _trianglesImage.contentMode = UIViewContentModeScaleAspectFit;
    _trianglesImage.image = [UIImage imageNamed:@"triangleDescending"];
    [self addSubview:_trianglesImage];
    
}
-(void)setTitle:(NSString *)title textColor:(UIColor *)textColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor target:(id)target action:(SEL)action
{
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:textColor forState:UIControlStateNormal];
    self.titleLabel.font = font;
    self.backgroundColor = backgroundColor;
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];

}
@end
