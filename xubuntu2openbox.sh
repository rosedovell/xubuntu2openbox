#!/bin/bash

USER=rose
HOME=/home/$USER

mkdir -p $HOME/Pictures
cp wall.jpg $HOME/Pictures/

apt update
apt upgrade -y

apt remove xubuntu-core xubuntu-desktop plymouth-theme-xubuntu-logo plymouth-theme-xubuntu-text -y
apt autoremove -y

snap remove firefox
apt remove snapd -y

apt install xorg lightdm lightdm-gtk-greeter -y
systemctl enable lightdm

add-apt-repository ppa:mozillateam/ppa -y
echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' > /etc/apt/preferences.d/mozilla-firefox
apt update

apt install -y compton \
               eom \
               firefox \
	       flatpak \
               focuswriter \
	       fonts-ubuntu \
	       libreoffice \
               lxappearance \
               lxappearance-obconf \
               nitrogen\
	       openbox \
	       terminator \
	       tint2 \
	       thunar \
	       vlc \
	       vim

mkdir -p $HOME/.config/openbox
echo 'compton &
nitrogen --restore &
tint2 &' > $HOME/.config/openbox/autostart

echo '<?xml version="1.0" encoding="UTF-8"?>

<openbox_menu xmlns="http://openbox.org/"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://openbox.org/
file:///usr/share/openbox/menu.xsd">

<menu id="root-menu" label="Openbox 3">
<item label="Firefox">
<action name="Execute"><execute>firefox</execute></action>
</item>
<item label="Focuswriter">
<action name="Execute"><execute>focuswriter</execute></action>
</item>
<item label="LibreOffice Calc">
<action name="Execute"><execute>libreoffice --calc</execute></action>
</item>
<item label="LibreOffice Writer">
<action name="Execute"><execute>libreoffice --writer</execute></action>
</item>
<item label="Terminator">
<action name="Execute"><execute>terminator</execute></action>
</item>
<item label="Thunar">
<action name="Execute"><execute>thunar</execute></action>
</item>
<item label="ObConf">
<action name="Execute"><execute>obconf</execute></action>
</item>
<item label="Reconfigure">
<action name="Reconfigure" />
</item>
<item label="Restart">
<action name="Restart" />
</item>
<item label="Exit">
<action name="Exit" />
</item>
</menu>

</openbox_menu>' > $HOME/.config/openbox/menu.xml

echo '<?xml version="1.0" encoding="UTF-8"?>

<openbox_config xmlns="http://openbox.org/3.4/rc"
		xmlns:xi="http://www.w3.org/2001/XInclude">

<resistance>
  <strength>10</strength>
  <screen_edge_strength>20</screen_edge_strength>
</resistance>

<focus>
  <focusNew>yes</focusNew>
  <followMouse>no</followMouse>
  <focusLast>yes</focusLast>
  <underMouse>no</underMouse>
  <focusDelay>200</focusDelay>
  <raiseOnFocus>no</raiseOnFocus>
</focus>

<placement>
  <policy>Smart</policy>
  <center>yes</center>
  <monitor>Primary</monitor>
  <primaryMonitor>1</primaryMonitor>
</placement>

<theme>
  <name>Nightmare</name>
  <titleLayout>NLIMC</titleLayout>
  <keepBorder>yes</keepBorder>
  <animateIconify>yes</animateIconify>
  <font place="ActiveWindow">
    <name>sans</name>
    <size>8</size>
    <weight>bold</weight>
    <slant>normal</slant>
  </font>
  <font place="InactiveWindow">
    <name>sans</name>
    <size>8</size>
    <weight>bold</weight>
    <slant>normal</slant>
  </font>
  <font place="MenuHeader">
    <name>sans</name>
    <size>9</size>
    <weight>normal</weight>
    <slant>normal</slant>
  </font>
  <font place="MenuItem">
    <name>sans</name>
    <size>9</size>
    <weight>normal</weight>
    <slant>normal</slant>
  </font>
  <font place="ActiveOnScreenDisplay">
    <name>sans</name>
    <size>9</size>
    <weight>bold</weight>
    <slant>normal</slant>
  </font>
  <font place="InactiveOnScreenDisplay">
    <name>sans</name>
    <size>9</size>
    <weight>bold</weight>
    <slant>normal</slant>
  </font>
</theme>

<desktops>
  <number>4</number>
  <firstdesk>1</firstdesk>
  <names>
  </names>
  <popupTime>875</popupTime>
