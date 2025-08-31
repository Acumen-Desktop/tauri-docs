# Tauri Core JS API Cheat Sheet

**Note:** This cheat sheet is designed for use without a build step. All APIs are accessed through the `window.__TAURI__` object.

**⚠️ APIs require permissions in `tauri.conf.json` capabilities array**

## Cross-Platform APIs

### Core

**Access:** `window.__TAURI__.core`

| Function | Signature | Description |
| --- | --- | --- |
| `invoke` | `async function invoke<T>(cmd: string, args?: object): Promise<T>` | Call Rust backend commands |

### App

**Access:** `window.__TAURI__.app`

| Function | Signature | Description |
| --- | --- | --- |
| `getName` | `async function getName(): Promise<string>` | Gets the application name. |
| `getVersion` | `async function getVersion(): Promise<string>` | Gets the application version. |
| `getTauriVersion` | `async function getTauriVersion(): Promise<string>` | Gets the Tauri framework version. |
| `getIdentifier` | `async function getIdentifier(): Promise<string>` | Gets the application identifier. |
| `setTheme` | `async function setTheme(theme?: 'light' \| 'dark' \| null): Promise<void>` | Sets the application's theme. |
| `getBundleType` | `async function getBundleType(): Promise<BundleType>` | Gets the application bundle type. |

### Window

**Access:** `window.__TAURI__.window`

**Class:** `Window`

*   `static async getByLabel(label: string): Promise<Window \| null>`: Gets the Window associated with the given label.
*   `static getCurrent(): Window`: Get an instance of `Window` for the current window.
*   `static async getAll(): Promise<Window[]>`: Gets a list of instances of `Window` for all available windows.
*   `static async getFocusedWindow(): Promise<Window \| null>`: Gets the focused window.

**⚠️ Returns null:** `getByLabel()`, `getFocusedWindow()` - always check before using

**Instance Methods:**

