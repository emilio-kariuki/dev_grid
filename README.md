# DevGrid

[![pub package](https://img.shields.io/pub/v/dev_grid.svg)](https://pub.dev/packages/dev_grid)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A Flutter package that overlays your app with Figma-like grid guides for precise layout debugging and development. Perfect for ensuring pixel-perfect designs and maintaining consistent spacing throughout your Flutter applications.

## Features

✨ **Figma-like Grid Overlay** - Visual grid guides similar to design tools
🎯 **Precise Layout Debugging** - Align widgets with pixel-perfect accuracy
🎨 **Customizable Appearance** - Adjust colors, thickness, and spacing
📐 **Multiple Grid Types** - Fixed spacing, column/row counts, or design presets
⌨️ **Keyboard Controls** - Quick toggle and real-time grid adjustments
🔧 **Design System Presets** - Built-in Figma 8pt, Bootstrap 12-column, Material 16dp grids
📱 **Safe Area Visualization** - Show device safe areas and margins
📏 **Ruler Markings** - Optional measurement guides along edges
📊 **Responsive Breakpoints** - Visualize breakpoint boundaries
🎭 **Debug Mode Only** - Automatically hidden in production builds
⚡ **Lightweight & Fast** - Simple, performant implementation with instant toggling  

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  dev_grid: ^0.0.3
```

Then run:

```bash
flutter pub get
```

## Quick Start

Wrap your app's root widget with `DevGrid`:

```dart
import 'package:flutter/material.dart';
import 'package:dev_grid/dev_grid.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DevGrid(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('DevGrid Example')),
          body: Center(
            child: Text('Hello, World!'),
          ),
        ),
      ),
    );
  }
}
```

That's it! You'll now see a red grid overlay in debug mode.

## Usage Examples

### Basic Grid with Custom Spacing

```dart
DevGrid(
  horizontalSpacing: 16.0,
  verticalSpacing: 16.0,
  lineColor: Colors.blue.withOpacity(0.3),
  lineThickness: 1.5,
  child: YourApp(),
)
```

### Column-Based Grid (Bootstrap-style)

```dart
DevGrid(
  columnCount: 12,
  lineColor: Colors.purple.withOpacity(0.2),
  showSafeArea: true,
  marginWidth: 20.0,
  child: YourApp(),
)
```

### Design System Presets

```dart
// Figma 8-point grid system
DevGrid(
  preset: GridPreset.figma8pt,
  child: YourApp(),
)

// Bootstrap 12-column grid
DevGrid(
  preset: GridPreset.bootstrap12,
  child: YourApp(),
)

