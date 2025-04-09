part of '../../blurbox.dart';

/// A blur box that follows the active pointer, creating a dynamic blur effect.
///
/// This widget creates a blur effect that follows the user's touch or cursor,
/// creating an interactive blur experience. Useful for highlighting
/// interactive areas or creating playful UI effects.
///
/// The blur effect appears as a circular region that follows pointer movement,
/// with configurable size, intensity, and follow speed.
///
/// ## Use Cases
///
/// - Creating interactive landing pages with playful blur effects
/// - Highlighting interactive areas with a moving blur region
/// - Creating focus effects that follow user interaction
/// - Building engaging, touch-responsive interfaces with minimal code
class FollowingBlurBox extends StatefulWidget {
  /// The child widget to display
  final Widget child;

  /// The radius of the blur effect
  final double radius;

  /// How intense the blur effect should be
  final double blurIntensity;

  /// How quickly the blur follows the pointer (1.0 = immediate, 0.1 = very slow)
  final double followSpeed;

  /// Color overlay for the blur effect
  final Color color;

  /// Creates a blur effect that follows the user's pointer.
  ///
  /// ## Example
  ///
  /// ```dart
  /// FollowingBlurBox(
  ///   radius: 50,
  ///   blurIntensity: 10,
  ///   followSpeed: 0.5,
  ///   child: Container(
  ///     width: double.infinity,
  ///     height: 200,
  ///     color: Colors.blue.withValues( alpha:0.3),
  ///     child: Center(child: Text('Move your finger or cursor')),
  ///   ),
  /// )
  /// ```
  const FollowingBlurBox({
    super.key,
    required this.child,
    this.radius = 50.0,
    this.blurIntensity = 10.0,
    this.followSpeed = 0.3,
    this.color = Colors.transparent,
  });

  @override
  State<FollowingBlurBox> createState() => _FollowingBlurBoxState();
}

