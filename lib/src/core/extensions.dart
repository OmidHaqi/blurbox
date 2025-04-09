part of '../../blurbox.dart';

/// Extension methods for easily applying blur effects to any widget.
extension BlurBoxExtension on Widget {
  /// Wraps any widget with a blur effect using a fluent syntax.
  ///
  /// This extension method makes it easy to apply blur to any widget
  /// without nested constructor calls.
  ///
  /// ## Basic Usage
  ///
  /// ```dart
  /// // Simple text with blur background
  /// Text('Hello World').blurry(
  ///   blur: 8.0,
  ///   borderRadius: BorderRadius.circular(10),
  ///   color: Colors.white.withValues( alpha:0.2),
  /// )
  ///
  /// // Image with blur overlay
  /// Image.network('https://example.com/image.jpg').blurry(
  ///   blur: 5.0,
  ///   color: Colors.black.withValues( alpha:0.1),
  /// )
  /// ```
  ///
  /// ## Common Use Cases
  ///
  /// - Create frosted glass cards: `Card(...).blurry()`
  /// - Blur backgrounds: `Container(...).blurry()`
  /// - Add blur to any existing widget without restructuring your layout
  ///
  /// All parameters are the same as [BlurBox] constructor.
  Widget blurry({
    double blur = 5.0,
    Color color = Colors.transparent,
    double elevation = 0.0,
    EdgeInsetsGeometry padding = const EdgeInsets.all(8.0),
    EdgeInsetsGeometry? margin,
    AlignmentGeometry? alignment,
    Clip clipBehavior = Clip.none,
    BoxConstraints? constraints,
    BoxDecoration? foregroundDecoration,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    BorderRadiusGeometry borderRadius = const BorderRadius.all(
      Radius.circular(0),
    ),
    Border? border,
    BlendMode? backgroundBlendMode,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    DecorationImage? image,
    BoxShape? shape = BoxShape.rectangle,
    double? height,
    double? width,
  }) {
    return BlurBox(
      blur: blur,
      color: color,
      elevation: elevation,
      padding: padding,
      margin: margin,
      alignment: alignment,
      clipBehavior: clipBehavior,
      constraints: constraints,
      foregroundDecoration: foregroundDecoration,
      transform: transform,
      transformAlignment: transformAlignment,
      borderRadius: borderRadius,
      border: border,
      backgroundBlendMode: backgroundBlendMode,
      boxShadow: boxShadow,
      gradient: gradient,
      image: image,
      shape: shape ?? BoxShape.rectangle,
      height: height,
      width: width,
      child: this,
    );
  }

  /// Creates an animated blur effect on any widget with a fluent syntax.
  ///
  /// This extension makes it easy to add animated blur transitions to
  /// existing widgets without complex nesting.
  ///
  /// ## Basic Usage
  ///
  /// ```dart
  /// // In a StatefulWidget:
  /// bool _isActive = false;
  ///
  /// @override
  /// Widget build(BuildContext context) {
  ///   return GestureDetector(
  ///     onTap: () => setState(() => _isActive = !_isActive),
  ///     child: Container(
  ///       height: 200,
  ///       width: double.infinity,
  ///       child: Center(child: Text('Tap me')),
  ///     ).animatedBlurry(
  ///       blur: _isActive ? 10.0 : 0.0,
  ///       beginBlur: _isActive ? 0.0 : 10.0,
  ///       duration: const Duration(milliseconds: 500),
  ///       borderRadius: BorderRadius.circular(15),
  ///       color: Colors.white.withValues( alpha:0.2),
  ///     ),
  ///   );
  /// }
  /// ```
  ///
  /// Parameters are the same as [AnimatedBlurBox] constructor, with
  /// [beginBlur] corresponding to the [begin] parameter.
  Widget animatedBlurry({
    double blur = 5.0,
    double beginBlur = 0.0,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeIn,
    Function()? onEnd,
    Color color = Colors.transparent,
    double elevation = 0.0,
    EdgeInsetsGeometry padding = const EdgeInsets.all(8.0),
    EdgeInsetsGeometry? margin,
    AlignmentGeometry? alignment,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    BoxDecoration? foregroundDecoration,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    BorderRadiusGeometry borderRadius = const BorderRadius.all(
      Radius.circular(0),
    ),
    Border? border,
    BlendMode? backgroundBlendMode,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    DecorationImage? image,
    BoxShape? shape,
    double? height,
    double? width,
  }) {
    return AnimatedBlurBox(
      blur: blur,
      begin: beginBlur,
      duration: duration,
      curve: curve,
      onEnd: onEnd,
      color: color,
      elevation: elevation,
      padding: padding,
      margin: margin,
      alignment: alignment,
      clipBehavior: clipBehavior,
      constraints: constraints,
      foregroundDecoration: foregroundDecoration,
      transform: transform,
      transformAlignment: transformAlignment,
      borderRadius: borderRadius,
      border: border,
      backgroundBlendMode: backgroundBlendMode,
      boxShadow: boxShadow,
      gradient: gradient,
      image: image,
      shape: shape,
      height: height,
      width: width,
      child: this,
    );
  }
}