</desktops>

<resize>
  <drawContents>yes</drawContents>
  <popupShow>Nonpixel</popupShow>
  <popupPosition>Center</popupPosition>
  <popupFixedPosition>
    <x>10</x>
    <y>10</y>
  </popupFixedPosition>
</resize>

<margins>
  <top>0</top>
  <bottom>0</bottom>
  <left>0</left>
  <right>0</right>
</margins>

<dock>
  <position>TopLeft</position>
  <floatingX>0</floatingX>
  <floatingY>0</floatingY>
  <noStrut>no</noStrut>
  <stacking>Above</stacking>
  <direction>Vertical</direction>
  <autoHide>no</autoHide>
  <hideDelay>300</hideDelay>
  <showDelay>300</showDelay>
  <moveButton>Middle</moveButton>
</dock>

<keyboard>
  <chainQuitKey>C-g</chainQuitKey>
  <keybind key="C-A-Left">
    <action name="GoToDesktop"><to>left</to><wrap>no</wrap></action>
  </keybind>
  <keybind key="C-A-Right">
    <action name="GoToDesktop"><to>right</to><wrap>no</wrap></action>
  </keybind>
  <keybind key="C-A-Up">
    <action name="GoToDesktop"><to>up</to><wrap>no</wrap></action>
  </keybind>
  <keybind key="C-A-Down">
    <action name="GoToDesktop"><to>down</to><wrap>no</wrap></action>
  </keybind>
  <keybind key="C-S-A-Left">
    <action name="SendToDesktop"><to>left</to><wrap>no</wrap></action>
  </keybind>
  <keybind key="C-S-A-Right">
    <action name="SendToDesktop"><to>right</to><wrap>no</wrap></action>
  </keybind>
  <keybind key="S-A-Up">
    <action name="SendToDesktop"><to>up</to><wrap>no</wrap></action>
  </keybind>
  <keybind key="S-A-Down">
    <action name="SendToDesktop"><to>down</to><wrap>no</wrap></action>
  </keybind>
  <keybind key="W-F1">
    <action name="GoToDesktop"><to>1</to></action>
  </keybind>
  <keybind key="W-F2">
    <action name="GoToDesktop"><to>2</to></action>
  </keybind>
  <keybind key="W-F3">
    <action name="GoToDesktop"><to>3</to></action>
  </keybind>
  <keybind key="W-F4">
    <action name="GoToDesktop"><to>4</to></action>
  </keybind>
  <keybind key="W-d">
    <action name="ToggleShowDesktop"/>
  </keybind>

  <keybind key="W-q">
    <action name="Close"/>
  </keybind>
  <keybind key="A-Escape">
    <action name="Lower"/>
    <action name="FocusToBottom"/>
    <action name="Unfocus"/>
  </keybind>
  <keybind key="A-space">
    <action name="ShowMenu"><menu>client-menu</menu></action>
  </keybind>
  <keybind key="A-Print">
    <action name="Execute"><command>scrot -s</command></action>
  </keybind>

  <keybind key="A-Tab">
    <action name="NextWindow">
      <finalactions>
        <action name="Focus"/>
        <action name="Raise"/>
        <action name="Unshade"/>
      </finalactions>
    </action>
  </keybind>
  <keybind key="A-S-Tab">
    <action name="PreviousWindow">
      <finalactions>
        <action name="Focus"/>
        <action name="Raise"/>
        <action name="Unshade"/>
      </finalactions>
    </action>
  </keybind>
  <keybind key="C-A-Tab">
    <action name="NextWindow">
      <panels>yes</panels><desktop>yes</desktop>
      <finalactions>
        <action name="Focus"/>
        <action name="Raise"/>
        <action name="Unshade"/>
      </finalactions>
    </action>
  </keybind>

  <keybind key="W-Up">
    <action name="ToggleMaximize"/>
  </keybind>
  <keybind key="W-Left">        # HalfLeftScreen
    <action name="UnmaximizeFull"/>
    <action name="MoveResizeTo"><x>0</x><y>0</y><height>100%</height><width>50%</width></action>
  </keybind>
  <keybind key="W-Right">       # HalfRightScreen
    <action name="UnmaximizeFull"/>
    <action name="MoveResizeTo"><x>-0</x><y>0</y><height>100%</height><width>50%</width></action>
  </keybind>
  <keybind key="W-S-Left">
    <action name="DirectionalCycleWindows">
      <direction>left</direction>
    </action>
  </keybind>
  <keybind key="W-S-Up">
    <action name="DirectionalCycleWindows">
      <direction>up</direction>
    </action>
  </keybind>
  <keybind key="W-S-Down">
    <action name="DirectionalCycleWindows">
      <direction>down</direction>
    </action>
  </keybind>

  <keybind key="W-b">
    <action name="Execute">
      <command>firefox</command>
    </action>
  </keybind>
  <keybind key="W-e">
    <action name="Execute">
      <command>thunar</command>
    </action>
  </keybind>
  <keybind key="W-f">
    <action name="Execute">
      <command>focuswriter</command>
    </action>
  </keybind>
  <keybind key="W-p">
    <action name="Execute">
      <command>pavucontrol</command>
    </action>
  </keybind>
  <keybind key="W-t">
    <action name="Execute">
      <command>terminator</command>
    </action>
  </keybind>
  <keybind key="Print">
    <action name="Execute"><command>scrot</command></action>
  </keybind>
