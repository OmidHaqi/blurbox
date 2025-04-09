part of '../../blurbox.dart';

/// A blur box that creates a geometric pattern of blurred shapes.
///
/// This widget generates an abstract geometric pattern using multiple
/// blurred shapes for creative backgrounds and design elements.
///
/// The generated pattern consists of random or organized geometric shapes
/// with configurable blur effects, creating visually interesting backgrounds
/// that can enhance modern UI designs while maintaining readability of
/// foreground content.
///
/// ## Use Cases
///
/// - Creating artistic, branded splash screens
/// - Building abstract decorative backgrounds for marketing content
/// - Designing modern, geometric app themes
/// - Implementing distinctive section dividers in content-heavy apps
class GeometricPatternBlurBox extends StatelessWidget {
  /// The child widget to display on top of the pattern
  final Widget child;

  /// Base blur intensity for shapes
  final double baseBlur;

  /// Number of shapes to generate
  final int shapeCount;

  /// Color palette for the shapes
  final List<Color> colors;

  /// Whether shapes should be randomly placed
  final bool randomPlacement;

  /// Types of shapes to include in the pattern
  final List<GeometricShapeType> shapeTypes;

  /// Minimum size of shapes as fraction of container size
  final double minSizeFactor;

  /// Maximum size of shapes as fraction of container size
  final double maxSizeFactor;

  /// Background color behind the pattern
  final Color backgroundColor;

  /// Border radius of the container
  final BorderRadius borderRadius;

