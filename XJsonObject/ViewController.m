//
//  ViewController.m
//  XJsonObject
//
//  Created by Xiu on 16/8/30.
//  Copyright © 2016年 Xiu. All rights reserved.
//

#import "ViewController.h"
#import "Info.h"
#import "XJsonObject.h"
#import "InfoItems.h"
#import "XJsonObject+Output.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    NSDictionary * dic = @{ @"testObj": @{  @"name": @"test2",
                                            @"intValue": @(80) },
                            @"name":        @"test1",
                            @"intValue":    @"10",
                            @"value":       @{  @"key1": @"value1" },
                            @"testItems":   @[  @{ @"name": @"testName1"},
                                                @{ @"name": @"testName2"},
                                                @{ @"name": @"testName3"}]};

    Info * obj = [Info objectWithDictionary:dic];

    NSLog(@"%@", obj.intValue);
    NSLog(@"%@", obj.name);
    NSLog(@"%@", obj.testItems.firstObject.name);
    NSLog(@"%@", obj.testObj.name);
    NSLog(@"%@", obj.testObj.intValue);
    NSLog(@"%@", obj.value.key1);
    
    
    
    NSArray * arr = @[  @{@"name": @"testName1"},
                        @{@"name": @"testName2"},
                        @{@"name": @"testName3"}];
    
    NSArray * objItems = [InfoItems arrayWithDictionarys:arr];

    for (InfoItems *item in objItems) {
        NSLog(@"%@",item.name);
    }
    
    NSLog(@"%@",obj.dictionaryFormInfoNone);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
