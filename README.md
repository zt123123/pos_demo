# 项目截图

![截图1](https://si.geilicdn.com/img-7e790000018dd56677960a22d30f-unadjust_2302_1092.png)

![截图2](https://si.geilicdn.com/img-7b050000018dd56677970a231447-unadjust_2302_1092.png)

# 知识图谱
[点我查看最新版本](https://www.processon.com/mindmap/65d6e45c64fc700e502fadfe)

![flutter知识图谱](https://si.geilicdn.com/img-4ec60000018dd5683e050a22d50c-unadjust_1772_3588.png)

# 问题记录

- Container设置圆角属性无效(实际上是被子组件的背景色挡住了)，需要设置容器的clipBehavior(类似overflow)为none以外的其他值
- 使用TextField、InkWell等组件报错，原因是这些组件属于Material组件，使用时需要嵌套Material组件或者使用Scaffold
- InkWell点击无波纹效果，原因是被InkWell的子组件背景色挡住了，使用Ink(设置样式)+InkWell(设置事件)组合解决此问题
- TextField默认高度很高，设置isCollapsed可取消默认高度，使用padding撑开高度
- 软键盘弹出界面被压缩，Scaffold组件中resizeToAvoidBottomInset属性设置为false可取消此行为
- 内容超出页面默认不会滚动，会产生一个错误警告，使用SingleChildScrollView包裹解决
- 自定义TextField的prefix组件，未聚焦时不显示，聚焦以后才显示，原因未知，暂未解决
- Expanded组件嵌套自身会报错误警告，删除重复的Expanded组件即可
- Container同时设置颜色和BoxDecoration会报错，移除其一即可

- 常用组件
  - 容器类组件
    - Container 单容器组件，设置内外边距、宽高、背景、边框、圆角、阴影等样式
    - Row 多容器组件，横向排列
    - Column 多容器组件，纵向排列
    - Expanded 相当于flex为1,占据剩余内容
    - Padding 单容器组件，专门用于设置内边距的
    - SizedBox 单容器组件，可使用此来模拟内外边距
  - 内容组件
    - Image 展示图片
    - FadeInImage 增强版Image组件，可优化体验
    - Text 展示文本
    - Icon 展示图标
  - 手势组件
    - GestureDetector 点击事件
    - Ink 配合InkWell使用可抽离样式到Ink组件中
    - InkWell 可实现带有波纹效果的点击事件
  - 滚动组件
    - ListView 适用于一维列表
    - SingleChildScrollView 滚动组件