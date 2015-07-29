//
//  ZHObjectBase.m
//
//  Created by peter zheng on 14-7-29.
//  Copyright (c) 2014年 codefunny. All rights reserved.
//

#import "ZHObjectBase.h"
#import <objc/runtime.h>

@implementation ZHObjectBase

+ (id)instance
{
    return [[[self class] alloc] init];
}

- (BOOL)saveToFile:(NSString *)path
{
    return [NSKeyedArchiver archiveRootObject:self toFile:path];
}

- (id)loadFromFile:(NSString *)path
{
    id obj = nil;
    @try {
        obj = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    }
    @catch (NSException *exception) {
        obj = nil;
        NSLog(@"Excetption:%@",exception);
    }
    @finally {
        
    }
    
    return obj;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        unsigned int outCount = 0;
        objc_property_t *properties = class_copyPropertyList([self class], &outCount);
        
        @try {
            for (int i = 0; i < outCount; i++) {
                objc_property_t property = properties[i];
                NSString *key = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
                id value = [aDecoder decodeObjectForKey:key];
                [self setValue:value forKey:key];
            }
        }
        @catch (NSException *exception) {
            NSLog(@"Excetption:%@",exception);
            return nil;
        }
        @finally {
            
        }
        
        free(properties);
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int outCount = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *key = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        id value = [self valueForKey:key];
        if (value && key) {
            if ([value isKindOfClass:[NSObject class]]) {
                [aCoder encodeObject:value forKey:key];
            } else {
                NSNumber *num = [NSNumber numberWithInt:(int)value];
                [aCoder encodeObject:num forKey:key];
            }
        }
    }
    free(properties);
    properties = NULL;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@",NSStringFromClass([self class])];
}

@end
