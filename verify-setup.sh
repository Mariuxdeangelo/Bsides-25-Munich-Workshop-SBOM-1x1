#!/bin/bash

echo "=========================================="
echo "SBOM Workshop - Setup Verification"
echo "=========================================="
echo ""

# Check if running in correct directory
if [ ! -f "README.md" ]; then
    echo "❌ Please run this script from the repository root"
    exit 1
fi

echo "Checking tool installations..."
echo ""

# Check syft
if command -v syft &> /dev/null; then
    echo "✓ Syft is installed"
    syft version | grep "Version:" | head -1
else
    echo "❌ Syft is NOT installed"
    MISSING=1
fi

echo ""

# Check grype
if command -v grype &> /dev/null; then
    echo "✓ Grype is installed"
    grype version | grep "Version:" | head -1
else
    echo "❌ Grype is NOT installed"
    MISSING=1
fi

echo ""

# Check cdxgen
if command -v cdxgen &> /dev/null; then
    echo "✓ cdxgen is installed"
    cdxgen --version
else
    echo "❌ cdxgen is NOT installed"
    MISSING=1
fi

echo ""
echo "=========================================="

if [ -z "$MISSING" ]; then
    echo "✅ All tools are installed correctly!"
    echo ""
    echo "You're ready to start the workshop!"
    echo "Check WORKSHOP_GUIDE.md for exercises."
    exit 0
else
    echo "❌ Some tools are missing"
    echo ""
    echo "This usually means:"
    echo "1. The devcontainer is still building"
    echo "2. The postCreateCommand hasn't run yet"
    echo ""
    echo "Please wait a moment and try again."
    exit 1
fi
