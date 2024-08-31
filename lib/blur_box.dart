part of 'blurbox.dart';

class BlurBox extends StatelessWidget {
  /// The [child] widget to be blurred.
  final Widget child;

  /// The [color] to fill the background of the blur box.
  final Color color;

  /// The [height] of the blur box.
  final double? height;

  /// The [width] of the blur box.
  final double? width;

  /// The amount of [blur] to apply. Defaults to 5.
  final double blur;

  /// The [elevation] at which to place the blur box. Used for shadows.
  final double elevation;

  /// The [padding] applied to the child widget. Defaults to EdgeInsets.all(8).
  final EdgeInsetsGeometry padding;

  /// The [margin] applied to the blur box.
  final EdgeInsetsGeometry? margin;

  /// The [alignment] of the child widget within the blur box.
  final AlignmentGeometry? alignment;

  /// The [clipBehavior] applied to the child widget. Defaults to Clip.none.
  final Clip? clipBehavior;

  /// The [constraints] to be applied to the child widget.
  final BoxConstraints? constraints;

  /// The decoration applied to the foreground of the blur box.
  final BoxDecoration? foregroundDecoration;

  /// The [key] of the widget.
  final Key? keyy;

  /// The [transformation] matrix applied to the blur box.
  final Matrix4? transform;

  /// The [alignment] of the [transform] applied to the blur box.
  final AlignmentGeometry? transformAlignment;

  /// The [borderRadius] of the blur box.
  final BorderRadiusGeometry borderRadius;

  /// The [border] applied to the blur box.
  final Border? border;

  /// The [blendMode] used to composite the background with the child.
  final BlendMode? backgroundBlendMode;

  /// A list of [shadows] applied to the blur box.
  final List<BoxShadow>? boxShadow;

  /// The [gradient] used to fill the background of the blur box.
  final Gradient? gradient;

  /// The [image] used to fill the background of the blur box.
  final DecorationImage? image;

  /// The [shape] of the blur box. Defaults to BoxShape.rectangle.
  final BoxShape? shape;

  /// Creates a BlurBox [widget].
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
    this.keyy,
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

  /// Builds a [BlurBox] widget.
  ///
  /// The [BlurBox] widget applies a blur effect to its background by using a
  /// [BackdropFilter] and an [ImageFilter].
  ///
  /// The [BlurBox] widget is a [Material] widget with a transparent color and
  /// a non-zero elevation. The elevation is used to create a shadow under the
  /// blur box.
  ///
  /// The [BlurBox] widget is a [ClipRRect] widget with a rounded corner
  /// rectangle shape. The corner radius of the rectangle is determined by the
  /// [borderRadius] property.
  ///
  /// The [BlurBox] widget is a container widget that can contain any widget.
  /// The child widget is positioned within the blur box using the
  /// [alignment] and [constraints] properties.
  ///
  /// The [BlurBox] widget can be used to create a variety of different
  /// effects, such as a blur background, a shadow, or a highlight. The blur box
  /// can be used to create a visual separation between different parts of the
  /// user interface, or to create a visual effect that draws the user's
  /// attention to a particular part of the user interface.
  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius;

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
            key: keyy,
            transform: transform,
            transformAlignment: transformAlignment,
            child: child,
          ),
        ),
      ),
    );
  }
}
