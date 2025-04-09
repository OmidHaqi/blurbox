part of '../../blurbox.dart';

class BlurBox extends StatelessWidget implements BlurProperties, BoxProperties {
  /// The [child] widget to be blurred.
  final Widget child;

  @override
  final Color color;

  @override
  final double? height;

  @override
  final double? width;

  @override
  final double blur;

  @override
  final double elevation;

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

  /// A widget that applies a customizable blur effect to its background.
  ///
  /// BlurBox creates a frosted glass effect by applying a Gaussian blur to everything
  /// behind it while displaying its child widget on top. This creates a modern,
  /// translucent UI element that follows current design trends.
  ///
  /// ## Basic Usage
  ///
  /// ```dart
  /// BlurBox(
  ///   blur: 5.0,
  ///   color: Colors.white.withValues( alpha:0.3),
  ///   borderRadius: BorderRadius.circular(15),
  ///   child: Padding(
  ///     padding: const EdgeInsets.all(20),
  ///     child: Text('Hello World'),
  ///   ),
  /// )
  /// ```
  ///
  /// ## Customization
  ///
  /// - Adjust [blur] to control the intensity of the blur effect
  /// - Use [color] to add a colored overlay to the blur (typically semi-transparent)
  /// - Control the shape with [borderRadius] or [shape]
  /// - Apply shadows with [boxShadow] and [elevation]
  /// - Customize borders with [border]
  ///
  /// ## Performance Considerations
  ///
  /// Blur effects can be performance-intensive. For optimal performance:
  /// - Keep blur values moderate (5-10 is often sufficient)
  /// - Minimize the size of the blur area
  /// - Avoid animating blur values rapidly
  /// - Consider using [PresetBlurBox] for common configurations
  const BlurBox({
    super.key,
    required this.child,
    this.height,
    this.width,
    this.blur = 5,
    this.elevation = 0,
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
    this.color = Colors.transparent,
    this.backgroundBlendMode,
    this.boxShadow,
    this.gradient,
    this.image,
    this.shape,
  }) : assert(blur >= 0, 'The blur value must be non-negative.');

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: elevation,
      borderRadius: borderRadius,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: borderRadius,
              border: border,
              backgroundBlendMode: backgroundBlendMode,
              boxShadow: boxShadow,
              gradient: gradient,
              image: image,
              shape: shape ?? BoxShape.rectangle,
            ),
            height: height,
            width: width,
            padding: padding,
            margin: margin,
            alignment: alignment,
            clipBehavior: clipBehavior ?? Clip.none,
            constraints: constraints,
            foregroundDecoration: foregroundDecoration,
            transform: transform,
            transformAlignment: transformAlignment,
            child: child,
          ),
        ),
      ),
    );
  }
}
