part of '../../blurbox.dart';

/// Interface defining core blur-related properties for blur widgets.
///
/// This interface standardizes the blur functionality across different
/// implementations, ensuring consistent behavior and property naming.
///
/// ## For Library Developers
///
/// When creating a new blur widget implementation, implement this interface
/// to ensure compatibility with the rest of the library:
///
/// ```dart
/// class MyCustomBlurWidget extends StatelessWidget implements BlurProperties {
///   @override
///   final double blur;
///
///   const MyCustomBlurWidget({required this.blur});
///
///   @override
///   Widget build(BuildContext context) {
///     // Implementation using blur value
///   }
/// }
/// ```
///
/// ## For Library Users
///
/// You typically won't need to use this interface directly. It's primarily used
/// internally to ensure consistency between different blur widgets.
abstract class BlurProperties {
  /// The amount of blur to apply.
  ///
  /// This value determines the intensity of the blur effect:
  /// - 0.0: No blur (completely clear)
  /// - 1.0-5.0: Subtle blur
  /// - 5.0-10.0: Moderate blur (good for UI elements)
  /// - 10.0+: Heavy blur (good for backgrounds)
  ///
  /// Higher values may impact performance.
  double get blur;

  /// The color overlay applied on top of the blur effect.
  ///
  /// Typically semi-transparent to allow the blur to show through.
  Color get color;
}

/// Interface for animated blur properties that extends basic blur functionality.
///
/// This interface adds animation-specific properties on top of the basic blur
/// properties, allowing for animated blur transitions.
///
/// ## For Library Developers
///
/// When creating a custom animated blur widget:
///
/// ```dart
/// class MyAnimatedBlur implements AnimatedBlurProperties {
///   @override
///   final double blur;
///   @override
///   final double begin;
///   @override
///   final Duration duration;
///   @override
///   final Curve curve;
///   @override
///   final Function()? onEnd;
///
///   // Constructor and implementation
/// }
/// ```
///
/// ## For Library Users
///
/// Use existing implementations like [AnimatedBlurBox] or the `.animatedBlurry()`
/// extension method instead of implementing this interface directly.
abstract class AnimatedBlurProperties extends BlurProperties {
  /// Initial blur value for animation.
  ///
  /// The animation transitions from this value to the [blur] value.
  double get begin;

  /// Animation curve that defines the rate of change.
  ///
  /// Common values:
  /// - [Curves.linear]: Constant rate of change
  /// - [Curves.easeIn]: Starts slowly and accelerates
  /// - [Curves.easeOut]: Starts quickly and decelerates
  /// - [Curves.easeInOut]: Combination of easeIn and easeOut
  Curve get curve;

  /// Duration of the blur animation.
  ///
  /// Typical values range from 200-500 milliseconds for a smooth effect.
  Duration get duration;

  /// Callback that triggers when the animation completes.
  ///
  /// Useful for chaining animations or performing actions after the transition.
  void Function()? get onEnd;
}