// Material Design 16dp grid
DevGrid(
  preset: GridPreset.material16,
  child: YourApp(),
)
```

### Advanced Configuration

```dart
DevGrid(
  showGuides: true,
  debugOnly: false, // Show in release mode too
  horizontalSpacing: 8.0,
  verticalSpacing: 8.0,
  lineColor: Colors.red.withOpacity(0.15),
  lineThickness: 1.0,
  showSafeArea: true,
  showRuler: true,
  marginWidth: 16.0,
  breakpoints: [600, 900, 1200], // Responsive breakpoints
  toggleKeySet: LogicalKeySet(
    LogicalKeyboardKey.control,
    LogicalKeyboardKey.keyG,
  ), // Ctrl+G to toggle
  child: YourApp(),
)
```

### Responsive Design with Breakpoints

```dart
DevGrid(
  breakpoints: [600.0, 900.0, 1200.0],
  columnCount: 12,
  showRuler: true,
  child: ResponsiveLayout(),
)
```

## API Reference

### DevGrid Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `child` | `Widget` | required | The widget to overlay with guides |
| `showGuides` | `bool` | `kDebugMode` | Whether to show the grid guides |
| `horizontalSpacing` | `double` | `8.0` | Spacing between horizontal grid lines |
| `verticalSpacing` | `double` | `8.0` | Spacing between vertical grid lines |
| `lineColor` | `Color` | `Color(0x1AFF0000)` | Color of the grid lines |
| `lineThickness` | `double` | `1.0` | Thickness of the grid lines |
| `columnCount` | `int?` | `null` | Number of columns (overrides verticalSpacing) |
| `rowCount` | `int?` | `null` | Number of rows (overrides horizontalSpacing) |
| `toggleKeySet` | `LogicalKeySet?` | `null` | Key combination to toggle guides |
| `preset` | `GridPreset?` | `null` | Predefined grid configuration |
| `showSafeArea` | `bool` | `false` | Show safe area boundaries |
| `marginWidth` | `double` | `16.0` | Width of margin guides |
| `showRuler` | `bool` | `false` | Show ruler markings |
| `breakpoints` | `List<double>?` | `null` | Responsive breakpoint widths |
| `debugOnly` | `bool` | `true` | Restrict to debug mode only |

### GridPreset Options

- **`GridPreset.figma8pt`** - Figma's 8-point grid system
- **`GridPreset.bootstrap12`** - Bootstrap's 12-column grid
- **`GridPreset.material16`** - Material Design's 16dp grid

## Keyboard Shortcuts

DevGrid supports powerful keyboard shortcuts for quick grid manipulation:

### Toggle Grid Visibility
```dart
DevGrid(
  toggleKeySet: LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyG),
  child: YourApp(),
)
```

Common toggle combinations:
- **Ctrl+G** (Windows/Linux)
- **Cmd+G** (macOS)
- **Alt+G** (Alternative)

### Real-time Grid Adjustments
When the grid is visible, use these shortcuts:
- **+/-** - Adjust horizontal spacing
- **Ctrl + +/-** - Adjust vertical spacing
- **Arrow Keys** - Fine-tune spacing (0.5px increments)
- **1/2/3** - Switch presets (Figma 8pt/Bootstrap 12/Material 16dp)
- **0** - Custom grid mode
- **R** - Reset all settings to defaults

## Best Practices

### 1. Debug Mode Only
By default, DevGrid only shows guides in debug mode and is automatically hidden in release builds:

```dart
DevGrid(
  debugOnly: true, // Default - only show in debug mode
  child: YourApp(),
)
```

### 2. Consistent Spacing
Use your design system's base unit for consistent spacing:

```dart
// For an 8px design system
DevGrid(
  horizontalSpacing: 8.0,
  verticalSpacing: 8.0,
  child: YourApp(),
)
```

### 3. Subtle Visual Design
Keep grid lines subtle to avoid interfering with your app's design:

```dart
DevGrid(
  lineColor: Colors.red.withOpacity(0.1), // Very subtle
  lineThickness: 0.5, // Thin lines
  child: YourApp(),
)
```

### 4. Responsive Development
Use breakpoints to visualize responsive behavior:

```dart
DevGrid(
  breakpoints: [600, 900, 1200], // Mobile, Tablet, Desktop
  columnCount: 12,
  child: ResponsiveApp(),
)
```

## Examples

### E-commerce App Layout
```dart
DevGrid(
  preset: GridPreset.bootstrap12,
  showSafeArea: true,
  marginWidth: 16.0,
  child: EcommerceApp(),
)
```

### Design System Validation
```dart
DevGrid(
  horizontalSpacing: 8.0,
  verticalSpacing: 8.0,
  lineColor: Colors.blue.withOpacity(0.15),
  showRuler: true,
  toggleKeySet: LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyG),
  child: DesignSystemApp(),
)
```

### Mobile-First Responsive Design
```dart
DevGrid(
  columnCount: 4, // Start with 4 columns for mobile
  breakpoints: [768, 1024], // Tablet and desktop breakpoints
  showSafeArea: true,
  child: ResponsiveMobileApp(),
)
```

## Performance Considerations

- **Zero Performance Impact in Release**: DevGrid is designed to have no impact on release builds when `debugOnly: true`
- **Efficient Rendering**: Uses `CustomPaint` for optimal grid rendering performance
- **Lightweight**: Simplified architecture with no animations for better performance
- **Instant Toggling**: Grid visibility changes happen immediately without animation overhead

## Contributing

We welcome contributions! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

### Development Setup

1. Fork the repository
2. Clone your fork: `git clone https://github.com/your-username/dev_grid.git`
3. Create a feature branch: `git checkout -b feature/amazing-feature`
4. Make your changes and add tests
5. Run tests: `flutter test`
6. Commit your changes: `git commit -m 'Add amazing feature'`
7. Push to the branch: `git push origin feature/amazing-feature`
8. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for a detailed history of changes.

## Support

- 📧 **Issues**: [GitHub Issues](https://github.com/emilio-kariuki/dev_grid/issues)
- 💬 **Discussions**: [GitHub Discussions](https://github.com/emilio-kariuki/dev_grid/discussions)
- 📚 **Documentation**: [API Documentation](https://pub.dev/documentation/dev_grid/latest/)

---

Made with ❤️ by [Emilio Kariuki](https://github.com/emilio-kariuki)
