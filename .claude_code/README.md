# Tauri Self-Correcting Code Quality System

This directory contains a self-correcting code quality loop for Tauri development using Claude Code's sub-agents and hooks features.

## Overview

The system provides:
- **Proactive validation** of Tauri code before execution
- **Automatic error analysis** and documentation updates
- **Self-learning** capabilities that improve over time
- **Consistent code quality** across development sessions

## Architecture

### Sub-Agents (`agents/`)

#### 1. `tauri-js-validator`
- **Purpose**: Validates JavaScript/TypeScript Tauri code
- **Checks**: 
  - Proper `window.__TAURI__` API usage
  - Null checks for methods that return null
  - Error handling patterns
  - Permission documentation
- **References**: `tauri_js_api_cheat_sheet.md`, `tauri_plugins_cheat_sheet.md`

#### 2. `tauri-rust-validator`
- **Purpose**: Validates Rust Tauri code patterns
- **Checks**:
  - `#[tauri::command]` functions return `Result<T, E>`
  - Proper Builder pattern usage
  - Command registration with `generate_handler!`
  - Error handling implementation
- **References**: `tauri_rust_api_cheat_sheet.md`

#### 3. `cheatsheet-updater`
- **Purpose**: Updates cheat sheets when errors reveal documentation gaps
- **Actions**:
  - Analyzes error patterns
  - Adds missing warnings or corrections
  - Updates API signatures if incorrect
  - Adds null-check reminders

### Hooks (`project_hooks.json`)

#### Pre-Execution Validation
- **Trigger**: Before writing/editing JS/TS/Rust files with Tauri code
- **Action**: Validates code against cheat sheets
- **Result**: Blocks execution if errors found

#### Post-Error Learning
- **Trigger**: After compilation/build errors in Tauri projects
- **Action**: Analyzes errors for documentation gaps
- **Result**: Updates cheat sheets to prevent future occurrences

## How It Works

### 1. Code Writing Phase
```
You write Tauri code → Hook intercepts → Validator agent checks → 
If valid: Proceed | If invalid: Show error and block
```

### 2. Error Learning Phase
```
Build/compile error → Hook captures → Updater agent analyzes → 
If doc gap: Update cheat sheets | If not: No action
```

### 3. Continuous Improvement
```
More errors → Better documentation → Fewer future errors → Higher code quality
```

## Usage

### Manual Validation
You can manually invoke the validators:

```bash
# Validate JS/TS code
claude-code agent tauri-js-validator --prompt "Check this code: [your code]"

# Validate Rust code  
claude-code agent tauri-rust-validator --prompt "Check this code: [your code]"

# Update cheat sheets after an error
claude-code agent cheatsheet-updater --prompt "Error: [error message] Command: [command]"
```

### Viewing Agent Activity
- Agents run automatically via hooks
- Check Claude Code logs for validation results
- Failed validations will show specific error messages

## Configuration

### Enabling/Disabling
- Edit `project_hooks.json` to enable/disable specific hooks
- Set `"enabled": false` for any hook to disable it

### Customizing Validation
- Modify agent system prompts in `agents/*.json`
- Adjust path matching patterns in hooks
- Add new validation rules as needed

## Troubleshooting

### Validation Not Working
1. Check that hooks are properly formatted JSON
2. Verify agent files exist in `agents/` directory
3. Ensure Claude Code has necessary permissions

### False Positives
1. Update agent system prompts to be more specific
2. Add exceptions for valid patterns that are flagged
3. Refine path matching to avoid non-Tauri files

### Cheat Sheets Not Updating
1. Check that `cheatsheet-updater` has Edit permissions
2. Verify error conditions in hooks are matching correctly
3. Ensure cheat sheet files are writable

## Benefits

- **Catch errors before they happen**: Pre-execution validation
- **Learn from mistakes**: Error analysis and documentation updates
- **Consistent quality**: Same validation rules across all sessions
- **Reduced context pollution**: Agents use separate contexts
- **Evolving documentation**: Cheat sheets improve with real usage

## Files Structure

```
.claude_code/
├── README.md                           # This file
├── project_hooks.json                  # Hooks configuration
└── agents/
    ├── tauri-js-validator.json         # JS/TS validation agent
    ├── tauri-rust-validator.json       # Rust validation agent
    └── cheatsheet-updater.json         # Documentation updater agent
```

This system creates a robust feedback loop that catches errors early and continuously improves the development experience through better documentation.