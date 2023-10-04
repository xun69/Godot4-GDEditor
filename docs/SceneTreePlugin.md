文档生成时间：2023-04-20 22:44:18
## 基本信息
| 项目 | 信息 |
| --- | --- |
| 文件名 | SceneTreePlugin.gd |
| Godot版本 | 4.0.2-stable (official) |
| is_tool | true |
| extend | EditorPlugin |
| class_name | SceneTreePlugin |
| 所在项目名称 | Script++ |
| 文件路径 | res://addons/myAdd4g4/class/sub_class/SceneTreePlugin.gd |
| 绝对路径 | C:/Users/巽星石/Documents/【Godot4项目】/Script++/addons/myAdd4g4/class/sub_class/SceneTreePlugin.gd |
| 作者 | 巽星石 |

## 概述
专用于“场景”面板相关插件开发的EditorPlugin扩展类。
提供“场景”面板相关位置的引用，以及提供相关的方法，用于快速获取场景的节点结构信息，以及截图等等。
相关的继承关系如下：
![](https://cdn.nlark.com/yuque/0/2023/jpeg/8438332/1682003644709-4e26228c-ba8d-44f3-8d70-5faf132aad4e.jpeg)
## 属性
| **变量** | **类型** | **描述** |
| --- | --- | --- |
| Scene_dock | SceneTreeDock | “场景”面板 |
| scene_tree_editor | SceneTreeEditor | “场景”面板下的`SceneTreeEditor`节点，其第一个`Tree`类型的子节点即“场景”面板的`Tree`控件。 |
| Scene_dock_Tree | Tree | “场景”面板的`Tree`控件 |

### 场景面板的节点构成
```swift
SceneTreeDock:Scene     -- “场景”面板
 	┠ HBoxContainer    -- 顶部栏 -- “添加节点”、“实例化子场景”、筛选节点等所在的位置
    ┠ VBoxContainer    -- 空场景 -- “创建根节点”界面
    ┗ SceneTreeEditor  -- 非空场景 -- 场景树编辑器
    	┗ Tree      -- 场景的节点树（Tree of Nodes）
```
![](https://cdn.nlark.com/yuque/0/2023/jpeg/8438332/1682004721737-a3f5cf36-afb3-4e02-ac07-33b6629c6748.jpeg)
可以看到，Godot编辑器在不同场景切换时：

- 如果是非空场景：显示`SceneTreeEditor`，并在其内部的`Tree`控件中加载场景的节点结构
- 如果是空场景：就隐藏`SceneTreeEditor`，显示`VBoxContainer`，也就是创建根节点的那四个按钮。
## 方法
### _init() -> void
初始化方法。
### get_current_scene_nodes_dic() -> Dictionary
返回当前场景的节点结构字典。
例如，当前场景如下图：
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8438332/1682005381675-0ee32e92-dd78-44cd-be16-2b43b98877f5.png#averageHue=%23252a33&clientId=ua66a3b6a-7d08-4&from=paste&height=283&id=u081eac1a&originHeight=708&originWidth=602&originalType=binary&ratio=2.5&rotation=0&showTitle=false&size=59483&status=done&style=none&taskId=u73c4e8d3-4c1b-4309-adf2-112d7776cee&title=&width=240.8)
执行如下的`EditorScript`：
```swift
@tool
extends EditorScript

var SceneTreePlugin = preload("res://addons/myAdd4g4/class/sub_class/SceneTreePlugin.gd").new()
func _run():
	var list = SceneTreePlugin.get_current_scene_nodes_dic()
	print(JSON.stringify(list,"\t"))
```
输出：
```json
{
	"children": [
		{
			"children": [],
			"class_name": "PopupMenu",
			"name": "[插入]",
			"script_path": ""
		},
		{
			"children": [],
			"class_name": "PopupMenu",
			"name": "[导出]",
			"script_path": ""
		},
		{
			"children": [],
			"class_name": "PopupMenu",
			"name": "[创建]",
			"script_path": ""
		},
		{
			"children": [],
			"class_name": "PopupMenu",
			"name": "[对象浏览器]",
			"script_path": ""
		}
	],
	"class_name": "MenuBar",
	"name": "ScriptMenuBar",
	"scene_path": "res://addons/Script++/UIs/script_menu_bar.tscn",
	"script_path": "res://addons/Script++/UIs/script_menu_bar.gd"
}
```
### get_select_node_dic() -> Dictionary
返回当前场景选中节点的结构字典。
### get_node_structure_dic(node:Node) -> Dictionary
通过递归子节点获取节点结构信息的底层函数，由`get_current_scene_nodes_dic()`和`get_select_node_dic()` 在内部调用。
## 源代码
以下是完整源代码：
```swift
# ========================================================
# 名称：SceneTreePlugin
# 类型：插件扩展类
# 简介：专用于“场景”面板插件开发的类
# 作者：巽星石
# Godot版本：4.0.2-stable (official)
# 创建时间：2023-04-12 00:26:45
# 最后修改时间：2023年4月20日22:42:20
# ========================================================
@tool
#class_name SceneTreePlugin
extends "../GDEditor.gd"


# "场景"面板
var Scene_dock
# "场景"面板 - SceneTreeEditor
var scene_tree_editor
# "场景"面板 - 节点树 - Tree控件
var Scene_dock_Tree


func _init():
	super._init()
	Scene_dock = face_root.find_child("Scene",true,false) 
	scene_tree_editor = get_child_as_class(Scene_dock,"SceneTreeEditor")
	Scene_dock_Tree = get_child_as_class(scene_tree_editor,"Tree")


# ========================= 场景结构相关 =========================

# 返回当前场景的节点结构字典
func get_current_scene_nodes_dic() -> Dictionary:
	var dict:Dictionary = get_node_structure_dic(face.get_edited_scene_root())
	dict["scene_path"] = get_current_scene_path()
	return dict

# 返回当前场景选中节点的结构字典
func get_select_node_dic() -> Dictionary:
	var dict:Dictionary = get_node_structure_dic(get_current_scene_select())
	dict["scene_path"] = get_current_scene_path()
	return dict

# ========================= 底层函数 =========================
func get_node_structure_dic(node:Node) -> Dictionary:
	var dic = {}
	dic["name"] = node.name
	dic["class_name"] = node.get_class()
	dic["script_path"] = node.get_script().resource_path if node.get_script() else ""
	# 遍历子节点
	var childs = node.get_children()
	dic["children"] = []
	for child in childs:
		dic["children"].append(get_node_structure_dic(child))
	return dic
```
