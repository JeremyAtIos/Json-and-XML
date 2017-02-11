//
//  JsonTableViewDelegate.h
//  JsonAndXML
//
//  Created by Metallic  on 16/12/10.
//  Copyright © 2016年 xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^ConfigureCellBlock)(id cell, id item);

@interface JsonTableViewDelegate : NSObject <UITableViewDataSource>

- (instancetype)initWithItems:(NSArray *)items
                cellIdetifier:(NSString *)cellIdentifier
           configureCellBlock:(ConfigureCellBlock)configureCellBlock;

@end
