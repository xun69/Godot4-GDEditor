文档生成时间：2023-04-20 00:06:06
## 基本信息
| **项目** | **信息** |
| --- | --- |
| 文件名 | PluginManager.gd |
| Godot版本 | 4.0.2-stable (official) |
| is_tool | false |
| extend | EditorPlugin |
| class_name | PluginManager |
| 所在项目名称 | Script++ |
| 文件路径 | res://addons/Script++/class/sub_class/PluginManager.gd |
| 绝对路径 | C:/Users/巽星石/Documents/【Godot4项目】/Script++/addons/Script++/class/sub_class/PluginManager.gd |
| 作者 | 巽星石 |

## 概述
方便获取当前项目的插件列表，以及进行插件的启用、停用等操作。
## 方法
### get_plugin_name_list() -> PackedStringArray
返回当前项目`res://addons/`目录下的子文件夹名称集合。
### set_plugin_enable(plugin:String,enabled:bool) -> void
设置对应名称的插件是否启用。
### is_plugin_enable(plugin:String) -> bool
判断对应名称的插件是否启用。
## 源代码
以下是完整源代码：
```swift
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
```

 
