//
//  Pick.m
//  JsonAndXML
//
//  Created by Metallic  on 16/12/6.
//  Copyright © 2016年 xiaowei. All rights reserved.
//

#import "Pick.h"

@implementation Pick

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"description"]) {
        _pdescription = value;
    }
}

@end
