part of '../../blurbox.dart';

class AnimatedBlurBox extends StatelessWidget
    implements AnimatedBlurProperties, BoxProperties {
  final Widget child;

  @override
  final double blur;

  @override
  final Duration duration;

  @override
  final double? height;

  @override
  final double? width;

  @override
  final Color color;

  @override
  final EdgeInsetsGeometry padding;

  @override
  final EdgeInsetsGeometry? margin;

  @override
  final AlignmentGeometry? alignment;

  @override
  final Clip? clipBehavior;

  @override
  final BoxConstraints? constraints;

  @override
  final BoxDecoration? foregroundDecoration;

  @override
  final Matrix4? transform;

  @override
  final AlignmentGeometry? transformAlignment;

  @override
  final BorderRadiusGeometry borderRadius;

  @override
  final Border? border;

  @override
  final BlendMode? backgroundBlendMode;

  @override
  final List<BoxShadow>? boxShadow;

  @override
  final Gradient? gradient;

  @override
  final DecorationImage? image;

  @override
  final BoxShape? shape;

  @override
  final double elevation;

  @override
  final double begin;

  @override
  final Curve curve;

  @override
  final Function()? onEnd;

  /// A widget that smoothly animates between blur values.
  ///
  /// AnimatedBlurBox extends the functionality of [BlurBox] by adding animation
  /// capabilities, allowing for smooth transitions between different blur intensities.
  ///
  /// ## Basic Usage
  ///
  /// ```dart
  /// // In a StatefulWidget
  /// bool _isBlurred = false;
  ///
  /// @override
  /// Widget build(BuildContext context) {
  ///   return Column(
  ///     children: [
  ///       AnimatedBlurBox(
  ///         blur: _isBlurred ? 15.0 : 0.0,
  ///         begin: _isBlurred ? 0.0 : 15.0,
  ///         duration: const Duration(milliseconds: 500),
  ///         curve: Curves.easeOutCubic,
  ///         borderRadius: BorderRadius.circular(20),
  ///         color: Colors.white.withValues( alpha:0.2),
  ///         child: const Padding(
  ///           padding: EdgeInsets.all(24.0),
  ///           child: Text('Tap to toggle blur'),
  ///         ),
  ///       ),
  ///       ElevatedButton(
  ///         onPressed: () {
  ///           setState(() {
  ///             _isBlurred = !_isBlurred;
  ///           });
  ///         },
  ///         child: Text(_isBlurred ? 'Clear' : 'Blur'),
  ///       ),
  ///     ],
  ///   );
  /// }
  /// ```
  ///
  /// ## Animation Control
  ///
  /// - [blur]: Target blur value
  /// - [begin]: Starting blur value
  /// - [duration]: How long the animation should take
  /// - [curve]: Animation easing curve (controls acceleration/deceleration)
  /// - [onEnd]: Callback function triggered when animation completes
  ///
  /// All other parameters work the same as in [BlurBox].

  const AnimatedBlurBox({
    super.key,
    required this.child,
    this.blur = 5,
    this.duration = const Duration(milliseconds: 300),
    this.height,
    this.width,
    this.color = Colors.transparent,
    this.padding = const EdgeInsets.all(8),
    this.margin,
    this.alignment,
    this.clipBehavior,
    this.constraints,
    this.foregroundDecoration,
    this.transform,
    this.transformAlignment,
    this.borderRadius = const BorderRadius.all(Radius.circular(0)),
    this.border,
    this.backgroundBlendMode,
    this.boxShadow,
    this.gradient,
    this.image,
    this.shape,
    this.elevation = 0,
    this.begin = 0,
    this.curve = Curves.easeIn,
    this.onEnd,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: begin, end: blur),
      curve: curve,
      duration: duration,
      onEnd: onEnd,
      builder: (context, value, _) {
        return BlurBox(
          blur: value,
          height: height,
          width: width,
          color: color,
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
          elevation: elevation,
          child: child,
        );
      },
    );
  }
}
