//
//  ContainViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-9.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "ContainViewController.h"

#import "OnlineViewController.h"
#import "ProductViewController.h"
#import "AroundViewController.h"
#import "PersonCenterViewController.h"

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
    self.selectedIndex = [self.itemIndex integerValue];
    [self initViewControllers];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initViewControllers
{
    UINavigationController *viewController1 = self.viewControllers[0];
    UINavigationController *viewController2 = self.viewControllers[1];
    UINavigationController *viewController3 = self.viewControllers[2];
    UINavigationController *viewController4 = self.viewControllers[3];
    
    ((OnlineViewController *)viewController1.topViewController).containDelegate = self;
    ((ProductViewController *)viewController2.topViewController).containDelegate = self;
    ((AroundViewController *)viewController3.topViewController).containDelegate = self;
    ((PersonCenterViewController *)viewController4.topViewController).containDelegate = self;
}

///////////////////////////////////////////////////////////////////////////////////////

#pragma mark - contain delegate

///////////////////////////////////////////////////////////////////////////////////////

-(void)closeContainer
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

@end
