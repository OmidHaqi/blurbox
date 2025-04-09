import 'package:blurbox/blurbox.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

/// The main application widget.
///
/// Sets up the MaterialApp with appropriate themes and the home page.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlurBox Examples',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}

/// The home page displaying a grid of example widgets.
///
/// Shows all available BlurBox examples in a grid layout.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true, // Allow content to go behind the bottom nav bar
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text('BlurBox Examples'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        flexibleSpace: BlurBox(
          height: 210,
          blur: 8,
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          child: const SizedBox.shrink(),
        ),
      ),
      bottomNavigationBar: BlurBox(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
        blur: 10,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              unselectedItemColor: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.6),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Vector Background
          const VectorBackground(),

          // Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.0,
              ),
              physics: const AlwaysScrollableScrollPhysics().applyTo(
                const BouncingScrollPhysics(),
              ),
              itemCount: exampleWidgets.length,
              itemBuilder: (context, index) {
                final example = exampleWidgets[index];
                return InkWell(
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => example.builder()),
                      ),
                  borderRadius: BorderRadius.circular(16),
                  child: BlurBox(
                    blur: 5,
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          example.icon,
                          size: 40,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          example.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// List of example widgets to display in the grid
final List<ExampleWidget> exampleWidgets = [
  ExampleWidget(
    title: 'Basic BlurBox',
    icon: Icons.blur_on,
    builder: () => const BasicBlurBoxExample(),
  ),
  ExampleWidget(
    title: 'Animated BlurBox',
    icon: Icons.animation,
    builder: () => const AnimatedBlurBoxExample(),
  ),
  ExampleWidget(
    title: 'Preset BlurBox',
    icon: Icons.style,
    builder: () => const PresetBlurBoxExample(),
  ),
  ExampleWidget(
    title: 'Themed BlurBox',
    icon: Icons.color_lens,
    builder: () => const ThemedBlurBoxExample(),
  ),
  ExampleWidget(
    title: 'Directional BlurBox',
    icon: Icons.gesture,
    builder: () => const DirectionalBlurBoxExample(),
  ),
  ExampleWidget(
    title: 'Radial BlurBox',
    icon: Icons.radio_button_checked,
    builder: () => const RadialBlurBoxExample(),
  ),
  ExampleWidget(
    title: 'Following BlurBox',
    icon: Icons.touch_app,
    builder: () => const FollowingBlurBoxExample(),
  ),
  ExampleWidget(
    title: 'Scroll Aware BlurBox',
    icon: Icons.roller_shades_closed_rounded,
    builder: () => const ScrollAwareBlurBoxExample(),
  ),
  ExampleWidget(
    title: 'PNG Pattern',
    icon: Icons.pattern,
    builder: () => const PngPatternedBlurBoxExample(),
  ),
  ExampleWidget(
    title: 'Geometric Pattern',
    icon: Icons.shape_line_rounded,
    builder: () => const GeometricPatternBlurBoxExample(),
  ),
  ExampleWidget(
    title: 'Organic Pattern',
    icon: Icons.bubble_chart,
    builder: () => const OrganicPatternBlurBoxExample(),
  ),
  ExampleWidget(
    title: 'Kaleidoscope',
    icon: Icons.auto_awesome,
    builder: () => const KaleidoscopeBlurBoxExample(),
  ),
  ExampleWidget(
    title: 'Extension Methods',
    icon: Icons.extension,
    builder: () => const ExtensionMethodsExample(),
  ),
];

/// Model class for example widgets displayed in the home grid.
///
/// Contains the title, icon, and builder function for each example.
class ExampleWidget {
  final String title;
  final IconData icon;
  final Widget Function() builder;

  const ExampleWidget({
    required this.title,
    required this.icon,
    required this.builder,
  });
}

/// A widget that provides a common layout for example pages.
///
/// Creates a scaffold with an app bar and a stack containing a vector
/// background and the provided child widget.
/// The app bar has a blurry background effect.
class ExamplePage extends StatelessWidget {
  final String title;
  final Widget child;

  const ExamplePage({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: BlurBox(
          height: 210,
          blur: 8,
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          child: SizedBox.shrink(),
        ),
      ),
      body: Stack(
        children: [
          // Vector Background
          const VectorBackground(),

          // Content
          Padding(padding: const EdgeInsets.only(top: 70.0), child: child),
        ],
      ),
    );
  }
}

