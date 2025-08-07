import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dev_grid/dev_grid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DevGrid(
      // Basic configuration
      showGuides: true,
      horizontalSpacing: 8.0,
      verticalSpacing: 8.0,
      lineColor: Colors.red.withAlpha(38), // 0.15 * 255
      lineThickness: 1.0,
      
      // Enable keyboard toggle with Ctrl+G
      toggleKeySet: LogicalKeySet(
        LogicalKeyboardKey.control,
        LogicalKeyboardKey.keyG,
      ),
      
      // Show additional guides
      showSafeArea: true,
      showRuler: true,
      marginWidth: 16.0,
      
      // Responsive breakpoints
      breakpoints: const [600, 900, 1200],
      
      child: MaterialApp(
        title: 'DevGrid Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const ExampleHomePage(),
      ),
    );
  }
}

class ExampleHomePage extends StatefulWidget {
  const ExampleHomePage({super.key});

  @override
  State<ExampleHomePage> createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<ExampleHomePage> {
  GridPreset? selectedPreset;
  bool showCustomGrid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DevGrid Examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Text(
              'DevGrid Example App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'This app demonstrates the DevGrid package capabilities.\n\nKeyboard Controls:\n• Ctrl+G: Toggle grid\n• +/-: Adjust spacing\n• Arrow keys: Fine-tune spacing\n• Ctrl+↑/↓: Opacity\n• 1/2/3/0: Switch presets\n• R: Reset to defaults',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),

            // Grid Preset Examples
            const Text(
              'Grid Presets',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            _buildPresetExample(),
            const SizedBox(height: 32),

            // Layout Examples
            const Text(
              'Layout Examples',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            _buildLayoutExamples(),
            const SizedBox(height: 32),

            // Grid Information
            _buildGridInfo(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showGridDialog(context);
        },
        tooltip: 'Grid Settings',
        child: const Icon(Icons.grid_on),
      ),
    );
  }

  Widget _buildPresetExample() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Choose a preset to see different grid systems:'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: [
                ChoiceChip(
                  label: const Text('Custom 8px'),
                  selected: selectedPreset == null && showCustomGrid,
                  onSelected: (selected) {
                    setState(() {
                      selectedPreset = null;
                      showCustomGrid = selected;
                    });
                    _updateGrid();
                  },
                ),
                ChoiceChip(
                  label: const Text('Figma 8pt'),
                  selected: selectedPreset == GridPreset.figma8pt,
                  onSelected: (selected) {
                    setState(() {
                      selectedPreset = selected ? GridPreset.figma8pt : null;
                      showCustomGrid = false;
                    });
                    _updateGrid();
                  },
                ),
                ChoiceChip(
                  label: const Text('Bootstrap 12'),
                  selected: selectedPreset == GridPreset.bootstrap12,
                  onSelected: (selected) {
                    setState(() {
                      selectedPreset = selected ? GridPreset.bootstrap12 : null;
                      showCustomGrid = false;
                    });
                    _updateGrid();
                  },
                ),
                ChoiceChip(
                  label: const Text('Material 16dp'),
                  selected: selectedPreset == GridPreset.material16,
                  onSelected: (selected) {
                    setState(() {
                      selectedPreset = selected ? GridPreset.material16 : null;
                      showCustomGrid = false;
                    });
                    _updateGrid();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLayoutExamples() {
    return Column(
      children: [
        // Row of cards
        Row(
          children: [
            Expanded(
              child: Card(
                child: Container(
                  height: 120,
                  padding: const EdgeInsets.all(16),
                  child: const Center(child: Text('Card 1')),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Card(
                child: Container(
                  height: 120,
                  padding: const EdgeInsets.all(16),
                  child: const Center(child: Text('Card 2')),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        
        // Grid of items
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Text('Item ${index + 1}'),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildGridInfo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Grid Features',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text('✓ Enhanced keyboard controls'),
            const Text('✓ Safe area visualization'),
            const Text('✓ Ruler markings'),
            const Text('✓ Responsive breakpoints'),
            const Text('✓ Custom spacing and colors'),
            const Text('✓ Design system presets'),
            const SizedBox(height: 12),
            const Text(
              'Try resizing the window or using different device sizes to see the responsive breakpoints in action.',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }

  void _updateGrid() {
    // In a real implementation, you'd update the DevGrid configuration
    // This is just for demonstration
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          selectedPreset != null
              ? 'Switched to ${selectedPreset.toString().split('.').last} preset'
              : 'Switched to custom 8px grid',
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showGridDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Grid Settings'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Current Configuration:'),
            SizedBox(height: 8),
            Text('• Horizontal Spacing: 8px'),
            Text('• Vertical Spacing: 8px'),
            Text('• Line Color: Red (15% opacity)'),
            Text('• Safe Area: Enabled'),
            Text('• Ruler: Enabled'),
            Text('• Breakpoints: 600, 900, 1200'),
            SizedBox(height: 12),
            Text('Press Ctrl+G to toggle grid visibility'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