</keyboard>

<mouse>
  <dragThreshold>1</dragThreshold>
  <doubleClickTime>500</doubleClickTime>
  <screenEdgeWarpTime>400</screenEdgeWarpTime>
  <screenEdgeWarpMouse>false</screenEdgeWarpMouse>
  <context name="Frame">
    <mousebind button="A-Left" action="Press">
      <action name="Focus"/>
      <action name="Raise"/>
    </mousebind>
    <mousebind button="A-Left" action="Click">
      <action name="Unshade"/>
    </mousebind>
    <mousebind button="A-Left" action="Drag">
      <action name="Move"/>
    </mousebind>

    <mousebind button="A-Right" action="Press">
      <action name="Focus"/>
      <action name="Raise"/>
      <action name="Unshade"/>
    </mousebind>
    <mousebind button="A-Right" action="Drag">
      <action name="Resize"/>
    </mousebind> 

    <mousebind button="A-Middle" action="Press">
      <action name="Lower"/>
      <action name="FocusToBottom"/>
      <action name="Unfocus"/>
    </mousebind>

    <mousebind button="A-Up" action="Click">
      <action name="GoToDesktop"><to>previous</to></action>
    </mousebind>
    <mousebind button="A-Down" action="Click">
      <action name="GoToDesktop"><to>next</to></action>
    </mousebind>
    <mousebind button="C-A-Up" action="Click">
      <action name="GoToDesktop"><to>previous</to></action>
    </mousebind>
    <mousebind button="C-A-Down" action="Click">
      <action name="GoToDesktop"><to>next</to></action>
    </mousebind>
    <mousebind button="A-S-Up" action="Click">
      <action name="SendToDesktop"><to>previous</to></action>
    </mousebind>
    <mousebind button="A-S-Down" action="Click">
      <action name="SendToDesktop"><to>next</to></action>
    </mousebind>
  </context>

  <context name="Titlebar">
    <mousebind button="Left" action="Drag">
      <action name="Move"/>
    </mousebind>
    <mousebind button="Left" action="DoubleClick">
      <action name="ToggleMaximize"/>
    </mousebind>

    <mousebind button="Up" action="Click">
      <action name="if">
        <shaded>no</shaded>
        <then>
          <action name="Shade"/>
          <action name="FocusToBottom"/>
          <action name="Unfocus"/>
          <action name="Lower"/>
        </then>
      </action>
    </mousebind>
    <mousebind button="Down" action="Click">
      <action name="if">
        <shaded>yes</shaded>
        <then>
          <action name="Unshade"/>
          <action name="Raise"/>
        </then>
      </action>
    </mousebind>
  </context>

  <context name="Titlebar Top Right Bottom Left TLCorner TRCorner BRCorner BLCorner">
    <mousebind button="Left" action="Press">
      <action name="Focus"/>
      <action name="Raise"/>
      <action name="Unshade"/>
    </mousebind>

    <mousebind button="Middle" action="Press">
      <action name="Lower"/>
      <action name="FocusToBottom"/>
      <action name="Unfocus"/>
    </mousebind>

    <mousebind button="Right" action="Press">
      <action name="Focus"/>
      <action name="Raise"/>
      <action name="ShowMenu"><menu>client-menu</menu></action>
    </mousebind>
  </context>

  <context name="Top">
    <mousebind button="Left" action="Drag">
      <action name="Resize"><edge>top</edge></action>
    </mousebind>
  </context>

  <context name="Left">
    <mousebind button="Left" action="Drag">
      <action name="Resize"><edge>left</edge></action>
    </mousebind>
  </context>

  <context name="Right">
    <mousebind button="Left" action="Drag">
      <action name="Resize"><edge>right</edge></action>
    </mousebind>
  </context>

  <context name="Bottom">
    <mousebind button="Left" action="Drag">
      <action name="Resize"><edge>bottom</edge></action>
    </mousebind>

    <mousebind button="Right" action="Press">
      <action name="Focus"/>
      <action name="Raise"/>
      <action name="ShowMenu"><menu>client-menu</menu></action>
    </mousebind>
  </context>

  <context name="TRCorner BRCorner TLCorner BLCorner">
    <mousebind button="Left" action="Press">
      <action name="Focus"/>
      <action name="Raise"/>
      <action name="Unshade"/>
    </mousebind>
    <mousebind button="Left" action="Drag">
      <action name="Resize"/>
    </mousebind>
  </context>

  <context name="Client">
    <mousebind button="Left" action="Press">
      <action name="Focus"/>
      <action name="Raise"/>
    </mousebind>
    <mousebind button="Middle" action="Press">
      <action name="Focus"/>
      <action name="Raise"/>
    </mousebind>
    <mousebind button="Right" action="Press">
      <action name="Focus"/>
      <action name="Raise"/>
    </mousebind>
  </context>

  <context name="Icon">
    <mousebind button="Left" action="Press">
      <action name="Focus"/>
      <action name="Raise"/>
      <action name="Unshade"/>
      <action name="ShowMenu"><menu>client-menu</menu></action>
    </mousebind>
    <mousebind button="Right" action="Press">
      <action name="Focus"/>
      <action name="Raise"/>
      <action name="ShowMenu"><menu>client-menu</menu></action>
    </mousebind>
  </context>

  <context name="AllDesktops">
    <mousebind button="Left" action="Press">
      <action name="Focus"/>
      <action name="Raise"/>
      <action name="Unshade"/>
    </mousebind>
    <mousebind button="Left" action="Click">
      <action name="ToggleOmnipresent"/>
    </mousebind>
  </context>

  <context name="Shade">
    <mousebind button="Left" action="Press">
      <action name="Focus"/>
      <action name="Raise"/>
    </mousebind>
    <mousebind button="Left" action="Click">
      <action name="ToggleShade"/>
    </mousebind>
  </context>

  <context name="Iconify">
    <mousebind button="Left" action="Press">
      <action name="Focus"/>
      <action name="Raise"/>
    </mousebind>
    <mousebind button="Left" action="Click">
      <action name="Iconify"/>
    </mousebind>
  </context>

  <context name="Maximize">
    <mousebind button="Left" action="Press">
      <action name="Focus"/>
      <action name="Raise"/>
      <action name="Unshade"/>
    </mousebind>
    <mousebind button="Middle" action="Press">
      <action name="Focus"/>
      <action name="Raise"/>
      <action name="Unshade"/>
    </mousebind>
    <mousebind button="Right" action="Press">
      <action name="Focus"/>
      <action name="Raise"/>
      <action name="Unshade"/>
    </mousebind>
    <mousebind button="Left" action="Click">
      <action name="ToggleMaximize"/>
    </mousebind>
    <mousebind button="Middle" action="Click">
      <action name="ToggleMaximize"><direction>vertical</direction></action>
    </mousebind>
    <mousebind button="Right" action="Click">
      <action name="ToggleMaximize"><direction>horizontal</direction></action>
    </mousebind>
  </context>

  <context name="Close">
    <mousebind button="Left" action="Press">
      <action name="Focus"/>
      <action name="Raise"/>
      <action name="Unshade"/>
    </mousebind>
    <mousebind button="Left" action="Click">
      <action name="Close"/>
    </mousebind>
  </context>

  <context name="Desktop">
    <mousebind button="Up" action="Click">
      <action name="GoToDesktop"><to>previous</to></action>
    </mousebind>
    <mousebind button="Down" action="Click">
      <action name="GoToDesktop"><to>next</to></action>
    </mousebind>

    <mousebind button="A-Up" action="Click">
      <action name="GoToDesktop"><to>previous</to></action>
    </mousebind>
    <mousebind button="A-Down" action="Click">
      <action name="GoToDesktop"><to>next</to></action>
    </mousebind>
    <mousebind button="C-A-Up" action="Click">
      <action name="GoToDesktop"><to>previous</to></action>
    </mousebind>
    <mousebind button="C-A-Down" action="Click">
      <action name="GoToDesktop"><to>next</to></action>
    </mousebind>

    <mousebind button="Left" action="Press">
      <action name="Focus"/>
      <action name="Raise"/>
    </mousebind>
    <mousebind button="Right" action="Press">
      <action name="Focus"/>
      <action name="Raise"/>
    </mousebind>
  </context>

  <context name="Root">
    <mousebind button="Middle" action="Press">
      <action name="ShowMenu"><menu>client-list-combined-menu</menu></action>
    </mousebind> 
    <mousebind button="Right" action="Press">
      <action name="ShowMenu"><menu>root-menu</menu></action>
    </mousebind>
  </context>

  <context name="MoveResize">
    <mousebind button="Up" action="Click">
      <action name="GoToDesktop"><to>previous</to></action>
    </mousebind>
    <mousebind button="Down" action="Click">
      <action name="GoToDesktop"><to>next</to></action>
    </mousebind>
    <mousebind button="A-Up" action="Click">
      <action name="GoToDesktop"><to>previous</to></action>
    </mousebind>
    <mousebind button="A-Down" action="Click">
      <action name="GoToDesktop"><to>next</to></action>
    </mousebind>
  </context>
