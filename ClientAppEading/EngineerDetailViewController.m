//
//  EngineerDetailViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-10.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "EngineerDetailViewController.h"
#import "EngineerDetailControl.h"

@interface EngineerDetailViewController ()

@property (nonatomic, strong) EngineerDetailControl *detailControl;

@end

@implementation EngineerDetailViewController

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

////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - 网络相关

////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)setupHttpQueue
{
    self.detailControl = [[EngineerDetailControl alloc] init];
    [[ITSTransManager defaultManager] add:self.detailControl];
}

- (void)destoryHttpQueue
{
    if (self.detailControl)
        [[ITSTransManager defaultManager] remove:self.detailControl];
    self.detailControl = nil;
}

@end
