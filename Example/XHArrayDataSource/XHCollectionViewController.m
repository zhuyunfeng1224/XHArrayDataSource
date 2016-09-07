//
//  XHCollectionViewController.m
//  XHArrayDataSource
//
//  Created by echo on 16/9/7.
//  Copyright © 2016年 echo. All rights reserved.
//

#import "XHCollectionViewController.h"
#import <XHArrayDataSource/XHArrayDataSource.h>

@interface XHCollectionViewController ()

@property (nonatomic, strong) UICollectionView              *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout    *layout;
@property (nonatomic, strong) XHArrayDataSource             *dataSource;

@end

@implementation XHCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    self.layout.sectionInset = UIEdgeInsetsZero;
    self.layout.minimumLineSpacing = 0;
    self.layout.minimumInteritemSpacing = 0;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) collectionViewLayout:self.layout];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CollecCell"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    NSArray *array = @[@"1", @"2", @"3"];
    
    self.dataSource = [[XHArrayDataSource alloc] initWithItems:array cellIdentifier:@"CollecCell" configureCellBlock:^(UICollectionViewCell *cell, NSString *item) {
        cell.backgroundColor = [UIColor lightGrayColor];
    }];
    self.collectionView.dataSource = self.dataSource;
    [self.view addSubview:self.collectionView];
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