  /// Creates an abstract geometric blur pattern.
  ///
  /// ## Example
  ///
  /// ```dart
  /// GeometricPatternBlurBox(
  ///   baseBlur: 8,
  ///   shapeCount: 15,
  ///   colors: [
  ///     Colors.blue.withValues( alpha:0.5),
  ///     Colors.purple.withValues( alpha:0.5),
  ///     Colors.pink.withValues( alpha:0.5),
  ///   ],
  ///   shapeTypes: [
  ///     GeometricShapeType.circle,
  ///     GeometricShapeType.rectangle,
  ///   ],
  ///   borderRadius: BorderRadius.circular(20),
  ///   child: Center(
  ///     child: Text(
  ///       'Abstract Pattern',
  ///       style: TextStyle(
  ///         fontSize: 24,
  ///         fontWeight: FontWeight.bold,
  ///         color: Colors.white,
  ///       ),
  ///     ),
  ///   ),
  /// )
  /// ```
  const GeometricPatternBlurBox({
    super.key,
    required this.child,
    this.baseBlur = 10.0,
    this.shapeCount = 20,
    this.colors = const [
      Color(0x80FF5252),
      Color(0x807B1FA2),
      Color(0x802196F3),
      Color(0x8000BFA5),
    ],
    this.randomPlacement = true,
    this.shapeTypes = const [
      GeometricShapeType.circle,
      GeometricShapeType.rectangle,
      GeometricShapeType.oval,
    ],
    this.minSizeFactor = 0.1,
    this.maxSizeFactor = 0.3,
    this.backgroundColor = Colors.transparent,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        color: backgroundColor,
        child: Stack(
          children: [
            // Pattern generator
            LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                final height = constraints.maxHeight;
                final random = Random();

                // Generate the shapes
                return Stack(
                  children: List.generate(shapeCount, (index) {
                    // Randomly select shape type
                    final shapeType =
                        shapeTypes[random.nextInt(shapeTypes.length)];

                    // Randomly select color
                    final color = colors[random.nextInt(colors.length)];

                    // Calculate size
                    final sizeFactor =
                        minSizeFactor +
                        random.nextDouble() * (maxSizeFactor - minSizeFactor);
                    final size = width * sizeFactor;

                    // Calculate position
                    double left, top;
                    if (randomPlacement) {
                      left = random.nextDouble() * width;
                      top = random.nextDouble() * height;
                    } else {
                      // Organized grid placement
                      final cols = sqrt(shapeCount).ceil();
                      final rows = (shapeCount / cols).ceil();
                      final colWidth = width / cols;
                      final rowHeight = height / rows;

                      final col = index % cols;
                      final row = index ~/ cols;

                      left =
                          col * colWidth + random.nextDouble() * colWidth * 0.2;
                      top =
                          row * rowHeight +
                          random.nextDouble() * rowHeight * 0.2;
                    }

                    // Calculate blur variation
                    final blurVariation =
                        baseBlur * (0.5 + random.nextDouble());

                    // Create the shape
                    return Positioned(
                      left: left - (size / 2),
                      top: top - (size / 2),
                      child: _buildGeometricShape(
                        shapeType,
                        size,
                        color,
                        blurVariation,
                        random.nextDouble() * 360,
                      ),
                    );
                  }),
                );
              },
            ),

            // Content
            Center(child: child),
          ],
        ),
      ),
    );
  }

  Widget _buildGeometricShape(
    GeometricShapeType type,
    double size,
    Color color,
    double blur,
    double rotation,
  ) {
    Widget shape;

    switch (type) {
      case GeometricShapeType.circle:
        shape = Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
          ),
          child: BlurBox(
            blur: blur,
            color: color,
            padding: EdgeInsets.zero,
            child: const SizedBox.expand(),
          ),
        );
        break;

      case GeometricShapeType.rectangle:
        shape = Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size * 0.1),
            color: Colors.transparent,
          ),
          child: BlurBox(
            blur: blur,
            color: color,
            padding: EdgeInsets.zero,
            borderRadius: BorderRadius.circular(size * 0.1),
            child: const SizedBox.expand(),
          ),
        );
        break;

      case GeometricShapeType.triangle:
        shape = SizedBox(
          width: size,
          height: size,
          child: ClipPath(
            clipper: _TriangleClipper(),
            child: BlurBox(
              blur: blur,
              color: color,
              padding: EdgeInsets.zero,
              child: const SizedBox.expand(),
            ),
          ),
        );
        break;

      case GeometricShapeType.oval:
        shape = Container(
          width: size,
          height: size * 0.6,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(size * 0.3),
            color: Colors.transparent,
          ),
          child: BlurBox(
            blur: blur,
            color: color,
            padding: EdgeInsets.zero,
            borderRadius: BorderRadius.circular(size * 0.3),
            child: const SizedBox.expand(),
          ),
        );
        break;
    }

    return Transform.rotate(
      angle: rotation * (pi / 180), // Convert degrees to radians
      child: shape,
    );
  }
}

/// Clipper for creating triangular shapes
class _TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(_TriangleClipper oldClipper) => false;
}

/// Types of geometric shapes available for pattern generation
enum GeometricShapeType {
  /// Circular shape
  circle,

  /// Rectangular shape with rounded corners
  rectangle,

  /// Triangular shape
  triangle,

  /// Oval or elliptical shape
  oval,
}

/// A blur box that creates flowing, organic blur patterns.
///
/// This widget generates natural-looking, fluid blur patterns that
/// resemble waves, clouds, or organic textures.
///
/// The organic patterns can be static or animated, with controls for complexity
/// and fluidity to achieve different natural effects from gentle waves to
/// turbulent flows, all rendered with customizable blur effects.
///
/// ## Use Cases
///
/// - Creating nature-inspired UI backgrounds
/// - Building calm, flowing animations for wellness apps
/// - Designing artistic backdrops for creative applications
/// - Implementing unique loading screens with organic movement
class OrganicPatternBlurBox extends StatelessWidget {
  /// The child widget to display on top of the pattern
  final Widget child;

  /// Base blur intensity
  final double blur;
  final double backgrundBlur;

  /// Color overlay for the pattern
  final Color color;

  /// Number of organic shapes to generate
  final int complexity;

  /// How fluid or rigid the pattern appears (0-1)
  final double fluidity;

  /// Animation duration (null = static pattern)
  final Duration? animationDuration;

