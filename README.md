# 🌀 BlurBox

# 📝 Introduction

A powerful and versatile Flutter widget library for applying beautiful blur effects to your UI elements.

BlurBox works like a Container widget but with added blur capabilities, giving you all the styling options of Container plus sophisticated blur effects.

# [🚀 Live Demo](https://ox0.ir/blurbox/)

## ✨ Features

- **BlurBox**: The core widget for applying customizable blur effects
- **AnimatedBlurBox**: Smooth animations for changing blur values
- **PresetBlurBox**: Predefined blur styles for quick implementation
- **ThemedBlurBox**: Automatically adapts colors to match your app theme
- **DirectionalBlurBox**: Creates directional blur effects with adjustable angles
- **RadialBlurBox**: Creates blur that radiates from a focal point
- **FollowingBlurBox**: Blur that follows user interaction (touch/cursor)
- **ScrollAwareBlurBox**: Adjust blur based on scroll position
- **PatternedBlurBox**: Apply blur with decorative pattern overlays
- **GeometricPatternBlurBox**: Create geometric pattern backgrounds with blur
- **OrganicPatternBlurBox**: Create flowing natural blur patterns
- **KaleidoscopeBlurBox**: Create symmetrical kaleidoscope effects with blur

# 📦 Installation

```yaml
dependencies:
  blurbox: ^0.0.6
```
or 
```bash
flutter pub add blurbox
```

```dart
import 'package:blurbox/blurbox.dart';
```

# 🔧 Basic Usage

# ⚠️ Performance Tips

> [!IMPORTANT]
> When using blur in scrollable views, you might encounter rendering issues. Use the following physics configuration to improve performance:
>
> ```dart
> ListView(
>   physics: const AlwaysScrollableScrollPhysics()
>     .applyTo(const BouncingScrollPhysics()),
>   children: [...]
> )
> ```


## 🌫️ BlurBox

The simplest way to add a blur effect to any widget:

```dart
BlurBox(
  blur: 5.0, // Adjust the blur amount
  color: Colors.white.withAlpha(30), // Semi-transparent background
  borderRadius: BorderRadius.circular(16),
  padding: EdgeInsets.all(20),
  child: Text('This text has a blurred background!'),
)
```



## 🖼️ Blur Background

Create a full-screen blurred background:

```dart
BlurBox(
  width: double.infinity,
  height: double.infinity,
  blur: 5.0, 
  child: const Center(
    child: Text(
      'Blur Background!',
      style: TextStyle(fontSize: 24.0),
    ),
  ),
),
```

## 🧩 PresetBlurBox

Use predefined blur styles for quick implementation:

```dart
PresetBlurBox(
  preset: BlurPreset.heavy, // Choose from: soft, medium, heavy, subtleShadow, frostedGlass, and more
  borderRadius: BorderRadius.circular(16),
  padding: EdgeInsets.all(20),
  child: Center(
    child: Text(
      'Heavy Blur',
      style: TextStyle(fontSize: 24, color: Colors.white),
    ),
  ),
)
```

## ⚡ AnimatedBlurBox 

Smoothly animate between blur states:

```dart
AnimatedBlurBox(
  blur: _isBlurred ? 20.0 : 0.0, // Toggle between blurred and clear
  begin: _isBlurred ? 0.0 : 20.0,
  duration: Duration(milliseconds: 800),
  curve: Curves.easeInOutCubic,
  borderRadius: BorderRadius.circular(20),
  child: Center(
    child: Text('Animated Blur Effect'),
  ),
)
```

## 🎨 ThemedBlurBox

Automatically match your app theme:

```dart
ThemedBlurBox(
  blur: 8,
  borderRadius: BorderRadius.circular(16),
  padding: EdgeInsets.all(20),
  elevation: 4,
  child: Text('Adapts to your app theme colors'),
)
```

# 🚀 Advanced Usage

## 🔄 DirectionalBlurBox

Create blur effects that flow in a specific direction:

```dart
DirectionalBlurBox(
  blur: 12,
  angle: 45.0, // Direction of blur in degrees
  color: Colors.blue.withAlpha(50),
  borderRadius: BorderRadius.circular(16),
  padding: EdgeInsets.all(20),
  child: Text('Directional blur effect'),
)
```

## ☀️ RadialBlurBox

Create blur that radiates from a focal point:

