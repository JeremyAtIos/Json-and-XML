//
//  Resp.h
//  JsonAndXML
//
//  Created by Metallic  on 16/12/13.
//  Copyright © 2016年 xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Weather;

@interface Resp : NSObject

@property (nonatomic, strong) Weather *yesterday;
@property (nonatomic, strong) NSArray<Weather *> *forecast;

@end
