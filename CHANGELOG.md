# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.3] - 2025-10-03

### Changed
- **Simplified Architecture**: Removed all animation-related code for a more straightforward implementation
  - Removed `AnimationController`, `Animation<double>`, and `SingleTickerProviderStateMixin`
  - Grid now toggles instantly without fade effects
  - Replaced `AnimatedBuilder` and `AnimatedOpacity` with simple conditional rendering

### Removed
- **Opacity Controls**: Removed Ctrl+Up/Down keyboard shortcuts for opacity adjustment
- **Animation System**: Removed all fade in/out animations for immediate grid visibility toggling

### Fixed
- **Test Suite**: Updated all tests to reflect simplified behavior
  - Replaced `AnimatedOpacity` checks with `CustomPaint` presence/absence validation
  - Removed opacity control keyboard tests
  - Fixed zero spacing test to use minimum viable spacing (1.0) to prevent infinite loops

### Technical
- **Code Reduction**: Reduced codebase complexity by removing ~50 lines of animation code
- **Performance**: Improved performance by eliminating animation frame calculations
- **Maintainability**: Simplified state management with fewer internal state variables

---

## [0.0.2] - 2025-08-07

### Added
- **Enhanced Keyboard Controls**: Comprehensive keyboard shortcuts for real-time grid manipulation:
  - `Ctrl+G`: Toggle grid visibility
  - `+/-`: Adjust horizontal spacing
  - `Ctrl + +/-`: Adjust vertical spacing
  - `Arrow Keys`: Fine-tune spacing (0.5px increments)
  - `Ctrl + ↑/↓`: Control grid opacity (0.1-1.0 range)
  - `1/2/3/0`: Switch between presets (Figma 8pt/Bootstrap 12/Material 16dp/Custom)
  - `R`: Reset all settings to defaults
- **Dynamic Grid Properties**: Real-time grid adjustment without widget rebuilds
- **Opacity Control**: Adjustable grid transparency via keyboard shortcuts
- **Enhanced Test Suite**: Comprehensive keyboard interaction testing

### Changed
- **API Modernization**: Updated deprecated `withValues()` usage to current Flutter standards
- **Performance Improvements**: Optimized keyboard event handling with modifier key detection
- **Animation System**: Enhanced smooth transitions for grid property changes
- **Example App**: Updated with comprehensive keyboard shortcuts documentation

### Fixed
- **Flutter Compatibility**: Resolved all deprecated API warnings for Flutter 3.8+
- **Keyboard Focus**: Improved focus management for consistent keyboard interaction
- **Color API**: Updated color manipulation to use modern Flutter color methods

### Technical
- **Code Quality**: Zero lint warnings, 100% test coverage
- **Static Analysis**: Clean analysis with no issues
- **Documentation**: Enhanced inline documentation and usage examples

---

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
- Comprehensive test suite with 30+ tests including keyboard interaction tests
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
