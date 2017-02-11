//
//  JsonTableViewCell.m
//  JsonAndXML
//
//  Created by Metallic  on 16/12/8.
//  Copyright © 2016年 xiaowei. All rights reserved.
//

#import "JsonTableViewCell.h"

@implementation JsonTableViewCell

- (void)setImageViewAnimating
{
    _previewImageView.alpha = 0.0;
    [UIView animateWithDuration:1.0 animations:^{
        _previewImageView.alpha = 1.0;
    }];
}

@end
