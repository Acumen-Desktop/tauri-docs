# Tauri Plugins Cheat Sheet

**Note:** This cheat sheet is designed for use without a build step. All APIs are accessed through the `window.__TAURI__` object.

## Cross-Platform APIs

### Clipboard

**Access:** `window.__TAURI__.clipboard`

| Function | Signature | Description |
| --- | --- | --- |
| `writeText` | `async function writeText(text: string, opts?: { label?: string }): Promise<void>` | Writes plain text to the clipboard. |
| `readText` | `async function readText(): Promise<string>` | Gets the clipboard content as plain text. |
| `clear` | `async function clear(): Promise<void>` | Clears the clipboard. |

### Dialog

**Access:** `window.__TAURI__.dialog`

| Function | Signature | Description |
| --- | --- | --- |
| `open` | `async function open<T extends OpenDialogOptions>(options: T = {} as T): Promise<OpenDialogReturn<T>>` | Open a file/directory selection dialog. |
| `save` | `async function save(options: SaveDialogOptions = {}): Promise<string \| null>` | Open a file/directory save dialog. |
| `message` | `async function message(message: string, options?: string \| MessageDialogOptions): Promise<void>` | Shows a message dialog with an `Ok` button. |
| `ask` | `async function ask(message: string, options?: string \| ConfirmDialogOptions): Promise<boolean>` | Shows a question dialog with `Yes` and `No` buttons. |
| `confirm` | `async function confirm(message: string, options?: string \| ConfirmDialogOptions): Promise<boolean>` | Shows a question dialog with `Ok` and `Cancel` buttons. |

### FS

**Access:** `window.__TAURI__.fs`

| Function | Signature | Description |
| --- | --- | --- |
| `create` | `async function create(path: string \| URL, options?: CreateOptions): Promise<FileHandle>` | Creates a file if none exists or truncates an existing file. |
| `open` | `async function open(path: string \| URL, options?: OpenOptions): Promise<FileHandle>` | Open a file. |
| `copyFile` | `async function copyFile(fromPath: string \| URL, toPath: string \| URL, options?: CopyFileOptions): Promise<void>` | Copies the contents and permissions of one file to another specified path. |
| `mkdir` | `async function mkdir(path: string \| URL, options?: MkdirOptions): Promise<void>` | Creates a new directory with the specified path. |
| `readDir` | `async function readDir(path: string \| URL, options?: ReadDirOptions): Promise<DirEntry[]>` | Reads the directory given by path and returns an array of `DirEntry`. |
| `readFile` | `async function readFile(path: string \| URL, options?: ReadFileOptions): Promise<Uint8Array<ArrayBuffer>>` | Reads and resolves to the entire contents of a file as an array of bytes. |
| `readTextFile` | `async function readTextFile(path: string \| URL, options?: ReadFileOptions): Promise<string>` | Reads and returns the entire contents of a file as UTF-8 string. |
| `readTextFileLines` | `async function readTextFileLines(path: string \| URL, options?: ReadFileOptions): Promise<AsyncIterableIterator<string>>` | Returns an async iterator over the lines of a file as UTF-8 string. |
| `remove` | `async function remove(path: string \| URL, options?: RemoveOptions): Promise<void>` | Removes the named file or directory. |
| `rename` | `async function rename(oldPath: string \| URL, newPath: string \| URL, options?: RenameOptions): Promise<void>` | Renames (moves) oldpath to newpath. |
| `stat` | `async function stat(path: string \| URL, options?: StatOptions): Promise<FileInfo>` | Resolves to a `FileInfo` for the specified `path`. |
| `lstat` | `async function lstat(path: string \| URL, options?: StatOptions): Promise<FileInfo>` | Resolves to a `FileInfo` for the specified `path`, without following symlinks. |
| `truncate` | `async function truncate(path: string \| URL, len?: number, options?: TruncateOptions): Promise<void>` | Truncates or extends the specified file. |
| `writeFile` | `async function writeFile(path: string \| URL, data: Uint8Array \| ReadableStream<Uint8Array>, options?: WriteFileOptions): Promise<void>` | Write `data` to the given `path`. |
| `writeTextFile` | `async function writeTextFile(path: string \| URL, data: string, options?: WriteFileOptions): Promise<void>` | Writes UTF-8 string `data` to the given `path`. |
| `exists` | `async function exists(path: string \| URL, options?: ExistsOptions): Promise<boolean>` | Check if a path exists. |
| `watch` | `async function watch(paths: string \| string[] \| URL \| URL[], cb: (event: WatchEvent) => void, options?: DebouncedWatchOptions): Promise<UnwatchFn>` | Watch changes (after a delay) on files or directories. |
| `watchImmediate` | `async function watchImmediate(paths: string \| string[] \| URL \| URL[], cb: (event: WatchEvent) => void, options?: WatchOptions): Promise<UnwatchFn>` | Watch changes on files or directories. |
| `size` | `async function size(path: string \| URL): Promise<number>` | Get the size of a file or directory. |

