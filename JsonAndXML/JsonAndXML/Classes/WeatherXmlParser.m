//
//  WeatherXmlParser.m
//  JsonAndXML
//
//  Created by Metallic  on 17/2/3.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import "WeatherXmlParser.h"
#import "Resp.h"
#import "JXMacros.h"
#import "Weather.h"
#import "HalfWeather.h"

@interface WeatherXmlParser () <NSXMLParserDelegate>

@property (nonatomic, strong) NSXMLParser *xmlParser;//xml解析器
@property (nonatomic, strong) Resp *resp;//解析结果（天气菜单对象）
@property (nonatomic, copy) NSString *currentElement;//当前节点
@property (nonatomic, strong) Weather *yesterday;//昨天天气
@property (nonatomic, strong) NSMutableArray<Weather *> *forecast;//未来天气
@property (nonatomic, strong) HalfWeather *day1;//昨天白天
@property (nonatomic, strong) HalfWeather *night1;//昨天晚上
@property (nonatomic, assign) BOOL isDay;//区分白天黑夜
@property (nonatomic, strong) Weather *currentWeather;//正在解析的天气
@property (nonatomic, strong) HalfWeather *day;//未来白天
@property (nonatomic, strong) HalfWeather *night;//未来晚上

@end

@implementation WeatherXmlParser

+ (instancetype)xmlParserWithUrl:(NSURL *)url
{
    return [[self alloc] initWithUrl:url];
}

- (void)parse
{
    if (![self.xmlParser parse]) {
        NSLog(@"Weather parse error!");
    }
}

- (instancetype)initWithUrl:(NSURL *)url
{
    self = [super init];
    if (self) {
        self.xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
        self.xmlParser.delegate = self;
    }
    return self;
}

#pragma mark - NSXMLParserDelegate

//开始解析xml文件
- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    NSLog(@"Start parsing...");
}

//开始解析某个节点
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    self.currentElement = elementName;
    
    if ([self.currentElement isEqualToString:WEATHER_RESP]) { //初始化天气菜单对象
        self.resp = [[Resp alloc] init];
    } else if ([self.currentElement isEqualToString:WEATHER_YESTERDAY]) { //昨天天气
        self.yesterday = [[Weather alloc] init];
    } else if ([self.currentElement isEqualToString:WEATHER_DAY_1]) { //白天
        self.isDay = YES;
        self.day1 = [[HalfWeather alloc] init];
    } else if ([self.currentElement isEqualToString:WEATHER_NIGHT_1]) { //晚上
        self.isDay = NO;
        self.night1 = [[HalfWeather alloc] init];
    } else if ([self.currentElement isEqualToString:WEATHER_FORECAST]) { //初始化未来天气数组
        self.forecast = [NSMutableArray array];
    } else if ([self.currentElement isEqualToString:WEATHER_WEATHER]) { //初始化天气
        self.currentWeather = [[Weather alloc] init];
    } else if ([self.currentElement isEqualToString:WEATHER_DAY]) {
        self.isDay = YES;
        self.day = [[HalfWeather alloc] init];
    } else if ([self.currentElement isEqualToString:WEATHER_NIGHT]) {
        self.isDay = NO;
        self.night = [[HalfWeather alloc] init];
    }
}

//获取节点内容
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    //To do: 可使用KVC
    
    //昨天天气数据
    if ([self.currentElement isEqualToString:WEATHER_DATE_1]) {//
        self.yesterday.date = string;
    } else if ([self.currentElement isEqualToString:WEATHER_HIGH_1]) {
        self.yesterday.high = string;
    } else if ([self.currentElement isEqualToString:WEATHER_LOW_1]) {
        self.yesterday.low = string;
    } else if ([self.currentElement isEqualToString:WEATHER_TYPE_1]) {
        if (self.isDay) {
            self.day1.type = string;
        } else {
            self.night1.type = string;
        }
    } else if ([self.currentElement isEqualToString:WEATHER_FX_1]) {
        if (self.isDay) {
            self.day1.windDirection = string;
        } else {
            self.night1.windDirection = string;
        }
    } else if ([self.currentElement isEqualToString:WEATHER_FL_1]) {
        if (self.isDay) {
            self.day1.windLevel = self.day1.windLevel ? [self.day1.windLevel stringByAppendingString:string] : string;
        } else {
            self.night1.windLevel = self.night1.windLevel ? [self.night1.windLevel stringByAppendingString:string] : string;
        }
    }
    //未来天气数据
    else if ([self.currentElement isEqualToString:WEATHER_DATE]) {
        self.currentWeather.date = string;
    } else if ([self.currentElement isEqualToString:WEATHER_HIGH]) {
        self.currentWeather.high = string;
    } else if ([self.currentElement isEqualToString:WEATHER_LOW]) {
        self.currentWeather.low = string;
    } else if ([self.currentElement isEqualToString:WEATHER_TYPE]) {
        if (self.isDay) {
            self.day.type = string;
        } else {
            self.night.type = string;
        }
    } else if ([self.currentElement isEqualToString:WEATHER_FX]) {
        if (self.isDay) {
            self.day.windDirection = string;
        } else {
            self.night.windDirection = string;
        }
    } else if ([self.currentElement isEqualToString:WEATHER_FL]) {
        if (self.isDay) {
            self.day.windLevel = self.day.windLevel ? [self.day.windLevel stringByAppendingString:string] : string;
        } else {
            self.night.windLevel = self.night.windLevel ? [self.night.windLevel stringByAppendingString:string] : string;
        }
    }
}

//解析完一个节点
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    //昨天
    if ([elementName isEqualToString:WEATHER_YESTERDAY]) {
        self.resp.yesterday = self.yesterday;
    } else if ([elementName isEqualToString:WEATHER_DAY_1]) {
        self.yesterday.day = self.day1;
    } else if ([elementName isEqualToString:WEATHER_NIGHT_1]) {
        self.yesterday.night = self.night1;
    }
    //未来
    else if ([elementName isEqualToString:WEATHER_WEATHER]) {
        [self.forecast addObject:self.currentWeather];
    } else if ([elementName isEqualToString:WEATHER_DAY]) {
        self.currentWeather.day = self.day;
    } else if ([elementName isEqualToString:WEATHER_NIGHT]) {
        self.currentWeather.night = self.night;
    } else if ([elementName isEqualToString:WEATHER_FORECAST]) {
        self.resp.forecast = [self.forecast copy];
    }
    self.currentElement = nil;
}

//文件解析结束
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    if ([self.delegate respondsToSelector:@selector(weatherXmlParser:didFinishedParseResp:)]) {
        [self.delegate weatherXmlParser:self didFinishedParseResp:self.resp];
    }
}

@end
