//
//  JsonResultTableViewController.m
//  JsonAndXML
//
//  Created by Metallic  on 16/12/8.
//  Copyright © 2016年 xiaowei. All rights reserved.
//

#import "JsonResultTableViewController.h"
#import "Pick.h"
#import "PickJsonParser.h"
#import "JsonViewModel.h"
#import "JsonTableViewCell.h"
#import "JsonTableViewDelegate.h"
#import "UIImageView+WebCache.h"

@interface JsonResultTableViewController ()

@property (nonatomic, strong) NSArray<Pick *> *picks;
@property (nonatomic, strong) NSArray<JsonViewModel *> *viewModels;

@end

@implementation JsonResultTableViewController

#pragma mark - Life

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //自适应高度
    self.tableView.estimatedRowHeight = 98;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

#pragma mark - Getter

- (NSArray<Pick *> *)picks
{
    if (!_picks) {
        _picks = [PickJsonParser parseJsonFile:[[NSBundle mainBundle] URLForResource:@"WeiXin" withExtension:@"json"]];
    }
    return _picks;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.picks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Json Cell";
    JsonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    Pick *pick = self.picks[indexPath.row];
    [self configureCell:cell withPick:pick];

    return cell;
}

- (void)configureCell:(JsonTableViewCell *)cell withPick:(Pick *)pick
{
    JsonViewModel *viewModel = [[JsonViewModel alloc] initWithPick:pick];
    cell.titleLabel.text = viewModel.titleText;
    cell.descriptionLabel.text = viewModel.descriptionText;
    cell.timeLabel.text = viewModel.timeText;
    [cell.previewImageView sd_setImageWithURL:viewModel.previewImageUrl placeholderImage:[UIImage imageNamed:@"placeholder"]];
    [cell setImageViewAnimating];
}

@end
