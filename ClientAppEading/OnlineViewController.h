//
//  OnlineViewController.h
//  ClientAppEading
//
//  Created by xukj on 13-12-10.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContainDelegate.h"

@interface OnlineViewController : UITableViewController

@property (nonatomic, assign) id<ContainDelegate>containDelegate;

-(IBAction)backButtonClicked:(id)sender;

@end
