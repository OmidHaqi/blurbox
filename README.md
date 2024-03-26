# BlurBox
<img src="https://i.ibb.co/TMGr2yY/intro.png" alt="screenshots">

# Introduction

### A widget that applies a blur effect to its child widget.<br/>

It works like the Container widget and gives you all the features that the container has,<br/>
with the difference that this container is BlurBox


# Installation

```yaml
dependencies:
  blurbox: 0.0.1
```

```dart
import 'package:bluebox/blur_box.dart';
```

# Usage

The `BlurBox` widget takes a child widget and applies a blur effect to it.<br/>
You can customize the blur amount, color, elevation, padding, and various other styling options.

```dart
BlurBox(
blur: 5.0, // Adjust the blur amount
color: Colors.white.withOpacity(0.1), // Set a semi-transparent background
  child: Text('This text is blurred!'),
)
```
### Blur Background!
```dart
BlurBox(
width: double.infinity,
height:double.infinity,
blur: 5.0, 
child: const Center(
  child: Text(
    'Blur Backgruond!',
     style: TextStyle(fontSize: 24.0),
    ),
  ),
),
```

# Features

* Blur effect with customizable sigma value
* Optional background color
* Border radius control
* Padding and margin for child widget
* Alignment control for child widget
* Clip behavior options
* Support for various decorations (border, gradient, image)
* And more!

# Customization

**Explore the various properties of `BlurBox` to customize its appearance and behavior:**

* `keyy`:The key of the widget.
* `blur`: Controls the blur intensity (`default`: `5.0`).
* `color`: Sets the background color of the BlurBox (`default`: `transparent`).
* `height` and width: Define the size of the BlurBox.
* `elevation`: Applies a shadow effect to the BlurBox.
* `padding`: Adds padding around the child widget.
* `margin`: Adds margin around the BlurBox.
* `alignment`: Positions the child widget within the BlurBox.
* `clipBehavior`: Determines how the child widget is clipped (`default`:`Clip.none`).
* `constraints`: Applies constraints to the child widget.
* `foregroundDecoration`: Applies decoration to the foreground of the BlurBox.
* `borderRadius`: Sets the border radius of the BlurBox.
* `border`: Defines a border for the BlurBox.
* `backgroundBlendMode`: Controls how the background and child are blended.
* `boxShadow`: Creates shadows on the BlurBox.
* `gradient`: Applies a gradient to the background of the BlurBox.
* `image`: Sets an image as the background of the BlurBox.
* `shape`: Defines the shape of the BlurBox (`default`: `BoxShape.rectangle`).
  <br/><br/>

___



