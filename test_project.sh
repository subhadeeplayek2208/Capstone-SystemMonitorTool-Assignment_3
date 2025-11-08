#!/bin/bash
# Test script for System Monitor Tool
# Run this in WSL or Linux environment

echo "========================================="
echo "System Monitor Tool - Build & Test Script"
echo "========================================="
echo ""

# Check if we're in the right directory
if [ ! -f "CMakeLists.txt" ]; then
    echo "Error: CMakeLists.txt not found. Please run this script from the project root."
    exit 1
fi

# Create build directory
echo "Step 1: Creating build directory..."
mkdir -p build
cd build

# Configure with CMake
echo ""
echo "Step 2: Configuring with CMake..."
if cmake ..; then
    echo "✓ CMake configuration successful"
else
    echo "✗ CMake configuration failed"
    exit 1
fi

# Build the project
echo ""
echo "Step 3: Building the project..."
if make -j$(nproc); then
    echo "✓ Build successful"
else
    echo "✗ Build failed"
    exit 1
fi

# Check if executable exists
echo ""
echo "Step 4: Checking executable..."
if [ -f "system_monitor" ]; then
    echo "✓ Executable found: system_monitor"
    ls -lh system_monitor
else
    echo "✗ Executable not found"
    exit 1
fi

# Test run (5 seconds)
echo ""
echo "Step 5: Testing executable (will run for 5 seconds)..."
echo "Press Ctrl+C to stop early, or wait 5 seconds"
echo ""
timeout 5 ./system_monitor 2>&1 || true

echo ""
echo "========================================="
echo "Test completed!"
echo "To run the monitor: cd build && ./system_monitor"
echo "========================================="

