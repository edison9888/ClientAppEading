//
//  LoginViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-11.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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

-(void)loginButtonClicked:(id)sender
{
    
}

-(void)registerButtonClicked:(id)sender
{
    [self performSegueWithIdentifier:@"register" sender:sender];
}

-(void)forgetButtonClicked:(id)sender
{
    [self performSegueWithIdentifier:@"forget" sender:sender];
}

-(void)testButtonClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

@end
