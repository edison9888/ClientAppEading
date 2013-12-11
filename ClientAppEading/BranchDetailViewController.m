//
//  BranchDetailViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-10.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "BranchDetailViewController.h"
#import "BranchDetailControl.h"

@interface BranchDetailViewController ()

@property (nonatomic, strong) BranchDetailControl *detailControl;

@end

@implementation BranchDetailViewController

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupHttpQueue];
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

-(void)dealloc
{
    [self destoryHttpQueue];
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

////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - 网络相关

////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)setupHttpQueue
{
    self.detailControl = [[BranchDetailControl alloc] init];
    [[ITSTransManager defaultManager] add:self.detailControl];
}

- (void)destoryHttpQueue
{
    if (self.detailControl)
        [[ITSTransManager defaultManager] remove:self.detailControl];
    self.detailControl = nil;
}

@end
