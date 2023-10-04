文档生成时间：2023-04-19 23:48:52
## 基本信息
| **项目** | **信息** |
| --- | --- |
| 文件名 | SysDialogPlugin.gd |
| Godot版本 | 4.0.2-stable (official) |
| is_tool | false |
| extend | EditorPlugin |
| class_name | SysDialogPlugin |
| 所在项目名称 | Script++ |
| 文件路径 | res://addons/Script++/class/sub_class/SysDialogPlugin.gd |
| 绝对路径 | C:/Users/巽星石/Documents/【Godot4项目】/Script++/addons/Script++/class/sub_class/SysDialogPlugin.gd |
| 作者 | 巽星石 |

## 概述
专用于Godot编辑器自带对话框相关插件编写，提供基础的函数。
## 常量
| **常量** | **描述** |
| --- | --- |
| "SYS_DIALOG_ProjectSettingsEditor" =  0  | 项目设置对话框 |
| "SYS_DIALOG_ProjectExportDialog" =  1  | 项目导出对话框 |
| "SYS_DIALOG_EditorSettingsDialog"= 2  | 编辑器设置对话框

 |

## 方法
### show_dialog(dlg_type:int = SYS_DIALOG_ProjectSettingsEditor,size_scale:Vector2 = Vector2(0.6,0.8)) -> void
显示系统对话框，默认参数将显示“项目”设置对话框。
例如：
```swift
@tool
extends EditorScript

var dlg = SysDialogPlugin.new()

func _run():
	dlg.show_dialog(dlg.SYS_DIALOG_EditorSettingsDialog)

```
将显示“编辑器设置”对话框。
## 源代码
以下是完整源代码：
```swift
# ========================================================
# 名称：SysDialogPlugin
# 类型：编辑器插件扩展类
# 简介：专用于Godot编辑器自带对话框相关插件编写，提供基础的函数
# 作者：巽星石
# Godot版本：4.0.2-stable (official)
# 创建时间：2023年4月12日01:26:21
# 最后修改时间：2023年4月12日01:26:21
# ========================================================
class_name SysDialogPlugin
extends "../GDEditor.gd"

enum {
    SYS_DIALOG_ProjectSettingsEditor,  # 项目设置
    SYS_DIALOG_ProjectExportDialog,    # 项目导出
    SYS_DIALOG_EditorSettingsDialog    # 编辑器设置
}

# 显示系统对话框
func show_dialog(dlg_type:int = SYS_DIALOG_ProjectSettingsEditor,size_scale:Vector2 = Vector2(0.6,0.8)) -> void:
    var dlg_type_str = ""
    match dlg_type:
        SYS_DIALOG_ProjectSettingsEditor:
            dlg_type_str = "ProjectSettingsEditor"
        SYS_DIALOG_ProjectExportDialog:
            dlg_type_str = "ProjectExportDialog"
        SYS_DIALOG_EditorSettingsDialog:
            dlg_type_str = "EditorSettingsDialog"
        
    var dlg:Window = get_child_as_class(base_control,dlg_type_str)
    dlg.popup_centered(face_root.get_visible_rect().size * size_scale)
```
