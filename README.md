# 问题记录

- Container设置圆角属性无效(实际上是被子组件的背景色挡住了)，需要设置容器的clipBehavior(类似overflow)为none以外的其他值
- 使用TextField、InkWell等组件报错，原因是这些组件属于Material组件，使用时需要嵌套Material组件或者使用Scaffold
- InkWell点击无波纹效果，原因是被InkWell的子组件背景色挡住了，使用Ink(设置样式)+InkWell(设置事件)组合解决此问题
- TextField默认高度很高，设置isCollapsed可取消默认高度，使用padding撑开高度
- 软键盘弹出界面被压缩，Scaffold组件中resizeToAvoidBottomInset属性设置为false可取消此行为