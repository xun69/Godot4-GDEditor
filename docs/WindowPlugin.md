文档生成时间：2023-04-19 23:08:02
## 基本信息
| 项目 | 信息 |
| --- | --- |
| 文件名 | WindowPlugin.gd |
| Godot版本 | 4.0.2-stable (official) |
| is_tool | true |
| extend | EditorPlugin |
| class_name | WindowPlugin |
| 所在项目名称 | Script++ |
| 文件路径 | res://addons/Script++/class/sub_class/WindowPlugin.gd |
| 绝对路径 | C:/Users/巽星石/Documents/【Godot4项目】/Script++/addons/Script++/class/sub_class/WindowPlugin.gd |
| 作者 | 巽星石 |

## 概述
专职于创建和显示自定义窗体和对话框的类（仅用于插件发）。扩展自`GDEditor`。
## 方法
### create_window(title:String = "定义窗体", width = 500,height = 500) -> Window
创建并返回一个`Window`节点实例。
### create_file_dialog(title:String = "保存",width:int = 800,height:int = 800,dlg_mode:int = FileDialog.FILE_MODE_SAVE_FILE,access:int= FileDialog.ACCESS_RESOURCES,base_dir:String = "res://",filters:PackedStringArray = [],show_hidden:bool = false) -> FileDialog:
创建并返回一个`FileDialog`实例，默认参数，返回一个保存文件对话框。
### show_txt_window(title:String = "文本",content:String = "",width = 500,height = 500) -> Window
显示一个带有`TextEdit`控件的，专用于显示纯文本内容的窗体。
```swift
@tool
extends EditorScript

var WindowPlugin = preload("res://addons/Script++/class/sub_class/WindowPlugin.gd").new()

func _run():
	WindowPlugin.show_txt_window("文本显示","这里是一段文字")
```
效果：
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8438332/1681917746992-e1518822-6184-4155-afdf-eaf7a595b95e.png#averageHue=%23292f38&clientId=u3e500567-d837-4&from=paste&height=515&id=u9bd2ab3c&originHeight=1288&originWidth=2080&originalType=binary&ratio=2.5&rotation=0&showTitle=false&size=482734&status=done&style=none&taskId=uf5d2f854-c42c-443c-9208-1e516e50c81&title=&width=832)
### show_msg(call_back:Callable,msg:String,title:String = "提示",width = 500,height = 200) -> AcceptDialog
消息框，显示简单的提示信息。回调函数`call_back`用于处理点击“确定”按钮后的行为。
```swift
@tool
extends EditorScript

var WindowPlugin = preload("res://addons/Script++/class/sub_class/WindowPlugin.gd").new()

func _run():
	WindowPlugin.show_msg(func():
		print("已经确认消息")
	,"这是一个消息框")
```
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8438332/1681917940404-6462342c-b363-4449-a835-d276ace49da1.png#averageHue=%232c323c&clientId=u3e500567-d837-4&from=paste&height=515&id=u46beb7b7&originHeight=1288&originWidth=2080&originalType=binary&ratio=2.5&rotation=0&showTitle=false&size=507786&status=done&style=none&taskId=u277531eb-1024-4778-840d-8d5243e3950&title=&width=832)
点击“OK”后，打印输出`已经确认消息`。
### show_window_from_tscn(win_tscn:PackedScene) -> void
通过场景文件，显示窗体。
场景文件的根节点必须是`Window`或其子类型。
![需要被显示的窗体场景](https://cdn.nlark.com/yuque/0/2023/png/8438332/1681918042492-3e7deb6c-bbd9-48ed-b701-390c128164b4.png#averageHue=%234f7b3f&clientId=u3e500567-d837-4&from=paste&height=468&id=ue1fbd391&originHeight=1171&originWidth=2327&originalType=binary&ratio=2.5&rotation=0&showTitle=true&size=312053&status=done&style=none&taskId=u66336057-8aa8-46fb-8333-8fbae6688bd&title=%E9%9C%80%E8%A6%81%E8%A2%AB%E6%98%BE%E7%A4%BA%E7%9A%84%E7%AA%97%E4%BD%93%E5%9C%BA%E6%99%AF&width=930.8 "需要被显示的窗体场景")
使用案例：
```swift
var tscn = load("res://addons/Script++/UIs/object_browser.tscn")
var win = WindowPlugin.show_window_from_tscn(tscn)
```
显示后的效果：
![通过show_window_from_tscn()方法显示后的效果](https://cdn.nlark.com/yuque/0/2023/png/8438332/1681918132134-8f75eb88-9766-43a5-aee6-2d360737180e.png#averageHue=%232a313a&clientId=u3e500567-d837-4&from=paste&height=515&id=u2a6fdbd4&originHeight=1288&originWidth=2080&originalType=binary&ratio=2.5&rotation=0&showTitle=true&size=708578&status=done&style=none&taskId=u633bff13-48a0-44a9-9fa1-512bf6cdb3b&title=%E9%80%9A%E8%BF%87show_window_from_tscn%28%29%E6%96%B9%E6%B3%95%E6%98%BE%E7%A4%BA%E5%90%8E%E7%9A%84%E6%95%88%E6%9E%9C&width=832 "通过show_window_from_tscn()方法显示后的效果")
### show_input_dialog(call_back:Callable,title:String = "输入",msg:String = "请输入：",placeholder:String = "",width = 500,height = 200) -> Window
显示简单的输入对话框，回调函数`call_back`接收一个参数返回输入的文本。
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8438332/1681918303332-413b071e-6e99-4c86-a426-57593f93d99c.png#averageHue=%23292f39&clientId=u3e500567-d837-4&from=paste&height=515&id=uc0310625&originHeight=1288&originWidth=2080&originalType=binary&ratio=2.5&rotation=0&showTitle=false&size=549906&status=done&style=none&taskId=uc104b85e-1347-4512-8474-a597cdf9a23&title=&width=832)
### show_save_dialog(title:String = "保存文件",base_dir:String = "res://",filters:PackedStringArray = [],show_hidden:bool = false) -> FileDialog
显示“保存文件”对话框。
![保存对话框的实例之一：Script++的“导出HTML”对话框](https://cdn.nlark.com/yuque/0/2023/png/8438332/1681918364399-e1713465-d6e1-49e0-b544-ae7f807cb948.png#averageHue=%232c323b&clientId=u3e500567-d837-4&from=paste&height=515&id=ub7edf5b9&originHeight=1288&originWidth=2080&originalType=binary&ratio=2.5&rotation=0&showTitle=true&size=571607&status=done&style=none&taskId=u113e8d14-53c5-49fb-b04c-8185c69ab20&title=%E4%BF%9D%E5%AD%98%E5%AF%B9%E8%AF%9D%E6%A1%86%E7%9A%84%E5%AE%9E%E4%BE%8B%E4%B9%8B%E4%B8%80%EF%BC%9AScript%2B%2B%E7%9A%84%E2%80%9C%E5%AF%BC%E5%87%BAHTML%E2%80%9D%E5%AF%B9%E8%AF%9D%E6%A1%86&width=832 "保存对话框的实例之一：Script++的“导出HTML”对话框")
### show_open_single_file_dialog(title:String = "打开文件",	base_dir:String = "res://",filters:PackedStringArray = [],		show_hidden:bool = false) -> FileDialog
显示打开文件对话框。
## 源代码
以下是完整源代码：
```swift
# ========================================================
# 名称：WindowPlugin
# 类型：编辑器插件扩展类
# 简介：专职于创建和显示自定义窗体和对话框的类（仅用于插件发）
# 作者：巽星石
# Godot版本：4.0.2-stable (official)
# 创建时间：2023年4月8日12:03:06
# 最后修改时间:2023年4月19日23:06:48
# ========================================================

@tool
extends "../GDEditor.gd"
#class_name WindowPlugin

# ============================== 基础的创建和关闭窗体 

# 创建窗体
func create_window(title:String = "定义窗体", width = 500,height = 500) -> Window:
	# 创建Window实例
	var win = Window.new()
	win.initial_position = Window.WINDOW_INITIAL_POSITION_CENTER_MAIN_WINDOW_SCREEN
	win.title = title
	win.size = Vector2(width,height)
	
	
	# 处理关闭请求
	win.close_requested.connect(func ():
		win.queue_free()
	) 
	return win

# 创建并返回一个FileDialog实例
# 默认参数，返回一个保存文件对话框
func create_file_dialog(
		title:String = "保存",
		width:int = 800,
		height:int = 800,
		dlg_mode:int = FileDialog.FILE_MODE_SAVE_FILE,
		access:int= FileDialog.ACCESS_RESOURCES,
		base_dir:String = "res://",
		filters:PackedStringArray = [],
		show_hidden:bool = false,
	) -> FileDialog:
	var file_dlg = FileDialog.new()
	file_dlg.file_mode = dlg_mode
	file_dlg.access = access
	file_dlg.root_subfolder = base_dir
	file_dlg.filters = filters
	file_dlg.show_hidden_files = show_hidden
	
	file_dlg.mode = Window.MODE_WINDOWED
	file_dlg.initial_position = Window.WINDOW_INITIAL_POSITION_CENTER_MAIN_WINDOW_SCREEN
	
	file_dlg.title = title
	file_dlg.size = Vector2(width,height)
	return file_dlg

# ============================== 具体的窗体

# 显示纯文本内容的窗体
func show_txt_window(title:String = "文本",content:String = "",width = 500,height = 500) -> Window:
	# 创建Window实例
	var win = create_window(title,width,height)

	
	# 创建TextEdit
	var txt = TextEdit.new()
	txt.text = content
	win.add_child(txt)
	txt.anchors_preset = Control.PRESET_FULL_RECT
	
	# 显示
	base_control.add_child(win)
	win.show()
	
	
	# 返回Window实例自身
	return win

# 显示简单的提示信息
func show_msg(call_back:Callable,msg:String,title:String = "提示",width = 500,height = 200) -> AcceptDialog:
	var dlg = AcceptDialog.new()
	dlg.title = title
	dlg.initial_position = Window.WINDOW_INITIAL_POSITION_CENTER_MAIN_WINDOW_SCREEN
	dlg.title = title
	dlg.size = Vector2(width,height)
	dlg.dialog_text = msg
	
	dlg.close_requested.connect(func ():
		dlg.queue_free()
	)
	
	dlg.confirmed.connect(func():
		call_back.call()
	)
	
	
	# 显示
	base_control.add_child(dlg)
	dlg.show()
	
	return dlg

# 通过场景文件，显示窗体
func show_window_from_tscn(win_tscn:PackedScene):
	var win = win_tscn.instantiate()
	# 显示
	base_control.add_child(win)
	win.show()
	
	return win


# 显示简单的输入对话框
# 回调函数接收一个参数返回输入的文本
func show_input_dialog(call_back:Callable,title:String = "输入",msg:String = "请输入：",placeholder:String = "",width = 500,height = 200) -> Window:
	# 创建Window实例
	var win = create_window(title,width,height)
	win.unresizable = true
	win.exclusive = true
	win.transient = true
	
	win.close_requested.connect(func ():
		win.queue_free()
	)
	
	var vbox = VBoxContainer.new()
	
	win.add_child(vbox)
	vbox.anchors_preset = Control.PRESET_FULL_RECT
#	vbox.size_flags_horizontal = Control.SIZE_EXPAND_FILL

	
	var lab = Label.new()
	lab.text = msg
	lab.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	
	# 创建TextEdit
	var txt = LineEdit.new()
	txt.placeholder_text = placeholder
	txt.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	
	vbox.add_child(lab)
	vbox.add_child(txt)
	
	var center = CenterContainer.new()
	var hbox = HBoxContainer.new()
	center.add_child(hbox)
	
	vbox.add_child(center)
	
	var okBtn = Button.new()
	okBtn.text = "确定"
	okBtn.unique_name_in_owner = true
	okBtn.pressed.connect(func():
		win.emit_signal("close_requested")
		call_back.call(txt.text)
	)
	hbox.add_child(okBtn)
	
	
	# 显示
	base_control.add_child(win)
	win.show()
	
	return win

# ============================== 具体的文件对话框
# 显示保存文件对话框
func show_save_dialog(
		title:String = "保存文件",
		base_dir:String = "res://",
		filters:PackedStringArray = [],
		show_hidden:bool = false
	) -> FileDialog:
	var save_dlg = create_file_dialog(title)
	save_dlg.root_subfolder = base_dir
	save_dlg.filters = filters
	save_dlg.show_hidden_files = show_hidden
	
	# 显示
	base_control.add_child(save_dlg)
	save_dlg.show()
	return save_dlg

# 显示打开文件对话框
func show_open_single_file_dialog(
		title:String = "打开文件",
		base_dir:String = "res://",
		filters:PackedStringArray = [],
		show_hidden:bool = false
	) -> FileDialog:
	var open_dlg = create_file_dialog(title)
	open_dlg.file_mode = FileDialog.FILE_MODE_OPEN_FILE
	open_dlg.root_subfolder = base_dir
	open_dlg.filters = filters
	open_dlg.show_hidden_files = show_hidden
	
	
	# 显示
	base_control.add_child(open_dlg)
	open_dlg.show()
	return open_dlg
```
