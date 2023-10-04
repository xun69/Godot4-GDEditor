文档生成时间：2023年4月20日22:41:52
## 基本信息
| 项目 | 信息 |
| --- | --- |
| 文件名 | GDEditor.gd |
| Godot版本 | 4.0.2-stable (official) |
| is_tool | true |
| extend | EditorPlugin |
| class_name | GDEditor |
| 所在项目名称 | Script++ |
| 文件路径 | res://addons/Script++/class/GDEditor.gd |
| 绝对路径 | C:/Users/巽星石/Documents/【Godot4项目】/Script++/addons/Script++/class/GDEditor.gd |
| 作者 | 巽星石 |

## 概述
Godot 4.0版本的GDEditor，扩展自EditorPlugin，用于更方便的创建Godot的编辑器插件。
相较于Godot 3.5版本时编写的GDEditor。此版本进行了诸多优化，包括：

- 采用有限的变量来获取Godot编辑器的主要元素
- 只提供最基础和重要的几个方法
- 创建子类型用于编写更细分的代码
## 变量
| 变量 | 类型 | 描述 |
| --- | --- | --- |
| face | EditorInterface | Godot编辑器的EditorInterface |
| face_root | Window | Godot编辑器的根节点，也就是编辑器窗体本身。 |
| base_control | Panel | Godot编辑器的基础控件。 |
| editor_title_bar | HBoxContainer | Godot编辑器的顶栏，包括菜单，编辑器切换按钮，场景运行按钮等
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8438332/1681901733207-3b6cd424-d36f-4e74-836a-136adfdb2154.png#averageHue=%23262c34&clientId=u7b1d57f2-d4a4-4&from=paste&height=26&id=u67918a3a&originHeight=64&originWidth=2051&originalType=binary&ratio=2.5&rotation=0&showTitle=false&size=40270&status=done&style=none&taskId=ua931446a-ff0e-4efd-b1c6-08c724101c1&title=&width=820.4) |
| top_menu_bar | MenuBar | Godot编辑器的顶部菜单栏：![image.png](https://cdn.nlark.com/yuque/0/2023/png/8438332/1681901705645-27b8ea9f-b72b-4676-bdf8-108596364fd5.png#averageHue=%232c3138&clientId=u7b1d57f2-d4a4-4&from=paste&height=26&id=uab1836ba&originHeight=65&originWidth=456&originalType=binary&ratio=2.5&rotation=0&showTitle=false&size=15481&status=done&style=none&taskId=ua8a606c1-d7c7-4e09-ba3e-93db8ce42ca&title=&width=182.4) |
| scenes_tabbar | TabBar | Godot编辑器的场景切换选项卡
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8438332/1681901573005-cd81f93a-a44f-4756-b07b-3e3f6d46ea6e.png#averageHue=%232c333e&clientId=u7b1d57f2-d4a4-4&from=paste&height=36&id=ub4bdc022&originHeight=91&originWidth=685&originalType=binary&ratio=2.5&rotation=0&showTitle=false&size=13765&status=done&style=none&taskId=u45da7e7b-6294-427c-b7a7-6c0e1a2fb15&title=&width=274) |
| add_new_scene_button | Button | Godot编辑器场景切换选项卡后面的“添加新场景”按钮。
通过`add_new_scene_button.emit_signal("pressed")`可以实现新建空场景操作。 |
| focus_mode_button | Button | Godot编辑器的“专注模式”切换按钮
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8438332/1681901919766-4b9a5fab-7194-4fe3-951c-d1de45559f57.png#averageHue=%232c323d&clientId=u7b1d57f2-d4a4-4&from=paste&height=19&id=ucbca3c14&originHeight=165&originWidth=773&originalType=binary&ratio=2.5&rotation=0&showTitle=false&size=20352&status=done&style=none&taskId=u32a4ee2f-fff6-4536-9d50-9fdeb4bf304&title=&width=87) |
| main_screen_CanvasItemEditor | null | Godot的2D场景编辑器CanvasItemEditor |
| main_screen_Node3DEditor | null | Godot的3D场景编辑器Node3DEditor |
| main_screen_ScriptEditor | null | Godot的脚本编辑器ScriptEditor |
| main_screen_EditorAssetLibrary | null | Godot的资产库EditorAssetLibrary |
| ScriptEditor_TabContainer | TabContainer | Godot脚本编辑器隐含的TabContainer，用于脚本的切换和增删，以及获取更底层的元素 |
| ScriptEditor_topbar | HBoxContainer | Godot脚本编辑器界面的顶部栏。
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8438332/1681902204236-e485b017-c797-4fbb-8411-dc274d4b8b6f.png#averageHue=%23333a44&clientId=u7b1d57f2-d4a4-4&from=paste&height=51&id=u6e040457&originHeight=128&originWidth=1397&originalType=binary&ratio=2.5&rotation=0&showTitle=false&size=50062&status=done&style=none&taskId=uee115c6f-2d17-4072-b567-ebe72c3123e&title=&width=558.8) |
| ScriptEditor_R_vbox | VBoxContainer | 脚本编辑器右侧区域的VBox，也就是脚本编辑框所处的VBox |
| ScriptEditor_LU_Vbox | VBoxContainer | 脚本编辑器左上角VBox，也就是脚本列表所处的VBox |
| ScriptEditor_LB_Vbox | VBoxContainer | 脚本编辑器左下角VBox，也就是方法列表所处的VBox |

## 方法
### _init() -> void
GDEditor的构造函数，用于在初始化时，获取Godot编辑器的界面元素，并实际赋值给全局变量进行存储。
### get_current_scene_select() -> Object
返回当前场景的选中节点，且仅返回所选节点中的第一个。
### get_current_scene_path() -> String
返回当前场景的文件路径。
### get_child_by_indexPath(node:Object,indexPath:PackedInt32Array) -> Object
通过indexPath指定的层级索引，查找并返回node的后代节点。
例如:
```swift
get_child_by_indexPath(Lab1,[0,0])
```
返回Lab1节点第一个子节点的第一个子节点。
### get_child_as_class(node:Object,className:String) -> void
返回node对应类名的一级子节点。
例如：
```swift
get_child_as_class(Lab1,"TextEdit")
```
返回Lab1节点下类名为"TextEdit"的第一个控件。
### get_icon(classType:String) -> Object
获取`classType`类型的图标。
例如：
```swift
@tool
extends EditorScript
var GDEditor = preload("res://addons/Script++/class/GDEditor.gd").new()

func _run():
	get_scene().texture = GDEditor.get_icon("Label")
```
上面的代码将`Label`类型的图标，赋值给当前打开场景的根节点`TextureRect`的`texture`属性。
效果如下：
![TextureRect显示的是Label类型的图标](https://cdn.nlark.com/yuque/0/2023/png/8438332/1681903103233-22612f71-d223-4cff-8af6-4d823df4fd8b.png#averageHue=%237acc84&clientId=u7b1d57f2-d4a4-4&from=paste&height=198&id=uf72c66b9&originHeight=494&originWidth=1017&originalType=binary&ratio=2.5&rotation=0&showTitle=true&size=54830&status=done&style=none&taskId=ua7d927d6-365a-4087-8c75-e4e1b74a2f8&title=TextureRect%E6%98%BE%E7%A4%BA%E7%9A%84%E6%98%AFLabel%E7%B1%BB%E5%9E%8B%E7%9A%84%E5%9B%BE%E6%A0%87&width=406.8 "TextureRect显示的是Label类型的图标")
### save_class_icon_to_png(calssType:String,save_path:String,size:Vector2) -> void
获取名为calssType的内部类型的图标，并将其以size所指定的尺寸，保存到save_path所指定的位置。
例如：
```swift
@tool
extends EditorScript
var GDEditor = preload("res://addons/Script++/class/GDEditor.gd").new()


func _run():
	GDEditor.save_class_icon_to_png("Label","res://Label.png",Vector2(30,30))
```
上面的代码将`Label`类型的图标以30×30像素的尺寸，保存到`res://`目录下，名称为`Label.png`。
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8438332/1681903715245-4133442d-74bd-4f3f-9057-62c180e22fbf.png#averageHue=%23313f4e&clientId=u7b1d57f2-d4a4-4&from=paste&height=34&id=ua35aa967&originHeight=85&originWidth=392&originalType=binary&ratio=2.5&rotation=0&showTitle=false&size=7374&status=done&style=none&taskId=u6872bac6-288c-4bd0-9440-f33e056e50c&title=&width=156.8)
### Now() -> String
返回当前日期时间字符串。形如：`YYYY-MM-DD HH:MM:SS`。
### engine_version() -> String
返回引擎当前版本信息。
```swift
@tool
extends EditorScript
var GDEditor = preload("res://addons/Script++/class/GDEditor.gd").new()


func _run():
	print(GDEditor.engine_version())
```
输出：
```swift
4.0.2-stable (official)
```
### get_file_sys_dock_current_dir() -> String
返回"文件系统"面板当前选中文件所在的文件夹的路径。

- 如果选中文件夹，则返回其自身的路径
- 如果选中文件夹下的子文件，也返回这个文件夹的路径。

例如，以下两种情况下，`get_file_sys_dock_current_dir()`返回的都是“res://addons/Script++/”。
![返回：“res://addons/Script++/”](https://cdn.nlark.com/yuque/0/2023/png/8438332/1681904001504-3b814b3b-852d-4bc9-b154-26fe2e4ef97d.png#averageHue=%2329303a&clientId=u7b1d57f2-d4a4-4&from=paste&height=369&id=ufb215312&originHeight=923&originWidth=775&originalType=binary&ratio=2.5&rotation=0&showTitle=true&size=105450&status=done&style=none&taskId=u163af52b-a8ff-48cd-a8da-0597eb51608&title=%E8%BF%94%E5%9B%9E%EF%BC%9A%E2%80%9Cres%3A%2F%2Faddons%2FScript%2B%2B%2F%E2%80%9D&width=310 "返回：“res://addons/Script++/”")![返回：“res://addons/Script++/”](https://cdn.nlark.com/yuque/0/2023/png/8438332/1681904014795-0c7961dd-c473-4456-bb3e-7f2ba8eb00a2.png#averageHue=%2328303a&clientId=u7b1d57f2-d4a4-4&from=paste&height=367&id=u3beb16c1&originHeight=917&originWidth=756&originalType=binary&ratio=2.5&rotation=0&showTitle=true&size=101137&status=done&style=none&taskId=uaec98398-7de9-4f0f-a80c-bda33782483&title=%E8%BF%94%E5%9B%9E%EF%BC%9A%E2%80%9Cres%3A%2F%2Faddons%2FScript%2B%2B%2F%E2%80%9D&width=302.4 "返回：“res://addons/Script++/”")
### update_file_sys_dock() -> void
文件系统面板执行更新。用于在通过代码或插件中创建文件或文件夹后更新文件系统面板，让其显示新建的文件或文件夹。
### edit_resource(file_path:String) -> void
编辑file_path指定的资源，如果是纯文本则用内部编辑器打开。
### edit_node(node:Node) -> void
编辑指定的节点。
### change_to_mainscreen(mainscreen_name:String) -> void
切换至名为`mainscreen_name`的主屏幕。
## 源代码
以下是完整源代码：
```swift
# ========================================================
# 名称：GDEditor - Godot4.0版
# 类型：
# 简介：扩展的编辑器插件开发类，可用于更好更快的开发编辑器插件
# 此版本另辟蹊径，简化了很多代码，只提供一些基础的界面元素引用和函数
# 更多的EditorPlugin、EditorInterFace、CodeEdit的函数将不再重复映射
# 作者：巽星石
# Godot版本：4.0.2-stable (official)
# 创建时间：2023年4月2日19:16:57
# 最后修改时间：2023年4月20日22:37:41
# ========================================================



@tool
extends EditorPlugin
#class_name GDEditor

## 返回对EditorInterface的引用
var face:EditorInterface
## 返回EditorInterface.get_tree().root
var face_root:Window
## 返回EditorInterface.get_base_control()
var base_control:Panel
## 返回对编辑器顶部栏的引用
var editor_title_bar:HBoxContainer
## 返回对编辑器顶部菜单栏的引用
var top_menu_bar:MenuBar

var scenes_tabbar:TabBar
var add_new_scene_button:Button
var focus_mode_button:Button



## 返回对2D场景编辑器界面的引用。[br]
## [method EditorPlugin.add_control_to_container]提供了2D场景编辑器的几个位点，更建议使用。
## 提供的位点可参考：[enum EditorPlugin.CustomControlContainer]。
var main_screen_CanvasItemEditor

## 返回对3D场景编辑器界面的引用。[br]
## EditorPlugin的add_control_to_container()提供了3D场景编辑器的几个位点，更建议使用。
var main_screen_Node3DEditor

## 返回对脚本编辑器界面的引用。[br]
## EditorPlugin以及EditorInterface对脚本编辑器位点的引用支持较弱，因此也是本扩展类重点编写的部分。[br]
## 请查看本类提供的相关属性和方法，并使用他们来创建你的脚本相关插件。
var main_screen_ScriptEditor

## 返回对AssetLib界面的引用。
var main_screen_EditorAssetLibrary

## 返回 - 脚本编辑器界面 - 管理和显示多个脚本以及帮助文档的TabContainer控件。[br]
## 通过它你可以获得当前打开的脚本或者帮助的索引等信息。
var ScriptEditor_TabContainer:TabContainer

## 返回 - 脚本编辑器界面 - 顶部栏的HBoxContainer。
## 包括脚本菜单部分和其他按钮部分。
var ScriptEditor_topbar:HBoxContainer

var ScriptEditor_R_vbox:VBoxContainer  # 脚本编辑器右侧VBox - 脚本编辑框
var ScriptEditor_LU_Vbox:VBoxContainer # 脚本编辑器左上角VBox - 脚本列表
var ScriptEditor_LB_Vbox:VBoxContainer # 脚本编辑器左上角VBox - 方法列表


func _init():
	# 初始化部分界面元素引用
	face = get_editor_interface()
	face_root = face.get_tree().root
	base_control = face.get_base_control()
	
	var base_vbox:VBoxContainer = get_child_as_class(base_control,"VBoxContainer")
	
	editor_title_bar = get_child_as_class(base_vbox,"EditorTitleBar")
	top_menu_bar = editor_title_bar.get_child(0)
	
	var main_vbox:VBoxContainer = get_child_by_indexPath(base_vbox,[1, 1, 1, 0])
	scenes_tabbar = get_child_by_indexPath(main_vbox,[0, 0, 0, 0, 0, 0])
	add_new_scene_button = get_child_by_indexPath(main_vbox,[0, 0, 0, 0, 0, 0, 0])
	focus_mode_button = get_child_by_indexPath(main_vbox,[0, 0, 0, 0, 0, 3])
	
	var main_screen = get_child_by_indexPath(main_vbox,[0, 0, 0, 1, 0])
	
	main_screen_CanvasItemEditor = get_child_as_class(main_screen,"CanvasItemEditor")
	main_screen_Node3DEditor = get_child_as_class(main_screen,"Node3DEditor")
	main_screen_ScriptEditor = face.get_script_editor()
	main_screen_EditorAssetLibrary = get_child_as_class(main_screen,"EditorAssetLibrary")
	
	ScriptEditor_LU_Vbox = get_child_by_indexPath(main_screen_ScriptEditor,[0, 1, 0, 0])
	ScriptEditor_LB_Vbox = get_child_by_indexPath(main_screen_ScriptEditor,[0, 1, 0, 1])
	
	ScriptEditor_R_vbox = get_child_by_indexPath(main_screen_ScriptEditor,[0, 1, 1])
	ScriptEditor_topbar = get_child_by_indexPath(main_screen_ScriptEditor,[0, 0])
	ScriptEditor_TabContainer = get_child_as_class(ScriptEditor_R_vbox,"TabContainer")


# 返回当前场景的选中节点
func get_current_scene_select() -> Node:
	return face.get_selection().get_selected_nodes()[0] if face.get_selection().get_selected_nodes().size() >0 else null



# 返回当前场景的路径
func get_current_scene_path() -> String:
	var arr = face.get_open_scenes()
	return arr[scenes_tabbar.current_tab]

## 通过indexPath指定的层级索引，查找并返回node的后代节点。
## 例如:[code]get_child_by_indexPath(Lab1,[0,0])[/code]返回Lab1节点第一个子节点的第一个子节点。
func get_child_by_indexPath(node:Node,indexPath:PackedInt32Array) -> Node:
	for idx in indexPath:
		var nd = node.get_child(idx)
		node = nd
	return node	

## 返回node对应类名的一级子节点。
## 例如：[code]get_child_as_class(Lab1,"TextEdit")[/code]返回Lab1节点下类名为"TextEdit"的第一个控件。
func get_child_as_class(node:Node,className:String):
	var children = node.get_children()
	for child in children:
		if child.get_class() == className:
			return child

# =================================== 辅助函数 ===================================
# 获取classType类型的图标
func get_icon(classType:String) -> Texture2D:
	return base_control.get_theme_icon(classType, "EditorIcons")

# 将classType类型的图标保存到save_path
func save_class_icon_to_png(calssType:String,save_path:String,size := Vector2(20,20)) -> void:
	var icon:Texture2D = get_icon(calssType)
	var img = icon.get_image()
	# 图标尺寸缩小为20×20
	img.resize(size.x,size.y,Image.INTERPOLATE_NEAREST)
	img.save_png(save_path)
	update_file_sys_dock()

# 返回当前日期时间字符串
# 形如： YYYY-MM-DD HH:MM:SS
static func Now() -> String:
	return Time.get_datetime_string_from_system(false,true).replace("T"," ")

# 返回引擎当前版本信息
static func engine_version() ->String:
	return Engine.get_version_info()["string"]

# 返回"文件系统"面板当前选中文件所在的文件夹的路径
# 如果选中文件夹，则返回其自身的路径
func get_file_sys_dock_current_dir() -> String:
	return face.get_current_directory()

# 文件系统面板执行更新
func update_file_sys_dock():
	face.get_resource_filesystem().scan() 

# 编辑file_path指定的资源
# 如果是纯文本则用内部编辑器打开
func edit_resource(file_path:String):
	face.edit_resource(load(file_path))

# 编辑file_path指定的资源
# 如果是纯文本则用内部编辑器打开
func edit_node(node:Node):
	face.edit_node(node)

# 切换主屏幕
func change_to_mainscreen(mainscreen_name:String) -> void:
	face.set_main_screen_editor(mainscreen_name)
```
