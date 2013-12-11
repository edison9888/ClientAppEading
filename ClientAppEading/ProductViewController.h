//
//  ProductViewController.h
//  ClientAppEading
//
//  Created by xukj on 13-12-9.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "ContainDelegate.h"

@interface ProductViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (nonatomic, assign) id<ContainDelegate>containDelegate;

@property (nonatomic, assign) IBOutlet UITableView *tableView;
@property (nonatomic, assign) IBOutlet UISearchBar *searchBar;

@property (nonatomic, strong) NSNumber *level;

//-(IBAction)backButtonClicked:(id)sender;

@end
