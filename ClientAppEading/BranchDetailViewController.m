//
//  BranchDetailViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-10.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "BranchDetailViewController.h"

@interface BranchDetailViewController ()

@end

@implementation BranchDetailViewController

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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - action

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

-(void)locationButtonClicked:(id)sender
{
    [self performSegueWithIdentifier:@"branchShowNavi" sender:sender];
}

-(void)engineerButtonClicked:(id)sender
{
    [self performSegueWithIdentifier:@"branchShowEngineerList" sender:sender];
}

-(void)productButtonClicked:(id)sender
{
    [self performSegueWithIdentifier:@"branchShowProduct" sender:sender];
}

-(void)phoneButtonClicked:(id)sender
{
    
}

@end
