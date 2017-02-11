//
//  XmlTableViewCell.h
//  JsonAndXML
//
//  Created by Metallic  on 17/2/10.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XmlTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *highLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayWeatherLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayWindDirectionLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayWindLevelLabel;
@property (weak, nonatomic) IBOutlet UILabel *nightWeatherLabel;
@property (weak, nonatomic) IBOutlet UILabel *nightWindDirectionLabel;
@property (weak, nonatomic) IBOutlet UILabel *nightWindLevelLabel;

@end
