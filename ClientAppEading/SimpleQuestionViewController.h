//
//  SimpleQuestionViewController.h
//  ClientAppEading
//
//  Created by xukj on 13-12-10.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface SimpleQuestionViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, assign) IBOutlet UITableView *tableView;
@property (nonatomic, assign) IBOutlet UISearchBar *searchBar;

@property (nonatomic, strong) NSNumber *level;

@end
