//
//  JsonTableViewCell.h
//  JsonAndXML
//
//  Created by Metallic  on 16/12/8.
//  Copyright © 2016年 xiaowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JsonTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *previewImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

- (void)setImageViewAnimating;

@end
