//
//  Info.h
//  XJsonObject
//
//  Created by Xiu on 16/8/30.
//  Copyright © 2016年 Xiu. All rights reserved.
//

#import "XJsonObject.h"

@class TestItemsInfo;
@class TestObjInfo;
@class ValueInfo;

@interface Info : XJsonObject

@property (nonatomic, readonly) NSString *nullStr;

@property (nonatomic, readonly) NSString * intValue;

@property (nonatomic, readonly) NSString * name;

@property (nonatomic, readonly) NSArray <TestItemsInfo *> * testItems;

@property (nonatomic, readonly) TestObjInfo * testObj;

@property (nonatomic, readonly) ValueInfo * value;

@end


@interface TestItemsInfo : XJsonObject

@property (nonatomic, readonly) NSString * name;

@end


@interface TestObjInfo : XJsonObject

@property(nonatomic, readonly) NSString * intValue;

@property(nonatomic, readonly) NSString * name;

@end


@interface ValueInfo : XJsonObject

@property(nonatomic, readonly) NSString *key1;

@end
