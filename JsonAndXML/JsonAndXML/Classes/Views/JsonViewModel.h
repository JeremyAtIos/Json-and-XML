//
//  JsonViewModel.h
//  JsonAndXML
//
//  Created by Metallic  on 16/12/8.
//  Copyright © 2016年 xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage, Pick;

@interface JsonViewModel : NSObject

@property (nonatomic, strong, readonly) NSURL *previewImageUrl;
@property (nonatomic, copy, readonly) NSString *titleText;
@property (nonatomic, copy, readonly) NSString *descriptionText;
@property (nonatomic, copy, readonly) NSString *timeText;

- (instancetype)initWithPick:(Pick *)pick;

@end