| Method | Signature | Description |
| --- | --- | --- |
| `scaleFactor` | `async function scaleFactor(): Promise<number>` | The scale factor that can be used to map physical pixels to logical pixels. |
| `innerPosition` | `async function innerPosition(): Promise<PhysicalPosition>` | The position of the top-left hand corner of the window's client area relative to the top-left hand corner of the desktop. |
| `outerPosition` | `async function outerPosition(): Promise<PhysicalPosition>` | The position of the top-left hand corner of the window relative to the top-left hand corner of the desktop. |
| `innerSize` | `async function innerSize(): Promise<PhysicalSize>` | The physical size of the window's client area. |
| `outerSize` | `async function outerSize(): Promise<PhysicalSize>` | The physical size of the entire window. |
| `isFullscreen` | `async function isFullscreen(): Promise<boolean>` | Gets the window's current fullscreen state. |
| `isMinimized` | `async function isMinimized(): Promise<boolean>` | Gets the window's current minimized state. |
| `isMaximized` | `async function isMaximized(): Promise<boolean>` | Gets the window's current maximized state. |
| `isFocused` | `async function isFocused(): Promise<boolean>` | Gets the window's current focus state. |
| `isDecorated` | `async function isDecorated(): Promise<boolean>` | Gets the window's current decorated state. |
| `isResizable` | `async function isResizable(): Promise<boolean>` | Gets the window's current resizable state. |
| `isClosable` | `async function isClosable(): Promise<boolean>` | Gets the window's native close button state. |
| `isVisible` | `async function isVisible(): Promise<boolean>` | Gets the window's current visible state. |
| `title` | `async function title(): Promise<string>` | Gets the window's current title. |
| `theme` | `async function theme(): Promise<Theme \| null>` | Gets the window's current theme. |
| `isAlwaysOnTop` | `async function isAlwaysOnTop(): Promise<boolean>` | Whether the window is configured to be always on top of other windows or not. |
| `center` | `async function center(): Promise<void>` | Centers the window. |
| `requestUserAttention` | `async function requestUserAttention(requestType: UserAttentionType \| null): Promise<void>` | Requests user attention to the window. |
| `setResizable` | `async function setResizable(resizable: boolean): Promise<void>` | Updates the window resizable flag. |
| `setEnabled` | `async function setEnabled(enabled: boolean): Promise<void>` | Enable or disable the window. |
| `isEnabled` | `async function isEnabled(): Promise<boolean>` | Whether the window is enabled or disabled. |
| `setTitle` | `async function setTitle(title: string): Promise<void>` | Sets the window title. |
| `maximize` | `async function maximize(): Promise<void>` | Maximizes the window. |
| `unmaximize` | `async function unmaximize(): Promise<void>` | Unmaximizes the window. |
| `toggleMaximize` | `async function toggleMaximize(): Promise<void>` | Toggles the window maximized state. |
| `minimize` | `async function minimize(): Promise<void>` | Minimizes the window. |
| `unminimize` | `async function unminimize(): Promise<void>` | Unminimizes the window. |
| `show` | `async function show(): Promise<void>` | Sets the window visibility to true. |
| `hide` | `async function hide(): Promise<void>` | Sets the window visibility to false. |
| `close` | `async function close(): Promise<void>` | Closes the window. |
| `destroy` | `async function destroy(): Promise<void>` | Destroys the window. |
| `setDecorations` | `async function setDecorations(decorations: boolean): Promise<void>` | Whether the window should have borders and bars. |
| `setAlwaysOnTop` | `async function setAlwaysOnTop(alwaysOnTop: boolean): Promise<void>` | Whether the window should always be on top of other windows. |
| `setAlwaysOnBottom` | `async function setAlwaysOnBottom(alwaysOnBottom: boolean): Promise<void>` | Whether the window should always be below other windows. |
| `setContentProtected` | `async function setContentProtected(protected_: boolean): Promise<void>` | Prevents the window contents from being captured by other apps. |
| `setSize` | `async function setSize(size: LogicalSize \| PhysicalSize \| Size): Promise<void>` | Resizes the window with a new inner size. |
| `setMinSize` | `async function setMinSize(size: LogicalSize \| PhysicalSize \| Size \| null \| undefined): Promise<void>` | Sets the window minimum inner size. |
| `setMaxSize` | `async function setMaxSize(size: LogicalSize \| PhysicalSize \| Size \| null \| undefined): Promise<void>` | Sets the window maximum inner size. |
| `setSizeConstraints` | `async function setSizeConstraints(constraints: WindowSizeConstraints \| null \| undefined): Promise<void>` | Sets the window inner size constraints. |
| `setPosition` | `async function setPosition(position: LogicalPosition \| PhysicalPosition \| Position): Promise<void>` | Sets the window outer position. |
| `setFullscreen` | `async function setFullscreen(fullscreen: boolean): Promise<void>` | Sets the window fullscreen state. |
| `setFocus` | `async function setFocus(): Promise<void>` | Bring the window to front and focus. |
| `setFocusable` | `async function setFocusable(focusable: boolean): Promise<void>` | Sets whether the window can be focused. |
| `setIcon` | `async function setIcon(icon: string \| Image \| Uint8Array \| ArrayBuffer \| number[]): Promise<void>` | Sets the window icon. |
| `setCursorGrab` | `async function setCursorGrab(grab: boolean): Promise<void>` | Grabs the cursor, preventing it from leaving the window. |
| `setCursorVisible` | `async function setCursorVisible(visible: boolean): Promise<void>` | Modifies the cursor's visibility. |
| `setCursorIcon` | `async function setCursorIcon(icon: CursorIcon): Promise<void>` | Modifies the cursor icon of the window. |
| `setCursorPosition` | `async function setCursorPosition(position: LogicalPosition \| PhysicalPosition \| Position): Promise<void>` | Changes the position of the cursor in window coordinates. |
| `setIgnoreCursorEvents` | `async function setIgnoreCursorEvents(ignore: boolean): Promise<void>` | Changes the cursor events behavior. |
| `startDragging` | `async function startDragging(): Promise<void>` | Starts dragging the window. |
| `startResizeDragging` | `async function startResizeDragging(direction: ResizeDirection): Promise<void>` | Starts resize-dragging the window. |
| `setProgressBar` | `async function setProgressBar(state: ProgressBarState): Promise<void>` | Sets the taskbar progress state. |
| `setTheme` | `async function setTheme(theme?: Theme \| null): Promise<void>` | Set window theme. |

