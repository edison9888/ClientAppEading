//
//  AroundListViewController.h
//  ClientAppEading
//
//  Created by xukj on 13-12-10.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface AroundListViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign)IBOutlet UITableView *tableView;
@property (nonatomic, assign)IBOutlet UISegmentedControl *segmentControl;

-(IBAction)changeSegment:(id)sender;

@end
