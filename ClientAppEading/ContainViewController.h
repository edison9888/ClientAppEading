//
//  ContainViewController.h
//  ClientAppEading
//
//  Created by xukj on 13-12-9.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContainDelegate.h"

@interface ContainViewController : UITabBarController<ContainDelegate>

@property (nonatomic, strong) NSNumber *itemIndex;

@end
