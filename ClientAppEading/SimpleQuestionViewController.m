//
//  SimpleQuestionViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-10.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "SimpleQuestionViewController.h"

@interface SimpleQuestionViewController ()

@property (nonatomic, strong) NSMutableArray *datasource;

@end

@implementation SimpleQuestionViewController

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

    [self testData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
