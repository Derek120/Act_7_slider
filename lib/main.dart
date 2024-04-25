import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "Flutter Demo Home Page"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imgList = [
    "https://raw.githubusercontent.com/Derek120/img_IOS/main/flutterflowA12/m14.jpg",
    "https://raw.githubusercontent.com/Derek120/img_IOS/main/flutterflowA12/m13.jpg",
    "https://raw.githubusercontent.com/Derek120/img_IOS/main/flutterflowA12/m12.jpg",
    "https://raw.githubusercontent.com/Derek120/img_IOS/main/flutterflowA12/m11.jpg",
    "https://raw.githubusercontent.com/Derek120/img_IOS/main/flutterflowA12/m10.jpg",
    "https://raw.githubusercontent.com/Derek120/img_IOS/main/flutterflowA12/m1.jpg",
  ];

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            CarouselSlider(
              items: imgList
                  .map((e) => Center(
                        child: Center(
                          child: Image.network(e),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  autoPlayInterval: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: (value, _) {
                    setState(() {
                      _currentPage = value;
                    });
                  }),
            ),
            buildCarouselIndicator()
          ],
        ),
      ),
    );
  }

  buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < imgList.length; i++)
          Container(
            margin: const EdgeInsets.all(5),
            height: i == _currentPage ? 7 : 5,
            width: i == _currentPage ? 7 : 5,
            decoration: BoxDecoration(
                color: i == _currentPage ? Colors.black : Colors.red,
                shape: BoxShape.circle),
          )
      ],
    );
  }
}
