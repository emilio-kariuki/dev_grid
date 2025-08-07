# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.1] - 2025-08-06

### Added
- Initial release of DevGrid package
- Basic grid overlay functionality with customizable spacing
- Support for horizontal and vertical grid lines
- Customizable line colors and thickness
- Column and row count-based grids
- GridPreset system with built-in presets:
  - `GridPreset.figma8pt` - Figma's 8-point grid system
  - `GridPreset.bootstrap12` - Bootstrap's 12-column grid
  - `GridPreset.material16` - Material Design's 16dp grid
- Safe area visualization
- Margin guides with customizable width
- Ruler markings along edges
- Responsive breakpoint visualization
- Keyboard toggle support with customizable key combinations
- Smooth fade in/out animations
- Debug mode only visibility (automatically hidden in release builds)
- Comprehensive test suite with 28 tests
- Complete documentation and examples

### Features
- **Grid Types**: Fixed spacing, column/row counts, and design system presets
- **Customization**: Full control over colors, thickness, spacing, and appearance
- **Developer Experience**: Keyboard shortcuts, debug mode integration, smooth animations
- **Responsive Design**: Breakpoint visualization and responsive grid behavior
- **Performance**: Zero impact on release builds, efficient CustomPaint rendering
- **Accessibility**: Non-intrusive overlay that doesn't interfere with app functionality

### Documentation
- Comprehensive README with usage examples
- API documentation for all public methods and properties
- Example application demonstrating all features
- Best practices and performance considerations
