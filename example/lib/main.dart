import 'package:blurbox/blurbox.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlurBox Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            surface: const Color(0xff19191B),
            onSurface: const Color(0xffffffff),
            seedColor: const Color(0xff19191B)),
        scaffoldBackgroundColor: const Color(0xff19191B),
      ),
      home: const ExampleOne(
        title: 'BlurBox Example',
      ),
    );
  }
}

class ExampleOne extends StatelessWidget {
  final String title;
  const ExampleOne({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'BlurBox Example',
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/test.png',
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 250,
            child: PresetBlurBox(
              width: 200,
              height: 150,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: const Color(0xff4d4d4d),
              ),
              child: const Center(
                child: Text(
                  'BlurBox!',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 175,
            //You can use all the properties provided by the container here
            child: BlurBox(
              width: 200,
              height: 150,
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: const Color(0xff4d4d4d),
              ),
              blur: 10, // Adjust blur amount
              gradient: const LinearGradient(
                colors: [
                  Color(0x30FBA91C),
                  Color(0x20E05688),
                ],
              ),
              child: const Center(
                child: Text(
                  'BlurBox!',
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 30,
            left: 30,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExampleTwo(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_back_ios_rounded),
              label: const Text('Go to ExampleTwo'),
            ),
          ),
        ],
      ),
    );
  }
}

class ExampleTwo extends StatelessWidget {
  const ExampleTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BlurBox Example'),
      ),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/test.png'),
            ),
          ),
        ),
        const AnimatedBlurBox(
          duration: Duration(milliseconds: 1000),
          child: Center(
              child: Text(
            'Blur Background!',
            style: TextStyle(fontSize: 24.0),
          )),
        ),
      ]),
    );
  }
}
