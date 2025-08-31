# Tauri Core Rust API Cheat Sheet

This cheat sheet provides a quick reference for the core Rust API in Tauri.

**Note:** R = Runtime type (usually tauri::Wry)

## Macros

| Macro | Description |
| --- | --- |
| `#[tauri::command]` | Marks a function as a command that can be called from the frontend. |
| `#[tauri::main]` | Marks the main function of the Tauri application. |
| `tauri::generate_handler!` | Generates a command handler for a list of commands. |
| `tauri::include_bytes!` | Includes a file as a byte array. |
| `tauri::include_str!` | Includes a file as a string. |

## Commands

Commands must return `Result<T, E>` where `E: std::error::Error + Send + Sync + 'static`

```rust
#[tauri::command]
fn my_command(arg: String) -> Result<String, String> {
    Ok(format!("Hello, {}", arg))
}
```

## Builder & State

```rust
tauri::Builder::default()
    .manage(MyState::default()) // State management
    .invoke_handler(tauri::generate_handler![my_command])
    .run(tauri::generate_context!())
```

**⚠️ All fallible operations return Result<T, Error> - handle errors!**

## Menu

**Module:** `tauri::menu`

**Structs:**

*   `Menu`: A window or app menu.
*   `Submenu`: A submenu.
*   `MenuItem`: A menu item.
*   `PredefinedMenuItem`: A predefined menu item.
*   `CheckMenuItem`: A check menu item.
*   `IconMenuItem`: An icon menu item.

**Key Methods on `Menu`:**

| Method | Signature | Description |
| --- | --- | --- |
| `new` | `fn new(manager: &AppHandle) -> Result<Self>` | Creates a new menu. |
| `with_items` | `fn with_items(manager: &AppHandle, items: Vec<&dyn IsMenuItem>) -> Result<Self>` | Creates a new menu with the given items. |
| `popup` | `fn popup(&self, window: Window) -> Result<()>` | Popups the menu on the given window. |
| `popup_at` | `fn popup_at(&self, window: Window, position: Position) -> Result<()>` | Popups the menu on the given window at the specified position. |

**Key Methods on `Submenu`:**

| Method | Signature | Description |
| --- | --- | --- |
| `new` | `fn new(manager: &AppHandle, text: &str, enabled: bool) -> Result<Self>` | Creates a new submenu. |
| `with_items` | `fn with_items(manager: &AppHandle, text: &str, enabled: bool, items: Vec<&dyn IsMenuItem>) -> Result<Self>` | Creates a new submenu with the given items. |

**Key Methods on `MenuItem`:**

| Method | Signature | Description |
| --- | --- | --- |
| `new` | `fn new(manager: &AppHandle, text: &str, enabled: bool, accelerator: Option<&str>) -> Result<Self>` | Creates a new menu item. |

**Key Methods on `CheckMenuItem`:**

| Method | Signature | Description |
| --- | --- | --- |
| `new` | `fn new(manager: &AppHandle, text: &str, enabled: bool, checked: bool, accelerator: Option<&str>) -> Result<Self>` | Creates a new check menu item. |
| `is_checked` | `fn is_checked(&self) -> Result<bool>` | Returns whether the menu item is checked or not. |
| `set_checked` | `fn set_checked(&self, checked: bool) -> Result<()>` | Sets whether the menu item is checked or not. |

**Key Methods on `IconMenuItem`:**

| Method | Signature | Description |
| --- | --- | --- |
| `new` | `fn new(manager: &AppHandle, text: &str, enabled: bool, icon: Option<Image>, accelerator: Option<&str>) -> Result<Self>` | Creates a new icon menu item. |

## Tray

**Module:** `tauri::tray`

**Structs:**

*   `TrayIcon`: A tray icon.
*   `TrayIconBuilder`: A builder for `TrayIcon`.

**Key Methods on `TrayIconBuilder`:**

| Method | Signature | Description |
| --- | --- | --- |
| `new` | `fn new() -> Self` | Creates a new tray icon builder. |
| `menu` | `fn menu<M: ContextMenu>(&self, menu: &M) -> Self` | Set the a menu for this tray icon. |
| `icon` | `fn icon(&self, icon: Image<'_>) -> Self` | Set an icon for this tray icon. |
| `tooltip` | `fn tooltip<S: AsRef<str>>(&self, s: S) -> Self` | Set a tooltip for this tray icon. |
| `on_menu_event` | `fn on_menu_event<F: Fn(&AppHandle<R>, MenuEvent) + Sync + Send + 'static>(&self, f: F) -> Self` | Set a handler for menu events. |
| `on_tray_icon_event` | `fn on_tray_icon_event<F: Fn(&TrayIcon<R>, TrayIconEvent) + Sync + Send + 'static>(&self, f: F) -> Self` | Set a handler for this tray icon events. |
| `build` | `fn build<M: Manager<R>>(&self, manager: &M) -> Result<TrayIcon<R>>` | Builds and adds a new `TrayIcon` to the system tray. |

**Key Methods on `TrayIcon`:**

