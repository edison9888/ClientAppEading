//
//  SimpleAnswerViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-10.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "SimpleAnswerViewController.h"
#import "SimpleAnswerControl.h"

@interface SimpleAnswerViewController ()

@property (nonatomic, strong) SimpleAnswerControl *answerControl;

@end

@implementation SimpleAnswerViewController

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
    self.answerControl = [[SimpleAnswerControl alloc] init];
    [[ITSTransManager defaultManager] add:self.answerControl];
}

- (void)destoryHttpQueue
{
    if (self.answerControl)
        [[ITSTransManager defaultManager] remove:self.answerControl];
    self.answerControl = nil;
}

@end