  /// Border radius of the container
  final BorderRadius borderRadius;

  /// Whether pattern should tile seamlessly
  final bool seamlessTiling;

  /// Creates an organic, flowing blur pattern.
  ///
  /// ## Example
  ///
  /// ```dart
  /// OrganicPatternBlurBox(
  ///   blur: 10,
  ///   color: Colors.teal.withValues( alpha:0.4),
  ///   complexity: 8,
  ///   fluidity: 0.8,
  ///   animationDuration: Duration(seconds: 10),
  ///   borderRadius: BorderRadius.circular(20),
  ///   child: Padding(
  ///     padding: const EdgeInsets.all(20),
  ///     child: Text(
  ///       'Organic Pattern',
  ///       style: TextStyle(color: Colors.white),
  ///     ),
  ///   ),
  /// )
  /// ```
  const OrganicPatternBlurBox({
    super.key,
    required this.child,
    this.blur = 8.0,
    this.color = const Color(0x407B1FA2),
    this.complexity = 5,
    this.fluidity = 0.7,
    this.animationDuration,
    this.borderRadius = BorderRadius.zero,
    this.seamlessTiling = false,
    this.backgrundBlur = 50,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Stack(
        children: [
          // The pattern
          animationDuration != null
              ? _AnimatedOrganicPattern(
                blur: blur,
                color: color,
                complexity: complexity,
                fluidity: fluidity,
                duration: animationDuration!,
                seamlessTiling: seamlessTiling,
                backgrundBlur: backgrundBlur,
              )
              : _StaticOrganicPattern(
                blur: blur,
                color: color,
                complexity: complexity,
                fluidity: fluidity,
                seamlessTiling: seamlessTiling,
                backgrundBlur: backgrundBlur,
              ),

          // Content
          Center(child: child),
        ],
      ),
    );
  }
}

class _StaticOrganicPattern extends StatelessWidget {
  final double blur;
  final double backgrundBlur;
  final Color color;
  final int complexity;
  final double fluidity;
  final bool seamlessTiling;

  const _StaticOrganicPattern({
    required this.blur,
    required this.color,
    required this.complexity,
    required this.fluidity,
    required this.seamlessTiling,
    required this.backgrundBlur,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _OrganicPatternPainter(
        blur: blur,
        color: color,
        complexity: complexity,
        fluidity: fluidity,
        phase: 0.0,
        seamlessTiling: seamlessTiling,
      ),
      child: BlurBox(blur: backgrundBlur, child: SizedBox.expand()),
    );
  }
}

class _AnimatedOrganicPattern extends StatefulWidget {
  final double blur;
  final double backgrundBlur;
  final Color color;
  final int complexity;
  final double fluidity;
  final Duration duration;
  final bool seamlessTiling;

  const _AnimatedOrganicPattern({
    required this.blur,
    required this.color,
    required this.complexity,
    required this.fluidity,
    required this.duration,
    required this.seamlessTiling,
    required this.backgrundBlur,
  });

  @override
  State<_AnimatedOrganicPattern> createState() =>
      _AnimatedOrganicPatternState();
}

class _AnimatedOrganicPatternState extends State<_AnimatedOrganicPattern>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _OrganicPatternPainter(
            blur: widget.blur,
            color: widget.color,
            complexity: widget.complexity,
            fluidity: widget.fluidity,
            phase: _controller.value,
            seamlessTiling: widget.seamlessTiling,
          ),
          child: BlurBox(blur: widget.backgrundBlur, child: SizedBox.expand()),
        );
      },
    );
  }
}

class _OrganicPatternPainter extends CustomPainter {
  final double blur;
  final Color color;
  final int complexity;
  final double fluidity;
  final double phase;
  final bool seamlessTiling;