| Method | Signature | Description |
| --- | --- | --- |
| `set_icon` | `fn set_icon(&self, icon: Option<Image<'_>>) -> Result<()>` | Sets a new tray icon. |
| `set_menu` | `fn set_menu<M: ContextMenu + 'static>(&self, menu: Option<M>) -> Result<()>` | Sets a new tray menu. |
| `set_tooltip` | `fn set_tooltip<S: AsRef<str>>(&self, tooltip: Option<S>) -> Result<()>` | Sets the tooltip for this tray icon. |

## Webview

**Module:** `tauri::webview`

**Structs:**

*   `Webview`: A webview.
*   `WebviewWindow`: A webview window.
*   `WebviewWindowBuilder`: A builder for `WebviewWindow`.

**Key Methods on `Webview`:**

| Method | Signature | Description |
| --- | --- | --- |
| `window` | `fn window(&self) -> Window<R>` | The window that is hosting this webview. |
| `eval` | `fn eval(&self, js: impl Into<String>) -> Result<()>` | Evaluates JavaScript on this window. |
| `print` | `fn print(&self) -> Result<()>` | Opens the dialog to prints the contents of the webview. |
| `url` | `fn url(&self) -> Result<Url>` | Returns the current url of the webview. |
| `navigate` | `fn navigate(&self, url: Url) -> Result<()>` | Navigates the webview to the defined url. |
| `reload` | `fn reload(&self) -> Result<()>` | Reloads the current page. |
| `open_devtools` | `fn open_devtools(&self)` | Opens the developer tools window (Web Inspector). |
| `close_devtools` | `fn close_devtools(&self)` | Closes the developer tools window (Web Inspector). |
| `is_devtools_open` | `fn is_devtools_open(&self) -> bool` | Checks if the developer tools window (Web Inspector) is opened. |
| `set_zoom` | `fn set_zoom(&self, scale_factor: f64) -> Result<()>` | Set the webview zoom level. |

## App

**Module:** `tauri::app`

**Structs:**

*   `App`: The application instance.
*   `AppHandle`: A handle to the application instance.

**Key Methods on `App` and `AppHandle`:**

| Method | Signature | Description |
| --- | --- | --- |
| `get_window` | `fn get_window(&self, label: &str) -> Option<Window>` | Get a handle to a window by its label. |
| `get_focused_window` | `fn get_focused_window(&self) -> Option<Window>` | Get a handle to the focused window. |
| `windows` | `fn windows(&self) -> HashMap<String, Window>` | Get a map of all windows. |
| `emit_all` | `fn emit_all<S: Into<String>, P: Clone + Serialize>(&self, event: S, payload: P) -> Result<()>` | Emit an event to all windows. |
| `listen_global` | `fn listen_global<F>(&self, event: impl Into<String>, handler: F) -> EventId` | Listen to a global event. |
| `once_global` | `fn once_global<F>(&self, event: impl Into<String>, handler: F) -> EventId` | Listen to a global event only once. |
| `unlisten` | `fn unlisten(&self, id: EventId)` | Unlisten to an event. |
| `exit` | `fn exit(&self, exit_code: i32)` | Exits the app. |
| `restart` | `fn restart(&self)` | Restarts the app. |

## Window

**Module:** `tauri::window`

**Struct:** `Window`

**Key Methods on `Window`:**

| Method | Signature | Description |
| --- | --- | --- |
| `label` | `fn label(&self) -> &str` | Get the window's label. |
| `emit` | `fn emit<S: Into<String>, P: Clone + Serialize>(&self, event: S, payload: P) -> Result<()>` | Emit an event to the window's webview. |
| `on_window_event` | `fn on_window_event(&self, f: impl Fn(&WindowEvent) + Send + 'static)` | Add a closure to be executed when a window event is triggered. |
| `close` | `fn close(&self) -> Result<()>` | Close the window. |
| `destroy` | `fn destroy(&self) -> Result<()>` | Destroy the window. |
| `show` | `fn show(&self) -> Result<()>` | Show the window. |
| `hide` | `fn hide(&self) -> Result<()>` | Hide the window. |
| `set_title` | `fn set_title(&self, title: &str) -> Result<()>` | Set the window title. |
| `set_fullscreen` | `fn set_fullscreen(&self, fullscreen: bool) -> Result<()>` | Set the window to fullscreen. |
| `set_size` | `fn set_size<S: Into<Size>>(&self, size: S) -> Result<()>` | Set the window size. |
| `set_position` | `fn set_position<P: Into<Position>>(&self, position: P) -> Result<()>` | Set the window position. |

## Event

**Module:** `tauri::event`

**Structs:**

*   `Event`: A Tauri event.
*   `WindowEvent`: A window-specific event.

**Key Functions:**

| Function | Signature | Description |
| --- | --- | --- |
| `listen` | `fn listen<F>(event: impl Into<String>, handler: F) -> EventId` | Listen to an event. |
| `once` | `fn once<F>(event: impl Into<String>, handler: F) -> EventId` | Listen to an event only once. |
| `unlisten` | `fn unlisten(id: EventId)` | Unlisten to an event. |
