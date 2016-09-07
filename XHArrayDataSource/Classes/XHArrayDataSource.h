//
//  XHArrayDataSource.h
//  ShouChouJin
//
//  Created by echo on 09/07/2016.
//  Copyright (c) 2016 echo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^XHDataSourceCellConfigureBlock)(id cell, id item);
typedef void (^XHDataSourceSupplyViewConfigureBlock)(id view);

@interface XHArrayDataSource : NSObject<UITableViewDataSource, UICollectionViewDataSource>

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(XHDataSourceCellConfigureBlock)aConfigureCellBlock;

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
   headerIdentifier:(NSString *)hCellIdentifier
   footerIdentifier:(NSString *)fCellIdentifier
 configureCellBlock:(XHDataSourceCellConfigureBlock)aConfigureCellBlock
configureHeaderBlock:(XHDataSourceSupplyViewConfigureBlock)aConfigureHeaderBlock
configureFooterBlock:(XHDataSourceSupplyViewConfigureBlock)aConfigureFooterBlock;

- (void)resetItems:(NSArray *)anItems;
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
