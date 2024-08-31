part of 'blurbox.dart';

class AnimatedBlurBox extends StatelessWidget {
  final Widget child;
  final double blur;
  final Duration duration;
  final double? height;
  final double? width;
  final Color color;
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
  final double begin;
  final Curve curve;
  final Function()? onEnd;

  const AnimatedBlurBox({
    super.key,
    required this.child,
    this.blur = 5,
    this.duration = const Duration(milliseconds: 300),
    this.height,
    this.width,
    this.color = Colors.transparent,
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
    this.begin = 0,
    this.curve = Curves.easeIn,
    this.onEnd,
  });

  /// Builds a [BlurBox] widget with a tween animation on the [BlurBox.blur]
  /// property.
  ///
  /// The [BlurBox] widget is animated from the [begin] value to the [blur]
  /// value over the [duration] using the [curve].
  ///
  /// When the animation is complete, the [onEnd] function is called.
  ///
  /// The [key] property is passed to the [BlurBox] widget.
  ///
  /// The other properties are passed directly to the [BlurBox] constructor.
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: _begin, end: _blur),
      curve: _curve,
      duration: _duration,
      onEnd: _onEnd,
      key: _key,
      builder: (context, value, _) {
        return BlurBox(
          blur: value,
          height: _height,
          width: _width,
          key: _key,
          color: _color,
          padding: _padding,
          margin: _margin,
          alignment: _alignment,
          clipBehavior: _clipBehavior,
          constraints: _constraints,
          foregroundDecoration: _foregroundDecoration,
          keyy: _key,
          transform: _transform,
          transformAlignment: _transformAlignment,
          borderRadius: _borderRadius,
          border: _border,
          backgroundBlendMode: _backgroundBlendMode,
          boxShadow: _boxShadow,
          gradient: _gradient,
          image: _image,
          shape: _shape,
          elevation: _elevation,
          child: _child,
        );
      },
    );
  }

  double get _begin => begin;
  double get _blur => blur;
  Curve get _curve => curve;
  Duration get _duration => duration;
  void Function()? get _onEnd => onEnd;
  Key? get _key => key;
  double? get _height => height;
  double? get _width => width;
  Color get _color => color;
  EdgeInsetsGeometry get _padding => padding;
  EdgeInsetsGeometry? get _margin => margin;
  AlignmentGeometry? get _alignment => alignment;
  Clip? get _clipBehavior => clipBehavior;
  BoxConstraints? get _constraints => constraints;
  BoxDecoration? get _foregroundDecoration => foregroundDecoration;
  Matrix4? get _transform => transform;
  AlignmentGeometry? get _transformAlignment => transformAlignment;
  BorderRadiusGeometry get _borderRadius => borderRadius;
  Border? get _border => border;
  BlendMode? get _backgroundBlendMode => backgroundBlendMode;
  List<BoxShadow>? get _boxShadow => boxShadow;
  Gradient? get _gradient => gradient;
  DecorationImage? get _image => image;
  BoxShape? get _shape => shape;
  double get _elevation => elevation;
  Widget get _child => child;
}