</mouse>

<menu>

  <file>/var/lib/openbox/debian-menu.xml</file>
  <file>menu.xml</file>
  <hideDelay>200</hideDelay>
  <middle>no</middle>
  <submenuShowDelay>100</submenuShowDelay>
  <submenuHideDelay>400</submenuHideDelay>
  <showIcons>yes</showIcons>
  <manageDesktops>yes</manageDesktops>
</menu>
</openbox_config>' > $HOME/.config/openbox/rc.xml

mkdir -p $HOME/.config/terminator
echo '[global_config]
[keybindings]
[profiles]
  [[default]]
    background_darkness = 0.90
    background_type = transparent
    cursor_color = "#aaaaaa"
    show_titlebar = False
    scrollbar_position = hidden
    scrollback_infinite = True
[layouts]
  [[default]]
    [[[window0]]]
      type = Window
      parent = ""
    [[[child1]]]
      type = Terminal
      parent = window0
[plugins]' > $HOME/.config/terminator/config

mkdir -p $HOME/.config/tint2
echo '#---- Generated by tint2conf aeaf ----
# See https://gitlab.com/o9000/tint2/wikis/Configure for 
# full documentation of the configuration options.
#-------------------------------------
# Gradients
#-------------------------------------
# Backgrounds
# Background 1: Panel
rounded = 0
border_width = 0
border_sides = TBLR
background_color = #000000 90
border_color = #000000 60
background_color_hover = #000000 90
border_color_hover = #000000 60
background_color_pressed = #000000 90
border_color_pressed = #000000 60

