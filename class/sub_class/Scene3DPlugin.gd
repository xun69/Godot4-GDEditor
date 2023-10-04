# ========================================================
# 名称：Scene3DPlugin
# 类型：编辑器插件扩展类
# 简介：专用于3D界面相关插件编写，提供基础的函数
# 作者：巽星石
# Godot版本：4.0.2-stable (official)
# 创建时间：2023-04-12 01:38:33
# 最后修改时间：2023-04-12 01:38:33
# ========================================================
class_name Scene3DPlugin
extends "../GDEditor.gd"

# =================================== 添加控件到3D编辑器基本位置 ===================================

# 将控件添加到 - 3D场景 - 顶部菜单
func add_control_to_menu(name:String,control:Control) -> void:
	var pos = EditorPlugin.CONTAINER_SPATIAL_EDITOR_MENU
	add_control_to_container(pos,control)
	
# 将控件添加到 - 3D场景 - 左侧
func add_control_to_left(name:String,control:Control) -> void:
	var pos = EditorPlugin.CONTAINER_SPATIAL_EDITOR_SIDE_LEFT
	add_control_to_container(pos,control)

# 将控件添加到 - 3D场景 - 右侧
func add_control_to_right(name:String,control:Control) -> void:
	var pos = EditorPlugin.CONTAINER_SPATIAL_EDITOR_SIDE_RIGHT
	add_control_to_container(pos,control)

# 将控件添加到 - 3D场景 - 底部
func add_control_to_bottom(name:String,control:Control) -> void:
	var pos = EditorPlugin.CONTAINER_SPATIAL_EDITOR_BOTTOM
	add_control_to_container(pos,control)
