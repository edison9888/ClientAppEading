//
//  ProductDetailViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-10.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "ProductDetailViewController.h"
#import "ProductDetailControl.h"

@interface ProductDetailViewController ()

@property (nonatomic, strong)ProductDetailControl *detailControl;

@end

@implementation ProductDetailViewController

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
    self.detailControl = [[ProductDetailControl alloc] init];
    [[ITSTransManager defaultManager] add:self.detailControl];
}

- (void)destoryHttpQueue
{
    if (self.detailControl)
        [[ITSTransManager defaultManager] remove:self.detailControl];
    self.detailControl = nil;
}

@end