  _OrganicPatternPainter({
    required this.blur,
    required this.color,
    required this.complexity,
    required this.fluidity,
    required this.phase,
    required this.seamlessTiling,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final random = Random(42); // Fixed seed for consistency
    final width = size.width;
    final height = size.height;

    // Create control points for the organic shapes
    for (int i = 0; i < complexity; i++) {
      final path = Path();

      // Create a closed organic shape
      final List<Offset> controlPoints = [];
      final centerX = random.nextDouble() * width;
      final centerY = random.nextDouble() * height;
      final radius = (width + height) / (4 + random.nextDouble() * 4);

      // Number of points based on fluidity (more points = more organic)
      final points = 5 + (fluidity * 10).round();

      for (int j = 0; j < points; j++) {
        // Use parametric equation for base circle
        final angle = (j / points) * 2 * pi;
        final pctVariation = 0.2 + fluidity * 0.5;
        final radiusVariation =
            radius *
            (1 - pctVariation + random.nextDouble() * pctVariation * 2);

        // Add animation phase to angle for movement
        final animatedAngle = angle + phase * 2 * pi;

        // Calculate point with variation
        final x = centerX + cos(animatedAngle) * radiusVariation;
        final y = centerY + sin(animatedAngle) * radiusVariation;

        controlPoints.add(Offset(x, y));
      }

      // Start path
      if (controlPoints.isNotEmpty) {
        path.moveTo(controlPoints.first.dx, controlPoints.first.dy);
      }

      // Draw cubic curves between control points
      for (int j = 0; j < controlPoints.length; j++) {
        final nextIdx = (j + 1) % controlPoints.length;
        final currentPoint = controlPoints[j];
        final nextPoint = controlPoints[nextIdx];

        // Variation for control points
        final ctrlVariation = (fluidity * radius * 0.5);
        final ctrl1 = Offset(
          currentPoint.dx + random.nextDouble() * ctrlVariation,
          currentPoint.dy + random.nextDouble() * ctrlVariation,
        );
        final ctrl2 = Offset(
          nextPoint.dx - random.nextDouble() * ctrlVariation,
          nextPoint.dy - random.nextDouble() * ctrlVariation,
        );

        path.cubicTo(
          ctrl1.dx,
          ctrl1.dy,
          ctrl2.dx,
          ctrl2.dy,
          nextPoint.dx,
          nextPoint.dy,
        );
      }

      path.close();

      // Apply blur effect to the path
      final paint =
          Paint()
            ..imageFilter = ImageFilter.blur(
              sigmaX: blur * (0.5 + random.nextDouble()),
              sigmaY: blur * (0.5 + random.nextDouble()),
            )
            ..color = Color.fromRGBO(
              (color.r * 255.0).toInt(),
              (color.g * 255.0).toInt(),
              (color.b * 255.0).toInt(),
              color.a * (0.4 + random.nextDouble() * 0.6),
            );

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_OrganicPatternPainter oldDelegate) {
    return oldDelegate.phase != phase ||
        oldDelegate.blur != blur ||
        oldDelegate.color != color;
  }
}

/// Types of patterns available in KaleidoscopeBlurBox
enum KaleidoscopePatternType {
  /// Basic lines and circles pattern
  basic,

  /// Pattern with adjacent rectangles
  rectangles,

  /// Pattern with triangular shapes
  triangles,

  /// Pattern with mixed geometric shapes
  mixed,

  /// Pattern with concentric circles
  concentric,
}

/// A blur box that creates a kaleidoscopic pattern with mirrors and rotations.
///
/// This widget generates a mesmerizing kaleidoscope effect by mirroring and
/// rotating blur elements in a symmetrical pattern.
///
/// The kaleidoscope can be static or animated with a rotation effect,
/// creating visually striking backgrounds that are perfect for creative
/// applications, entertainment content, or attention-grabbing splash screens.
///
/// ## Use Cases
///
/// - Creating mesmerizing animated backgrounds for music or entertainment apps
/// - Building unique visual identities for creative platforms
/// - Designing eye-catching marketing materials
/// - Implementing interactive visual effects for user engagement
class KaleidoscopeBlurBox extends StatelessWidget implements BoxProperties {
  /// The child widget to display
  final Widget child;

  /// Number of segments in the kaleidoscope (6, 8, 12 recommended)
  final int segments;

  /// Base blur intensity
  final double blur;

  /// Whether to animate the kaleidoscope
  final bool animated;

  /// Duration of one complete rotation when animated
  final Duration? rotationDuration;

  /// Type of pattern to display in the kaleidoscope
  final KaleidoscopePatternType patternType;

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

  /// Creates a kaleidoscopic blur pattern effect.
  ///
  /// ## Example
  ///
  /// ```dart
  /// KaleidoscopeBlurBox(
  ///   segments: 8,
  ///   blur: 5.0,
  ///   patternType: KaleidoscopePatternType.rectangles,
  ///   color: Colors.purple.withValues( alpha:0.2),
  ///   animated: true,
  ///   rotationDuration: Duration(seconds: 20),
  ///   child: Center(
  ///     child: Icon(Icons.star, size: 30, color: Colors.white),
  ///   ),
  /// )
  /// ```
  const KaleidoscopeBlurBox({
    super.key,
    required this.child,
    this.segments = 6,
    this.blur = 5.0,
    this.animated = false,
    this.rotationDuration,
    this.patternType = KaleidoscopePatternType.basic,
    this.color = const Color(0x40FFFFFF),
    this.height,
    this.width,
    this.elevation = 0,
    this.padding = EdgeInsets.zero,
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
  }) : assert(segments > 0, 'Segments must be greater than 0');

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: elevation,
      borderRadius: borderRadius,
      child: Container(
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
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: border,
          backgroundBlendMode: backgroundBlendMode,
          boxShadow: boxShadow,
          gradient: gradient,
          image: image,
          shape: shape ?? BoxShape.rectangle,
        ),
        child: ClipRRect(
          borderRadius: borderRadius,
          child:
              animated && rotationDuration != null
                  ? _AnimatedKaleidoscope(
                    segments: segments,
                    blur: blur,
                    color: color,
                    patternType: patternType,
                    duration: rotationDuration!,
                    child: child,
                  )
                  : _StaticKaleidoscope(
                    segments: segments,
                    blur: blur,
                    color: color,
                    patternType: patternType,
                    child: child,
                  ),
        ),
      ),
    );
  }
}