**Size types:** `LogicalSize = {width, height}` or `PhysicalSize = {width, height, type: 'Physical'}`
**Position types:** `LogicalPosition = {x, y}` or `PhysicalPosition = {x, y, type: 'Physical'}`

### Event

**Access:** `window.__TAURI__.event`

| Function | Signature | Description |
| --- | --- | --- |
| `listen` | `async function listen<T>(event: EventName, handler: EventCallback<T>, options?: Options): Promise<UnlistenFn>` | Listen to an emitted event to any target. |
| `once` | `async function once<T>(event: EventName, handler: EventCallback<T>, options?: Options): Promise<UnlistenFn>` | Listens once to an emitted event to any target. |
| `emit` | `async function emit<T>(event: string, payload?: T): Promise<void>` | Emits an event to all targets. |
| `emitTo` | `async function emitTo<T>(target: EventTarget \| string, event: string, payload?: T): Promise<void>` | Emits an event to all targets matching the given target. |

### Path

**Access:** `window.__TAURI__.path`

| Function | Signature | Description |
| --- | --- | --- |
| `appConfigDir` | `async function appConfigDir(): Promise<string>` | Returns the path to the suggested directory for your app's config files. |
| `appDataDir` | `async function appDataDir(): Promise<string>` | Returns the path to the suggested directory for your app's data files. |
| `appLocalDataDir` | `async function appLocalDataDir(): Promise<string>` | Returns the path to the suggested directory for your app's local data files. |
| `appCacheDir` | `async function appCacheDir(): Promise<string>` | Returns the path to the suggested directory for your app's cache files. |
| `appLogDir` | `async function appLogDir(): Promise<string>` | Returns the path to the suggested directory for your app's log files. |
| `audioDir` | `async function audioDir(): Promise<string>` | Returns the path to the user's audio directory. |
| `cacheDir` | `async function cacheDir(): Promise<string>` | Returns the path to the user's cache directory. |
| `configDir` | `async function configDir(): Promise<string>` | Returns the path to the user's config directory. |
| `dataDir` | `async function dataDir(): Promise<string>` | Returns the path to the user's data directory. |
| `desktopDir` | `async function desktopDir(): Promise<string>` | Returns the path to the user's desktop directory. |
| `documentDir` | `async function documentDir(): Promise<string>` | Returns the path to the user's document directory. |
| `downloadDir` | `async function downloadDir(): Promise<string>` | Returns the path to the user's download directory. |
| `executableDir` | `async function executableDir(): Promise<string>` | Returns the path to the user's executable directory. |
| `fontDir` | `async function fontDir(): Promise<string>` | Returns the path to the user's font directory. |
| `homeDir` | `async function homeDir(): Promise<string>` | Returns the path to the user's home directory. |
| `localDataDir` | `async function localDataDir(): Promise<string>` | Returns the path to the user's local data directory. |
| `pictureDir` | `async function pictureDir(): Promise<string>` | Returns the path to the user's picture directory. |
| `publicDir` | `async function publicDir(): Promise<string>` | Returns the path to the user's public directory. |
| `resourceDir` | `async function resourceDir(): Promise<string>` | Returns the path to the application's resource directory. |
| `resolveResource` | `async function resolveResource(resourcePath: string): Promise<string>` | Resolve the path to a resource file. |
| `runtimeDir` | `async function runtimeDir(): Promise<string>` | Returns the path to the user's runtime directory. |
| `templateDir` | `async function templateDir(): Promise<string>` | Returns the path to the user's template directory. |
| `videoDir` | `async function videoDir(): Promise<string>` | Returns the path to the user's video directory. |
| `tempDir` | `async function tempDir(): Promise<string>` | Returns a temporary directory. |
| `sep` | `function sep(): string` | Returns the platform-specific path segment separator. |
| `delimiter` | `function delimiter(): string` | Returns the platform-specific path segment delimiter. |
| `resolve` | `async function resolve(...paths: string[]): Promise<string>` | Resolves a sequence of `paths` or `path` segments into an absolute path. |
| `normalize` | `async function normalize(path: string): Promise<string>` | Normalizes the given `path`, resolving `'..'` and `'.'` segments and resolve symbolic links. |
| `join` | `async function join(...paths: string[]): Promise<string>` | Joins all given `path` segments together using the platform-specific separator as a delimiter, then normalizes the resulting path. |
| `dirname` | `async function dirname(path: string): Promise<string>` | Returns the parent directory of a given `path`. |
| `extname` | `async function extname(path: string): Promise<string>` | Returns the extension of the `path`. |
| `basename` | `async function basename(path: string, ext?: string): Promise<string>` | Returns the last portion of a `path`. |
| `isAbsolute` | `async function isAbsolute(path: string): Promise<boolean>` | Returns whether the path is absolute or not. |

