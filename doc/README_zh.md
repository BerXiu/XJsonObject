<h1 align="center">XJsonObject</h1>
<br>
	<p align="center">
		<img src="https://img.shields.io/badge/版本-v0.0.1-blue.svg" />
		<img src="https://img.shields.io/badge/语言-OC-red.svg" />
	</p>
	<h5 align="center">对象序列化和网络数据解析，自动将数组映射成本地对象</h5>
</br>

# Language
* [English](README.md)
* [中文](doc/README_zh.md)

##引入
```
pod 'XJsonObject'
```
##常用场景：
将网络请求Json数据、NSDictionary、数组，映射为数据模型。

将数据模型对象序列化成字典保存

##特性：
实现对象正向反向映射, 自动判断属性类型，使用字典对应的键值匹配属性名进行初始化赋值

支持类型 NSString, NSDate, NSNumber, NSArray, 基本常量, SSObject及其子类

对于NSDate，如果是数字自动按照时间戳进行转换, 如果是字符串，按照提供的时间格式转换

支持数组直接序列化成对象!

##使用
```
    // 模拟网络数据
    NSDictionary * dic = @{ @"testObj": @{  @"name": @"test2",
                                            @"intValue": @(80) },
                            @"name":        @"test1",
                            @"intValue":    @"10",
                            @"value":       @{  @"key1": @"value1" },
                            @"testItems":   @[  @{ @"name": @"testName1"},
                                                @{ @"name": @"testName2"},
                                                @{ @"name": @"testName3"}]};
    // 调用
    Info * obj = [Info objectWithDictionary:dic];

    // 输出
    NSLog(@"%@", obj.intValue);
    NSLog(@"%@", obj.name);
    NSLog(@"%@", obj.testItems.firstObject.name);
    NSLog(@"%@", obj.testObj.name);
    NSLog(@"%@", obj.testObj.intValue);
    NSLog(@"%@", obj.value.key1);
```

```
    NSArray * arr = @[  @{@"name": @"testName1"},
                        @{@"name": @"testName2"},
                        @{@"name": @"testName3"}];
    
    NSArray * objItems = [InfoItems arrayWithDictionarys:arr];

    for (InfoItems *item in objItems) {
        NSLog(@"%@",item.name);
    }
    
    NSLog(@"%@",obj.dictionaryFormInfoNone);

```
