# QLProcessButton
在button上加旋转菊花，原理：runtime之添加属性

### 使用
使用方法及其简单，就是一个简单的分类，把ButtonTool直接拖入你的项目。
导入```#import "UIButton+Indicator.h"```

```
#pragma mark - 直接在按钮的点击事件中调用几个对外开放的方法就行了。
- (void)loginButtonEvent:(UIButton *)sender{
    //1.单纯显示默认菊花
//    [sender showIndicator];
    
    //2.显示菊花并选择菊花颜色
//    [sender showIndicatorWithStyle:UIActivityIndicatorViewStyleGray];
    
    //3.显示菊花并定义旋转过程中的title
    [sender beginSubmitting:@"登录中"];
    
    
    //5秒后关闭菊花
    [self performSelector:@selector(hide:) withObject:sender afterDelay:5.0];
}

- (void)hide:(UIButton *)sender{
//    [sender hideIndicator];//针对 1、2 方法的关闭
    [sender endSubmitting];//针对 3 方法的关闭
}

```
### 新增按钮的未读消息
导入 `#import "UIButton+QLMessageButton.h"`
```
//按钮直接调用 就可以在按钮右上角显示小圆点
- (void)goOrderPage:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        [_navRightBtn showMessage];
    }else{
        [sender hideMessage];
    }    
}

```

### 效果图
![菊花旋转、按钮禁用交互状态](https://github.com/Lqlin-ss/QLProcessButton/blob/master/submitting按钮.png?raw=true)
![正常状态](https://github.com/Lqlin-ss/QLProcessButton/blob/master/normal按钮.png?raw=true)

