part of '../../blurbox.dart';

/// A blur box with a repeating pattern overlay, creating a decorative glass effect.
///
/// This widget combines a blur effect with a tiled pattern overlay to create
/// elegant glass-like surfaces with decorative patterns. It's perfect for
/// creating custom backgrounds, cards, and containers with distinctive visual style.
///
/// Supports PNG and image patterns with extensive customization options
/// for the pattern appearance and positioning.
///
/// ## Use Cases
///
/// - Creating branded glass surfaces with company patterns/logos
/// - Designing decorative cards and panels with subtle textures
/// - Building frosted glass interfaces with distinctive visual identity
/// - Implementing themed containers that follow design language
class PatternedBlurBox extends StatelessWidget
    implements BlurProperties, BoxProperties {
  /// The child widget to display
  final Widget child;

  @override
  final double blur;

  @override
  final Color color;

  @override
  final double? height;

  @override
  final double? width;

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

  /// Asset path to the pattern image
  final String? patternAsset;

  /// URL to load the pattern from
  final String? patternUrl;

  /// Opacity of the pattern overlay (0.0 to 1.0)
  final double patternOpacity;

  /// Scale factor for the pattern (1.0 = original size)
  final double patternScale;

  /// Whether to repeat the pattern to fill the space
  final bool repeatPattern;

  /// Alignment of the pattern within the container
  final Alignment patternAlignment;

  /// Optional tint color for the pattern
  final Color? patternColor;

  /// Blend mode for combining the pattern with the background
  final BlendMode patternBlendMode;

  /// Creates a blur box with a repeating pattern overlay.
  ///
  /// Either [patternAsset] or [patternUrl] must be provided to display a pattern.
  ///
  /// ## Example
  ///
  /// ```dart
  /// PatternedBlurBox(
  ///   blur: 8.0,
  ///   color: Colors.white.withValues( alpha:0.2),
  ///   patternAsset: 'assets/patterns/dots.png',
  ///   patternOpacity: 0.15,
  ///   borderRadius: BorderRadius.circular(15),
  ///   child: Padding(
  ///     padding: const EdgeInsets.all(20),
  ///     child: Text('Patterned Glass Effect'),
  ///   ),
  /// )
  /// ```
  const PatternedBlurBox({
    super.key,
    required this.child,
    this.blur = 5.0,
    this.color = Colors.transparent,
    this.patternAsset,
    this.patternUrl,
    this.patternOpacity = 0.2,
    this.patternScale = 1.0,
    this.repeatPattern = true,
    this.patternAlignment = Alignment.center,
    this.patternColor,
    this.patternBlendMode = BlendMode.srcOver,
    this.height,
    this.width,
    this.elevation = 0,
    this.padding = const EdgeInsets.all(8),
    this.margin,
    this.alignment,
    this.clipBehavior,
    this.constraints,
    this.foregroundDecoration,
    this.transform,
    this.transformAlignment,
    this.borderRadius = BorderRadius.zero,
    this.border,
    this.backgroundBlendMode,
    this.boxShadow,
    this.gradient,
    this.image,
    this.shape,
  }) : assert(
         patternAsset != null || patternUrl != null || (image != null),
         'Either patternAsset, patternUrl or image must be provided',
       );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: elevation,
      borderRadius: borderRadius,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            // Base blur layer
            BlurBox(
              blur: blur,
              color: color,
              height: height,
              width: width,
              padding: EdgeInsets.zero, // No padding for base blur layer
              alignment: alignment,
              clipBehavior: clipBehavior,
              constraints: constraints,
              transform: transform,
              transformAlignment: transformAlignment,
              borderRadius: borderRadius,
              border: border,
              backgroundBlendMode: backgroundBlendMode,
              boxShadow: boxShadow,
              gradient: gradient,
              image: image,
              shape: shape,
              child: const SizedBox.expand(),
            ),

            // Pattern layer
            if (patternAsset != null || patternUrl != null)
              Positioned.fill(
                child: Opacity(
                  opacity: patternOpacity,
                  child: ClipRRect(
                    borderRadius: borderRadius,
                    child: _buildPatternLayer(),
                  ),
                ),
              ),

            // Content with padding
            Container(padding: padding, alignment: alignment, child: child),
          ],
        ),
      ),
    );
  }

  Widget _buildPatternLayer() {
    // Create the base pattern widget
    Widget patternWidget;

    // PNG/Image pattern
    if (patternAsset != null) {
      patternWidget = Image.asset(
        patternAsset!,
        color: patternColor,
        colorBlendMode: patternBlendMode,
        alignment: patternAlignment,
        scale: 1 / patternScale,
      );
    } else {
      patternWidget = Image.network(
        patternUrl!,
        color: patternColor,
        colorBlendMode: patternBlendMode,
        alignment: patternAlignment,
        scale: 1 / patternScale,
      );
    }

    // Apply scaling if needed
    if (patternScale != 1.0) {
      patternWidget = Transform.scale(
        scale: patternScale,
        child: patternWidget,
      );
    }

    // Create repeating pattern if required
    if (repeatPattern) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return RepaintBoundary(
            child: Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      patternAsset != null
                          ? AssetImage(patternAsset!)
                          : NetworkImage(patternUrl!) as ImageProvider,
                  repeat: ImageRepeat.repeat,
                  scale: 1 / patternScale,
                  colorFilter:
                      patternColor != null
                          ? ColorFilter.mode(patternColor!, patternBlendMode)
                          : null,
                  alignment: patternAlignment,
                ),
              ),
            ),
          );
        },
      );
    } else {
      return patternWidget;
    }
  }
}
