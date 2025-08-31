#!/bin/bash

# Tauri Self-Correcting Code Quality System Setup
echo "Setting up Tauri Self-Correcting Code Quality System..."

# Check if Claude Code is available
if ! command -v claude-code &> /dev/null; then
    echo "❌ Error: claude-code command not found. Please install Claude Code CLI first."
    exit 1
fi

# Check if we're in a git repository (good practice for projects)
if [ ! -d ".git" ]; then
    echo "⚠️  Warning: Not in a git repository. This system works best in version-controlled projects."
fi

# Check if cheat sheet files exist
CHEAT_SHEETS=(
    "tauri_js_api_cheat_sheet.md"
    "tauri_plugins_cheat_sheet.md" 
    "tauri_rust_api_cheat_sheet.md"
)

echo "Checking for cheat sheet files..."
for sheet in "${CHEAT_SHEETS[@]}"; do
    if [ -f "$sheet" ]; then
        echo "✅ Found $sheet"
    else
        echo "❌ Missing $sheet - please ensure cheat sheets are in the project root"
        exit 1
    fi
done

# Validate agent configurations
echo "Validating agent configurations..."
AGENTS=(
    ".claude_code/agents/tauri-js-validator.json"
    ".claude_code/agents/tauri-rust-validator.json"
    ".claude_code/agents/cheatsheet-updater.json"
)

for agent in "${AGENTS[@]}"; do
    if [ -f "$agent" ] && jq empty "$agent" 2>/dev/null; then
        echo "✅ Agent configuration valid: $(basename "$agent")"
    else
        echo "❌ Invalid JSON in $agent"
        exit 1
    fi
done

# Validate hooks configuration
echo "Validating hooks configuration..."
if [ -f ".claude_code/project_hooks.json" ] && jq empty ".claude_code/project_hooks.json" 2>/dev/null; then
    echo "✅ Hooks configuration valid"
else
    echo "❌ Invalid JSON in project_hooks.json"
    exit 1
fi

# Test agents (if Claude Code supports it)
echo "Testing agent configurations..."
echo "Note: You may need to manually test agents with 'claude-code agent <name>' after setup."

# Final success message
echo ""
echo "🎉 Tauri Self-Correcting Code Quality System setup complete!"
echo ""
echo "📚 The system includes:"
echo "   • 3 specialized validation agents"
echo "   • 5 automated hooks for code validation and error learning"
echo "   • Self-updating cheat sheets"
echo ""
echo "📖 Read .claude_code/README.md for usage details"
echo ""
echo "🚀 The system will now:"
echo "   • Validate Tauri code before execution"
echo "   • Learn from errors and update documentation"
echo "   • Improve code quality over time"
echo ""
echo "💡 Try writing some Tauri code to see the validation in action!"