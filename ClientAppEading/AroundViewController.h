//
//  AroundViewController.h
//  ClientAppEading
//
//  Created by xukj on 13-12-9.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface AroundViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) IBOutlet UIButton *distanceButton;
@property (nonatomic, assign) IBOutlet UITableView *tableView;

@property (nonatomic, assign) IBOutlet UIView *personView;
@property (nonatomic, assign) IBOutlet UIView *defaultView;
@property (nonatomic, assign) IBOutlet UIView *resultView;

@end