class _StaticKaleidoscope extends StatelessWidget {
  final int segments;
  final double blur;
  final Color color;
  final KaleidoscopePatternType patternType;
  final Widget child;

  const _StaticKaleidoscope({
    required this.segments,
    required this.blur,
    required this.color,
    required this.child,
    this.patternType = KaleidoscopePatternType.basic,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = max(constraints.maxWidth, constraints.maxHeight);
        return Stack(
          children: [
            // Kaleidoscope segments
            ...List.generate(segments, (index) {
              final angle = (index / segments) * 2 * pi;
              return Transform.rotate(
                angle: angle,
                alignment: Alignment.center,
                child: _KaleidoscopeSegment(
                  color: color,
                  blur: blur,
                  segmentAngle: 2 * pi / segments,
                  size: size,
                  patternType: patternType,
                ),
              );
            }),

            // Child content in center
            Center(child: child),
          ],
        );
      },
    );
  }
}

class _AnimatedKaleidoscope extends StatefulWidget {
  final int segments;
  final double blur;
  final Color color;
  final Duration duration;
  final Widget child;
  final KaleidoscopePatternType patternType;

  const _AnimatedKaleidoscope({
    required this.segments,
    required this.blur,
    required this.color,
    required this.duration,
    required this.child,
    this.patternType = KaleidoscopePatternType.basic,
  });

  @override
  State<_AnimatedKaleidoscope> createState() => _AnimatedKaleidoscopeState();
}