### Shell

**Access:** `window.__TAURI__.shell`

| Function | Signature | Description |
| --- | --- | --- |
| `open` | `async function open(path: string, with?: string): Promise<void>` | Opens a path or URL with the system's default app, or opens a file with a specific program. |
| `execute` | `async function execute(program: string, args?: string \| string[], options?: SpawnOptions): Promise<ChildProcessOutput>` | Executes a command. |
| `spawn` | `async function spawn(program: string, args?: string \| string[], options?: SpawnOptions): Promise<Child>` | Spawns a command. |
| `executeSidecar` | `async function executeSidecar(program: string, args?: string \| string[], options?: SpawnOptions): Promise<ChildProcessOutput>` | Executes a sidecar program. |
| `spawnSidecar` | `async function spawnSidecar(program: string, args?: string \| string[], options?: SpawnOptions): Promise<Child>` | Spawns a sidecar program. |
| `onSidecarEvent` | `async function onSidecarEvent(program: string, onEvent: (output: { stdout?: string; stderr?: string }) => void): Promise<() => void>` | Listen to a sidecar event. |

### Tray

**Access:** `window.__TAURI__.tray`

**Class:** `TrayIcon`

*   `static async new(options?: TrayIconOptions): Promise<TrayIcon>`: Creates a new tray icon.
*   `static async getById(id: string): Promise<TrayIcon \| null>`: Gets a tray icon using the provided id.
*   `static async removeById(id: string): Promise<void>`: Removes a tray icon using the provided id from tauri's internal state.

**Instance Methods:**

| Method | Signature | Description |
| --- | --- | --- |
| `setIcon` | `async setIcon(icon: string \| Image \| Uint8Array \| ArrayBuffer \| number[] \| null): Promise<void>` | Sets a new tray icon. |
| `setMenu` | `async setMenu(menu: Menu \| Submenu \| null): Promise<void>` | Sets a new tray menu. |
| `setTooltip` | `async setTooltip(tooltip: string \| null): Promise<void>` | Sets the tooltip for this tray icon. |
| `setTitle` | `async setTitle(title: string \| null): Promise<void>` | Sets the title for this tray icon. |
| `setVisible` | `async setVisible(visible: boolean): Promise<void>` | Show or hide this tray icon. |

### Webview

**Access:** `window.__TAURI__.webview`

**Class:** `Webview`

*   `static getCurrent(): Webview`: Get an instance of `Webview` for the current webview.
*   `static async getAll(): Promise<Webview[]>`: Gets a list of instances of `Webview` for all available webviews.
*   `static async getByLabel(label: string): Promise<Webview \| null>`: Gets the Webview for the webview associated with the given label.

**⚠️ Returns null:** `getByLabel()` - always check before using

**Instance Methods:**

