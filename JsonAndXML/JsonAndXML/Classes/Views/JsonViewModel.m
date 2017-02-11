//
//  JsonViewModel.m
//  JsonAndXML
//
//  Created by Metallic  on 16/12/8.
//  Copyright © 2016年 xiaowei. All rights reserved.
//

#import "JsonViewModel.h"
#import <UIKit/UIKit.h>
#import "Pick.h"

@implementation JsonViewModel

- (instancetype)initWithPick:(Pick *)pick
{
    self = [super init];
    if (self) {
        _previewImageUrl = [NSURL URLWithString:pick.picUrl];
        _titleText = pick.title;
        _descriptionText = pick.pdescription;
        _timeText = pick.ctime;
    }
    return self;
}

@end
