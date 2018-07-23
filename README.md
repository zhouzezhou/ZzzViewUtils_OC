# ZzzViewUtils_OC
UIView animation、alpha、color gradient 、image blur etc


### color gradient 颜色渐变

- 彩色渐变
- 黑白透明渐变
- 不规则图形渐变
- 加遮罩形成不规则图形渐变,示例为圆环的彩色渐变


### ZzzUIViewImageShow UIImageView的内容显示问题

```
// UIViewContentModeScaleToFill 缩放以显示图片里全部内容，会拉伸或压缩图片的宽高来达到要求（图片会变形）
// UIViewContentModeScaleAspectFit 缩放以显示图片里全部内容，但图片宽高比不变
// UIViewContentModeScaleAspectFill 缩放图放以填充满整个布局大小，边框上的有内容可能会显示不出来
// UIViewContentModeRedraw 按bound大小重新绘制图片，图片会变形但能填充满bound，和UIViewContentModeScaleToFill相似
// UIViewContentModeCenter 按实际像素比例显示图片的正中心
```

### ZzzUIViewBlurEffect 视图/图片模糊

4种方式达到图片模糊的效果

- 使用UIToolbar达到模糊效果
- 使用VisualEffect达到模糊效果
- 使用CoreImage达到模糊效果（非常消耗CPU和内存）
- 使用CVImage达到模糊效果


