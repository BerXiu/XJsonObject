//
//  XJsonProperty.h
//  XJsonObject
//
//  Created by Xiu on 16/8/30.
//  Copyright © 2016年 Xiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

// 属性的类型
typedef NS_ENUM(NSInteger,XJsonObjectPropertyType) {
    XJsonObjectTypeUnknown = 0,     ///<                       未知类型
    XJsonObjectTypeInt,             ///< Ti                 -> 整形
    XJsonObjectTypeShort,           ///< Ts                 -> 短整形
    XJsonObjectTypeLongInt,         ///< Tq                 -> 长整形
    XJsonObjectTypeUnsignedInt,     ///< TI                 -> 无符号短整形
    XJsonObjectTypeUnsignedShort,   ///< TS                 -> 无符号整形
    XJsonObjectTypeUnsignedLong,    ///< TQ                 -> 无符号长整形
    XJsonObjectTypeFloat,           ///< Tf                 -> 浮点型
    XJsonObjectTypeDouble,          ///< Td                 -> 双精度型
    XJsonObjectTypeLongDouble,      ///< TD                 -> 长双精度型
    XJsonObjectTypeChar,            ///< Tc                 -> 字符型
    XJsonObjectTypeUnsignedChar,    ///< TC                 -> 无符号字符型
    XJsonObjectTypeBool,            ///< TB                 -> 布尔型
    XJsonObjectTypeId,              ///< T@                 -> id类型
    XJsonObjectTypeNSString,        ///< T@"NSString"       -> OC类型 NSString
    XJsonObjectTypeNSArray,         ///< T@"NSArray"        -> OC类型 NSArray
    XJsonObjectTypeNSDate,          ///< T@"NSDate"         -> OC类型 NSDate
    XJsonObjectTypeNSNumber,        ///< T@"NSNumber"       -> OC类型 NSNumber
    XJsonObjectTypeNSDictionary,    ///< T@"NSDictionary"   -> OC类型 NSDictionary
    XJsonObjectTypeXJsonObject      ///< T@"XX"             -> 模型   XJsonObject
};

/// class1 是否是 class2或其的子类
bool class_isClass( Class class1, Class class2 );

@interface XJsonProperty : NSObject

@property (nonatomic, copy) NSString * name; ///< 属性名

@property (nonatomic, copy) NSString * attributes;

@property (nonatomic, assign) XJsonObjectPropertyType type; ///< 属性类型

@property (nonatomic, assign) Class class; ///< 属所属的类


@end

