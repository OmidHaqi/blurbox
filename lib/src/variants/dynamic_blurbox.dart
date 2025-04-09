part of '../../blurbox.dart';

/// A blur box that responds to scroll events by changing blur intensity.
///
/// This widget can be used to create dynamic UI effects where elements
/// blur or sharpen based on the scroll position, creating a sense of depth.
/// Particularly useful for app bars, headers, or floating action buttons
/// that change appearance as the user scrolls through content.
///
/// The widget listens to a provided [ScrollController] and maps scroll position
/// to a blur intensity between [minBlur] and [maxBlur].
///
/// ## Use Cases
///
/// - Creating app bars that blur as content scrolls underneath
/// - Implementing backdrop blur effects that intensify during scroll
/// - Making floating elements that become clearer or blurrier based on scroll position
/// - Creating depth-based focus effects as users navigate through content
class ScrollAwareBlurBox extends StatefulWidget {
  /// The child widget to display
  final Widget child;

  /// The ScrollController to listen to for scroll events
  final ScrollController scrollController;

  /// Minimum blur value when scroll position is at 0
  final double minBlur;

  /// Maximum blur value at maximum scroll threshold
  final double maxBlur;

  /// Maximum scroll offset to reach maximum blur
  final double scrollThreshold;

  /// Background color of the blur effect
  final Color color;

  /// Border radius of the blur container
  final BorderRadius borderRadius;

  /// Whether blur increases (true) or decreases (false) with scrolling
  final bool blurOnScroll;

  /// Creates a blur effect that changes intensity based on scroll position.
  ///
  /// ## Example
  ///
  /// ```dart
  /// // In a StatefulWidget
  /// final ScrollController _scrollController = ScrollController();
  ///
  /// @override
  /// Widget build(BuildContext context) {
  ///   return Stack(
  ///     children: [
  ///       ListView.builder(
  ///         controller: _scrollController,
  ///         itemCount: 50,
  ///         itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
  ///       ),
  ///       Positioned(
  ///         top: 0,
  ///         left: 0,
  ///         right: 0,
  ///         child: ScrollAwareBlurBox(
  ///           scrollController: _scrollController,
  ///           minBlur: 0,
  ///           maxBlur: 10,
  ///           scrollThreshold: 200,
  ///           color: Colors.white.withValues( alpha:0.3),
  ///           child: Container(
  ///             padding: EdgeInsets.all(16),
  ///             alignment: Alignment.center,
  ///             child: Text('Scroll to see effect'),
  ///           ),
  ///         ),
  ///       ),
  ///     ],
  ///   );
  /// }
  /// ```
  const ScrollAwareBlurBox({
    super.key,
    required this.child,
    required this.scrollController,
    this.minBlur = 0,
    this.maxBlur = 10,
    this.scrollThreshold = 100,
    this.color = Colors.transparent,
    this.borderRadius = BorderRadius.zero,
    this.blurOnScroll = true,
  });

  @override
  State<ScrollAwareBlurBox> createState() => _ScrollAwareBlurBoxState();
}

class _ScrollAwareBlurBoxState extends State<ScrollAwareBlurBox> {
  double _currentBlur = 0;

  @override
  void initState() {
    super.initState();
    _currentBlur = widget.minBlur;
    widget.scrollController.addListener(_updateBlur);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_updateBlur);
    super.dispose();
  }

  void _updateBlur() {
    final scrollPosition = widget.scrollController.offset;
    final scrollPercentage = (scrollPosition / widget.scrollThreshold).clamp(
      0.0,
      1.0,
    );

    final newBlur =
        widget.blurOnScroll
            ? widget.minBlur +
                scrollPercentage * (widget.maxBlur - widget.minBlur)
            : widget.maxBlur -
                scrollPercentage * (widget.maxBlur - widget.minBlur);

    if (newBlur != _currentBlur) {
      setState(() {
        _currentBlur = newBlur;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlurBox(
      blur: _currentBlur,
      color: widget.color,
      borderRadius: widget.borderRadius,
      padding:
          EdgeInsets
              .zero, // Usually no padding is needed for scroll-aware effects
      child: widget.child,
    );
  }
}
