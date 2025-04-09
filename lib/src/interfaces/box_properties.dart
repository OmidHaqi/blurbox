part of '../../blurbox.dart';

/// Defines common box styling properties used across blur widgets.
///
/// This interface ensures consistent container styling across
/// different widgets in the BlurBox library, making them compatible
/// with standard Flutter container properties.
abstract class BoxProperties {
  /// The background color of the box.
  abstract final Color? color;

  /// The height of the box.
  abstract final double? height;

  /// The width of the box.
  abstract final double? width;

  /// The material design elevation of the box.
  abstract final double elevation;

  /// The padding inside the box.
  abstract final EdgeInsetsGeometry padding;

  /// The margin around the box.
  abstract final EdgeInsetsGeometry? margin;

  /// How to align the child widget within the box.
  abstract final AlignmentGeometry? alignment;

  /// How to clip the child widget, if at all.
  abstract final Clip? clipBehavior;

  /// Additional constraints to apply to the box.
  abstract final BoxConstraints? constraints;

  /// Decoration applied on top of the child widget.
  abstract final BoxDecoration? foregroundDecoration;

  /// Optional transform matrix for the box.
  abstract final Matrix4? transform;

  /// The alignment of the transform operation.
  abstract final AlignmentGeometry? transformAlignment;

  /// The border radius of the box.
  abstract final BorderRadiusGeometry borderRadius;

  /// The border of the box.
  abstract final Border? border;

  /// The blend mode applied to the background color.
  abstract final BlendMode? backgroundBlendMode;

  /// Shadow effects applied to the box.
  abstract final List<BoxShadow>? boxShadow;

  /// Gradient fill applied to the box.
  abstract final Gradient? gradient;

  /// Background image for the box.
  abstract final DecorationImage? image;

  /// The shape of the box (rectangle or circle).
  abstract final BoxShape? shape;
}