### Global Shortcut

**Access:** `window.__TAURI__.globalShortcut`

| Function | Signature | Description |
| --- | --- | --- |
| `register` | `async function register(shortcuts: string \| string[], handler: ShortcutHandler): Promise<void>` | Register a global shortcut or a list of shortcuts. |
| `unregister` | `async function unregister(shortcuts: string \| string[]): Promise<void>` | Unregister a global shortcut or a list of shortcuts. |
| `unregisterAll` | `async function unregisterAll(): Promise<void>` | Unregister all global shortcuts. |
| `isRegistered` | `async function isRegistered(shortcut: string): Promise<boolean>` | Determines whether the given shortcut is registered by this application or not. |

### HTTP

**Access:** `window.__TAURI__.http`

| Function | Signature | Description |
| --- | --- | --- |
| `fetch` | `async function fetch(input: URL \| Request \| string, init?: RequestInit & ClientOptions): Promise<Response>` | Fetch a resource from the network. |

### Notification

**Access:** `window.__TAURI__.notification`

| Function | Signature | Description |
| --- | --- | --- |
| `sendNotification` | `function sendNotification(options: Options \| string): void` | Sends a notification to the user. |
| `requestPermission` | `async function requestPermission(): Promise<NotificationPermission>` | Requests the permission to send notifications. |
| `isPermissionGranted` | `async function isPermissionGranted(): Promise<boolean>` | Checks if the permission to send notifications is granted. |
| `registerActionTypes` | `async function registerActionTypes(types: ActionType[]): Promise<void>` | Register actions that are performed when the user clicks on the notification. |
| `pending` | `async function pending(): Promise<PendingNotification[]>` | Retrieves the list of pending notifications. |
| `cancel` | `async function cancel(notifications: number[]): Promise<void>` | Cancels the pending notifications with the given list of identifiers. |
| `cancelAll` | `async function cancelAll(): Promise<void>` | Cancels all pending notifications. |
| `active` | `async function active(): Promise<ActiveNotification[]>` | Retrieves the list of active notifications. |
| `removeActive` | `async function removeActive(notifications: Array<{ id: number; tag?: string }>): Promise<void>` | Removes the active notifications with the given list of identifiers. |
| `removeAllActive` | `async function removeAllActive(): Promise<void>` | Removes all active notifications. |
| `createChannel` | `async function createChannel(channel: Channel): Promise<void>` | Creates a notification channel. |
| `removeChannel` | `async function removeChannel(id: string): Promise<void>` | Removes the channel with the given identifier. |
| `channels` | `async function channels(): Promise<Channel[]>` | Retrieves the list of notification channels. |
| `onNotificationReceived` | `async function onNotificationReceived(cb: (notification: Options) => void): Promise<PluginListener>` | Listen to a notification received event. |
| `onAction` | `async function onAction(cb: (notification: Options) => void): Promise<PluginListener>` | Listen to a notification action performed event. |

### OS

**Access:** `window.__TAURI__.os`

| Function | Signature | Description |
| --- | --- | --- |
| `eol` | `function eol(): string` | Returns the operating system-specific end-of-line marker. |
| `platform` | `function platform(): Platform` | Returns a string describing the specific operating system in use. |
| `version` | `function version(): string` | Returns the current operating system version. |
| `family` | `function family(): Family` | Returns the current operating system family. |
| `type` | `function type(): OsType` | Returns the current operating system type. |
| `arch` | `function arch(): Arch` | Returns the current operating system architecture. |
| `exeExtension` | `function exeExtension(): string` | Returns the file extension, if any, used for executable binaries on this platform. |
| `locale` | `async function locale(): Promise<string \| null>` | Returns a String with a `BCP-47` language tag inside. |
| `hostname` | `async function hostname(): Promise<string \| null>` | Returns the host name of the operating system. |

### Process

**Access:** `window.__TAURI__.process`

| Function | Signature | Description |
| --- | --- | --- |
| `exit` | `async function exit(code = 0): Promise<void>` | Exits immediately with the given `exitCode`. |
| `relaunch` | `async function relaunch(): Promise<void>` | Exits the current instance of the app then relaunches it. |

### Updater

**Access:** `window.__TAURI__.updater`

| Function | Signature | Description |
| --- | --- | --- |
| `check` | `async function check(options?: CheckOptions): Promise<Update \| null>` | Check for updates, resolves to `null` if no updates are available |

---

## Platform-Specific APIs

### Clipboard

**Windows, macOS, Linux Only**

| Function | Signature | Description |
| --- | --- | --- |
| `writeImage` | `async function writeImage(image: string \| Image \| Uint8Array \| ArrayBuffer \| number[]): Promise<void>` | Writes image buffer to the clipboard. |
| `readImage` | `async function readImage(): Promise<Image>` | Gets the clipboard content as Uint8Array image. |
| `writeHtml` | `async function writeHtml(html: string, altText?: string): Promise<void>` | Writes HTML or fallbacks to write provided plain text to the clipboard. |
