//
//  ZHObjectBase.h
//
//  Created by peter zheng on 14-7-29.
//  Copyright (c) 2014年 codefunny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHObjectBase : NSObject <NSCoding>

@property (nonatomic,assign) NSInteger  tag;

+ (id)instance;
- (BOOL)saveToFile:(NSString *)path;
- (id)loadFromFile:(NSString *)path;

- (id)initWithCoder:(NSCoder *)aDecoder;

@end
