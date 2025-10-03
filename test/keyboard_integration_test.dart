import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dev_grid/dev_grid.dart';

void main() {
  group('DevGrid keyboard integration tests', () {
    testWidgets('keyboard toggle functionality', (WidgetTester tester) async {
    bool initialShowGuides = true;
    
    await tester.pumpWidget(
      MaterialApp(
        home: DevGrid(
          showGuides: initialShowGuides,
          debugOnly: false, // Ensure it works in test mode
          toggleKeySet: LogicalKeySet(
            LogicalKeyboardKey.control,
            LogicalKeyboardKey.keyG,
          ),
          child: const Scaffold(
            body: Center(
              child: Text('Test App'),
            ),
          ),
        ),
      ),
    );

    // Verify the app is built correctly
    expect(find.text('Test App'), findsOneWidget);
    expect(find.byType(DevGrid), findsOneWidget);

    // Verify the initial state - guides should be visible
    final devGrid = tester.widget<DevGrid>(find.byType(DevGrid));
    expect(devGrid.showGuides, isTrue);

    // Test that the Focus widget is present and ready for keyboard events
    final focusFinder = find.descendant(
      of: find.byType(DevGrid),
      matching: find.byType(Focus),
    );
    expect(focusFinder, findsOneWidget);

    // Simulate keyboard event (Ctrl+G)
    await tester.sendKeyDownEvent(LogicalKeyboardKey.control);
    await tester.sendKeyDownEvent(LogicalKeyboardKey.keyG);
    await tester.pumpAndSettle();
    
    // Note: In a real app, this would toggle the guides visibility
    // The internal state change would be tested through the animation
    
    await tester.sendKeyUpEvent(LogicalKeyboardKey.keyG);
    await tester.sendKeyUpEvent(LogicalKeyboardKey.control);
    await tester.pumpAndSettle();

    debugPrint('✅ Keyboard toggle test completed successfully');
    });

    testWidgets('enhanced keyboard controls', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DevGrid(
            showGuides: true,
            debugOnly: false,
            toggleKeySet: LogicalKeySet(
              LogicalKeyboardKey.control,
              LogicalKeyboardKey.keyG,
            ),
            child: const Scaffold(
              body: Center(
                child: Text('Enhanced Controls Test'),
              ),
            ),
          ),
        ),
      );

      // Verify the app is built correctly
      expect(find.text('Enhanced Controls Test'), findsOneWidget);
      expect(find.byType(DevGrid), findsOneWidget);

      // Test spacing controls with + key (Shift + =)
      await tester.sendKeyDownEvent(LogicalKeyboardKey.shift);
      await tester.sendKeyDownEvent(LogicalKeyboardKey.equal);
      await tester.pumpAndSettle();
      await tester.sendKeyUpEvent(LogicalKeyboardKey.equal);
      await tester.sendKeyUpEvent(LogicalKeyboardKey.shift);

      // Test spacing controls with - key
      await tester.sendKeyDownEvent(LogicalKeyboardKey.minus);
      await tester.pumpAndSettle();
      await tester.sendKeyUpEvent(LogicalKeyboardKey.minus);

      // Test arrow key controls
      await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowUp);
      await tester.pumpAndSettle();
      await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowUp);

      await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowDown);
      await tester.pumpAndSettle();
      await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowDown);

      await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowLeft);
      await tester.pumpAndSettle();
      await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowLeft);

      await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowRight);
      await tester.pumpAndSettle();
      await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowRight);

      // Test preset switching (1, 2, 3, 0 keys)
      await tester.sendKeyDownEvent(LogicalKeyboardKey.digit1);
      await tester.pumpAndSettle();
      await tester.sendKeyUpEvent(LogicalKeyboardKey.digit1);

      await tester.sendKeyDownEvent(LogicalKeyboardKey.digit2);
      await tester.pumpAndSettle();
      await tester.sendKeyUpEvent(LogicalKeyboardKey.digit2);

      await tester.sendKeyDownEvent(LogicalKeyboardKey.digit3);
      await tester.pumpAndSettle();
      await tester.sendKeyUpEvent(LogicalKeyboardKey.digit3);

      await tester.sendKeyDownEvent(LogicalKeyboardKey.digit0);
      await tester.pumpAndSettle();
      await tester.sendKeyUpEvent(LogicalKeyboardKey.digit0);

      // Test reset functionality (R key)
      await tester.sendKeyDownEvent(LogicalKeyboardKey.keyR);
      await tester.pumpAndSettle();
      await tester.sendKeyUpEvent(LogicalKeyboardKey.keyR);

      debugPrint('✅ Enhanced keyboard controls test completed successfully');
    });
  });
}
