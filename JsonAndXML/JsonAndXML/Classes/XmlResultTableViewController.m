//
//  XmlResultTableViewController.m
//  JsonAndXML
//
//  Created by Metallic  on 17/2/4.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import "XmlResultTableViewController.h"
#import "WeatherXmlParser.h"
#import "Resp.h"
#import "XmlTableViewCell.h"
#import "Weather.h"
#import "HalfWeather.h"

@implementation XmlResultTableViewController

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section ? self.resp.forecast.count : 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Weather Cell";
    XmlTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    Weather *weather = indexPath.section ? self.resp.forecast[indexPath.row] : self.resp.yesterday;
    [self configureCell:cell withWeather:weather];
    
    return cell;
}

- (void)configureCell:(XmlTableViewCell *)cell
          withWeather:(Weather *)weather
{
    cell.dateLabel.text = weather.date;
    cell.highLabel.text = weather.high;
    cell.lowLabel.text = weather.low;
    cell.dayWeatherLabel.text = weather.day.type;
    cell.dayWindDirectionLabel.text = weather.day.windDirection;
    cell.dayWindLevelLabel.text = weather.day.windLevel;
    cell.nightWeatherLabel.text = weather.night.type;
    cell.nightWindDirectionLabel.text = weather.night.windDirection;
    cell.nightWindLevelLabel.text = weather.night.windLevel;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return section ? @"未来" : @"昨天";
}


@end
