//
//  Info.m
//  XJsonObject
//
//  Created by Xiu on 16/8/30.
//  Copyright © 2016年 Xiu. All rights reserved.
//

#import "Info.h"

@implementation Info

-(Class)arrayClassWithPropertyName:(NSString *)propertyName {
    if ([propertyName isEqualToString:@"testItems"]) {
        return TestItemsInfo.class;
    }
    return nil;
}

@end

@implementation TestItemsInfo

@end


@implementation TestObjInfo

@end


@implementation ValueInfo

@end