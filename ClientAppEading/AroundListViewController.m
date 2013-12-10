//
//  AroundListViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-10.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "AroundListViewController.h"

@interface AroundListViewController ()

@property (nonatomic, strong) NSMutableArray *datasourceOne;
@property (nonatomic, strong) NSMutableArray *datasourceTwo;

@end

@implementation AroundListViewController

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
    [self testData];
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
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"map"] style:UIBarButtonItemStylePlain target:self action:@selector(showMap:)];
    self.navigationItem.rightBarButtonItem = item;
}

-(void)showMap:(id)sender
{
    [self performSegueWithIdentifier:@"showAroundMap" sender:sender];
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - public method

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

-(void)changeSegment:(id)sender
{
    [self.tableView reloadData];
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
    if (self.segmentControl.selectedSegmentIndex == 0) {
        return self.datasourceOne.count;
    }
    else {
        return self.datasourceTwo.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    // Configure the cell...
    if (self.segmentControl.selectedSegmentIndex == 0) {
        NSString *CellIdentifier = @"engineerCell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        cell.textLabel.text = [self.datasourceOne objectAtIndex:indexPath.row];
    }
    else {
        NSString *CellIdentifier = @"branchCell";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        cell.textLabel.text = [self.datasourceTwo objectAtIndex:indexPath.row];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Configure the cell...
    if (self.segmentControl.selectedSegmentIndex == 0) {
        [self performSegueWithIdentifier:@"listShowEngineer" sender:[tableView cellForRowAtIndexPath:indexPath]];
    }
    else {
        [self performSegueWithIdentifier:@"listShowBranch" sender:[tableView cellForRowAtIndexPath:indexPath]];
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - 测试数据

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)testData
{
    NSString *str = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    
    self.datasourceOne = [[NSMutableArray alloc] init];
    for (int i = 0; i < str.length; i++) {
        [self.datasourceOne addObject:[str substringWithRange:NSMakeRange(i, 1)]];
    }
    
    self.datasourceTwo = [[NSMutableArray alloc] init];
    for (int i = str.length - 1; i >= 0; i--) {
        [self.datasourceTwo addObject:[str substringWithRange:NSMakeRange(i, 1)]];
    }
}

@end