# Background 2: Default task, Iconified task
rounded = 4
border_width = 1
border_sides = TBLR
background_color = #777777 20
border_color = #777777 30
background_color_hover = #aaaaaa 22
border_color_hover = #eaeaea 44
background_color_pressed = #555555 4
border_color_pressed = #eaeaea 44

# Background 3: Active task
rounded = 4
border_width = 1
border_sides = TBLR
background_color = #777777 20
border_color = #ffffff 40
background_color_hover = #aaaaaa 22
border_color_hover = #eaeaea 44
background_color_pressed = #555555 4
border_color_pressed = #eaeaea 44

# Background 4: Urgent task
rounded = 4
border_width = 1
border_sides = TBLR
background_color = #aa4400 100
border_color = #aa7733 100
background_color_hover = #cc7700 100
border_color_hover = #aa7733 100
background_color_pressed = #555555 4
border_color_pressed = #aa7733 100

# Background 5: Tooltip
rounded = 1
border_width = 1
border_sides = TBLR
background_color = #222222 100
border_color = #333333 100
background_color_hover = #ffffaa 100
border_color_hover = #000000 100
background_color_pressed = #ffffaa 100
border_color_pressed = #000000 100

#-------------------------------------
# Panel
panel_items = LTSC
panel_size = 100% 30
panel_margin = 0 0
panel_padding = 2 0 2
panel_background_id = 1
wm_menu = 1
panel_dock = 0
panel_position = bottom center horizontal
panel_layer = top
panel_monitor = all
panel_shrink = 0
autohide = 0
autohide_show_timeout = 0
autohide_hide_timeout = 0.5
autohide_height = 2
strut_policy = follow_size
panel_window_name = tint2
disable_transparency = 1
mouse_effects = 1
font_shadow = 0
mouse_hover_icon_asb = 100 0 10
mouse_pressed_icon_asb = 100 0 0

