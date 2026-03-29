#!/bin/bash

function icon_map() {
  case "$1" in
  "Live")
    icon_result=":ableton:"
    ;;
  "Adobe Bridge"*)
    icon_result=":adobe_bridge:"
    ;;
  "Affinity Designer"*)
    icon_result=":affinity_designer:"
    ;;
  "Affinity Photo"*)
    icon_result=":affinity_photo:"
    ;;
  "Affinity Publisher"*)
    icon_result=":affinity_publisher:"
    ;;
  "Alacritty")
    icon_result=":alacritty:"
    ;;
  "Alfred")
    icon_result=":alfred:"
    ;;
  "Android Studio")
    icon_result=":android_studio:"
    ;;
  "App Store")
    icon_result=":app_store:"
    ;;
  "Arc")
    icon_result=":arc:"
    ;;
  "Bitwarden")
    icon_result=":bit_warden:"
    ;;
  "Brave Browser")
    icon_result=":brave_browser:"
    ;;
  "Calculator" | "Calculette")
    icon_result=":calculator:"
    ;;
  "Calendar" | "Fantastical" | "Cron" | "Notion Calendar")
    icon_result=":calendar:"
    ;;
  "Claude")
    icon_result=":claude:"
    ;;
  "Code" | "Code - Insiders")
    icon_result=":code:"
    ;;
  "Cursor")
    icon_result=":code:"
    ;;
  "ChatGPT")
    icon_result=":openai:"
    ;;
  "Chromium" | "Google Chrome" | "Google Chrome Canary")
    icon_result=":google_chrome:"
    ;;
  "DataGrip")
    icon_result=":datagrip:"
    ;;
  "Discord" | "Discord Canary" | "Discord PTB")
    icon_result=":discord:"
    ;;
  "Docker" | "Docker Desktop")
    icon_result=":docker:"
    ;;
  "Emacs")
    icon_result=":emacs:"
    ;;
  "FaceTime")
    icon_result=":face_time:"
    ;;
  "Figma")
    icon_result=":figma:"
    ;;
  "Final Cut Pro")
    icon_result=":final_cut_pro:"
    ;;
  "Finder")
    icon_result=":finder:"
    ;;
  "Firefox")
    icon_result=":firefox:"
    ;;
  "Firefox Developer Edition" | "Firefox Nightly")
    icon_result=":firefox_developer_edition:"
    ;;
  "Ghostty")
    icon_result=":ghostty:"
    ;;
  "Antigravity")
    icon_result=":code:"
    ;;
  "GitHub Desktop")
    icon_result=":git_hub:"
    ;;
  "GoLand")
    icon_result=":goland:"
    ;;
  "Home Assistant")
    icon_result=":home_assistant:"
    ;;
  "IntelliJ IDEA")
    icon_result=":idea:"
    ;;
  "Adobe Illustrator"*)
    icon_result=":illustrator:"
    ;;
  "Insomnia")
    icon_result=":insomnia:"
    ;;
  "iTerm" | "iTerm2")
    icon_result=":iterm:"
    ;;
  "KeePassXC")
    icon_result=":kee_pass_x_c:"
    ;;
  "Keynote")
    icon_result=":keynote:"
    ;;
  "kitty")
    icon_result=":kitty:"
    ;;
  "Linear")
    icon_result=":linear:"
    ;;
  "Canary Mail" | "HEY" | "Mail" | "Mailspring" | "Spark")
    icon_result=":mail:"
    ;;
  "Maps" | "Google Maps")
    icon_result=":maps:"
    ;;
  "Messages")
    icon_result=":messages:"
    ;;
  "Messenger")
    icon_result=":messenger:"
    ;;
  "Microsoft Edge")
    icon_result=":microsoft_edge:"
    ;;
  "Microsoft Excel")
    icon_result=":microsoft_excel:"
    ;;
  "Microsoft Outlook")
    icon_result=":microsoft_outlook:"
    ;;
  "Microsoft PowerPoint")
    icon_result=":microsoft_power_point:"
    ;;
  "Microsoft Teams" | "Microsoft Teams (work or school)")
    icon_result=":microsoft_teams:"
    ;;
  "Microsoft Word")
    icon_result=":microsoft_word:"
    ;;
  "MongoDB Compass"*)
    icon_result=":mongodb:"
    ;;
  "Music")
    icon_result=":music:"
    ;;
  "Neovim" | "neovim" | "nvim")
    icon_result=":neovim:"
    ;;
  "Notes")
    icon_result=":notes:"
    ;;
  "Notion")
    icon_result=":notion:"
    ;;
  "Numbers")
    icon_result=":numbers:"
    ;;
  "Obsidian")
    icon_result=":obsidian:"
    ;;
  "OBS" | "OBS Studio")
    icon_result=":obsstudio:"
    ;;
  "1Password")
    icon_result=":one_password:"
    ;;
  "OrbStack")
    icon_result=":orbstack:"
    ;;
  "Pages")
    icon_result=":pages:"
    ;;
  "Parallels Desktop")
    icon_result=":parallels:"
    ;;
  "Preview" | "Skim")
    icon_result=":pdf:"
    ;;
  "Adobe Photoshop"*)
    icon_result=":photoshop:"
    ;;
  "PhpStorm")
    icon_result=":php_storm:"
    ;;
  "Podcasts")
    icon_result=":podcasts:"
    ;;
  "Postman")
    icon_result=":postman:"
    ;;
  "PyCharm")
    icon_result=":pycharm:"
    ;;
  "Reminders")
    icon_result=":reminders:"
    ;;
  "Rider" | "JetBrains Rider")
    icon_result=":rider:"
    ;;
  "Safari" | "Safari Technology Preview")
    icon_result=":safari:"
    ;;
  "Signal")
    icon_result=":signal:"
    ;;
  "Sketch")
    icon_result=":sketch:"
    ;;
  "Slack")
    icon_result=":slack:"
    ;;
  "Spotify")
    icon_result=":spotify:"
    ;;
  "Sublime Text")
    icon_result=":sublime_text:"
    ;;
  "System Preferences" | "System Settings")
    icon_result=":gear:"
    ;;
  "Telegram")
    icon_result=":telegram:"
    ;;
  "Terminal")
    icon_result=":terminal:"
    ;;
  "Thunderbird")
    icon_result=":thunderbird:"
    ;;
  "Todoist")
    icon_result=":todoist:"
    ;;
  "Tor Browser")
    icon_result=":tor_browser:"
    ;;
  "UTM")
    icon_result=":utm:"
    ;;
  "MacVim" | "Vim" | "VimR")
    icon_result=":vim:"
    ;;
  "Vivaldi")
    icon_result=":vivaldi:"
    ;;
  "VLC")
    icon_result=":vlc:"
    ;;
  "VMware Fusion")
    icon_result=":vmware_fusion:"
    ;;
  "VSCodium")
    icon_result=":vscodium:"
    ;;
  "Warp")
    icon_result=":warp:"
    ;;
  "WebStorm")
    icon_result=":web_storm:"
    ;;
  "WeChat")
    icon_result=":wechat:"
    ;;
  "WezTerm")
    icon_result=":wezterm:"
    ;;
  *"WhatsApp"*)
    icon_result=":whats_app:"
    ;;
  "Xcode")
    icon_result=":xcode:"
    ;;
  "Zed")
    icon_result=":zed:"
    ;;
  "zoom.us")
    icon_result=":zoom:"
    ;;
  "cmux")
    icon_result=":terminal:"
    ;;
  *)
    icon_result=":default:"
    ;;
  esac
}

icon_map "$1"
echo "$icon_result"
