//
//  XHViewController.m
//  XHArrayDataSource
//
//  Created by echo on 09/07/2016.
//  Copyright (c) 2016 echo. All rights reserved.
//

#import "XHViewController.h"
#import <XHArrayDataSource/XHArrayDataSource.h>
#import "XHCollectionViewController.h"

@interface XHViewController ()
<UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *arrayData;

@property (nonatomic, strong) XHArrayDataSource *dataSource;

@end

@implementation XHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    NSArray *array = @[@"第一行", @"第二行", @"Collections"];
    self.tableView.delegate = self;
    self.dataSource = [[XHArrayDataSource alloc] initWithItems:array cellIdentifier:@"Cell" configureCellBlock:^(UITableViewCell *cell, NSString *item) {
        
        cell.textLabel.text = item;
    }];
    self.tableView.dataSource = _dataSource;
    [self.view addSubview:self.tableView];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
        XHCollectionViewController *collectVC = [[XHCollectionViewController alloc] init];
        [self.navigationController pushViewController:collectVC animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