/// A decorative background widget that renders vector graphics.
///
/// Creates a full-size background with gradient colors and vector shapes.
/// Used to add visual interest to example pages.
class VectorBackground extends StatelessWidget {
  const VectorBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: CustomPaint(painter: VectorBackgroundPainter(context)),
    );
  }
}

/// Custom painter that renders a vector-based decorative background.
///
/// Creates a gradient background with various vector elements:
/// - Wave patterns at the bottom
/// - Floating geometric shapes
/// - Glowing dots for a cosmic effect
class VectorBackgroundPainter extends CustomPainter {
  final BuildContext context;

  VectorBackgroundPainter(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Create a theme-aware gradient background
    final Paint backgroundPaint =
        Paint()
          ..shader = LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors:
                isDarkMode
                    ? [
                      const Color(0xFF0F2027), // Dark teal
                      const Color(0xFF203A43), // Medium teal
                      const Color(0xFF2C5364), // Light teal
                    ]
                    : [
                      const Color(0xFFF0F8FF), // Alice blue
                      const Color(0xFFE6F2FF), // Light sky blue
                      const Color(0xFFD4E6FF), // Very light blue
                    ],
          ).createShader(rect);

    canvas.drawRect(rect, backgroundPaint);

    // Draw various vector shapes
    _drawWavePattern(canvas, size, isDarkMode);
    _drawFloatingShapes(canvas, size, isDarkMode);
    _drawGlowingDots(canvas, size, isDarkMode);
  }

  // Draw a wave pattern at the bottom
  void _drawWavePattern(Canvas canvas, Size size, bool isDarkMode) {
    final primaryWaveColor =
        isDarkMode
            ? const Color(0xFF5DE6DE).withValues(alpha: 0.15)
            : const Color(0xFF4287f5).withValues(alpha: 0.2);

    final secondaryWaveColor =
        isDarkMode
            ? const Color(0xFF5A8BFF).withValues(alpha: 0.1)
            : const Color(0xFF8A56AC).withValues(alpha: 0.15);

    final paint =
        Paint()
          ..color = primaryWaveColor
          ..style = PaintingStyle.fill;

    final wavePath = Path();
    wavePath.moveTo(0, size.height);

    // First wave
    for (double x = 0; x <= size.width; x += size.width / 20) {
      double y = size.height - 100 + 30 * math.sin(x * 0.05);
      wavePath.lineTo(x, y);
    }

    wavePath.lineTo(size.width, size.height);
    wavePath.close();
    canvas.drawPath(wavePath, paint);

    // Second wave (higher frequency)
    final wavePath2 = Path();
    wavePath2.moveTo(0, size.height);
    final paint2 =
        Paint()
          ..color = secondaryWaveColor
          ..style = PaintingStyle.fill;

    for (double x = 0; x <= size.width; x += size.width / 40) {
      double y = size.height - 50 + 20 * math.sin(x * 0.1);
      wavePath2.lineTo(x, y);
    }

    wavePath2.lineTo(size.width, size.height);
    wavePath2.close();
    canvas.drawPath(wavePath2, paint2);
  }

  // Draw floating geometric shapes
  void _drawFloatingShapes(Canvas canvas, Size size, bool isDarkMode) {
    final random = math.Random(42); // Fixed seed for consistency

    // Define theme-aware vibrant colors with transparency
    final colors =
        isDarkMode
            ? [
              const Color(0xFFFF61D2).withValues(alpha: 0.15), // Pink
              const Color(0xFFFE9090).withValues(alpha: 0.15), // Salmon
              const Color(0xFF7A66FF).withValues(alpha: 0.15), // Purple
              const Color(0xFF41C7FF).withValues(alpha: 0.15), // Blue
              const Color(0xFF41F1FF).withValues(alpha: 0.15), // Cyan
            ]
            : [
              const Color(0xFFE91E63).withValues(alpha: 0.25), // Pink
              const Color(0xFFFF5722).withValues(alpha: 0.2), // Deep Orange
              const Color(0xFF673AB7).withValues(alpha: 0.2), // Deep Purple
              const Color(0xFF2196F3).withValues(alpha: 0.25), // Blue
              const Color(0xFF009688).withValues(alpha: 0.2), // Teal
            ];

    // Draw hexagons
    for (int i = 0; i < 8; i++) {
      final centerX = random.nextDouble() * size.width;
      final centerY = random.nextDouble() * size.height * 0.7;
      final radius = 30.0 + random.nextDouble() * 50.0;

      final path = Path();
      for (int j = 0; j < 6; j++) {
        final angle = j * math.pi / 3;
        final x = centerX + radius * math.cos(angle);
        final y = centerY + radius * math.sin(angle);

        if (j == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      path.close();

      final paint =
          Paint()
            ..color = colors[random.nextInt(colors.length)]
            ..style = PaintingStyle.fill;

      canvas.drawPath(path, paint);

      // Add a subtle stroke with theme-aware color
      final strokePaint =
          Paint()
            ..color = (isDarkMode ? Colors.white : Colors.black).withValues(
              alpha: 0.1,
            )
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.0;

      canvas.drawPath(path, strokePaint);
    }

    // Draw circles with gradients
    for (int i = 0; i < 12; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = 20.0 + random.nextDouble() * 40.0;

      final gradientPaint =
          Paint()
            ..shader = RadialGradient(
              colors: [
                colors[random.nextInt(colors.length)],
                colors[random.nextInt(colors.length)].withValues(alpha: 0.05),
              ],
            ).createShader(
              Rect.fromCircle(center: Offset(x, y), radius: radius),
            );

      canvas.drawCircle(Offset(x, y), radius, gradientPaint);
    }

    // Draw polygons
    for (int i = 0; i < 6; i++) {
      final centerX = random.nextDouble() * size.width;
      final centerY = random.nextDouble() * size.height;
      final radius = 20.0 + random.nextDouble() * 30.0;
      final sides = 3 + random.nextInt(3); // 3-5 sides

      final path = Path();
      for (int j = 0; j < sides; j++) {
        final angle = j * (2 * math.pi / sides);
        final x = centerX + radius * math.cos(angle);
        final y = centerY + radius * math.sin(angle);

        if (j == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      path.close();

      final paint =
          Paint()
            ..color = colors[random.nextInt(colors.length)]
            ..style = PaintingStyle.fill;

      canvas.drawPath(path, paint);
    }
  }

  // Add glowing dots for a cosmic effect
  void _drawGlowingDots(Canvas canvas, Size size, bool isDarkMode) {
    final random = math.Random(24); // Different seed

    // Theme-aware glow colors
    final innerGlowColor =
        isDarkMode
            ? Colors.white.withValues(alpha: 0.6)
            : Colors.white.withValues(alpha: 0.7);

    final outerGlowColor =
        isDarkMode
            ? Colors.white.withValues(alpha: 0.15)
            : Colors.blue.withValues(alpha: 0.3);

    for (int i = 0; i < 60; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = 1.0 + random.nextDouble() * 2.5;

      // Inner glow
      final innerPaint = Paint()..color = innerGlowColor;

      // Outer glow
      final outerPaint =
          Paint()
            ..color = outerGlowColor
            ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3.0);

      canvas.drawCircle(Offset(x, y), radius * 2, outerPaint);
      canvas.drawCircle(Offset(x, y), radius, innerPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

//
// Individual example pages for each widget
//

/// Demonstrates the basic BlurBox widget with standard properties.
///
/// Shows a simple frosted glass effect card with custom styling.
class BasicBlurBoxExample extends StatelessWidget {
  const BasicBlurBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
      title: 'Basic BlurBox',
      child: Center(
        child: BlurBox(
          blur: 10,
          color: Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(20),
          padding: const EdgeInsets.all(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.blur_on, size: 60),
                const SizedBox(height: 16),
                const Text(
                  'Basic BlurBox',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'A simple frosted glass effect with blur: 10, color: white(0.2)',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black.withValues(alpha: 0.7)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Demonstrates the AnimatedBlurBox with controllable blur transitions.
///
/// Allows toggling between blurred and clear states with animated transitions.
class AnimatedBlurBoxExample extends StatefulWidget {
  const AnimatedBlurBoxExample({super.key});

  @override
  State<AnimatedBlurBoxExample> createState() => _AnimatedBlurBoxExampleState();
}

class _AnimatedBlurBoxExampleState extends State<AnimatedBlurBoxExample> {
  bool _isBlurred = false;

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
      title: 'Animated BlurBox',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBlurBox(
              blur: _isBlurred ? 20.0 : 0.0,
              begin: _isBlurred ? 0.0 : 20.0,
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOutCubic,
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withValues(alpha: 0.2),
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.animation, size: 60),
                    const SizedBox(height: 16),
                    const Text(
                      'Animated BlurBox',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _isBlurred ? 'Blurred (20.0)' : 'Clear (0.0)',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _isBlurred = !_isBlurred;
                });
              },
              icon: Icon(_isBlurred ? Icons.visibility : Icons.visibility_off),
              label: Text(_isBlurred ? 'Clear' : 'Blur'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Demonstrates the PresetBlurBox with various predefined blur styles.
///
/// Displays all available BlurPreset options in a scrollable list.
class PresetBlurBoxExample extends StatelessWidget {
  const PresetBlurBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
      title: 'Preset BlurBox',
      child: Center(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics().applyTo(
            const BouncingScrollPhysics(),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              for (final preset in BlurPreset.values)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: PresetBlurBox(
                    preset: preset,
                    borderRadius: BorderRadius.circular(16),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Icon(Icons.style, size: 36),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                preset.toString().split('.').last,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'A preset with predefined blur and style settings',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Demonstrates the ThemedBlurBox which adapts to the app's theme.
///
/// Shows a blur box that automatically uses appropriate colors from the theme.
class ThemedBlurBoxExample extends StatelessWidget {
  const ThemedBlurBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
      title: 'Themed BlurBox',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ThemedBlurBox(
              blur: 8,
              borderRadius: BorderRadius.circular(20),
              padding: const EdgeInsets.all(24),
              elevation: 4,
              child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.color_lens, size: 60),
                    const SizedBox(height: 16),
                    const Text(
                      'Themed BlurBox',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Automatically adapts to your app theme colors',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Demonstrates the DirectionalBlurBox with adjustable blur direction.
///
/// Allows changing the angle of the blur effect using a slider.
class DirectionalBlurBoxExample extends StatefulWidget {
  const DirectionalBlurBoxExample({super.key});

  @override
  State<DirectionalBlurBoxExample> createState() =>
      _DirectionalBlurBoxExampleState();
}

class _DirectionalBlurBoxExampleState extends State<DirectionalBlurBoxExample> {
  double _angle = 45.0;

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
      title: 'Directional BlurBox',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DirectionalBlurBox(
              blur: 12,
              angle: _angle,
              color: Colors.blue.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20),
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.gesture, size: 60),
                    const SizedBox(height: 16),
                    const Text(
                      'Directional BlurBox',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Blur angle: ${_angle.toStringAsFixed(0)}°',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Column(
                children: [
                  const Text('Adjust angle:'),
                  Slider(
                    value: _angle,
                    min: 0,
                    max: 360,
                    divisions: 72,
                    label: '${_angle.round()}°',
                    onChanged: (value) {
                      setState(() {
                        _angle = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Demonstrates the RadialBlurBox with a focal point that can be changed.
///
/// Shows blur that radiates from a focal point that can be controlled via touch.
class RadialBlurBoxExample extends StatefulWidget {
  const RadialBlurBoxExample({super.key});

  @override
  State<RadialBlurBoxExample> createState() => _RadialBlurBoxExampleState();
}

class _RadialBlurBoxExampleState extends State<RadialBlurBoxExample> {
  Alignment _focalPoint = Alignment.center;

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
      title: 'Radial BlurBox',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onPanUpdate: (details) {
                // Convert the touch position to an Alignment
                final RenderBox box = context.findRenderObject() as RenderBox;
                final Offset localPosition = box.globalToLocal(
                  details.globalPosition,
                );
                final double x = 2 * (localPosition.dx / box.size.width) - 1;
                final double y = 2 * (localPosition.dy / box.size.height) - 1;

                setState(() {
                  _focalPoint = Alignment(x, y);
                });
              },
              child: Center(
                child: RadialBlurBox(
                  radius: 150.0,
                  falloff: 2.0,
                  quality: 8,
                  maxBlur: 15,
                  focalPoint: _focalPoint,

                  color: Colors.purple.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                  padding: const EdgeInsets.all(24),
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.radio_button_checked, size: 60),
                        const SizedBox(height: 16),
                        const Text(
                          'Radial BlurBox',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Tap or drag anywhere to move focal point',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Focal point: (${_focalPoint.x.toStringAsFixed(2)}, ${_focalPoint.y.toStringAsFixed(2)})',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Demonstrates the FollowingBlurBox that tracks user input.
///
/// Shows a blur effect that follows the user's finger or cursor.
class FollowingBlurBoxExample extends StatelessWidget {
  const FollowingBlurBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
      title: 'Following BlurBox',
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: FollowingBlurBox(
            radius: 60,
            blurIntensity: 12,
            followSpeed: 0.5,
            color: Colors.pink.withValues(alpha: 0.2),
            child: Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.touch_app, size: 60),
                  SizedBox(height: 16),
                  Text(
                    'Following BlurBox',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Move your finger or cursor\nover this container',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Demonstrates the ScrollAwareBlurBox that responds to scroll position.
///
/// Shows a header that becomes more blurred as the user scrolls down.
class ScrollAwareBlurBoxExample extends StatefulWidget {
  const ScrollAwareBlurBoxExample({super.key});

  @override
  State<ScrollAwareBlurBoxExample> createState() =>
      _ScrollAwareBlurBoxExampleState();
}

class _ScrollAwareBlurBoxExampleState extends State<ScrollAwareBlurBoxExample> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
      title: 'ScrollAware BlurBox',
      child: Stack(
        children: [
          ListView.builder(
            physics: const AlwaysScrollableScrollPhysics().applyTo(
              const BouncingScrollPhysics(),
            ),
            controller: _scrollController,
            padding: const EdgeInsets.only(top: 150),
            itemCount: 50,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Item $index'),
                subtitle: const Text('Scroll to change header blur'),
              );
            },
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ScrollAwareBlurBox(
              scrollController: _scrollController,
              minBlur: 0,
              maxBlur: 15,
              scrollThreshold: 300,
              color: Colors.white.withValues(alpha: 0.3),
              child: const SafeArea(
                bottom: false,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(Icons.roller_shades_closed_rounded),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ScrollAware BlurBox',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text('Scroll down to increase blur effect'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Demonstrates the GeometricPatternBlurBox with abstract shapes.
///
/// Shows a blur box with generated geometric patterns and shapes.
class GeometricPatternBlurBoxExample extends StatelessWidget {
  const GeometricPatternBlurBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
      title: 'Geometric Pattern',
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: GeometricPatternBlurBox(
            baseBlur: 8,
            shapeCount: 100,
            colors: [
              Colors.blue.withValues(alpha: 0.5),
              Colors.purple.withValues(alpha: 0.5),
              Colors.pink.withValues(alpha: 0.5),
            ],
            shapeTypes: const [
              GeometricShapeType.circle,
              GeometricShapeType.rectangle,
              GeometricShapeType.oval,
              GeometricShapeType.triangle,
            ],
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: double.infinity,
              height: 400,
              padding: const EdgeInsets.all(24),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shape_line_rounded, size: 60, color: Colors.white),
                  SizedBox(height: 16),
                  Text(
                    'Geometric Pattern',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Abstract geometric shapes with blur effects',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Demonstrates the OrganicPatternBlurBox with flowing patterns.
///
/// Shows natural, organic-looking animated blur patterns.
class OrganicPatternBlurBoxExample extends StatelessWidget {
  const OrganicPatternBlurBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
      title: 'Organic Pattern',
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: OrganicPatternBlurBox(
            blur: 10,
            backgrundBlur: 50,
            color: Colors.teal.withValues(alpha: 0.4),
            complexity: 8,
            fluidity: 0.8,
            animationDuration: const Duration(seconds: 15),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: double.infinity,
              height: 400,
              padding: const EdgeInsets.all(24),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bubble_chart, size: 60, color: Colors.white),
                  SizedBox(height: 16),
                  Text(
                    'Organic Pattern',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Flowing, natural blur patterns that animate over time',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Demonstrates the KaleidoscopeBlurBox with symmetrical patterns.
///
/// Shows a kaleidoscope effect using various pattern types with blur.
class KaleidoscopeBlurBoxExample extends StatefulWidget {
  const KaleidoscopeBlurBoxExample({super.key});

  @override
  State<KaleidoscopeBlurBoxExample> createState() =>
      _KaleidoscopeBlurBoxExampleState();
}

class _KaleidoscopeBlurBoxExampleState
    extends State<KaleidoscopeBlurBoxExample> {
  KaleidoscopePatternType _selectedPatternType = KaleidoscopePatternType.basic;
  bool _animated = true;

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
      title: 'Kaleidoscope',
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: KaleidoscopeBlurBox(
                  segments: 20,
                  blur: 5.0,
                  color: Colors.purple.withValues(alpha: 0.2),
                  animated: _animated,
                  patternType: _selectedPatternType,
                  rotationDuration: const Duration(seconds: 20),
                  borderRadius: BorderRadius.circular(20),
                  width: double.infinity,
                  height: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.auto_awesome,
                        size: 60,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Kaleidoscope BlurBox',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Pattern type: ${_selectedPatternType.toString().split('.').last}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Pattern type selection
          Container(
            color: Colors.black12,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pattern Type:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (final patternType in KaleidoscopePatternType.values)
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ChoiceChip(
                            label: Text(patternType.toString().split('.').last),
                            selected: _selectedPatternType == patternType,
                            onSelected: (selected) {
                              if (selected) {
                                setState(() {
                                  _selectedPatternType = patternType;
                                });
                              }
                            },
                          ),
                        ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text(
                      'Animation:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                    Switch(
                      value: _animated,
                      onChanged: (value) {
                        setState(() {
                          _animated = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Demonstrates the extension methods available for adding blur effects.
///
/// Shows how to use the .blurry() and .animatedBlurry() extensions on widgets.
class ExtensionMethodsExample extends StatefulWidget {
  const ExtensionMethodsExample({super.key});

  @override
  State<ExtensionMethodsExample> createState() =>
      _ExtensionMethodsExampleState();
}

class _ExtensionMethodsExampleState extends State<ExtensionMethodsExample> {
  bool _isBlurred = false;

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
      title: 'Extension Methods',
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Simple blurry extension
            Container(
              width: 300,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.withValues(alpha: 0.1),
                    Colors.purple.withValues(alpha: 0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  Icon(Icons.extension, size: 40, color: Colors.white),
                  SizedBox(height: 8),
                  Text(
                    'Container with gradient',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ).blurry(
              blur: _isBlurred ? 10.0 : 0.0,
              borderRadius: BorderRadius.circular(16),
              padding: EdgeInsets.zero,
            ),

            const SizedBox(height: 24),

            // Animated blurry extension
            Container(
              width: 300,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.orange.withValues(alpha: 0.1),
                    Colors.red.withValues(alpha: 0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  Icon(Icons.animation, size: 40, color: Colors.white),
                  SizedBox(height: 8),
                  Text(
                    'With animated blur',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ).animatedBlurry(
              blur: _isBlurred ? 10.0 : 0.0,
              beginBlur: _isBlurred ? 0.0 : 10.0,
              duration: const Duration(milliseconds: 500),
              borderRadius: BorderRadius.circular(16),
              padding: EdgeInsets.zero,
            ),

            const SizedBox(height: 24),

            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _isBlurred = !_isBlurred;
                });
              },
              icon: Icon(_isBlurred ? Icons.visibility : Icons.visibility_off),
              label: Text(_isBlurred ? 'Clear' : 'Blur'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Demonstrates the PatternedBlurBox using a PNG pattern.
///
/// Shows how to use a PNG image as a pattern overlay with blur effects.
class PngPatternedBlurBoxExample extends StatelessWidget {
  const PngPatternedBlurBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ExamplePage(
      title: 'PNG Pattern BlurBox',
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: PatternedBlurBox(
            height: 500,
            blur: 8.0,
            color: Colors.white.withValues(alpha: 0.2),
            patternAsset: 'assets/images/vc_pattern.png',
            patternOpacity: 0.9,
            patternScale: 0.5,
            patternColor: Theme.of(context).colorScheme.primary,
            patternBlendMode: BlendMode.srcIn,
            borderRadius: BorderRadius.circular(20),
            padding: const EdgeInsets.all(24),
            child: SizedBox(
              width: double.infinity,
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.pattern, size: 60),
                  const SizedBox(height: 16),
                  const Text(
                    'PNG Pattern BlurBox',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Using PNG pattern with opacity: 0.2, scale: 0.5',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey.shade800),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