| Method | Signature | Description |
| --- | --- | --- |
| `position` | `async position(): Promise<PhysicalPosition>` | The position of the top-left hand corner of the webview's client area relative to the top-left hand corner of the desktop. |
| `size` | `async size(): Promise<PhysicalSize>` | The physical size of the webview's client area. |
| `close` | `async close(): Promise<void>` | Closes the webview. |
| `setSize` | `async setSize(size: LogicalSize \| PhysicalSize \| Size): Promise<void>` | Resizes the webview. |
| `setPosition` | `async setPosition(position: LogicalPosition \| PhysicalPosition \| Position): Promise<void>` | Sets the webview position. |
| `setFocus` | `async setFocus(): Promise<void>` | Bring the webview to front and focus. |
| `setAutoResize` | `async setAutoResize(autoResize: boolean): Promise<void>` | Sets whether the webview should automatically grow and shrink its size and position when the parent window resizes. |
| `hide` | `async hide(): Promise<void>` | Hide the webview. |
| `show` | `async show(): Promise<void>` | Show the webview. |
| `setZoom` | `async setZoom(scaleFactor: number): Promise<void>` | Set webview zoom level. |
| `reparent` | `async reparent(window: Window \| WebviewWindow \| string): Promise<void>` | Moves this webview to the given label. |
| `clearAllBrowsingData` | `async clearAllBrowsingData(): Promise<void>` | Clears all browsing data for this webview. |
| `setBackgroundColor` | `async setBackgroundColor(color: Color \| null): Promise<void>` | Specify the webview background color. |

### WebviewWindow

**Access:** `window.__TAURI__.webviewWindow`

**Class:** `WebviewWindow`

*   `constructor(label: string, options?: WindowOptions)`: Creates a new WebviewWindow
*   `static getCurrent(): WebviewWindow`: Get an instance of `WebviewWindow` for the current webview window.
*   `static async getAll(): Promise<WebviewWindow[]>`: Gets a list of instances of `WebviewWindow` for all available webview windows.
*   `static async getByLabel(label: string): Promise<WebviewWindow \| null>`: Gets the WebviewWindow for the webview window associated with the given label.

**⚠️ Returns null:** `getByLabel()` - always check before using

**Instance Methods:**

| Method | Signature | Description |
| --- | --- | --- |
| `setBackgroundColor` | `async setBackgroundColor(color: Color): Promise<void>` | Set the window and webview background color. |

### Webview

**Access:** `window.__TAURI__.webview`

**Class:** `Webview`

*   `static getCurrent(): Webview`: Get an instance of `Webview` for the current webview.
*   `static async getAll(): Promise<Webview[]>`: Gets a list of instances of `Webview` for all available webviews.
*   `static async getByLabel(label: string): Promise<Webview | null>`: Gets the Webview for the webview associated with the given label.

**⚠️ Returns null:** `getByLabel()` - always check before using

**Instance Methods:**

| Method | Signature | Description |
| --- | --- | --- |
| `position` | `async position(): Promise<PhysicalPosition>` | The position of the top-left hand corner of the webview's client area relative to the top-left hand corner of the desktop. |
| `size` | `async size(): Promise<PhysicalSize>` | The physical size of the webview's client area. |
| `close` | `async close(): Promise<void>` | Closes the webview. |
| `setSize` | `async setSize(size: LogicalSize | PhysicalSize | Size): Promise<void>` | Resizes the webview. |
| `setPosition` | `async setPosition(position: LogicalPosition | PhysicalPosition | Position): Promise<void>` | Sets the webview position. |
| `setFocus` | `async setFocus(): Promise<void>` | Bring the webview to front and focus. |
| `setAutoResize` | `async setAutoResize(autoResize: boolean): Promise<void>` | Sets whether the webview should automatically grow and shrink its size and position when the parent window resizes. |
| `hide` | `async hide(): Promise<void>` | Hide the webview. |
| `show` | `async show(): Promise<void>` | Show the webview. |
| `setZoom` | `async setZoom(scaleFactor: number): Promise<void>` | Set webview zoom level. |
| `reparent` | `async reparent(window: Window | WebviewWindow | string): Promise<void>` | Moves this webview to the given label. |
| `clearAllBrowsingData` | `async clearAllBrowsingData(): Promise<void>` | Clears all browsing data for this webview. |
| `setBackgroundColor` | `async setBackgroundColor(color: Color | null): Promise<void>` | Specify the webview background color. |

### WebviewWindow

**Access:** `window.__TAURI__.webviewWindow`

**Class:** `WebviewWindow`

