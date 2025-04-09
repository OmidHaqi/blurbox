part of '../../blurbox.dart';

class ThemedBlurBox extends StatelessWidget
    implements BlurProperties, BoxProperties {
  final Widget child;

  @override
  final double blur;

  @override
  final double? height;

  @override
  final double? width;

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

  /// A theme-aware blur box that adapts its appearance to the current app theme.
  ///
  /// ThemedBlurBox automatically uses colors from the current theme to create
  /// blur effects that match your app's design system. It's particularly useful
  /// for apps that support both light and dark themes.
  ///
  /// ## Basic Usage
  ///
  /// ```dart
  /// ThemedBlurBox(
  ///   blur: 8.0,
  ///   borderRadius: BorderRadius.circular(15),
  ///   child: Padding(
  ///     padding: const EdgeInsets.all(20),
  ///     child: Text('This adapts to your theme!'),
  ///   ),
  /// )
  /// ```
  ///
  /// The color will automatically be derived from your theme's colorScheme.surface
  /// with a semi-transparent opacity.
  ///
  /// ## Theme Integration
  ///
  /// This widget works best when:
  /// - Your app uses ThemeData properly
  /// - You switch between light and dark themes
  /// - You want consistent blur effects across your app
  ///
  /// It's ideal for creating UI components like cards, bottom sheets, and app bars
  /// that match your app's theme without manual color management.z
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

  @override
  Color get color => Colors.transparent; // Return a non-nullable default color that will be overridden at build time

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlurBox(
      blur: blur,
      color: theme.colorScheme.surface.withValues(alpha: 0.2),
      height: height,
      width: width,
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
  }
}
