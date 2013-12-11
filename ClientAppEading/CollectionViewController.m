//
//  CollectionViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-9.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "CollectionViewController.h"
#import "MJRefresh/MJRefresh.h"
#import "CollectionControl.h"

@interface CollectionViewController () <MJRefreshBaseViewDelegate>

@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, strong) MJRefreshFooterView *footerView;
@property (nonatomic, strong) CollectionControl *collectionControl;

@end

@implementation CollectionViewController

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
    static NSString *CellIdentifier = @"collectionCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self.datasource objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"collectionShowProduct" sender:[tableView cellForRowAtIndexPath:indexPath]];
}

#pragma refresh delegate

-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    if (refreshView == self.footerView) {
        
        [self loadMore];
    }
}

-(void)loadMore
{
    
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
    self.collectionControl = [[CollectionControl alloc] init];
    [[ITSTransManager defaultManager] add:self.collectionControl];
}

- (void)destoryHttpQueue
{
    if (self.collectionControl)
        [[ITSTransManager defaultManager] remove:self.collectionControl];
    self.collectionControl = nil;
}

@end
