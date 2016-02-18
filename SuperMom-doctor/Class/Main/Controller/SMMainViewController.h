//
//  SMMainViewController.h
//  SuperMom-doctor
//
//  Created by Air on 15/12/10.
//  Copyright (c) 2015年 super-Yang. All rights reserved.
//

#import "SMBaseViewController.h"

typedef NS_ENUM(NSUInteger, Direction){
    left = 0,
    right,
    down
    
};


@interface SMMainViewController : SMBaseViewController
@property(nonatomic,assign)Direction direction;
@end
