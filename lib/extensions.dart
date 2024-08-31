part of 'blurbox.dart';

extension BlurBoxExtension on Widget {
  Widget blurry({
    double blur = 5.0,
    Color color = Colors.transparent,
    double elevation = 0.0,
    EdgeInsetsGeometry padding = const EdgeInsets.all(8.0),
    EdgeInsetsGeometry? margin,
    AlignmentGeometry? alignment,
    Clip clipBehavior = Clip.none,
    BoxConstraints? constraints,
    BoxDecoration? foregroundDecoration,
    Key? keyy,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    BorderRadiusGeometry borderRadius =
        const BorderRadius.all(Radius.circular(0)),
    Border? border,
    BlendMode? backgroundBlendMode,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    DecorationImage? image,
    BoxShape shape = BoxShape.rectangle,
    double? height,
    double? width,
  }) {
    return BlurBox(
      blur: blur,
      color: color,
      elevation: elevation,
      padding: padding,
      margin: margin,
      alignment: alignment,
      clipBehavior: clipBehavior,
      constraints: constraints,
      foregroundDecoration: foregroundDecoration,
      keyy: keyy,
      transform: transform,
      transformAlignment: transformAlignment,
      borderRadius: borderRadius,
      border: border,
      backgroundBlendMode: backgroundBlendMode,
      boxShadow: boxShadow,
      gradient: gradient,
      image: image,
      shape: shape,
      height: height,
      width: width,
      child: this,
    );
  }
}
