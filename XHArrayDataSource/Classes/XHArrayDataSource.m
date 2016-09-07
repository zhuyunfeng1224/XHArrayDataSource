//
//  XHArrayDataSource.m
//  ShouChouJin
//
//  Created by echo on 09/07/2016.
//  Copyright (c) 2016 echo. All rights reserved.
//

#import "XHArrayDataSource.h"

@interface XHArrayDataSource ()
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) NSString *headerIdentifier;
@property (nonatomic, copy) NSString *footerIdentifier;
@property (nonatomic, copy) UICollectionReusableView *headerView;
@property (nonatomic, copy) UICollectionReusableView *footerView;
@property (nonatomic, copy) XHDataSourceCellConfigureBlock configureCellBlock;
@property (nonatomic, copy) XHDataSourceSupplyViewConfigureBlock configureHeaderBlock;
@property (nonatomic, copy) XHDataSourceSupplyViewConfigureBlock configureFooterBlock;

@end

@implementation XHArrayDataSource

- (id)init
{
    return nil;
}

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(XHDataSourceCellConfigureBlock)aConfigureCellBlock
{
    self = [super init];
    if (self) {
        self.items = anItems;
        self.cellIdentifier = aCellIdentifier;
        self.configureCellBlock = [aConfigureCellBlock copy];
    }
    return self;
}

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
   headerIdentifier:(NSString *)hCellIdentifier
   footerIdentifier:(NSString *)fCellIdentifier
 configureCellBlock:(XHDataSourceCellConfigureBlock)aConfigureCellBlock
configureHeaderBlock:(XHDataSourceSupplyViewConfigureBlock)aConfigureHeaderBlock
configureFooterBlock:(XHDataSourceSupplyViewConfigureBlock)aConfigureFooterBlock
{
    self = [super init];
    if (self) {
        self.items = anItems;
        self.cellIdentifier = aCellIdentifier;
        self.headerIdentifier = hCellIdentifier;
        self.footerIdentifier = fCellIdentifier;
        self.configureCellBlock = [aConfigureCellBlock copy];
        self.configureHeaderBlock = [aConfigureHeaderBlock copy];
        self.configureFooterBlock = [aConfigureFooterBlock copy];
    }
    return self;
}

- (void)resetItems:(NSArray *)anItems
{
    self.items = anItems;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[(NSUInteger) indexPath.row];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                            forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.configureCellBlock(cell, item);
    return cell;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.cellIdentifier forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.configureCellBlock(cell, item);
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        if (!_headerView) {
            _headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:self.headerIdentifier forIndexPath:indexPath];
        }
        
        if (self.configureHeaderBlock) {
            self.configureHeaderBlock(_headerView);
        }
        return self.headerView;
    }
    else {
        if (!_footerView) {
            _footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:self.footerIdentifier forIndexPath:indexPath];
        }
        
        if (self.configureFooterBlock) {
            self.configureFooterBlock(_footerView);
        }
        return self.footerView;
    }
    return nil;
}


@end
