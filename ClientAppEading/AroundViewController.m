//
//  AroundViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-9.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "AroundViewController.h"
#import "TSLocationManagerDelegate.h"
#import "TSLocationManager.h"

#import "AroundControl.h"

@interface AroundViewController () <TSLocationManagerDelegate>

// 位置管理器
@property (nonatomic, strong) TSLocationManager *locationManager;
// 是否震动
@property (nonatomic, assign) BOOL isShake;
// 数据源
@property (nonatomic, strong) NSMutableArray *datasource;
// 网络控制
@property (nonatomic, strong) AroundControl *aroundControl;

@end

@implementation AroundViewController

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
        
    if ([TSLocationManager locationServicesEnabled]) {
    
        self.locationManager = [[TSLocationManager alloc] init];
        self.locationManager.delegate = self;
        [self.locationManager startUpdatingLocation];
    }
    else {
    
        
    }
    
    [self testData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self becomeFirstResponder];
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

#pragma mark - 位置管理

-(void)locationManager:(TSLocationManager *)manager didUpdateLocation:(CLLocation *)location
{
    
}

-(void)locationManager:(TSLocationManager *)manager didFailWithError:(NSError *)error
{
    
}

#pragma mark - 摇一摇

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"begin");
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"end");
    if (motion == UIEventSubtypeMotionShake && self.isShake == NO) {
        
        //TODO 执行摇动查询方法
        self.isShake = YES;
    }
}

-(BOOL)canBecomeFirstResponder
{
    return YES;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - tableView delegate

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datasource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"aroundCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self.datasource objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"showAroundList" sender:[tableView cellForRowAtIndexPath:indexPath]];
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - action

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

-(void)backButtonClicked:(id)sender
{
    [self.containDelegate closeContainer];
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - 测试数据

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)testData
{
    NSString *str = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    self.datasource = [[NSMutableArray alloc] init];
    for (int i = 0; i < str.length; i++) {
        [self.datasource addObject:[str substringWithRange:NSMakeRange(i, 1)]];
    }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - 网络相关

////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)setupHttpQueue
{
    self.aroundControl = [[AroundControl alloc] init];
    [[ITSTransManager defaultManager] add:self.aroundControl];
}

- (void)destoryHttpQueue
{
    if (self.aroundControl)
        [[ITSTransManager defaultManager] remove:self.aroundControl];
    self.aroundControl = nil;
}

@end