class _AnimatedKaleidoscopeState extends State<_AnimatedKaleidoscope>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final size = max(constraints.maxWidth, constraints.maxHeight);
            return Stack(
              children: [
                // Kaleidoscope segments
                ...List.generate(widget.segments, (index) {
                  final baseAngle = (index / widget.segments) * 2 * pi;
                  final rotationAngle =
                      baseAngle + (_controller.value * 2 * pi);

                  return Transform.rotate(
                    angle: rotationAngle,
                    alignment: Alignment.center,
                    child: _KaleidoscopeSegment(
                      color: widget.color,
                      blur: widget.blur,
                      segmentAngle: 2 * pi / widget.segments,
                      size: size,
                      patternType: widget.patternType,
                    ),
                  );
                }),

                // Child content in center
                Center(child: widget.child),
              ],
            );
          },
        );
      },
    );
  }
}

class _KaleidoscopeSegment extends StatelessWidget {
  final Color color;
  final double blur;
  final double segmentAngle;
  final double size;
  final KaleidoscopePatternType patternType;

  const _KaleidoscopeSegment({
    required this.color,
    required this.blur,
    required this.segmentAngle,
    required this.size,
    this.patternType = KaleidoscopePatternType.basic,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _SegmentClipper(segmentAngle),
      child: Container(
        width: size,
        height: size,
        color: Colors.transparent,
        child: BlurBox(
          blur: blur,
          color: color,
          padding: EdgeInsets.zero,
          child: CustomPaint(
            painter: _KaleidoscopePatternPainter(
              color: color,
              patternType: patternType,
            ),
            child: const SizedBox.expand(),
          ),
        ),
      ),
    );
  }
}

class _SegmentClipper extends CustomClipper<Path> {
  final double angle;

  _SegmentClipper(this.angle);

  @override
  Path getClip(Size size) {
    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);

    path.moveTo(center.dx, center.dy);
    path.lineTo(center.dx + size.width, center.dy);

    // Add an arc that covers just this segment
    path.arcTo(
      Rect.fromCircle(center: center, radius: size.width),
      0,
      angle,
      false,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(_SegmentClipper oldClipper) => angle != oldClipper.angle;
}

class _KaleidoscopePatternPainter extends CustomPainter {
  final Color color;
  final KaleidoscopePatternType patternType;

