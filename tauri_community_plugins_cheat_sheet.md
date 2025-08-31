# Tauri Community Plugins Cheat Sheet

This cheat sheet provides a quick reference for community-developed Tauri plugins.

**Note:** This cheat sheet is designed for use without a build step. All APIs are accessed through the `window.__TAURI__` object.

**⚠️ Plugins require permissions in `tauri.conf.json` capabilities array**

## sentry-tauri

**Description:** A Sentry plugin for Tauri v2.

**GitHub URL:** https://github.com/timfish/sentry-tauri

### Installation

Add `tauri-plugin-sentry` to dependencies in `Cargo.toml`:

```toml
[dependencies]
tauri-plugin-sentry = "0.4"
```

Run one of these commands to add the capabilities:

- npm: `npm run tauri add sentry`
- yarn: `yarn run tauri add sentry`
- pnpm: `pnpm tauri add sentry`
- cargo: `cargo tauri add sentry`

### Usage

```rust
use tauri_plugin_sentry::{minidump, sentry};

pub fn run() {
    let client = sentry::init((
        "__YOUR_DSN__",
        sentry::ClientOptions {
            release: sentry::release_name!(),
            auto_session_tracking: true,
            ..Default::default()
        },
    ));

    // Caution! Everything before here runs in both app and crash reporter processes
    #[cfg(not(target_os = "ios"))]
    let _guard = minidump::init(&client);
    // Everything after here runs in only the app process

    tauri::Builder::default()
        .plugin(tauri_plugin_sentry::init(&client))
        .run(tauri::generate_context!())
        .expect("error while running tauri app");
}
```

### API

| Function | Signature | Description |
| --- | --- | --- |
| `breadcrumb` | `async function breadcrumb(breadcrumb: Breadcrumb): Promise<void>` | Adds a breadcrumb to Sentry. |
| `envelope` | `async function envelope(envelope: Buffer): Promise<void>` | Sends an envelope to Sentry. |

