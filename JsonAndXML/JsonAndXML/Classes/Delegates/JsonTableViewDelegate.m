//
//  JsonTableViewDelegate.m
//  JsonAndXML
//
//  Created by Metallic  on 16/12/10.
//  Copyright © 2016年 xiaowei. All rights reserved.
//

#import "JsonTableViewDelegate.h"

@interface JsonTableViewDelegate () 

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) ConfigureCellBlock configureCellBlock;

@end

@implementation JsonTableViewDelegate

- (instancetype)initWithItems:(NSArray *)items
                cellIdetifier:(NSString *)cellIdentifier
           configureCellBlock:(ConfigureCellBlock)configureCellBlock
{
    self = [super init];
    if (self) {
        _items = items;
        _cellIdentifier = cellIdentifier;
        _configureCellBlock = configureCellBlock;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id cell = [tableView dequeueReusableCellWithIdentifier:_cellIdentifier forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    _configureCellBlock(cell, item);
    return cell;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return _items[indexPath.row];
}

@end
