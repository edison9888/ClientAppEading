//
//  BranchDetailViewController.h
//  ClientAppEading
//
//  Created by xukj on 13-12-10.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface BranchDetailViewController : BaseViewController

@property (nonatomic, assign)IBOutlet UILabel *nameLabel;
@property (nonatomic, assign)IBOutlet UIButton *locationButton;
@property (nonatomic, assign)IBOutlet UIButton *engineerButton;
@property (nonatomic, assign)IBOutlet UIButton *productButton;
@property (nonatomic, assign)IBOutlet UIButton *phoneButton;

-(IBAction)locationButtonClicked:(id)sender;
-(IBAction)engineerButtonClicked:(id)sender;
-(IBAction)productButtonClicked:(id)sender;
-(IBAction)phoneButtonClicked:(id)sender;

@end
