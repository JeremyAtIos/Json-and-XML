//
//  JsonParser.h
//  JsonAndXML
//
//  Created by Metallic  on 16/12/5.
//  Copyright © 2016年 xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Pick;

@interface PickJsonParser : NSObject

+ (NSArray<Pick *> *)parseJsonFile:(NSURL *)jsonFileUrl;

@end