```dart
RadialBlurBox(
  radius: 150.0,
  falloff: 2.0,
  quality: 8,
  maxBlur: 15,
  focalPoint: Alignment(0.3, -0.2), // Position of the focal point
  color: Colors.purple.withAlpha(50),
  borderRadius: BorderRadius.circular(16),
  padding: EdgeInsets.all(20),
  child: Text('Radial blur effect'),
)
```

## 👆 FollowingBlurBox

Blur that follows user interaction:

```dart
FollowingBlurBox(
  radius: 60,
  blurIntensity: 12,
  followSpeed: 0.5, // How quickly the blur follows (0.0-1.0)
  color: Colors.pink.withAlpha(50),
  child: Container(
    height: 200,
    width: 300,
    child: Center(
      child: Text('Move your finger or cursor over me'),
    ),
  ),
)
```

## 📜 ScrollAwareBlurBox

Adjust blur based on scroll position:

```dart
ScrollAwareBlurBox(
  scrollController: _scrollController, // Your ScrollController
  minBlur: 0,
  maxBlur: 15,
  scrollThreshold: 300, // How far to scroll for max blur
  color: Colors.white.withAlpha(75),
  child: Text('Scroll-aware header'),
)
```

## 🎭 PatternedBlurBox

Create blur with decorative pattern overlays:

```dart
PatternedBlurBox(
  blur: 8.0,
  color: Colors.white.withAlpha(50),
  patternAsset: 'assets/patterns/dots.png',
  patternOpacity: 0.15,
  borderRadius: BorderRadius.circular(15),
  child: Padding(
    padding: const EdgeInsets.all(20),
    child: Text('Patterned Glass Effect'),
  ),
)
```

## 🔮 Pattern BlurBoxes

Create beautiful patterns with blur effects:

```dart
// Geometric patterns
GeometricPatternBlurBox(
  baseBlur: 8,
  shapeCount: 100,
  colors: [Colors.blue, Colors.purple, Colors.pink],
  shapeTypes: [
    GeometricShapeType.circle,
    GeometricShapeType.rectangle,
  ],
  borderRadius: BorderRadius.circular(16),
  child: Text('Geometric patterns'),
)

// Organic, flowing patterns
OrganicPatternBlurBox(
  blur: 10,
  backgrundBlur: 50,
  color: Colors.teal.withAlpha(100),
  complexity: 8,
  fluidity: 0.8,
  animationDuration: Duration(seconds: 15),
  borderRadius: BorderRadius.circular(16),
  child: Text('Organic patterns'),
)

// Kaleidoscope patterns
KaleidoscopeBlurBox(
  segments: 8,
  blur: 5.0,
  color: Colors.purple.withAlpha(50),
  patternType: KaleidoscopePatternType.basic,
  animated: true,
  rotationDuration: Duration(seconds: 20),
  borderRadius: BorderRadius.circular(16),
  child: Text('Kaleidoscope patterns'),
)
```

# 🧰 Extension Methods

Apply blur effects directly to any widget:

```dart
// Simple blur
Text('Blurred Text').blurry(
  blur: 10,
  color: Colors.blue.withAlpha(50),
  borderRadius: BorderRadius.circular(15),
  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
)

// Animated blur
Container(
  child: Text('Animates between clear and blurry'),
).animatedBlurry(
  blur: _isBlurred ? 10.0 : 0.0,
  beginBlur: _isBlurred ? 0.0 : 10.0,
  duration: Duration(milliseconds: 500),
  borderRadius: BorderRadius.circular(16),
)
```


# 🛠️ Customization

BlurBox offers extensive customization options similar to Container:

- `blur`: Controls the blur intensity (default: 5.0)
- `color`: Sets the background color (default: transparent)
- `height` and `width`: Define the size
- `elevation`: Applies a shadow effect
- `padding`: Adds internal spacing
- `margin`: Adds external spacing
- `alignment`: Positions the child within the BlurBox
- `clipBehavior`: Controls child clipping (default: Clip.none)
- `borderRadius`: Sets rounded corners
- `border`: Defines a border
- `boxShadow`: Creates shadow effects
- `gradient`: Applies a gradient background
- `shape`: Defines the shape (default: BoxShape.rectangle)

# 📚 Examples

Check out the example app in the GitHub repository for complete demonstrations of all features.

## 📄 License

This package is available under the Apache License.



