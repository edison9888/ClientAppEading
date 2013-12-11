//
//  ViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-9.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self showLoginViewController];

}

- (void)viewDidAppear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender == nil) {
    
    }
    else if ([sender isKindOfClass:[UIButton class]]) {
        NSNumber *index = [NSNumber numberWithInteger:((UIButton *)sender).tag];
        UIViewController *send = segue.destinationViewController;
        if ([send respondsToSelector:@selector(setItemIndex:)]) {
            [send setValue:index forKey:@"itemIndex"];
        }
    }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - action

/////////////////////////////////////////////////////////////////////////////////////////////////////////

-(void)showViewController:(id)sender
{
    [self performSegueWithIdentifier:@"menu" sender:sender];
}

-(void)showLoginViewController
{
    [self performSegueWithIdentifier:@"login" sender:nil];
}

@end
