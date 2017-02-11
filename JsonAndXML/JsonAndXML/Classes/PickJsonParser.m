//
//  JsonParser.m
//  JsonAndXML
//
//  Created by Metallic  on 16/12/5.
//  Copyright © 2016年 xiaowei. All rights reserved.
//

#import "PickJsonParser.h"
#import "JXMacros.h"
#import "Pick.h"

@implementation PickJsonParser

+ (NSArray<Pick *> *)parseJsonFile:(NSURL *)jsonFileUrl
{
    NSArray *picks;
    
    NSData *jsonData = [NSData dataWithContentsOfURL:jsonFileUrl];
    NSError *error = nil;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    if (error) {
        NSLog(@"%@", error);
        return nil;
    }
    picks = [self picksWithArray:[jsonDict valueForKeyPath:WINXIN_NEWSLIST]];
    
    return picks;
}

+ (NSArray<Pick *> *)picksWithArray:(NSArray<NSDictionary *> *)array
{
    NSArray *picks = nil;
    
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:array.count];
    for (NSDictionary *dict in array) {
        Pick *pick = [[Pick alloc] initWithDictionary:dict];
        [mutableArray addObject:pick];
    }
    picks = [NSArray arrayWithArray:mutableArray];
    
    return picks;
}

@end
