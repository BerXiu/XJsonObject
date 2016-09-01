//
//  XJsonProperty.m
//  XJsonObject
//
//  Created by Xiu on 16/8/30.
//  Copyright © 2016年 Xiu. All rights reserved.
//

#import "XJsonProperty.h"

/// class1 是否是 class2或其的子类
bool class_isClass( Class class1, Class class2 )
{
    if (class1==NULL || class2==NULL) { return NO; }
    
    if (class1 != class2) { return class_isClass( class_getSuperclass(class1), class2 ); }
    
    return true;
}


@interface XJsonProperty()

@property (nonatomic, copy) NSString * infoString; ///< 属性的原始信息

@end

@implementation XJsonProperty



-(XJsonObjectPropertyType)type {
    
    NSDictionary * keyDic = @{
                              @"Ti":                @(XJsonObjectTypeInt),
                              @"Ts":                @(XJsonObjectTypeShort),
                              @"Tq":                @(XJsonObjectTypeLongInt),
                              @"TI":                @(XJsonObjectTypeUnsignedInt),
                              @"TS":                @(XJsonObjectTypeUnsignedShort),
                              @"TQ":                @(XJsonObjectTypeUnsignedLong),
                              @"Tf":                @(XJsonObjectTypeFloat),
                              @"Td":                @(XJsonObjectTypeDouble),
                              @"TD":                @(XJsonObjectTypeLongDouble),
                              @"Tc":                @(XJsonObjectTypeChar),
                              @"TC":                @(XJsonObjectTypeUnsignedChar),
                              @"TB":                @(XJsonObjectTypeBool),
                              @"T@":                @(XJsonObjectTypeId),
                              @"T@\"NSString\"":    @(XJsonObjectTypeNSString),
                              @"T@\"NSArray\"":     @(XJsonObjectTypeNSArray),
                              @"T@\"NSDate\"":      @(XJsonObjectTypeNSDate),
                              @"T@\"NSNumber\"":    @(XJsonObjectTypeNSNumber),
                              @"T@\"NSDictionary\"":@(XJsonObjectTypeNSDictionary)
                              };
    NSString *key = [_attributes componentsSeparatedByString:@","].firstObject;
    NSNumber *type = [keyDic objectForKey:key];
    
    if (type) {
        
        return [type integerValue];
    }else {
        // 为定义类型
        if ([key hasPrefix:@"T@\""]) { ///数据模型对象
            
            return XJsonObjectTypeXJsonObject;
        }
        return  XJsonObjectTypeUnknown;
    }
};

@end
