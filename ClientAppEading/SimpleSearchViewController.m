//
//  SimpleSearchViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-11.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "SimpleSearchViewController.h"
#import "MJRefresh/MJRefresh.h"
#import "SimpleSearchControl.h"

@interface SimpleSearchViewController ()<MJRefreshBaseViewDelegate>

@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, strong) MJRefreshFooterView *footerView;
@property (nonatomic, strong) SimpleSearchControl *searchControl;

@end

@implementation SimpleSearchViewController

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
    [self initViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    [self.footerView free];
    [self destoryHttpQueue];
}

- (void)initViews
{
    self.footerView = [[MJRefreshFooterView alloc] init];
    self.footerView.delegate = self;
    self.footerView.scrollView = self.tableView;
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - tableView delegate

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    [self.footerView endRefreshing];
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datasource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"searchQuestionCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self.datasource objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"searchShowSimpleAnswer" sender:[tableView cellForRowAtIndexPath:indexPath]];
}

#pragma mark - refresh delegate

-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    if (refreshView == self.footerView) {
        
        [self loadMore];
    }
}

-(void)loadMore
{
    //查看更多数据
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
    self.searchControl = [[SimpleSearchControl alloc] init];
    [[ITSTransManager defaultManager] add:self.searchControl];
}

- (void)destoryHttpQueue
{
    if (self.searchControl)
        [[ITSTransManager defaultManager] remove:self.searchControl];
    self.searchControl = nil;
}

@end
