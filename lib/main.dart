import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double status;
  Color color;

  double sizeStart, sizeEnd, size;

  @override
  void initState() {
    super.initState();

    this.status = 0;
    this.color = Colors.blue;

    this.size = 0;
    this.sizeStart = 0;
    this.sizeEnd = 500;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          height: double.infinity,
          color: Colors.grey[40],
          child: Center(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Center(
                  child: TweenAnimationBuilder(
                    tween: ColorTween(begin: Colors.white, end: this.color),
                    duration: const Duration(milliseconds: 500),
                    builder: (context, value, child) {
                      return ColorFiltered(
                        colorFilter:
                            ColorFilter.mode(value, BlendMode.modulate),
                        child: child,
                      );
                    },
                    child: TweenAnimationBuilder(
                      tween: SizeTween(
                          begin: Size(100, 100),
                          end: Size(
                              100 +
                                  ((this.sizeEnd - this.sizeStart) * this.size),
                              100 +
                                  ((this.sizeEnd - this.sizeStart) *
                                      this.size))),
                      builder: (context, valueSize, child) {
                        return Container(
                          width: valueSize.width,
                          height: valueSize.height,
                          child: child,
                        );
                      },
                      child: Image.asset("assets/flutter_logo.png"),
                      duration: Duration(
                        milliseconds: 200,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Column(
                    children: [
                      Text("color white to red"),
                      Slider.adaptive(
                        value: status,
                        onChanged: (value) {
                          setState(() {
                            status = value;
                            color =
                                Color.lerp(Colors.blue, Colors.green, value);
                          });
                        },
                      ),
                      Text("Size"),
                      Slider.adaptive(
                        value: this.size,
                        onChanged: (value) {
                          setState(() {
                            this.size = value;
                          });
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
