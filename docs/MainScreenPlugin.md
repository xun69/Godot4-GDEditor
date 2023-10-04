这个类虽然扩展自`GDEditor`，但并不提供相关的方法，而是作为一个全屏插件的模板。
具体内容请参考：[创建全屏插件](https://www.yuque.com/xunwukong/frdo3b/reyrswuzuay2z2ua?view=doc_embed)
```swift
# MainScreenPlugin 类
# 方便创建主屏幕插件
# 作者：巽星石
# 创建时间：2023年4月7日20:05:22
# 最后修改时间：2023年4月7日21:36:04

@tool
extends GDEditor
class_name MainScreenPlugin

var _ui:Control
var _icon:Texture
var _title:String


func _init(ui:Control,icon:Texture,title:String):
	_ui = ui
	_icon = icon
	_title = title

func _enter_tree():
	face.get_editor_main_screen().add_child(_ui)
	_ui.visible = false

func _exit_tree():
	if _ui:_ui.queue_free()

func _has_main_screen():
	return true

func _make_visible(visible):
	if _ui:_ui.visible = visible

func _get_plugin_name():
	return _title

func _get_plugin_icon():
	return _icon

```
