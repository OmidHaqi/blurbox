part of '../../blurbox.dart';

/// Predefined blur effect styles for quick implementation.
///
/// Use these presets to quickly apply common blur configurations.
enum BlurPreset {
  /// A gentle blur with light background (blur: 5.0)
  soft,

  /// A strong blur with medium background opacity (blur: 20.0)
  heavy,

  /// A medium blur with shadow effect (blur: 10.0)
  subtleShadow,

  /// A frosted glass effect with white tint (blur: 7.0)
  frostedGlass,

  /// A dark tinted blur effect for nighttime UI (blur: 6.0)
  darkMist,

  /// An elegant, minimal blur for modern designs (blur: 3.0)
  subtle,

  /// A colorful gradient blur for vibrant interfaces (blur: 8.0)
  vibrant,

  /// A deep blur with strong shadow for elevated UI elements (blur: 15.0)
  floating,

  /// A light blur with light blue tint for iOS-style interfaces (blur: 10.0)
  iosStyle,

  /// A material design inspired blur with depth (blur: 8.0)
  materialDesign,
}

/// Factory that generates settings for different blur presets.
///
/// This is mostly used internally by [PresetBlurBox].
class BlurPresetFactory {
  static Map<String, dynamic> getPresetSettings(
    BlurPreset preset,
    Color? overrideColor,
  ) {
    switch (preset) {
      case BlurPreset.soft:
        return {
          'blur': 5.0,
          'color': overrideColor ?? const Color(0x33000000),
          'boxShadow': null,
        };
      case BlurPreset.heavy:
        return {
          'blur': 20.0,
          'color': overrideColor ?? const Color(0x66000000),
          'boxShadow': null,
        };
      case BlurPreset.subtleShadow:
        return {
          'blur': 10.0,
          'color': overrideColor ?? const Color(0x4d000000),
          'boxShadow': [
            const BoxShadow(color: Color(0x33000000), blurRadius: 10.0),
          ],
        };
      case BlurPreset.frostedGlass:
        return {
          'blur': 7.0,
          'color': overrideColor ?? const Color(0x40FFFFFF),
          'boxShadow': [
            const BoxShadow(
              color: Color(0x20000000),
              blurRadius: 6.0,
              spreadRadius: 0.5,
            ),
          ],
          'border': Border.all(color: const Color(0x30FFFFFF), width: 1.5),
        };
      case BlurPreset.darkMist:
        return {
          'blur': 6.0,
          'color': overrideColor ?? const Color(0x80000000),
          'boxShadow': null,
          'gradient': const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0x70000000), Color(0x90000000)],
          ),
        };
      case BlurPreset.subtle:
        return {
          'blur': 3.0,
          'color': overrideColor ?? const Color(0x15000000),
          'boxShadow': null,
          'border': Border.all(color: const Color(0x10000000), width: 0.5),
        };
      case BlurPreset.vibrant:
        return {
          'blur': 8.0,
          'color': overrideColor ?? const Color(0x00000000),
          'boxShadow': null,
          'gradient': const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0x40FF4081), Color(0x406A1B9A)],
          ),
        };
      case BlurPreset.floating:
        return {
          'blur': 15.0,
          'color': overrideColor ?? const Color(0x40FFFFFF),
          'boxShadow': [
            const BoxShadow(
              color: Color(0x40000000),
              blurRadius: 20.0,
              spreadRadius: 2.0,
              offset: Offset(0, 5),
            ),
          ],
          'elevation': 8.0,
        };
      case BlurPreset.iosStyle:
        return {
          'blur': 10.0,
          'color': overrideColor ?? const Color(0x30FFFFFF),
          'boxShadow': null,
          'border': Border.all(color: const Color(0x20FFFFFF), width: 0.5),
        };
      case BlurPreset.materialDesign:
        return {
          'blur': 8.0,
          'color': overrideColor ?? const Color(0x25000000),
          'boxShadow': [
            const BoxShadow(
              color: Color(0x20000000),
              blurRadius: 6.0,
              spreadRadius: 0.0,
              offset: Offset(0, 3),
            ),
          ],
          'elevation': 4.0,
        };
    }
  }
}

class PresetBlurBox extends StatelessWidget implements BoxProperties {
  final Widget child;
  final BlurPreset preset;

  @override
  final double? height;

  @override
  final double? width;

  final Color? _color;

  @override
  Color? get color => _color;

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

  /// A widget that applies predefined blur styles with minimal configuration.
  ///
  /// PresetBlurBox simplifies the creation of common blur effects by offering
  /// ready-to-use presets that look good in most situations.
  ///
  /// ## Basic Usage
  ///
  /// ```dart
  /// // Simple soft blur preset
  /// PresetBlurBox(
  ///   preset: BlurPreset.soft,
  ///   borderRadius: BorderRadius.circular(15),
  ///   child: Padding(
  ///     padding: const EdgeInsets.all(20),
  ///     child: Text('Soft Blur Preset'),
  ///   ),
  /// )
  ///
  /// // Shadow blur preset - good for cards
  /// PresetBlurBox(
  ///   preset: BlurPreset.subtleShadow,
  ///   borderRadius: BorderRadius.circular(20),
  ///   child: Padding(
  ///     padding: const EdgeInsets.all(24),
  ///     child: Column(
  ///     children: [
  ///       Icon(Icons.favorite),
  ///       Text('Card with Shadow Blur'),
  ///     ],
  ///    ),
  ///   ),
  /// )
  ///
  /// // Heavy blur preset - good for backgrounds
  /// PresetBlurBox(
  ///   preset: BlurPreset.heavy,
  ///   child: Center(
  ///     child: Text('Heavy Background Blur'),
  ///   ),
  /// )
  /// ```
  ///
  /// ## Customization
  ///
  /// You can still customize other aspects like borders, radius, shadows, etc.
  /// If you provide a [color], it will override the preset's default color.

  const PresetBlurBox({
    super.key,
    required this.child,
    this.preset = BlurPreset.soft,
    this.height,
    this.width,
    Color? color,
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
    this.elevation = 0,
  }) : _color = color;

  @override
  Widget build(BuildContext context) {
    final presetSettings = BlurPresetFactory.getPresetSettings(preset, _color);

    // Extract additional properties from preset settings that weren't in the original
    final Border? presetBorder = presetSettings['border'] as Border?;
    final Gradient? presetGradient = presetSettings['gradient'] as Gradient?;
    final double? presetElevation = presetSettings['elevation'] as double?;

    return BlurBox(
      blur: presetSettings['blur'],
      height: height,
      width: width,
      color: presetSettings['color'],
      padding: padding,
      margin: margin,
      alignment: alignment,
      clipBehavior: clipBehavior,
      constraints: constraints,
      foregroundDecoration: foregroundDecoration,
      transform: transform,
      transformAlignment: transformAlignment,
      borderRadius: borderRadius,
      border: presetBorder ?? border,
      backgroundBlendMode: backgroundBlendMode,
      boxShadow: presetSettings['boxShadow'] ?? boxShadow,
      gradient: presetGradient ?? gradient,
      image: image,
      shape: shape,
      elevation: presetElevation ?? elevation,
      child: child,
    );
  }
}
