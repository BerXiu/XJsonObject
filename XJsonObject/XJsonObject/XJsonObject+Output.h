//
//  XJsonObject+Output.h
//  XJsonObject
//
//  Created by Xiu on 16/9/1.
//  Copyright © 2016年 Xiu. All rights reserved.
//

#import "XJsonObject.h"

@interface XJsonObject(XJsonObject_Output)

@property(nonatomic, readonly) NSDictionary * dictionaryFormInfo;       ///< 按照自身属性生成字典，一般用于序列化保存,不忽略空值

@property(nonatomic, readonly) NSDictionary * dictionaryFormInfoNone;   ///< 按照自身属性生成字典，一般用于序列化保存，忽略空值

@end
