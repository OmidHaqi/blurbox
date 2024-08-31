part of 'blurbox.dart';

class PresetBlurBox extends StatelessWidget {
  final Widget child;
  final BlurPreset preset;
  final double? height;
  final double? width;
  final Color? color;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final Clip? clipBehavior;
  final BoxConstraints? constraints;
  final BoxDecoration? foregroundDecoration;
  final Key? keyy;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final BorderRadiusGeometry? borderRadius;
  final Border? border;
  final BlendMode? backgroundBlendMode;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final DecorationImage? image;
  final BoxShape? shape;
  final double elevation;

  const PresetBlurBox({
    super.key,
    required this.child,
    this.preset = BlurPreset.soft,
    this.height,
    this.width,
    this.color,
    this.padding = const EdgeInsets.all(8),
    this.margin,
    this.alignment,
    this.clipBehavior,
    this.constraints,
    this.foregroundDecoration,
    this.keyy,
    this.transform,
    this.transformAlignment,
    this.borderRadius,
    this.border,
    this.backgroundBlendMode,
    this.boxShadow,
    this.gradient,
    this.image,
    this.shape,
    this.elevation = 0,
  });

  /// Builds a [BlurBox] with a preset blur style.
  ///
  /// The following presets are available:
  ///
  /// * [BlurPreset.soft]: A soft blur with a radius of 5.0 and a color of
  ///   [Color(0x33000000)].
  /// * [BlurPreset.heavy]: A heavy blur with a radius of 20.0 and a color of
  ///   [Color(0x66000000)].
  /// * [BlurPreset.subtleShadow]: A subtle shadow blur with a radius of 10.0 and a
  ///   color of [Color(0x4d000000)]. This preset also adds a box shadow to the
  ///   [BlurBox].
  ///
  /// The [preset] parameter defaults to [BlurPreset.soft].
  ///
  /// The other parameters are passed directly to the [BlurBox] constructor.
  @override
  Widget build(BuildContext context) {
    final double blurValue;
    final Color? colorValue;
    List<BoxShadow>? boxShadowValue;

    switch (preset) {
      case BlurPreset.soft:
        blurValue = 5.0;
        colorValue = color ?? const Color(0x33000000);
        break;
      case BlurPreset.heavy:
        blurValue = 20.0;
        colorValue = color ?? const Color(0x66000000);
        break;
      case BlurPreset.subtleShadow:
        blurValue = 10.0;
        colorValue = color ?? const Color(0x4d000000);
        boxShadowValue = [
          const BoxShadow(
            color: Color(0x33000000),
            blurRadius: 10.0,
          ),
        ];
        break;
    }

    return BlurBox(
      blur: blurValue,
      height: height,
      width: width,
      color: colorValue,
      padding: padding,
      margin: margin,
      alignment: alignment,
      clipBehavior: clipBehavior,
      constraints: constraints,
      foregroundDecoration: foregroundDecoration,
      keyy: keyy,
      transform: transform,
      transformAlignment: transformAlignment,
      borderRadius: borderRadius ?? BorderRadius.zero,
      border: border,
      backgroundBlendMode: backgroundBlendMode,
      boxShadow: boxShadowValue,
      gradient: gradient,
      image: image,
      shape: shape,
      elevation: elevation,
      child: child,
    );
  }
}

enum BlurPreset {
  soft,
  heavy,
  subtleShadow,
}
