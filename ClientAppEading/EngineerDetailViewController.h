//
//  EngineerDetailViewController.h
//  ClientAppEading
//
//  Created by xukj on 13-12-10.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface EngineerDetailViewController : BaseViewController

@property (nonatomic, assign)IBOutlet UIImageView *headImageView;
@property (nonatomic, assign)IBOutlet UILabel *nameLabel;
@property (nonatomic, assign)IBOutlet UILabel *stateLabel;
@property (nonatomic, assign)IBOutlet UITextView *detailTextView;
@property (nonatomic, assign)IBOutlet UIButton *branchButton;
@property (nonatomic, assign)IBOutlet UIButton *productButton;
@property (nonatomic, assign)IBOutlet UIButton *phoneButton;

-(IBAction)branchButtonClicked:(id)sender;
-(IBAction)productButtonClicked:(id)sender;
-(IBAction)phoneButtonClicked:(id)sender;

@end
