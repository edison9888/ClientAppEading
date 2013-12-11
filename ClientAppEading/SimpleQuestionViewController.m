//
//  SimpleQuestionViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-10.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "SimpleQuestionViewController.h"
#import "SimpleQuestionControl.h"

@interface SimpleQuestionViewController ()

@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, strong) SimpleQuestionControl *questionControl;

@end

@implementation SimpleQuestionViewController

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
    // Dispose of any resources that can be recreated.
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
    static NSString *CellIdentifier = @"simpleQuestionCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self.datasource objectAtIndex:indexPath.row];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.level.intValue >= 3) {
        [self performSegueWithIdentifier:@"showSimpleAnswer" sender:[tableView cellForRowAtIndexPath:indexPath]];
    }
    else {
        
        // 创建重复界面
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SimpleQuestionViewController *questionController = [storyboard instantiateViewControllerWithIdentifier:@"simpleQuestionViewController"];
        questionController.level = [NSNumber numberWithInt:self.level.intValue + 1];
        [self.navigationController pushViewController:questionController animated:YES];
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - search delegate

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self performSegueWithIdentifier:@"showSearchQuestion" sender:searchBar];
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
    self.questionControl = [[SimpleQuestionControl alloc] init];
    [[ITSTransManager defaultManager] add:self.questionControl];
}

- (void)destoryHttpQueue
{
    if (self.questionControl)
        [[ITSTransManager defaultManager] remove:self.questionControl];
    self.questionControl = nil;
}

@end
