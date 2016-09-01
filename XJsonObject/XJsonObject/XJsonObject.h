//
//  XJsonObject.h
//  XJsonObject
//
//  Created by Xiu on 16/8/30.
//  Copyright © 2016年 Xiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XJsonObject : NSObject

/**
 *  批量设置属性
 *
 *  @param dictionary 要设置的属性和值
 */
- (void)setDictionary:(NSDictionary *)dictionary;

/**
 *  使用字典初始化模型对象
 *
 *  @param dictionary 要初始化的属性
 *
 *  @return SSObject
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

/**
 *  创建数据模型
 *  @param  dictionary  数据字典
 *  return  数据模型
 */
+ (instancetype)objectWithDictionary:(NSDictionary *)dictionary;

/**
 *  使用字典数组创建模型数组
 *
 *  @param dictionarys 字典数组
 *
 *  @return 模型对象数组
 */
+ (NSArray *)arrayWithDictionarys:(NSArray *)dictionarys;

/// 时间格式，默认 @"yyyy-MM-dd HH:mm:ss" ， 如需要修改，子类重载
- (NSString *)dateFormatWithPropertyName:(NSString *)propertyName;

/// 对于数字时间，默认使用毫秒做单位，如果不是毫秒，重载返回单位对于毫秒的倍数
- (double)dateMillisecondMultipleWithPropertyName:(NSString *)propertyName;

/// 解析数组时，需要子类重载，根据属性名，返回数组中对象的类名
- (Class)arrayClassWithPropertyName:(NSString *)propertyName;

@end
