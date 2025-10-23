#!/bin/bash

echo "🔍 MkDocs Build Issue Diagnostic Script"
echo "========================================"
echo ""

# Check if we're in the right directory
if [ ! -f "mkdocs.yml" ]; then
    echo "❌ Error: mkdocs.yml not found in current directory"
    echo "Please run this script from your repository root"
    exit 1
fi

# Check Python and pip
echo "📦 Checking Python environment..."
python3 --version
pip --version
echo ""

# Install/upgrade dependencies
echo "📦 Installing MkDocs and dependencies..."
pip install --quiet --upgrade mkdocs mkdocs-material
echo ""

# Check installed versions
echo "📋 Installed versions:"
pip list | grep -E "(mkdocs|material)" | head -5
echo ""

# Check file structure
echo "📁 Checking required files..."
FILES_OK=true

if [ -f "docs/index.md" ]; then
    echo "✅ docs/index.md exists"
else
    echo "❌ docs/index.md is MISSING"
    FILES_OK=false
fi

if [ -f "docs/blog/index.md" ]; then
    echo "✅ docs/blog/index.md exists"
else
    echo "❌ docs/blog/index.md is MISSING"
    FILES_OK=false
fi

if [ -f "docs/stylesheets/terminal-material-bridge.css" ]; then
    echo "✅ docs/stylesheets/terminal-material-bridge.css exists"
else
    echo "⚠️  docs/stylesheets/terminal-material-bridge.css is MISSING (creating empty file)"
    mkdir -p docs/stylesheets
    touch docs/stylesheets/terminal-material-bridge.css
fi

echo ""

# Check if blog posts directory exists
if [ -d "docs/blog/posts" ]; then
    echo "✅ docs/blog/posts/ directory exists"
    POST_COUNT=$(ls -1 docs/blog/posts/*.md 2>/dev/null | wc -l)
    if [ $POST_COUNT -eq 0 ]; then
        echo "ℹ️  No blog posts found in docs/blog/posts/"
        echo "   Creating a sample post..."
        cat > docs/blog/posts/sample.md << 'EOF'
---
date: 2024-01-01
---

# Sample Post

This is a sample blog post.
EOF
    else
        echo "   Found $POST_COUNT blog post(s)"
    fi
else
    echo "⚠️  docs/blog/posts/ directory is MISSING (creating it)"
    mkdir -p docs/blog/posts
fi

echo ""

# Validate YAML syntax
echo "🔍 Validating mkdocs.yml syntax..."
python3 -c "
import yaml
import sys
try:
    with open('mkdocs.yml', 'r') as f:
        config = yaml.safe_load(f)
    print('✅ YAML syntax is valid')
    
    # Check for blog plugin
    if 'plugins' in config:
        plugins = config['plugins']
        has_blog = any(
            (isinstance(p, str) and p == 'blog') or 
            (isinstance(p, dict) and 'blog' in p)
            for p in plugins
        )
        if has_blog:
            print('ℹ️  Blog plugin is configured')
            print('   Make sure mkdocs-material is properly installed')
except Exception as e:
    print(f'❌ YAML parsing error: {e}')
    sys.exit(1)
"

echo ""
echo "=========================================="
echo "🏗️  Attempting to build with current config..."
echo "=========================================="
echo ""

# Try to build with verbose output
mkdocs build --verbose 2>&1 | tee /tmp/mkdocs_build.log | tail -30

if [ ${PIPESTATUS[0]} -eq 0 ]; then
    echo ""
    echo "✅ Build successful with current configuration!"
    echo ""
    echo "The site should work on GitHub Actions now."
else
    echo ""
    echo "❌ Build failed!"
    echo ""
    echo "Error details:"
    echo "--------------"
    grep -E "(ERROR|Error|error|No module|not found|does not exist)" /tmp/mkdocs_build.log | head -10
    
    echo ""
    echo "=========================================="
    echo "🔧 Attempting build with simplified config..."
    echo "=========================================="
    echo ""
    
    # Create a minimal mkdocs.yml
    cat > mkdocs_minimal.yml << 'EOF'
site_name: A Search For Lost Time
theme:
  name: material

plugins:
  - search

nav:
  - Home: index.md
EOF
    
    mkdocs build --config-file mkdocs_minimal.yml --verbose 2>&1 | tail -10
    
    if [ $? -eq 0 ]; then
        echo ""
        echo "✅ Build works with minimal configuration!"
        echo "The issue is likely with:"
        echo "  - The blog plugin configuration"
        echo "  - Missing dependencies for plugins"
        echo "  - File references in navigation"
        echo ""
        echo "Try installing the blog plugin dependencies:"
        echo "  pip install mkdocs-material[recommended]"
    else
        echo ""
        echo "❌ Build fails even with minimal config"
        echo "This suggests a fundamental issue with the installation"
        echo ""
        echo "Try reinstalling:"
        echo "  pip uninstall mkdocs mkdocs-material -y"
        echo "  pip install mkdocs-material"
    fi
    
    # Clean up
    rm -f mkdocs_minimal.yml
fi

echo ""
echo "=========================================="
echo "📋 Recommendations:"
echo "=========================================="
echo ""
echo "1. If the build failed, check the error messages above"
echo "2. Make sure all required files exist in docs/"
echo "3. Try the simplified configuration if the full one fails"
echo "4. Ensure all Python dependencies are installed:"
echo "   pip install mkdocs-material[recommended]"
echo ""
echo "For GitHub Actions, use this workflow:"
echo "   https://squidfunk.github.io/mkdocs-material/publishing-your-site/#with-github-actions"