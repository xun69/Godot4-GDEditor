# ========================================================
# 名称：PluginManager
# 类型：静态函数库
# 简介：方便获取当前项目的插件列表，以及进行插件的启用、停用等操作
# 作者：巽星石
# Godot版本：4.0.2-stable (official)
# 创建时间：2023-04-12 00:10:16
# 最后修改时间：2023-04-12 00:10:16
# ========================================================
#class_name PluginManager
extends "../GDEditor.gd"

# 返回当前项目addons目录下的子文件夹集合
func get_plugin_name_list() -> PackedStringArray:
	var dir = "res://addons/"
	return DirAccess.get_directories_at(dir) if DirAccess.dir_exists_absolute(dir) else []

# 设置对应名称的插件是否启用
func set_plugin_enable(plugin:String,enabled:bool) -> void:
	face.set_plugin_enabled(plugin,enabled)

# 判断一个插件是否启用
func is_plugin_enable(plugin: String) -> bool:
	return face.is_plugin_enabled(plugin)
