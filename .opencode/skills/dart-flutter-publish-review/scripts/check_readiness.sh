#!/bin/bash

# Package Publication Readiness Check
# Validates that a Dart/Flutter package is ready for publication

set -e

echo "🔍 Checking package publication readiness..."
echo ""

ERRORS=0
WARNINGS=0

# Check for required files
echo "📄 Checking required files..."

if [ -f "LICENSE" ]; then
    echo "  ✓ LICENSE exists"
else
    echo "  ✗ LICENSE missing (REQUIRED)"
    ERRORS=$((ERRORS + 1))
fi

if [ -f "README.md" ]; then
    if [ -s "README.md" ]; then
        echo "  ✓ README.md exists and is non-empty"
    else
        echo "  ⚠ README.md exists but is empty"
        WARNINGS=$((WARNINGS + 1))
    fi
else
    echo "  ✗ README.md missing (REQUIRED)"
    ERRORS=$((ERRORS + 1))
fi

if [ -f "CHANGELOG.md" ]; then
    if [ -s "CHANGELOG.md" ]; then
        echo "  ✓ CHANGELOG.md exists and is non-empty"
    else
        echo "  ⚠ CHANGELOG.md exists but is empty"
        WARNINGS=$((WARNINGS + 1))
    fi
else
    echo "  ⚠ CHANGELOG.md missing (recommended)"
    WARNINGS=$((WARNINGS + 1))
fi

if [ -f "pubspec.yaml" ]; then
    echo "  ✓ pubspec.yaml exists"
else
    echo "  ✗ pubspec.yaml missing (REQUIRED)"
    ERRORS=$((ERRORS + 1))
    echo ""
    echo "❌ Cannot continue without pubspec.yaml"
    exit 1
fi

echo ""

# Check pubspec.yaml fields
echo "📝 Checking pubspec.yaml fields..."

if grep -q "^name:" pubspec.yaml; then
    NAME=$(grep "^name:" pubspec.yaml | head -1 | awk '{print $2}')
    echo "  ✓ name: $NAME"
else
    echo "  ✗ name field missing"
    ERRORS=$((ERRORS + 1))
fi

if grep -q "^version:" pubspec.yaml; then
    VERSION=$(grep "^version:" pubspec.yaml | head -1 | awk '{print $2}')
    echo "  ✓ version: $VERSION"
else
    echo "  ⚠ version field missing (defaults to 0.0.1)"
    WARNINGS=$((WARNINGS + 1))
fi

if grep -q "^description:" pubspec.yaml; then
    echo "  ✓ description present"
else
    echo "  ⚠ description field missing (recommended)"
    WARNINGS=$((WARNINGS + 1))
fi

if grep -q "^homepage:" pubspec.yaml || grep -q "^repository:" pubspec.yaml; then
    echo "  ✓ homepage or repository present"
else
    echo "  ⚠ No homepage or repository URL (recommended)"
    WARNINGS=$((WARNINGS + 1))
fi

if grep -q "^topics:" pubspec.yaml; then
    echo "  ✓ topics present"
else
    echo "  ⚠ topics field missing (improves discoverability)"
    WARNINGS=$((WARNINGS + 1))
fi

if grep -q "^funding:" pubspec.yaml; then
    echo "  ✓ funding present"
else
    echo "  ℹ funding field optional (for support links)"
fi

echo ""

# Check package size
echo "📦 Checking package size..."

SIZE=$(du -sm . 2>/dev/null | cut -f1)
if [ "$SIZE" -lt 100 ]; then
    echo "  ✓ Package size: ${SIZE}MB (under 100MB recommended limit)"
elif [ "$SIZE" -lt 256 ]; then
    echo "  ⚠ Package size: ${SIZE}MB (under 256MB but over 100MB)"
    WARNINGS=$((WARNINGS + 1))
else
    echo "  ✗ Package size: ${SIZE}MB (exceeds 256MB limit)"
    ERRORS=$((ERRORS + 1))
fi

echo ""

# Check for .pubignore or .gitignore
echo "🚫 Checking ignore files..."

if [ -f ".pubignore" ]; then
    echo "  ✓ .pubignore exists"
elif [ -f ".gitignore" ]; then
    echo "  ✓ .gitignore exists (used as fallback)"
else
    echo "  ⚠ No .pubignore or .gitignore (might publish unwanted files)"
    WARNINGS=$((WARNINGS + 1))
fi

echo ""

# Run dart analyze
echo "🔬 Running static analysis..."

if command -v dart &> /dev/null; then
    if dart analyze 2>&1 | grep -q "No issues found"; then
        echo "  ✓ No analysis issues found"
    else
        echo "  ⚠ Analysis issues found - run 'dart analyze' for details"
        WARNINGS=$((WARNINGS + 1))
    fi
else
    echo "  ⚠ dart command not found - skipping analysis"
    WARNINGS=$((WARNINGS + 1))
fi

echo ""

# Summary
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📊 Summary:"
echo "  Errors: $ERRORS"
echo "  Warnings: $WARNINGS"
echo ""

if [ $ERRORS -gt 0 ]; then
    echo "❌ Package is NOT ready for publication"
    echo "   Fix the errors above before publishing."
    exit 1
elif [ $WARNINGS -gt 0 ]; then
    echo "⚠️  Package has warnings but can be published"
    echo "   Consider addressing warnings for better quality."
    echo ""
    echo "   Test publish with: dart pub publish --dry-run"
    exit 0
else
    echo "✅ Package is ready for publication!"
    echo ""
    echo "   Next steps:"
    echo "   1. Test publish: dart pub publish --dry-run"
    echo "   2. Publish: dart pub publish"
    exit 0
fi