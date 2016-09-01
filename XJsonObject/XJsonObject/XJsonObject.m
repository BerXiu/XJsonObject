//
//  XJsonObject.m
//  XJsonObject
//
//  Created by Xiu on 16/8/30.
//  Copyright © 2016年 Xiu. All rights reserved.
//

#import "XJsonObject.h"
#import "XJsonProperty.h"
#import "XJsonObject+Items.h"


@implementation XJsonObject

#pragma mark - Formats
- (NSString *)dateFormatWithPropertyName:(NSString *)propertyName {
    return @"yyyy-MM-dd HH:mm:ss";
}
- (double)dateMillisecondMultipleWithPropertyName:(NSString *)propertyName {
    return 0.001;
}
- (Class)arrayClassWithPropertyName:(NSString *)propertyName {
    return NULL;
}


+ (instancetype)objectWithDictionary:(NSDictionary *)dictionary {
    
    return [[self alloc] initWithDictionary:dictionary];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super init]) {
        [self setDictionary:dictionary];
    }
    return self;
}

- (void)setDictionary:(NSDictionary *)dictionary;
{
    if (![dictionary isKindOfClass:NSDictionary.class])
    {
        return;
    }
    
    if (dictionary.allKeys.count == 0 )
    {
        return;
    }
    
    id value = nil;
    NSArray * propertyItems = [self.class propertyItems];
    
    for (XJsonProperty * item in propertyItems)
    {
        
        value = [dictionary objectForKey:item.name];
        
        if ( value==nil || [value isKindOfClass:NSNull.class]) { continue; }
        
        // 给属性赋值
        [self setPropertyWithItem:item value:value];
    }
}

/**
 * 对属性进行赋值
 */
- (void)setPropertyWithItem:(XJsonProperty *)item value:(id)value {
    
    id finalValue = nil;
    
    switch (item.type) {
        case XJsonObjectTypeInt:            finalValue = @([value intValue]);           break;
        case XJsonObjectTypeShort:          finalValue = @([value shortValue]);         break;
        case XJsonObjectTypeLongInt:        finalValue = @([value longValue]);          break;
        case XJsonObjectTypeUnsignedInt:    finalValue = @([value unsignedIntValue]);   break;
        case XJsonObjectTypeUnsignedShort:  finalValue = @([value unsignedShortValue]); break;
        case XJsonObjectTypeUnsignedLong:   finalValue = @([value unsignedLongValue]);  break;
        case XJsonObjectTypeFloat:          finalValue = @([value floatValue]);         break;
        case XJsonObjectTypeDouble:         finalValue = @([value doubleValue]);        break;
        case XJsonObjectTypeLongDouble:     finalValue = @([value longLongValue]);      break;
        case XJsonObjectTypeChar:           finalValue = @([value charValue]);          break;
        case XJsonObjectTypeUnsignedChar:   finalValue = @([value unsignedCharValue]);  break;
        case XJsonObjectTypeBool:           finalValue = @([value boolValue]);          break;
        case XJsonObjectTypeId:             finalValue = value;                         break;
        case XJsonObjectTypeNSString:
        {
            finalValue = [NSString stringWithFormat:@"%@",value];
             break;
        }
        case XJsonObjectTypeNSArray:
        {
            if (![value isKindOfClass:NSArray.class]) return ;
            
            NSMutableArray * items = [NSMutableArray array];
            id obj = nil;
            for (id v in value)
            {
                Class objClass = [self arrayClassWithPropertyName:item.name];
                if (class_isClass(objClass, XJsonObject.class))
                {
                    obj = [[objClass alloc] initWithDictionary:v];
                }
                else
                {
                    obj = v;
                }
                [items addObject:obj];
            }
            finalValue = [NSArray arrayWithArray:items];
            break;
        }
        case XJsonObjectTypeNSDate:
        {
            // NSDate
            if ( ![value isKindOfClass:NSString.class] && ![value isKindOfClass:NSNumber.class]) { return; }
            
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^[0-9]+$"];
            BOOL isNumber = [predicate evaluateWithObject:[NSString stringWithFormat:@"%@", value]];
            
            if (isNumber)
            {
                // 数字时间
                NSTimeInterval time = [value doubleValue] * [self dateMillisecondMultipleWithPropertyName:item.name];
                finalValue = [NSDate dateWithTimeIntervalSince1970:time];
            }
            else
            {
                // 字符串时间
                NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
                dateformatter.dateFormat = [self dateFormatWithPropertyName:item.name];
                finalValue = [dateformatter dateFromString:value];
            }
            break;
        }
        case XJsonObjectTypeNSNumber:
        {
            // NSNumber
            if ([value isKindOfClass:NSNumber.class])
            {
                // 正好是NSNumber什么都不做
            }
            else if ([value isKindOfClass:NSString.class])
            {
                finalValue = @([value doubleValue]);
            }
            break;
        }
        case XJsonObjectTypeUnknown:break;
        case XJsonObjectTypeNSDictionary:break;
        case XJsonObjectTypeXJsonObject :
        {
            // 数据模型对象是属性，自动生成对象
            finalValue = [item.class objectWithDictionary:value];
            break;
        }
        default:
            break;
    }
    
    if (finalValue) {
        [self setValue:finalValue forKey:item.name];
    }
}

+ (NSArray *)arrayWithDictionarys:(NSArray *)dictionarys {
    if ( ![dictionarys isKindOfClass:NSArray.class] )
    {
        return nil;
    }
    NSMutableArray * itmes = [NSMutableArray array];
    for (NSDictionary * dic in dictionarys) {
        id info = [self objectWithDictionary:dic];
        if (info) {
            [itmes addObject:info];
        }
    }
    return [NSArray arrayWithArray:itmes];
}

@end
