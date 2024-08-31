part of 'blurbox.dart';

class ThemedBlurBox extends StatelessWidget {
  final Widget child;
  final double blur;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final Clip? clipBehavior;
  final BoxConstraints? constraints;
  final BoxDecoration? foregroundDecoration;
  final Key? keyy;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final BorderRadiusGeometry borderRadius;
  final Border? border;
  final BlendMode? backgroundBlendMode;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final DecorationImage? image;
  final BoxShape? shape;
  final double elevation;

  const ThemedBlurBox({
    super.key,
    required this.child,
    this.blur = 5,
    this.height,
    this.width,
    this.padding = const EdgeInsets.all(8),
    this.margin,
    this.alignment,
    this.clipBehavior,
    this.constraints,
    this.foregroundDecoration,
    this.keyy,
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
  });

  /// Builds a [BlurBox] with the current theme's surface color with opacity
  /// of 0.2.
  ///
  /// The other parameters are passed directly to the [BlurBox] constructor.
  ///
  /// See also:
  ///
  /// * [BlurBox], the widget that is created.
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlurBox(
      blur: blur,
      color: theme.colorScheme.surface.withOpacity(0.2),
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      alignment: alignment,
      clipBehavior: clipBehavior,
      constraints: constraints,
      foregroundDecoration: foregroundDecoration,
      key: keyy,
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
  }
}
