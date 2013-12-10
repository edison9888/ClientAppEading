//
//  AroundMapViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-10.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "AroundMapViewController.h"

@interface AroundMapViewController ()

@end

@implementation AroundMapViewController

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
    [self initViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - view

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

-(void)initViews
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(showList:)];
    self.navigationItem.rightBarButtonItem = item;
}

-(void)showList:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

@end
