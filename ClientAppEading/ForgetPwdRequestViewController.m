//
//  ForgetPwdRequestViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-11.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "ForgetPwdRequestViewController.h"

@interface ForgetPwdRequestViewController ()

@end

@implementation ForgetPwdRequestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - action

/////////////////////////////////////////////////////////////////////////////////////////////////////////

-(void)sendButtonClicked:(id)sender
{
    [self performSegueWithIdentifier:@"forgetVerify" sender:sender];
}

@end