*   `constructor(label: string, options?: WindowOptions)`: Creates a new WebviewWindow
*   `static getCurrent(): WebviewWindow`: Get an instance of `WebviewWindow` for the current webview window.
*   `static async getAll(): Promise<WebviewWindow[]>`: Gets a list of instances of `WebviewWindow` for all available webview windows.
*   `static async getByLabel(label: string): Promise<WebviewWindow | null>`: Gets the WebviewWindow for the webview window associated with the given label.

**⚠️ Returns null:** `getByLabel()` - always check before using

**Instance Methods:**

| Method | Signature | Description |
| --- | --- | --- |
| `setBackgroundColor` | `async setBackgroundColor(color: Color): Promise<void>` | Set the window and webview background color. |

---

## Platform-Specific APIs

### macOS Only

**App**

| Function | Signature | Description |
| --- | --- | --- |
| `show` | `async function show(): Promise<void>` | Shows the application. |
| `hide` | `async function hide(): Promise<void>` | Hides the application. |
| `fetchDataStoreIdentifiers` | `async function fetchDataStoreIdentifiers(): Promise<DataStoreIdentifier[]>` | Fetches the data store identifiers. |
| `removeDataStore` | `async function removeDataStore(uuid: DataStoreIdentifier): Promise<void>` | Removes the data store with the given identifier. |
| `setDockVisibility` | `async function setDockVisibility(visible: boolean): Promise<void>` | Sets the dock visibility for the application. |

**Tray**

| Method | Signature | Description |
| --- | --- | --- |
| `setIconAsTemplate` | `async setIconAsTemplate(asTemplate: boolean): Promise<void>` | Sets the current icon as a template. |

**Window**

| Method | Signature | Description |
| --- | --- | --- |
| `isMaximizable` | `async function isMaximizable(): Promise<boolean>` | Gets the window's native maximize button state. |
| `isMinimizable` | `async function isMinimizable(): Promise<boolean>` | Gets the window's native minimize button state. |
| `setMaximizable` | `async function setMaximizable(maximizable: boolean): Promise<void>` | Sets whether the window's native maximize button is enabled or not. |
| `setMinimizable` | `async function setMinimizable(minimizable: boolean): Promise<void>` | Sets whether the window's native minimize button is enabled or not. |
| `setSimpleFullscreen` | `async function setSimpleFullscreen(fullscreen: boolean): Promise<void>` | Toggles a fullscreen mode that doesn’t require a new macOS space. |
| `setBadgeCount` | `async function setBadgeCount(count?: number): Promise<void>` | Sets the badge count. |
| `setBadgeLabel` | `async function setBadgeLabel(label?: string): Promise<void>` | Sets the badge label. |
| `setTitleBarStyle` | `async function setTitleBarStyle(style: TitleBarStyle): Promise<void>` | Sets the title bar style. |

### Windows Only

**Window**

| Method | Signature | Description |
| --- | --- | --- |
| `setSkipTaskbar` | `async function setSkipTaskbar(skip: boolean): Promise<void>` | Whether the window icon should be hidden from the taskbar or not. |
| `setOverlayIcon` | `async function setOverlayIcon(icon?: string \| Image \| Uint8Array \| ArrayBuffer \| number[]): Promise<void>` | Sets the overlay icon. |
| `setShadow` | `async function setShadow(enable: boolean): Promise<void>` | Whether or not the window should have shadow. |
| `setEffects` | `async function setEffects(effects: Effects): Promise<void>` | Set window effects. |
| `clearEffects` | `async function clearEffects(): Promise<void>` | Clear any applied effects if possible. |

### Linux Only

**Tray**

| Method | Signature | Description |
| --- | --- | --- |
| `setTempDirPath` | `async setTempDirPath(path: string \| null): Promise<void>` | Sets the tray icon temp dir path. |

**Window**

| Method | Signature | Description |
| --- | --- | --- |
| `setVisibleOnAllWorkspaces` | `async function setVisibleOnAllWorkspaces(visible: boolean): Promise<void>` | Sets whether the window should be visible on all workspaces or virtual desktops. |
