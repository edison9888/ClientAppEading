//
//  ProductViewController.m
//  ClientAppEading
//
//  Created by xukj on 13-12-9.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "ProductViewController.h"
#import "ProductControl.h"

@interface ProductViewController ()

@property (nonatomic, strong) NSMutableArray *datasource;
@property (nonatomic, strong) ProductControl *productControl;

@end

@implementation ProductViewController

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
    [self destoryHttpQueue];
}

-(void)initViews
{
    if (self.level.intValue == 0) {
        
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        backButton.frame = CGRectMake(5, 0, 71, 44);
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        self.navigationItem.leftBarButtonItem = backItem;
    }
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
    static NSString *CellIdentifier = @"productCategoryCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self.datasource objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.level.intValue >= 3) {
        [self performSegueWithIdentifier:@"categoryShowProduct" sender:[tableView cellForRowAtIndexPath:indexPath]];
    }
    else {
        
        // 创建重复界面
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ProductViewController *questionController = [storyboard instantiateViewControllerWithIdentifier:@"productViewController"];
        
        if (self.level.intValue == 2) {
            questionController.title = @"服务列表";
        }
        questionController.level = [NSNumber numberWithInt:self.level.intValue + 1];
        [self.navigationController pushViewController:questionController animated:YES];
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - search delegate

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self performSegueWithIdentifier:@"categorySearchProduct" sender:searchBar];
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
    self.productControl = [[ProductControl alloc] init];
    [[ITSTransManager defaultManager] add:self.productControl];
}

- (void)destoryHttpQueue
{
    if (self.productControl)
        [[ITSTransManager defaultManager] remove:self.productControl];
    self.productControl = nil;
}

@end
