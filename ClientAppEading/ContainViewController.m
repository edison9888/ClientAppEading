//
//  ContainViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-9.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "ContainViewController.h"

@interface ContainViewController ()

@end

@implementation ContainViewController

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
    self.navigationController.navigationBarHidden = YES;
//    
//    self.navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 20, 320, 44)];
//    UILabel *labelText = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 100, 44)];
//    labelText.text = @"hehe";
//    [self.navigationBar addSubview:labelText];
//    [self.view addSubview:self.navigationBar];
    
    self.selectedIndex = [self.itemIndex integerValue];
//    NSLog(@"%d", [self.itemIndex intValue]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
