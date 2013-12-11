//
//  BranchNaviViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-10.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "BranchNaviViewController.h"
#import "BranchNaviControl.h"

@interface BranchNaviViewController ()

@property (nonatomic, strong)BranchNaviControl *naviControl;

@end

@implementation BranchNaviViewController

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

////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - 网络相关

////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)setupHttpQueue
{
    self.naviControl = [[BranchNaviControl alloc] init];
    [[ITSTransManager defaultManager] add:self.naviControl];
}

- (void)destoryHttpQueue
{
    if (self.naviControl)
        [[ITSTransManager defaultManager] remove:self.naviControl];
    self.naviControl = nil;
}

@end
