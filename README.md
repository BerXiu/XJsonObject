<h1 align="center">XJsonObject</h1>
<br>
	<p align="center">
		<img src="https://img.shields.io/badge/version-v0.0.1-blue.svg" />
		<img src="https://img.shields.io/badge/language-OC-red.svg" />
	</p>
	<h5 align="center">对象序列化和网络数据解析，自动将数组映射成本地对象</h5>
</br>

##CocoaPods
```
pod 'XJsonObject'
```

##Usage

#####Create Rounding Image
```
	UIImageView *roundingImage = [[UIImageView alloc]initWithRoundingRectImageView];
	roundingImage.image = [UIImage imageNamed:@"testImage"];
	[roundingImage setFrame:CGRectMake(centerX - 120, centerY - 120, 100, 100)];
	[self.view addSubview:roundingImage];
```

#####set the coustom ConrnerRadius
```
    UIImageView *cornerRadius = [[UIImageView alloc]initCornerRadius:25 type: UIRectCornerTopLeft | UIRectCornerBottomRight];
    cornerRadius.image = [UIImage imageNamed:@"testImage"];
    [cornerRadius setFrame:CGRectMake(centerX - 120, centerY + 20, 100, 100)];
    [self.view addSubview:cornerRadius];
```

#####set the borderWidth and borderColor
```
	[roundingImage x_setBorderWidth:5 borderColor:[UIColor orangeColor]];
```
