import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:blurbox/blurbox.dart'; 

void main() {
  testWidgets('BlurBox should render a blurred child widget', (WidgetTester tester) async {
    // Arrange: Create a BlurBox with a child widget
    final childWidget = Text('Hello, world!');
    await tester.pumpWidget(BlurBox(child: childWidget));

    // Assert: Verify that the blurred child widget is rendered correctly
    expect(find.text('Hello, world!'), findsOneWidget);
    expect(find.byType(ImageFilter), findsOneWidget); // Ensure blur filter is applied
  });

  // Write more test cases for different scenarios and properties
}