  _KaleidoscopePatternPainter({
    required this.color,
    this.patternType = KaleidoscopePatternType.basic,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5;

    final fillPaint =
        Paint()
          ..color = color.withValues(alpha: 0.3)
          ..style = PaintingStyle.fill;

    final random = Random(42); // Fixed seed for consistency

    switch (patternType) {
      case KaleidoscopePatternType.basic:
        _paintBasicPattern(canvas, size, paint, random);
        break;

      case KaleidoscopePatternType.rectangles:
        _paintRectanglesPattern(canvas, size, paint, fillPaint, random);
        break;

      case KaleidoscopePatternType.triangles:
        _paintTrianglesPattern(canvas, size, paint, fillPaint, random);
        break;

      case KaleidoscopePatternType.mixed:
        _paintMixedPattern(canvas, size, paint, fillPaint, random);
        break;

      case KaleidoscopePatternType.concentric:
        _paintConcentricPattern(canvas, size, paint, random);
        break;
    }
  }

  void _paintBasicPattern(
    Canvas canvas,
    Size size,
    Paint paint,
    Random random,
  ) {
    // Draw some decorative lines
    for (int i = 0; i < 10; i++) {
      final startX = random.nextDouble() * size.width;
      final startY = random.nextDouble() * size.height / 3;
      final endX = random.nextDouble() * size.width;
      final endY = size.height;

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
    }

    // Draw some circles
    for (int i = 0; i < 5; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = 5 + random.nextDouble() * 20;

      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  void _paintRectanglesPattern(
    Canvas canvas,
    Size size,
    Paint strokePaint,
    Paint fillPaint,
    Random random,
  ) {
    // Draw adjacent rectangles with varied sizes
    final gridSize = 5;
    final cellWidth = size.width / gridSize;
    final cellHeight = size.height / gridSize;

    for (int row = 0; row < gridSize; row++) {
      for (int col = 0; col < gridSize; col++) {
        if (random.nextBool()) {
          final rectSize =
              min(cellWidth, cellHeight) * (0.6 + random.nextDouble() * 0.4);
          final left =
              col * cellWidth + (cellWidth - rectSize) * random.nextDouble();
          final top =
              row * cellHeight + (cellHeight - rectSize) * random.nextDouble();

          final rect = Rect.fromLTWH(left, top, rectSize, rectSize);

          // Draw filled rectangle with stroke
          canvas.drawRect(rect, fillPaint);
          canvas.drawRect(rect, strokePaint);
        }
      }
    }
  }

  void _paintTrianglesPattern(
    Canvas canvas,
    Size size,
    Paint strokePaint,
    Paint fillPaint,
    Random random,
  ) {
    // Draw triangular pattern
    for (int i = 0; i < 8; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final triangleSize = 10.0 + random.nextDouble() * 40.0;

      final path = Path();
      path.moveTo(x, y - triangleSize);
      path.lineTo(x + triangleSize, y + triangleSize);
      path.lineTo(x - triangleSize, y + triangleSize);
      path.close();

      // Apply random rotation
      final rotationAngle = random.nextDouble() * pi * 2;
      final matrix = Matrix4.rotationZ(rotationAngle).storage;
      final rotatedPath = path.transform(
        Float64List.fromList([
          matrix[0],
          matrix[1],
          0,
          0,
          matrix[4],
          matrix[5],
          0,
          0,
          0,
          0,
          1,
          0,
          x,
          y,
          0,
          1,
        ]),
      );

      canvas.drawPath(rotatedPath, fillPaint);
      canvas.drawPath(rotatedPath, strokePaint);
    }
  }

  void _paintMixedPattern(
    Canvas canvas,
    Size size,
    Paint strokePaint,
    Paint fillPaint,
    Random random,
  ) {
    // Draw a mix of shapes

    // Some rectangles
    for (int i = 0; i < 5; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final rectSize = 10.0 + random.nextDouble() * 30.0;

      final rect = Rect.fromCenter(
        center: Offset(x, y),
        width: rectSize,
        height: rectSize * (0.5 + random.nextDouble() * 1.0),
      );

      canvas.drawRect(rect, fillPaint);
      canvas.drawRect(rect, strokePaint);
    }

    // Some circles
    for (int i = 0; i < 3; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = 5.0 + random.nextDouble() * 15.0;

      canvas.drawCircle(Offset(x, y), radius, fillPaint);
      canvas.drawCircle(Offset(x, y), radius, strokePaint);
    }

    // Some lines
    for (int i = 0; i < 8; i++) {
      final startX = random.nextDouble() * size.width;
      final startY = random.nextDouble() * size.height;
      final endX = startX + (-40.0 + random.nextDouble() * 80.0);
      final endY = startY + (-40.0 + random.nextDouble() * 80.0);

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), strokePaint);
    }
  }

  void _paintConcentricPattern(
    Canvas canvas,
    Size size,
    Paint paint,
    Random random,
  ) {
    // Draw concentric circles or ellipses
    final centerX = size.width * (0.3 + random.nextDouble() * 0.4);
    final centerY = size.height * (0.3 + random.nextDouble() * 0.4);

    for (int i = 1; i <= 10; i++) {
      final radius = size.width * i * 0.08;
      canvas.drawCircle(Offset(centerX, centerY), radius, paint);
    }

    // Add some crossing lines
    for (int i = 0; i < 5; i++) {
      final angle = random.nextDouble() * pi * 2;
      final length = size.width * 0.8;

      canvas.drawLine(
        Offset(centerX + cos(angle) * length, centerY + sin(angle) * length),
        Offset(
          centerX + cos(angle + pi) * length,
          centerY + sin(angle + pi) * length,
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_KaleidoscopePatternPainter oldDelegate) =>
      color != oldDelegate.color || patternType != oldDelegate.patternType;
}
