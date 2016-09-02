<h1 align="center">XJsonObject</h1>
<br>
	<p align="center">
		<img src="https://img.shields.io/badge/version-v0.0.1-blue.svg" />
		<img src="https://img.shields.io/badge/language-OC-red.svg" />
	</p>
	<h5 align="center">Object serialization and network data parsing, automatic mapping array cost object</h5>
</br>

# Language
* [English](README.md)
* [中文](doc/README_zh.md)

##Cocoapods
```
pod 'XJsonObject'
```
##introduction
Will the Json data network request, NSDictionary, array, mapping model for the data.

To save data model object serialization into a dictionary.

##peculiarity
Achieve positive reverse mapping object, attribute type automatic judgment, use a dictionary of the corresponding key matching initialized attribute name assignment.

Support types NSString, NSDate, NSNumber, NSArray, constant, SSObject And its subclasses.

For NSDate, if the number is automatically carried out in accordance with the timestamp conversion, if it is a string, according to the provided time format conversion.

Support array object serialization into directly!

##Use
### mapping model for the data
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
###Support array object serialization into directly!
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
