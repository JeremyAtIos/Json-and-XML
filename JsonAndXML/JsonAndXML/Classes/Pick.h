//
//  Pick.h
//  JsonAndXML
//
//  Created by Metallic  on 16/12/6.
//  Copyright © 2016年 xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pick : NSObject

@property (nonatomic, copy, readonly) NSString *ctime;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *pdescription;
@property (nonatomic, copy, readonly) NSString *picUrl;
@property (nonatomic, copy, readonly) NSString *url;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
