//
//  WeatherXmlParser.h
//  JsonAndXML
//
//  Created by Metallic  on 17/2/3.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Resp, WeatherXmlParser;

@protocol WeatherXmlParserDelegate <NSObject>

@required

- (void)weatherXmlParser:(WeatherXmlParser *)parser didFinishedParseResp:(Resp *)resp;

@end

@interface WeatherXmlParser : NSObject

/**
 *  初始化一个xml解析器
 *
 *  @param url xml文件路径
 *
 *  @return xml解析器
 */
+ (instancetype)xmlParserWithUrl:(NSURL *)url;

/**
 *  解析器需要调用这个方法执行解析
 *
 *  @return 解析结果（天气菜单对象）
 */
- (void)parse;

@property (nonatomic, weak) id<WeatherXmlParserDelegate> delegate;

@end