class _FollowingBlurBoxState extends State<FollowingBlurBox> {
  Offset position = Offset.zero;
  Offset? pointerPosition;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          pointerPosition = event.localPosition;
        });
      },
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            pointerPosition = details.localPosition;
          });
        },
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            widget.child,
            if (pointerPosition != null)
              AnimatedPositioned(
                left: pointerPosition!.dx - widget.radius,
                top: pointerPosition!.dy - widget.radius,
                duration: Duration(
                  milliseconds: (300 / widget.followSpeed).round(),
                ),
                curve: Curves.easeOutCubic,
                child: ClipOval(
                  child: BlurBox(
                    blur: widget.blurIntensity,
                    color: widget.color,
                    padding: EdgeInsets.zero,
                    width: widget.radius * 2,
                    height: widget.radius * 2,
                    child: const SizedBox(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// A blur box with a directional blur effect, simulating motion or focus.
///
/// This widget applies blur in a specific direction to create the impression
/// of movement or to direct the user's attention in a particular direction.
///
/// Unlike standard blur which is uniform in all directions, directional blur
/// creates a sense of motion or focus along a specific axis, making it ideal
/// for creating dynamic visual effects or drawing attention to UI elements.
///
/// ## Use Cases
///
/// - Creating motion blur effects for animations
/// - Simulating speed or movement in UI elements
/// - Directing user attention to important areas
/// - Creating depth-of-field effects in photo displays
/// - Enhancing transition animations with motion blur
class DirectionalBlurBox extends StatelessWidget
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

  /// The direction of the blur effect in degrees (0 = right, 90 = down)
  final double angle;

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

  /// Creates a directional blur effect.
  ///
  /// The [angle] parameter determines the direction of the blur in degrees:
  /// - 0: Rightward blur
  /// - 90: Downward blur
  /// - 180: Leftward blur
  /// - 270: Upward blur
  ///
  /// ## Example
  ///
  /// ```dart
  /// DirectionalBlurBox(
  ///   blur: 10,
  ///   angle: 45,
  ///   color: Colors.teal.withValues( alpha:0.2),
  ///   child: Padding(
  ///     padding: EdgeInsets.all(20),
  ///     child: Text('Directional Blur'),
  ///   ),
  /// )
  /// ```
  const DirectionalBlurBox({
    super.key,
    required this.child,
    this.blur = 10,
    this.angle = 0,
    this.color = Colors.transparent,
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
  });

  @override
  Widget build(BuildContext context) {
    final double radians = angle * (3.14159265359 / 180);
    final double sigmaX = blur * cos(radians).abs();
    final double sigmaY = blur * sin(radians).abs();

    // Using a custom implementation since BlurBox doesn't support directional blur natively
    return Material(
      color: Colors.transparent,
      elevation: elevation,
      borderRadius: borderRadius,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
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

/// A blur box that creates a radial blur effect from a center point.
///
/// This widget creates a blur effect that radiates from a central focal point,
/// with the blur intensity decreasing as you move away from the center.
/// The effect creates a visual focus point, drawing attention to specific
/// areas of your UI.
///
/// Customize the blur distribution with [falloff] and [quality] parameters
/// to achieve different visual effects from subtle to dramatic.
///
/// ## Use Cases
///
/// - Creating focus effects that highlight specific UI elements
/// - Building interactive splash screens with radial blur animations
/// - Implementing spotlight-like effects in media galleries
/// - Creating depth and dimensional effects in flat designs
class RadialBlurBox extends StatelessWidget implements BoxProperties {
  final Widget child;
  final double maxBlur;
  final Alignment focalPoint;
  final double radius;
  final double falloff; // New: Controls blur gradient falloff
  final int quality; // New: Controls number of blur layers

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

  const RadialBlurBox({
    super.key,
    required this.child,
    this.maxBlur = 10.0,
    this.focalPoint = Alignment.center,
    this.radius = 100.0,
    this.falloff = 2.0, // Added falloff parameter
    this.quality = 8, // Added quality parameter
    this.color = Colors.transparent,
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
  }) : assert(quality > 0 && quality <= 20, 'Quality must be between 1 and 20'),
       assert(
         falloff >= 0.1 && falloff <= 10.0,
         'Falloff must be between 0.1 and 10.0',
       );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: elevation,
      borderRadius: borderRadius,
      child: ClipRRect(
        borderRadius: borderRadius,
        clipBehavior: clipBehavior ?? Clip.antiAlias,
        child: CustomPaint(
          foregroundPainter: RadialBlurPainter(
            maxBlur: maxBlur,
            focalPoint: focalPoint,
            radius: radius,
            color: color,
            falloff: falloff,
            quality: quality,
          ),
          child: Container(
            decoration: BoxDecoration(
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

class RadialBlurPainter extends CustomPainter {
  final double maxBlur;
  final Alignment focalPoint;
  final double radius;
  final Color color;
  final double falloff;
  final int quality;

  RadialBlurPainter({
    required this.maxBlur,
    required this.focalPoint,
    required this.radius,
    required this.color,
    required this.falloff,
    required this.quality,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(
      size.width * (focalPoint.x * 0.5 + 0.5),
      size.height * (focalPoint.y * 0.5 + 0.5),
    );

    final shaderPaint =
        Paint()
          ..shader = ui.Gradient.radial(
            center,
            radius,
            [color.withValues(alpha: color.a), color.withValues(alpha: 0.0)],
            [0.0, 1.0],
            TileMode.clamp,
            null,
            null,
            falloff,
          );

    // Draw layered blur effect
    for (int i = quality; i > 0; i--) {
      final t = i / quality;
      final currentBlur = maxBlur * t * t; // Quadratic falloff
      final currentRadius = radius * t;

      final blurPaint =
          Paint()
            ..imageFilter = ui.ImageFilter.blur(
              sigmaX: currentBlur,
              sigmaY: currentBlur,
              tileMode: TileMode.decal,
            )
            ..blendMode = BlendMode.srcOver;

      canvas.saveLayer(null, blurPaint);
      canvas.drawCircle(center, currentRadius, shaderPaint);
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant RadialBlurPainter oldDelegate) {
    return maxBlur != oldDelegate.maxBlur ||
        focalPoint != oldDelegate.focalPoint ||
        radius != oldDelegate.radius ||
        color != oldDelegate.color ||
        falloff != oldDelegate.falloff ||
        quality != oldDelegate.quality;
  }
}

/// A blur box with a gradient blur effect.
///
/// This widget applies a blur effect with varying intensity across
/// the widget, creating a depth effect or visual focus point.
///
/// The blur intensity transitions smoothly from [minBlur] to [maxBlur]
/// along the gradient direction specified by [begin] and [end], allowing
/// for creative focus effects and visual hierarchy.
///
/// ## Use Cases
///
/// - Creating depth effects that guide user focus
/// - Building UI elements with varying levels of visibility
/// - Implementing creative transitions between content areas
/// - Designing cards or panels with varying background clarity
class GradientBlurBox extends StatelessWidget {
  /// The child widget to display
  final Widget child;

  /// Minimum blur intensity
  final double minBlur;

  /// Maximum blur intensity
  final double maxBlur;

  /// Direction of the blur gradient
  final AlignmentGeometry begin;

  /// End direction of the blur gradient
  final AlignmentGeometry end;

  /// Background color
  final Color color;

  /// Border radius of the container
  final BorderRadius borderRadius;

  /// The shape of the container
  final BoxShape shape;

  /// Creates a blur effect that varies in intensity across the widget.
  ///
  /// ## Example
  ///
  /// ```dart
  /// GradientBlurBox(
  ///   minBlur: 2,
  ///   maxBlur: 10,
  ///   begin: Alignment.topLeft,
  ///   end: Alignment.bottomRight,
  ///   color: Colors.white.withValues( alpha:0.2),
  ///   borderRadius: BorderRadius.circular(20),
  ///   child: Padding(
  ///     padding: const EdgeInsets.all(20),
  ///     child: Text('Gradient blur effect'),
  ///   ),
  /// )
  /// ```
  const GradientBlurBox({
    super.key,
    required this.child,
    this.minBlur = 2.0,
    this.maxBlur = 10.0,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
    this.color = Colors.transparent,
    this.borderRadius = BorderRadius.zero,
    this.shape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    // Use a shader mask to create gradient blur by masking multiple blur layers
    return Stack(
      children: [
        // First layer - minimum blur everywhere
        BlurBox(
          blur: minBlur,
          color: color,
          borderRadius: borderRadius,
          padding: EdgeInsets.zero,
          child: const SizedBox.expand(),
        ),

        // Second layer - additional blur with gradient mask
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: begin,
              end: end,
              colors: [Colors.black, Colors.transparent],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: BlurBox(
            blur: maxBlur,
            color: Colors.transparent,
            borderRadius: borderRadius,
            padding: EdgeInsets.zero,
            child: const SizedBox.expand(),
          ),
        ),

        // Content container
        ClipRRect(borderRadius: borderRadius, child: child),
      ],
    );
  }
}
