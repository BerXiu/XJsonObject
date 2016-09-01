//
//  XJsonObject+Output.m
//  XJsonObject
//
//  Created by Xiu on 16/9/1.
//  Copyright © 2016年 Xiu. All rights reserved.
//

#import "XJsonObject+Output.h"
#import "XJsonObject+Items.h"
#import "XJsonProperty.h"


@implementation XJsonObject(XJsonObject_Output)

-(NSDictionary *)dictionaryFormInfo {
    
    return [self dictionaryFormInfoWithNull:YES];
}

-(NSDictionary *)dictionaryFormInfoNone {
    
    return [self dictionaryFormInfoWithNull:NO];
}

- (NSDictionary *)dictionaryFormInfoWithNull:(BOOL)withNull
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:1];
    id value = nil;
    NSString *key = nil;
    for (XJsonProperty *item in [self.class propertyItems]) {
        
        key = item.name;
        value = [self valueForKey:key];
        switch (item.type) {
            case XJsonObjectTypeNSDate:
            {
                [dic setObject:[self date:value withFormat:[self dateFormatWithPropertyName:key]] forKey:key];
                break;
            }
            case XJsonObjectTypeXJsonObject:
            {
                [dic setObject:[value dictionaryFormInfo] forKey:key];
                break;
            }
            case XJsonObjectTypeNSArray:
            {
                NSMutableArray * arr = [NSMutableArray array];
                for (id obj in value) {
                    if ([obj isKindOfClass:XJsonObject.class]) {
                        [arr addObject:[obj dictionaryFormInfo]];
                    } else {
                        [arr addObject:obj];
                    }
                }
                [dic setObject:arr forKey:key];
                break;
            }
            default:
            {
                if (withNull)
                {
                    [dic setObject:value?value:[NSNull null] forKey:key];
                }
                else
                {
                    if (value != nil && value != [NSNull null])
                    {
                        [dic setObject:value forKey:key];
                    }
                }
                break;
            }
        }
    }
    return dic;
}

- (NSString *)date:(NSDate *)date withFormat:(NSString *)format {
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:format];
    return [outputFormatter stringFromDate:date];
}

#pragma mark - Debug 输出
- (NSString *)getDebugString {
    return [NSString stringWithFormat:@"\r\n%@ <0x%08X>:\r\n%@", self.class, (int)self, self.dictionaryFormInfo];
}
- (NSString *)description {
    return [self getDebugString];
}
- (NSString *)debugDescription {
    return [self getDebugString];
}
@end
