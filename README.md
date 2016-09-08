# XHArrayDataSource
a datasource for tableview and collectionView
一个简单datasource，解决每次都要实现UITableViewDataSource／UICollectionViewDataSource的困扰
##使用方法
两句话实现dataSource，注意由于tableView.dataSource是weak的，不要直接用初始化语句赋值，并且dataSource一定要是实例变量

```
self.dataSource = [[XHArrayDataSource alloc] initWithItems:array cellIdentifier:@"Cell" configureCellBlock:^(UITableViewCell *cell, NSString *item) {
  cell.textLabel.text = item;
}];
self.tableView.dataSource = _dataSource;
```

UICollectionView同理

## 导入
### 手工导入
直接下载或者clone，将```pod->Development Pods->XHArrayDataSource->XHArrayDataSource->classes```中
XHArrayDataSource.h和XHArrayDataSource.m引入工程即可

### cocoapods
```pod 'XHArrayDataSource', '~> 1.0.0'```

# License
MIT license.
