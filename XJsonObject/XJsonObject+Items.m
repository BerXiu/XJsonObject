//
//  XJsonObject+Items.m
//  XJsonObject
//
//  Created by Xiu on 16/8/31.
//  Copyright © 2016年 Xiu. All rights reserved.
//

#import "XJsonObject+Items.h"
#import <objc/runtime.h>
#import "XJsonProperty.h"

@implementation XJsonObject(XJsonObject_Items)

+ (NSArray *)propertyItems {
    // 缓存
    static NSMutableDictionary * cacheItems = nil;
    if (cacheItems == nil)
    {
        cacheItems = [NSMutableDictionary dictionary];
    }
    
    NSArray * callBackData = [cacheItems objectForKey:NSStringFromClass(self)];
    if (callBackData == nil)
    {
        NSMutableArray *items = [NSMutableArray arrayWithCapacity:1];
        
        unsigned int outCount;
        // 获取对象的属性列表
        objc_property_t *propertys = class_copyPropertyList(self.class, &outCount);
        
        XJsonProperty *item = nil;
        for (int i = 0; i < outCount; i++) {
            
            item = [[XJsonProperty alloc]init];
            objc_property_t property = propertys[i];
            
            item.name = [[NSString alloc]initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
            item.attributes = [[NSString alloc]initWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
            
            // 如果是对象,就确定对象的类
            if (item.type == XJsonObjectTypeXJsonObject) {
                NSRange start = [item.attributes rangeOfString:@"T@\""];
                NSRange end = [item.attributes rangeOfString:@"\","];
                NSString * className = nil;
                if (start.length && end.length)
                {
                    className = [item.attributes substringWithRange:NSMakeRange(start.location+start.length, end.location - start.length)];
                }
                item.class = NSClassFromString(className);
            }
            
            
            [items addObject:item];
            
        }
        free(propertys);
        
        callBackData = [NSArray arrayWithArray:items];
        [cacheItems setObject:callBackData forKey:NSStringFromClass(self)];
    }
    
    return callBackData;
}
@end
