//
//  EngineerDetailViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-10.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "EngineerDetailViewController.h"

@interface EngineerDetailViewController ()

@end

@implementation EngineerDetailViewController

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

-(void)branchButtonClicked:(id)sender
{
    [self performSegueWithIdentifier:@"engineerShowBranch" sender:sender];
}

-(void)productButtonClicked:(id)sender
{
    [self performSegueWithIdentifier:@"engineerShowProduct" sender:sender];
}

-(void)phoneButtonClicked:(id)sender
{

}

@end
