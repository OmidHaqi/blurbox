/// BlurBox - A modern, flexible blur effect library for Flutter.
///
/// This library provides a collection of widgets for creating beautiful
/// frosted glass and blur effects in your Flutter applications.
///
/// ## Getting Started
///
/// Import this package:
/// ```dart
/// import 'package:blurbox/blurbox.dart';
/// ```
///
/// ## Core Widgets
///
/// - [BlurBox]: Base widget for creating blur effects
/// - [AnimatedBlurBox]: For animated blur transitions
/// - [PresetBlurBox]: Quick implementation with predefined styles
/// - [ThemedBlurBox]: Theme-aware blur styling
/// - [PatternedBlurBox]: Blur with decorative pattern overlays
///
/// ## Specialized Blur Effects
///
/// - [DirectionalBlurBox]: Creates a blur effect in a specific direction
/// - [RadialBlurBox]: Creates a radial blur emanating from a center point
/// - [FollowingBlurBox]: Creates a blur that follows the user's pointer
/// - [ScrollAwareBlurBox]: Blur that responds to scroll position
///
/// ## Abstract Blur Patterns
///
/// - [GeometricPatternBlurBox]: Creates abstract geometric blur patterns
/// - [OrganicPatternBlurBox]: Creates flowing, organic blur patterns
/// - [KaleidoscopeBlurBox]: Creates kaleidoscopic mirrored blur patterns
///
/// ## Extension Methods
///
/// Use extension methods for a cleaner syntax:
/// ```dart
/// // Apply blur to any widget
/// Text('Hello').blurry(blur: 5.0);
///
/// // Apply animated blur
/// Image.asset('background.jpg').animatedBlurry(blur: 10.0);
///
/// // Apply patterned blur (new!)
/// Container().patternedBlurry(
///   blur: 8.0,
///   patternAsset: 'assets/pattern.png',
///   patternOpacity: 0.2,
/// );
/// ```
///
/// ## Examples
///
/// ### Frosted Glass Card
/// ```dart
/// BlurBox(
///   blur: 8.0,
///   color: Colors.white.withValues( alpha:0.2),
///   borderRadius: BorderRadius.circular(15),
///   child: Padding(
///     padding: const EdgeInsets.all(20),
///     child: Column(
///       children: [
///         Icon(Icons.star, size: 40),
///         SizedBox(height: 8),
///         Text('Frosted Glass Effect'),
///       ],
///     ),
///   ),
/// )
/// ```
library;

import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'dart:ui' show ImageFilter;
import 'dart:math';

// Base interfaces and abstractions
part 'src/interfaces/blur_properties.dart';
part 'src/interfaces/box_properties.dart';

// Core implementations
part 'src/core/blur_box.dart';
part 'src/variants/animated_blurbox.dart';
part 'src/variants/preset_blurbox.dart';
part 'src/variants/themed_blurbox.dart';

// Specialized blur implementations
part 'src/variants/specialized_blurbox.dart';
part 'src/variants/dynamic_blurbox.dart';
part 'src/variants/abstract_blurbox.dart';
part 'src/variants/patterned_blurbox.dart';

part 'src/core/extensions.dart';
