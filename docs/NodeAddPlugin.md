文档生成时间：2023-04-20 22:49:11
## 基本信息
| **项目** | **信息** |
| --- | --- |
| 文件名 | NodeAddPlugin.gd |
| Godot版本 | 4.0.2-stable (official) |
| is_tool | true |
| extend | EditorPlugin |
| class_name | NodeAddPlugin |
| 所在项目名称 | Script++ |
| 文件路径 | res://addons/myAdd4g4/class/sub_class/NodeAddPlugin.gd |
| 绝对路径 | C:/Users/巽星石/Documents/【Godot4项目】/Script++/addons/myAdd4g4/class/sub_class/NodeAddPlugin.gd |
| 作者 | 巽星石 |

## 概述
专用于节点添加类插件开发的EditorPlug扩展类型。相关继承关系如下：
![](https://cdn.nlark.com/yuque/0/2023/jpeg/8438332/1682003644709-4e26228c-ba8d-44f3-8d70-5faf132aad4e.jpeg)
## 变量
| **变量** | **类型** | **描述** |
| --- | --- | --- |
| AddNode_dialog | CreateDialog | Godot编辑器的“创建节点”对话框 |

## 方法
### _init() -> void
初始化。
### get_selected_node() -> Object
返回当前场景中选中的节点(选中多个时只返回第一个)。
### get_edited_scene_root() -> void
返回当前场景的根节点。
### current_scene_is_empty() -> bool
判断当前场景是否为空场景(也就是没有添加任何节点)。
### open_AddNode_dialog() -> void
返回对“场景”面板顶部“添加节点”按钮的引用。
![image.png](https://cdn.nlark.com/yuque/0/2023/png/8438332/1682003148854-74d25fd0-de42-446c-8642-34d8678eef06.png#averageHue=%232f3540&clientId=ub35db3b2-ae3f-4&from=paste&height=48&id=u7ab7cb81&originHeight=121&originWidth=540&originalType=binary&ratio=2.5&rotation=0&showTitle=false&size=16101&status=done&style=none&taskId=u41616f60-34f9-4565-8bac-cf5ca5c2962&title=&width=216)
### empty_scene_add_root(node:Node) -> void
将`node`添加为空场景根节点。
:::success
其原理为通过“创建节点”对话框先给空场景添加一个与node同类型的根节点，然后将node添加为其子节点，再调用根节点的`replace_by()`方法将根节点替换为node。
:::
### empty_scene_add_root_by_class(nodeType:String) -> void
为空场景添加指定类型为`nodeType`的根节点。
相比`empty_scene_add_root()`受限许多，但也算是节点添加类的基础和核心方法。
### select_add_child_by_class(nodeType:String) -> void
为当前场景选中节点添加对应类型为`nodeType`的子节点。
### select_add_child(node:Object) -> void
为当前场景选中节点添加子节点`node`。这个方法相比`select_add_child_by_class()`，可以更好的构造和配置子节点，甚至是添加带有结构的节点。
## 源代码
以下是完整源代码：
```swift
# ========================================================
# 名称：NodeAddPlugin
# 类型：插件扩展类
# 简介：专用于节点添加类插件开发
# 作者：巽星石
# Godot版本：4.0.2-stable (official)
# 创建时间：2023-04-20 22:42:28
# 最后修改时间：2023年4月22日17:27:18
# ========================================================

@tool
extends "SceneTreePlugin.gd"
#class_name NodeAddPlugin

# “创建节点”对话框
var AddNode_dialog

func _init():
	super._init()
	AddNode_dialog = get_child_as_class(Scene_dock,"CreateDialog")


# ---- 节点添加 ----
# 返回当前场景中选中的节点(选中多个时只返回第一个)
func get_selected_node() -> Node:
	var sels = face.get_selection().get_selected_nodes() 
	return sels[0] if sels.size() == 1 else null

# 返回当前正在编辑的场景的根节点
func get_edited_scene_root():
	return face.get_edited_scene_root()

# 判断当前场景是否为空场景(也就是没有添加任何节点)
func current_scene_is_empty() -> bool:
	return true if not get_edited_scene_root() else false

# 返回场景面板顶部“添加节点”按钮的引用
func open_AddNode_dialog():
	var addBtn:Button = get_child_by_indexPath(Scene_dock,[0,0])
	addBtn.emit_signal("pressed")

# 通过简写的节点结构字符串创建节点，并返回
func create_nodes_by_short_struct(short_struct:String):
	var levels = short_struct.split(">",false)
	var root:Node = null
	var p_node:Node = null
	for i in levels.size():
		if i == 0: # 根节点
			root = ClassDB.instantiate(levels[i])
			root.name = levels[i]
			p_node = root
		else:
			print(levels[i].find("+"))
			if levels[i].find("+") > -1: # 有并列子子节点
				var bros = levels[i].split("+",false)
				for bro in bros:
					var node = ClassDB.instantiate(bro)
					node.name = bro
					p_node.add_child(node,true)
			else:
				var node = ClassDB.instantiate(levels[i])
				node.name = levels[i]
				p_node.add_child(node,true)
				p_node = node
	return root


# 为空场景添加根节点
func empty_scene_add_root(node:Node) -> void:
	var nodeType = node.get_class()
	if current_scene_is_empty():# 当前场景为空场景
		# 新建根节点
		open_AddNode_dialog() # 打开“添加Node”对话框
		# 搜索框
		var left_Vbox = get_child_by_indexPath(AddNode_dialog,[0, 1])
		var txt:LineEdit = get_child_by_indexPath(left_Vbox,[1, 0, 0])
		txt.text = nodeType # 修改搜索关键字
		txt.emit_signal("text_changed",nodeType) # 触发“文本改变”信号
		# "创建"按钮
		AddNode_dialog.emit_signal("confirmed")# 触发“创建”按钮pressed信号
#		await face.get_tree().create_timer(0.2).timeout
		
		var pros = node.get_property_list()
		for pro in pros:
			get_edited_scene_root().set(pro["name"],node.get(pro["name"]))
		add_childrens_to_root(get_edited_scene_root(),node)

		
		
		
		
		

# 根据指定类型为空场景添加根节点
func empty_scene_add_root_by_class(nodeType:String) -> void:	
	if current_scene_is_empty():# 当前场景为空场景
		# 新建根节点
		open_AddNode_dialog() # 打开“添加Node”对话框
		# 搜索框
		var left_Vbox = get_child_by_indexPath(AddNode_dialog,[0, 1])
		var txt:LineEdit = get_child_by_indexPath(left_Vbox,[1, 0, 0])
		txt.text = nodeType # 修改搜索关键字
		txt.emit_signal("text_changed",nodeType) # 触发“文本改变”信号
		
		# "创建"按钮
		AddNode_dialog.emit_signal("confirmed")# 触发“创建”按钮pressed信号
	

# 为当前场景选中节点添加对应类型的子节点
# @param nodeType 节点类型名称，字符串
func select_add_child_by_class(nodeType:String):
	var selected_node = get_selected_node()
	if selected_node: # 存在选中节点
		if ClassDB.class_exists(nodeType):
			# 添加子节点
			var node:Node = ClassDB.instantiate(nodeType) # 按照类型名称添加节点
			node.name = nodeType
			selected_node.add_child(node,true)
			node.owner = get_edited_scene_root() # 设置owner为场景根节点
			# 选中新添加的节点
			await face.get_tree().create_timer(0.02).timeout
			var tree:Tree = Scene_dock_Tree
			var old_sel:TreeItem = tree.get_selected()
			var count = old_sel.get_child_count()
			tree.set_selected(old_sel.get_child(count-1),0)

# 为当前场景选中节点添加子节点
# 这个方法相比select_add_child_by_class，可以更好的构造和配置子节点
# 甚至是添加带有结构的节点
func select_add_child(node:Node):
	var selected_node = get_selected_node()
	if selected_node: # 存在选中节点
		selected_node.add_child(node,true)
		node.owner = get_edited_scene_root() # 设置owner为场景根节点
		set_children_owner(node,node.owner)
		# 选中新添加的节点
		await face.get_tree().create_timer(0.02).timeout
		var tree:Tree = Scene_dock_Tree
		var old_sel:TreeItem = tree.get_selected()
		var count = old_sel.get_child_count()
		tree.set_selected(old_sel.get_child(count-1),0)

# 设置node的所有子孙节点的owner
func set_children_owner(node:Node,owner:Node) -> void:
	var childs = node.get_children()
	for child in childs:
		child.owner = owner
		set_children_owner(child,owner)

# 设置node的所有子孙节点的owner
func add_childrens_to_root(p_node:Node,node:Node) -> void:
	for child in node.get_children():
		var chd = child.duplicate()
		p_node.add_child(chd,true)
		chd.owner = get_edited_scene_root()
		add_childrens_to_root(chd,child)

```
