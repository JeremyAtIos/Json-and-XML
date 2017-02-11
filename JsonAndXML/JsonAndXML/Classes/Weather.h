//
//  Weather.h
//  JsonAndXML
//
//  Created by Metallic  on 16/12/13.
//  Copyright © 2016年 xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HalfWeather;

@interface Weather : NSObject

@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *high;
@property (nonatomic, copy) NSString *low;
@property (nonatomic, strong) HalfWeather *day;
@property (nonatomic, strong) HalfWeather *night;

@end
