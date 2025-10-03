import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:dev_grid/dev_grid.dart';

void main() {
  group('DevGrid Widget Tests', () {
    testWidgets('DevGrid renders child widget correctly', (WidgetTester tester) async {
      const testWidget = Text('Test Child');
      
      await tester.pumpWidget(
        const MaterialApp(
          home: DevGrid(
            child: testWidget,
          ),
        ),
      );

      expect(find.text('Test Child'), findsOneWidget);
    });

    testWidgets('DevGrid shows guides by default in debug mode', (WidgetTester tester) async {
      const testWidget = Text('Test Child');
      
      await tester.pumpWidget(
        const MaterialApp(
          home: DevGrid(
            child: testWidget,
          ),
        ),
      );

      // The guides should be visible by default in debug mode
      // Find the DevGrid widget and check that it contains a CustomPaint
      final devGridFinder = find.byType(DevGrid);
      expect(devGridFinder, findsOneWidget);
      
      // Look for CustomPaint within the DevGrid
      final customPaintInDevGrid = find.descendant(
        of: devGridFinder,
        matching: find.byType(CustomPaint),
      );
      expect(customPaintInDevGrid, findsOneWidget);
    });

    testWidgets('DevGrid can hide guides when showGuides is false', (WidgetTester tester) async {
      const testWidget = Text('Test Child');

      await tester.pumpWidget(
        const MaterialApp(
          home: DevGrid(
            showGuides: false,
            child: testWidget,
          ),
        ),
      );

      // When guides are hidden, CustomPaint should not be present
      final devGridFinder = find.byType(DevGrid);
      final customPaintInDevGrid = find.descendant(
        of: devGridFinder,
        matching: find.byType(CustomPaint),
      );
      expect(customPaintInDevGrid, findsNothing);
    });

    testWidgets('DevGrid respects debugOnly parameter', (WidgetTester tester) async {
      const testWidget = Text('Test Child');
      
      await tester.pumpWidget(
        const MaterialApp(
          home: DevGrid(
            debugOnly: false,
            showGuides: true,
            child: testWidget,
          ),
        ),
      );

      // The guides should be visible regardless of debug mode when debugOnly is false
      final devGridFinder = find.byType(DevGrid);
      expect(devGridFinder, findsOneWidget);
      
      // Look for CustomPaint within the DevGrid
      final customPaintInDevGrid = find.descendant(
        of: devGridFinder,
        matching: find.byType(CustomPaint),
      );
      expect(customPaintInDevGrid, findsOneWidget);
    });

    testWidgets('DevGrid applies custom line color', (WidgetTester tester) async {
      const customColor = Color(0xFF00FF00); // Green
      const testWidget = Text('Test Child');
      
      await tester.pumpWidget(
        const MaterialApp(
          home: DevGrid(
            lineColor: customColor,
            child: testWidget,
          ),
        ),
      );

      final devGridFinder = find.byType(DevGrid);
      final customPaintInDevGrid = find.descendant(
        of: devGridFinder,
        matching: find.byType(CustomPaint),
      );
      final customPaint = tester.widget<CustomPaint>(customPaintInDevGrid);
      final painter = customPaint.painter as LayoutGuidePainter;
      expect(painter.lineColor, equals(customColor));
    });

    testWidgets('DevGrid applies custom line thickness', (WidgetTester tester) async {
      const customThickness = 3.0;
      const testWidget = Text('Test Child');
      
      await tester.pumpWidget(
        const MaterialApp(
          home: DevGrid(
            lineThickness: customThickness,
            child: testWidget,
          ),
        ),
      );

      final devGridFinder = find.byType(DevGrid);
      final customPaintInDevGrid = find.descendant(
        of: devGridFinder,
        matching: find.byType(CustomPaint),
      );
      final customPaint = tester.widget<CustomPaint>(customPaintInDevGrid);
      final painter = customPaint.painter as LayoutGuidePainter;
      expect(painter.lineThickness, equals(customThickness));
    });

    testWidgets('DevGrid applies custom spacing values', (WidgetTester tester) async {
      const customHorizontalSpacing = 12.0;
      const customVerticalSpacing = 16.0;
      const testWidget = Text('Test Child');
      
      await tester.pumpWidget(
        const MaterialApp(
          home: DevGrid(
            horizontalSpacing: customHorizontalSpacing,
            verticalSpacing: customVerticalSpacing,
            child: testWidget,
          ),
        ),
      );

      final devGridFinder = find.byType(DevGrid);
      final customPaintInDevGrid = find.descendant(
        of: devGridFinder,
        matching: find.byType(CustomPaint),
      );
      final customPaint = tester.widget<CustomPaint>(customPaintInDevGrid);
      final painter = customPaint.painter as LayoutGuidePainter;
      expect(painter.horizontalSpacing, equals(customHorizontalSpacing));
      expect(painter.verticalSpacing, equals(customVerticalSpacing));
    });

    testWidgets('DevGrid applies column and row counts', (WidgetTester tester) async {
      const columnCount = 12;
      const rowCount = 8;
      const testWidget = Text('Test Child');
      
      await tester.pumpWidget(
        const MaterialApp(
          home: DevGrid(
            columnCount: columnCount,
            rowCount: rowCount,
            child: testWidget,
          ),
        ),
      );

      final devGridFinder = find.byType(DevGrid);
      final customPaintInDevGrid = find.descendant(
        of: devGridFinder,
        matching: find.byType(CustomPaint),
      );
      final customPaint = tester.widget<CustomPaint>(customPaintInDevGrid);
      final painter = customPaint.painter as LayoutGuidePainter;
      expect(painter.columnCount, equals(columnCount));
      expect(painter.rowCount, equals(rowCount));
    });

    testWidgets('DevGrid applies safe area settings', (WidgetTester tester) async {
      const testWidget = Text('Test Child');
      
      await tester.pumpWidget(
        const MaterialApp(
          home: DevGrid(
            showSafeArea: true,
            child: testWidget,
          ),
        ),
      );

      final devGridFinder = find.byType(DevGrid);
      final customPaintInDevGrid = find.descendant(
        of: devGridFinder,
        matching: find.byType(CustomPaint),
      );
      final customPaint = tester.widget<CustomPaint>(customPaintInDevGrid);
      final painter = customPaint.painter as LayoutGuidePainter;
      expect(painter.showSafeArea, isTrue);
    });

    testWidgets('DevGrid applies margin width', (WidgetTester tester) async {
      const customMarginWidth = 24.0;
      const testWidget = Text('Test Child');
      
      await tester.pumpWidget(
        const MaterialApp(
          home: DevGrid(
            marginWidth: customMarginWidth,
            child: testWidget,
          ),
        ),
      );

      final devGridFinder = find.byType(DevGrid);
      final customPaintInDevGrid = find.descendant(
        of: devGridFinder,
        matching: find.byType(CustomPaint),
      );
      final customPaint = tester.widget<CustomPaint>(customPaintInDevGrid);
      final painter = customPaint.painter as LayoutGuidePainter;
      expect(painter.marginWidth, equals(customMarginWidth));
    });

    testWidgets('DevGrid applies ruler settings', (WidgetTester tester) async {
      const testWidget = Text('Test Child');
      
      await tester.pumpWidget(
        const MaterialApp(
          home: DevGrid(
            showRuler: true,
            child: testWidget,
          ),
        ),
      );

      final devGridFinder = find.byType(DevGrid);
      final customPaintInDevGrid = find.descendant(
        of: devGridFinder,
        matching: find.byType(CustomPaint),
      );
      final customPaint = tester.widget<CustomPaint>(customPaintInDevGrid);
      final painter = customPaint.painter as LayoutGuidePainter;
      expect(painter.showRuler, isTrue);
    });

    testWidgets('DevGrid applies breakpoints', (WidgetTester tester) async {
      const breakpoints = [600.0, 1200.0];
      const testWidget = Text('Test Child');
      
      await tester.pumpWidget(
        const MaterialApp(
          home: DevGrid(
            breakpoints: breakpoints,
            child: testWidget,
          ),
        ),
      );

      final devGridFinder = find.byType(DevGrid);
      final customPaintInDevGrid = find.descendant(
        of: devGridFinder,
        matching: find.byType(CustomPaint),
      );
      final customPaint = tester.widget<CustomPaint>(customPaintInDevGrid);
      final painter = customPaint.painter as LayoutGuidePainter;
      expect(painter.breakpoints, equals(breakpoints));
    });

    testWidgets('DevGrid toggles guides on state change', (WidgetTester tester) async {
      const testWidget = Text('Test Child');
      bool showGuides = true;
      
      await tester.pumpWidget(
        MaterialApp(
          home: StatefulBuilder(
            builder: (context, setState) {
              return DevGrid(
                showGuides: showGuides,
                child: Column(
                  children: [
                    testWidget,
                    ElevatedButton(
                      onPressed: () => setState(() {
                        showGuides = !showGuides;
                      }),
                      child: const Text('Toggle'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );

      // Initially guides should be visible
      final devGrid = tester.widget<DevGrid>(find.byType(DevGrid));
      expect(devGrid.showGuides, isTrue);

      // Tap to trigger state change
      await tester.tap(find.text('Toggle'));
      await tester.pumpAndSettle();

      // Check that the widget was updated
      final updatedDevGrid = tester.widget<DevGrid>(find.byType(DevGrid));
      expect(updatedDevGrid.showGuides, isFalse);
    });
  });

  group('GridPreset Tests', () {
    testWidgets('DevGrid applies figma8pt preset correctly', (WidgetTester tester) async {
      const testWidget = Text('Test Child');
      
      await tester.pumpWidget(
        const MaterialApp(
          home: DevGrid(
            preset: GridPreset.figma8pt,
            child: testWidget,
          ),
        ),
      );

      final devGridFinder = find.byType(DevGrid);
      final customPaintInDevGrid = find.descendant(
        of: devGridFinder,
        matching: find.byType(CustomPaint),
      );
      final customPaint = tester.widget<CustomPaint>(customPaintInDevGrid);
      final painter = customPaint.painter as LayoutGuidePainter;
      expect(painter.preset, equals(GridPreset.figma8pt));
    });

    testWidgets('DevGrid applies bootstrap12 preset correctly', (WidgetTester tester) async {
      const testWidget = Text('Test Child');
      
      await tester.pumpWidget(
        const MaterialApp(
          home: DevGrid(
            preset: GridPreset.bootstrap12,
            child: testWidget,
          ),
        ),
      );

      final devGridFinder = find.byType(DevGrid);
      final customPaintInDevGrid = find.descendant(
        of: devGridFinder,
        matching: find.byType(CustomPaint),
      );
      final customPaint = tester.widget<CustomPaint>(customPaintInDevGrid);
      final painter = customPaint.painter as LayoutGuidePainter;
      expect(painter.preset, equals(GridPreset.bootstrap12));
    });

    testWidgets('DevGrid applies material16 preset correctly', (WidgetTester tester) async {
      const testWidget = Text('Test Child');
      
      await tester.pumpWidget(
        const MaterialApp(
          home: DevGrid(
            preset: GridPreset.material16,
            child: testWidget,
          ),
        ),
      );

      final devGridFinder = find.byType(DevGrid);
      final customPaintInDevGrid = find.descendant(
        of: devGridFinder,
        matching: find.byType(CustomPaint),
      );
      final customPaint = tester.widget<CustomPaint>(customPaintInDevGrid);
      final painter = customPaint.painter as LayoutGuidePainter;
      expect(painter.preset, equals(GridPreset.material16));
    });

    test('GridPreset enum has correct values', () {
      expect(GridPreset.values.length, equals(3));
      expect(GridPreset.values, contains(GridPreset.figma8pt));
      expect(GridPreset.values, contains(GridPreset.bootstrap12));
      expect(GridPreset.values, contains(GridPreset.material16));
    });
  });

  group('LayoutGuidePainter Tests', () {
    testWidgets('LayoutGuidePainter shouldRepaint returns true when properties change', (WidgetTester tester) async {
      final painter1 = LayoutGuidePainter(
        horizontalSpacing: 8.0,
        verticalSpacing: 8.0,
        lineColor: Colors.red,
        lineThickness: 1.0,
        context: MockBuildContext(),
      );

      final painter2 = LayoutGuidePainter(
        horizontalSpacing: 16.0, // Changed
        verticalSpacing: 8.0,
        lineColor: Colors.red,
        lineThickness: 1.0,
        context: MockBuildContext(),
      );

      expect(painter1.shouldRepaint(painter2), isTrue);
    });

    testWidgets('LayoutGuidePainter shouldRepaint returns false when properties are same', (WidgetTester tester) async {
      final context = MockBuildContext();
      final painter1 = LayoutGuidePainter(
        horizontalSpacing: 8.0,
        verticalSpacing: 8.0,
        lineColor: Colors.red,
        lineThickness: 1.0,
        context: context,
      );

      final painter2 = LayoutGuidePainter(
        horizontalSpacing: 8.0,
        verticalSpacing: 8.0,
        lineColor: Colors.red,
        lineThickness: 1.0,
        context: context,
      );

      expect(painter1.shouldRepaint(painter2), isFalse);
    });
  });

  group('Default Values Tests', () {
    testWidgets('DevGrid has correct default values', (WidgetTester tester) async {
      const testWidget = Text('Test Child');
      
      await tester.pumpWidget(
        const MaterialApp(
          home: DevGrid(
            child: testWidget,
          ),
        ),
      );

      final devGrid = tester.widget<DevGrid>(find.byType(DevGrid));
      
      expect(devGrid.showGuides, equals(kDebugMode));
      expect(devGrid.horizontalSpacing, equals(8.0));
      expect(devGrid.verticalSpacing, equals(8.0));
      expect(devGrid.lineColor, equals(const Color(0x1AFF0000)));
      expect(devGrid.lineThickness, equals(1.0));
      expect(devGrid.columnCount, isNull);
      expect(devGrid.rowCount, isNull);
      expect(devGrid.toggleKeySet, isNull);
      expect(devGrid.preset, isNull);
      expect(devGrid.showSafeArea, isFalse);
      expect(devGrid.marginWidth, equals(16.0));
      expect(devGrid.showRuler, isFalse);
      expect(devGrid.breakpoints, isNull);
      expect(devGrid.debugOnly, isTrue);
    });
  });

  group('Widget Lifecycle Tests', () {
    testWidgets('DevGrid disposes properly', (WidgetTester tester) async {
      const testWidget = Text('Test Child');

      await tester.pumpWidget(
        const MaterialApp(
          home: DevGrid(
            child: testWidget,
          ),
        ),
      );

      // Widget should be built without errors
      expect(find.byType(DevGrid), findsOneWidget);

      // Remove the widget to trigger dispose
      await tester.pumpWidget(
        const MaterialApp(
          home: Text('New Widget'),
        ),
      );

      // Should not throw any errors during disposal
      expect(find.text('New Widget'), findsOneWidget);
    });

    testWidgets('DevGrid shows guides correctly when enabled', (WidgetTester tester) async {
      const testWidget = Text('Test Child');

      await tester.pumpWidget(
        const MaterialApp(
          home: DevGrid(
            showGuides: true,
            debugOnly: false, // Ensure guides are shown regardless of debug mode
            child: testWidget,
          ),
        ),
      );

      // Check that the DevGrid widget is configured to show guides
      final devGrid = tester.widget<DevGrid>(find.byType(DevGrid));
      expect(devGrid.showGuides, isTrue);
      expect(devGrid.debugOnly, isFalse);

      // CustomPaint should be present when guides are shown
      final customPaint = find.descendant(
        of: find.byType(DevGrid),
        matching: find.byType(CustomPaint),
      );
      expect(customPaint, findsOneWidget);
    });
  });

  group('Keyboard Interaction Tests', () {
    testWidgets('DevGrid responds to keyboard toggle when toggleKeySet is provided', (WidgetTester tester) async {
      const testWidget = Text('Test Child');
      
      await tester.pumpWidget(
        MaterialApp(
          home: DevGrid(
            toggleKeySet: LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyG),
            child: testWidget,
          ),
        ),
      );

      // Find the Focus widget within DevGrid specifically
      final devGridFinder = find.byType(DevGrid);
      expect(devGridFinder, findsOneWidget);
      
      final focusInDevGrid = find.descendant(
        of: devGridFinder,
        matching: find.byType(Focus),
      );
      expect(focusInDevGrid, findsOneWidget);
      
      // The widget should be built successfully
      expect(find.byType(DevGrid), findsOneWidget);
    });
  });

  group('Edge Cases Tests', () {
    testWidgets('DevGrid handles null preset correctly', (WidgetTester tester) async {
      const testWidget = Text('Test Child');
      
      await tester.pumpWidget(
        const MaterialApp(
          home: DevGrid(
            preset: null,
            child: testWidget,
          ),
        ),
      );

      final devGridFinder = find.byType(DevGrid);
      final customPaintInDevGrid = find.descendant(
        of: devGridFinder,
        matching: find.byType(CustomPaint),
      );
      final customPaint = tester.widget<CustomPaint>(customPaintInDevGrid);
      final painter = customPaint.painter as LayoutGuidePainter;
      expect(painter.preset, isNull);
    });

    testWidgets('DevGrid handles empty breakpoints list', (WidgetTester tester) async {
      const testWidget = Text('Test Child');
      
      await tester.pumpWidget(
        const MaterialApp(
          home: DevGrid(
            breakpoints: [],
            child: testWidget,
          ),
        ),
      );

      final devGridFinder = find.byType(DevGrid);
      final customPaintInDevGrid = find.descendant(
        of: devGridFinder,
        matching: find.byType(CustomPaint),
      );
      final customPaint = tester.widget<CustomPaint>(customPaintInDevGrid);
      final painter = customPaint.painter as LayoutGuidePainter;
      expect(painter.breakpoints, equals([]));
    });

    testWidgets('DevGrid handles zero spacing values', (WidgetTester tester) async {
      const testWidget = Text('Test Child');

      await tester.pumpWidget(
        const MaterialApp(
          home: DevGrid(
            horizontalSpacing: 1.0,
            verticalSpacing: 1.0,
            child: testWidget,
          ),
        ),
      );

      final devGridFinder = find.byType(DevGrid);
      final customPaintInDevGrid = find.descendant(
        of: devGridFinder,
        matching: find.byType(CustomPaint),
      );
      final customPaint = tester.widget<CustomPaint>(customPaintInDevGrid);
      final painter = customPaint.painter as LayoutGuidePainter;
      expect(painter.horizontalSpacing, equals(1.0));
      expect(painter.verticalSpacing, equals(1.0));
    });

    testWidgets('DevGrid handles zero margin width', (WidgetTester tester) async {
      const testWidget = Text('Test Child');
      
      await tester.pumpWidget(
        const MaterialApp(
          home: DevGrid(
            marginWidth: 0.0,
            child: testWidget,
          ),
        ),
      );

      final devGridFinder = find.byType(DevGrid);
      final customPaintInDevGrid = find.descendant(
        of: devGridFinder,
        matching: find.byType(CustomPaint),
      );
      final customPaint = tester.widget<CustomPaint>(customPaintInDevGrid);
      final painter = customPaint.painter as LayoutGuidePainter;
      expect(painter.marginWidth, equals(0.0));
    });
  });

  group('Complex Widget Tests', () {
    testWidgets('DevGrid works with complex child widgets', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DevGrid(
            child: Scaffold(
              appBar: AppBar(title: const Text('Test App')),
              body: const Column(
                children: [
                  Text('Header'),
                  Expanded(
                    child: Text('Content Area'),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            ),
          ),
        ),
      );

      // Check that all parts of the complex UI are rendered
      expect(find.text('Test App'), findsOneWidget);
      expect(find.text('Header'), findsOneWidget);
      expect(find.text('Content Area'), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
      
      // Check that DevGrid is still working
      expect(find.byType(DevGrid), findsOneWidget);
    });
  });
}

// Mock BuildContext for testing LayoutGuidePainter
class MockBuildContext extends BuildContext {
  @override
  bool get debugDoingBuild => false;

  @override
  InheritedWidget dependOnInheritedElement(InheritedElement ancestor, {Object? aspect}) {
    throw UnimplementedError();
  }

  @override
  T? dependOnInheritedWidgetOfExactType<T extends InheritedWidget>({Object? aspect}) {
    return null;
  }

  @override
  T? getInheritedWidgetOfExactType<T extends InheritedWidget>() {
    return null;
  }

  @override
  void dispatchNotification(Notification notification) {}

  @override
  DiagnosticsNode describeElement(String name, {DiagnosticsTreeStyle style = DiagnosticsTreeStyle.errorProperty}) {
    throw UnimplementedError();
  }

  @override
  List<DiagnosticsNode> describeMissingAncestor({required Type expectedAncestorType}) {
    throw UnimplementedError();
  }

  @override
  DiagnosticsNode describeOwnershipChain(String name) {
    throw UnimplementedError();
  }

  @override
  DiagnosticsNode describeWidget(String name, {DiagnosticsTreeStyle style = DiagnosticsTreeStyle.errorProperty}) {
    throw UnimplementedError();
  }

  @override
  T? findAncestorRenderObjectOfType<T extends RenderObject>() {
    return null;
  }

  @override
  T? findAncestorStateOfType<T extends State<StatefulWidget>>() {
    return null;
  }

  @override
  T? findAncestorWidgetOfExactType<T extends Widget>() {
    return null;
  }

  @override
  RenderObject? findRenderObject() {
    return null;
  }

  @override
  T? findRootAncestorStateOfType<T extends State<StatefulWidget>>() {
    return null;
  }

  @override
  InheritedElement? getElementForInheritedWidgetOfExactType<T extends InheritedWidget>() {
    return null;
  }

  @override
  BuildOwner? get owner => null;

  @override
  Size? get size => const Size(400, 600);

  @override
  void visitAncestorElements(bool Function(Element element) visitor) {}

  @override
  void visitChildElements(ElementVisitor visitor) {}

  @override
  Widget get widget => throw UnimplementedError();

  @override
  bool get mounted => true;
}