#-------------------------------------
# Taskbar
taskbar_mode = single_desktop
taskbar_hide_if_empty = 0
taskbar_padding = 0 0 2
taskbar_background_id = 0
taskbar_active_background_id = 0
taskbar_name = 1
taskbar_hide_inactive_tasks = 0
taskbar_hide_different_monitor = 0
taskbar_hide_different_desktop = 0
taskbar_always_show_all_desktop_tasks = 0
taskbar_name_padding = 4 2
taskbar_name_background_id = 0
taskbar_name_active_background_id = 0
taskbar_name_font_color = #e3e3e3 100
taskbar_name_active_font_color = #ffffff 100
taskbar_distribute_size = 0
taskbar_sort_order = none
task_align = left

#-------------------------------------
# Task
task_text = 1
task_icon = 1
task_centered = 1
urgent_nb_of_blink = 100000
task_maximum_size = 150 35
task_padding = 2 2 4
task_tooltip = 1
task_thumbnail = 0
task_thumbnail_size = 210
task_font_color = #ffffff 100
task_background_id = 2
task_active_background_id = 3
task_urgent_background_id = 4
task_iconified_background_id = 2
mouse_left = toggle_iconify
mouse_middle = none
mouse_right = close
mouse_scroll_up = toggle
mouse_scroll_down = iconify

#-------------------------------------
# System tray (notification area)
systray_padding = 0 4 2
systray_background_id = 0
systray_sort = ascending
systray_icon_size = 24
systray_icon_asb = 100 0 0
systray_monitor = 1
systray_name_filter = 

#-------------------------------------
# Clock
time1_format = %H:%M
time2_format = %A %d %B
time1_timezone = 
time2_timezone = 
clock_font_color = #ffffff 100
clock_padding = 2 0
clock_background_id = 0
clock_tooltip = 
clock_tooltip_timezone = 
clock_lclick_command = 
clock_rclick_command = orage
clock_mclick_command = 
clock_uwheel_command = 
clock_dwheel_command = 

#-------------------------------------
# Battery
battery_tooltip = 1
battery_low_status = 10
battery_full_cmd = 
battery_font_color = #ffffff 100
bat1_format = 
bat2_format = 
battery_padding = 1 0
battery_background_id = 0
battery_hide = 101
battery_lclick_command = 
battery_rclick_command = 
battery_mclick_command = 
battery_uwheel_command = 
battery_dwheel_command = 
ac_connected_cmd = 
ac_disconnected_cmd = 

#-------------------------------------
# Tooltip
tooltip_show_timeout = 0.5
tooltip_hide_timeout = 0.1
tooltip_padding = 4 4
tooltip_background_id = 5
tooltip_font_color = #dddddd 100' > $HOME/.config/tint2/tint2rc

mkdir -p $HOME/.config/gtk-3.0
echo '[Settings]
gtk-theme-name=Greybird-dark
gtk-icon-theme-name=elementary-xfce-dark
gtk-font-name=Ubuntu Medium 10
gtk-cursor-theme-name=Adwaita
gtk-cursor-theme-size=0
gtk-toolbar-style=GTK_TOOLBAR_ICONS
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=1
gtk-menu-images=1
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle=hintfull
gtk-xfg-rgba=rgb' > $HOME/.config/gtk-3.0/settings.ini

mkdir -p $HOME/.config/nitrogen
echo "[xin_-1]
file=/home/$USER/Pictures/wall.jpg
mode=5
bgcolor=#000000" > $HOME/.config/nitrogen/bg-saved.cfg

echo "[geometry]
posx=0
posy=0
sizex=510
sizey=500

[nitrogen]
view=icon
recurse=true
sort=alpha
icon_caps=false
dirs=/home/$USER/Pictures;" > $HOME/.config/nitrogen/nitrogen.cfg

chown $USER:$USER $HOME/Pictures/wall.jpg
chown -R $USER:$USER $HOME/.config
