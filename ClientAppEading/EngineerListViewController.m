//
//  EngineerListViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-10.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "EngineerListViewController.h"
#import "EngineerListControl.h"

@interface EngineerListViewController ()

@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, strong) EngineerListControl *engineerListControl;

@end

@implementation EngineerListViewController

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
    [self testData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)dealloc
{
    [self destoryHttpQueue];
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
    static NSString *CellIdentifier = @"engineerListCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self.datasource objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"engineerListShowEngineer" sender:[tableView cellForRowAtIndexPath:indexPath]];
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
    self.engineerListControl = [[EngineerListControl alloc] init];
    [[ITSTransManager defaultManager] add:self.engineerListControl];
}

- (void)destoryHttpQueue
{
    if (self.engineerListControl)
        [[ITSTransManager defaultManager] remove:self.engineerListControl];
    self.engineerListControl = nil;
}

@end
