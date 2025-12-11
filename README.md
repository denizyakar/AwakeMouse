# 🖱️ AwakeMouse

![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg) ![Platform](https://img.shields.io/badge/Platform-macOS%2014+-lightgrey.svg) ![Status](https://img.shields.io/badge/Status-Active-success.svg) ![License](https://img.shields.io/badge/License-MIT-blue.svg)

**AwakeMouse** is a lightweight, eye-catching, and high-performance utility tool designed to prevent your macOS device from sleeping or dimming the screen at unwanted times.

Instead of dealing with complex settings or boring terminal commands, it offers a stylish experience with its retro aesthetics that adds a touch of pixel-art charm to your desktop without draining system resources.

---

## 📸 Preview

| Idle Mode | Running Mode |
|:---:|:---:|
| <img src="[URL_TO_YOUR_IDLE_SCREENSHOT_HERE](https://github.com/denizyakar/AwakeMouse/blob/main/AwakeMouse/Screenshots/idle.png?raw=true)" width="300"> | <img src="[URL_TO_YOUR_RUNNING_SCREENSHOT_HERE](https://github.com/denizyakar/AwakeMouse/blob/main/AwakeMouse/Screenshots/running.png?raw=true)" width="300"> |

---

##  Key Features

* **Open Source Configurability:** Currently, the app focuses on simplicity and does not include a settings menu. However, since the project is open source, you can clone the code and modify the **pixel step**, **movement direction**, **frequency**, or the **sensitivity threshold** directly in the `AwakeMouseEngine.swift` file to build a version tailored to your needs.
* **Smart Threshold Detection:** The app instantly detects user interaction. When you move the mouse manually, it automatically stops the jiggler and hands control back to you.
* **Flexible Timer:** Run in "Unlimited" mode or choose a specific countdown ranging from 30 minutes to 5 hours, automatically stopping when the time is up.
* **Live Visual Feedback:**
    * **Idle:** Silent mode with a sleeping "Zzz..." animation.
    * **Active:** Working state with vibrant colors and shimmering text effects.
    * **Situational:** User can understand how to use the app by looking at the texts that have breathing animation.

---

##  Ideal Use Cases

AwakeMouse is a lifesaver in scenarios such as:

1.  📁 **Large File Downloads:** Prevent your Mac from sleeping and cutting off the connection while downloading huge files.
2.  💻 **Compiling & Rendering:** Keep the screen on for developers or designers during long processing tasks.
3.  🟢 **Online Presence:** Stay "Active" on communication apps (Teams, Slack, Discord, etc.) even when you are away from the keyboard.
4.  ✨ **Or whenever you don't want your computer to go A.F.K!**

---

## 🎨 Design Philosophy

The interface is inspired by **Minecraft and Pixel-Art** themes.

However, **no static images (PNG/JPG) were used** in this design. Every button, shadow, grid background, and toggle switch is drawn pixel-by-pixel using **pure Swift code**. This ensures the app is incredibly lightweight and looks crystal clear on any screen resolution.

---

## 🛠 Technical Infrastructure

This project adheres to modern software development principles:

* **Language & Framework:** Built entirely using **Swift** and **SwiftUI**.
* **Modern Architecture (MVVM):** Implements the **Model-View-ViewModel (MVVM)** pattern for code readability and maintainability. Business Logic and UI are completely separated.
* **System Integration:** Utilizes **AppKit** and **Core Graphics** libraries for low-level mouse event handling.
* **Performance:** Optimized using Apple's new `@Observable` macro for efficient data flow with minimal resource usage.

---

## 🚀 Download & Installation

There are two ways to get started:

### 1. For Users (Recommended)
You can download the latest pre-built version from the **Releases** page:

[📥 Download Latest Version](https://github.com/denizyakar/AwakeMouse/releases)

> **⚠️ Important Setup Note:**
> Since this app is not signed with a paid Apple Developer ID, you may need to:
> 1.  **Right-click** the app and select **Open** to bypass the Gatekeeper warning.
> 2.  Go to **System Settings > Privacy & Security > Accessibility** and enable **AwakeMouse** to allow it to move your cursor.

### 2. For Developers
If you want to inspect the code, customize the algorithms, or contribute, simply clone the repo:

```bash
git clone [https://github.com/denizyakar/AwakeMouse.git](https://github.com/denizyakar/AwakeMouse.git)
