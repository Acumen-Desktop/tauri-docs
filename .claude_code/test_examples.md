# Test Examples for Self-Correcting Code Quality System

This file contains examples you can use to test the validation system.

## JavaScript/TypeScript Examples

### ❌ Bad Example (should be caught by validator)
```javascript
// Missing null check - validator should catch this
const window = await Window.getByLabel('settings');
await window.close(); // Error: window could be null!

// Missing error handling
const appName = await window.__TAURI__.app.getName();
```

### ✅ Good Example (should pass validation)
```javascript
// Proper null check and error handling
try {
    const window = await Window.getByLabel('settings');
    if (window) {
        await window.close();
    }
    
    const appName = await window.__TAURI__.app.getName();
    console.log('App name:', appName);
} catch (error) {
    console.error('Failed to get app info:', error);
}
```

## Rust Examples

### ❌ Bad Example (should be caught by validator)
```rust
// Command not returning Result - validator should catch this
#[tauri::command]
fn bad_command(name: String) -> String {
    format!("Hello, {}", name)
}

// Missing error handling
fn main() {
    tauri::Builder::default()
        .invoke_handler(tauri::generate_handler![bad_command])
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}
```

### ✅ Good Example (should pass validation)
```rust
// Proper Result return type
#[tauri::command]
fn good_command(name: String) -> Result<String, String> {
    if name.is_empty() {
        return Err("Name cannot be empty".to_string());
    }
    Ok(format!("Hello, {}", name))
}

fn main() {
    tauri::Builder::default()
        .invoke_handler(tauri::generate_handler![good_command])
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}
```

## Testing the System

1. **Copy a bad example** into a new file
2. **Try to save it** - the validator should catch the error
3. **Fix the issues** and save again - should work
4. **Introduce a build error** and run a command - updater should analyze

## Expected Validator Messages

### JS Validator
- `ERROR: Missing null check for getByLabel() - window could be null`
- `ERROR: Missing try-catch block for async Tauri API calls`
- `VALID: Code follows cheat sheet guidelines`

### Rust Validator  
- `ERROR: #[tauri::command] function must return Result<T, E>`
- `ERROR: Missing error type that implements std::error::Error + Send + Sync`
- `VALID: Code follows Rust cheat sheet guidelines`

### Cheat Sheet Updater
- `UPDATED: Added warning about null checks for getByLabel method`
- `NO UPDATE NEEDED: Error not caused by documentation gap`

Use these examples to verify the system is working correctly!