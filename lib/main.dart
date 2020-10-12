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

  @override
  void initState() {
    super.initState();

    this.status = 0;
    this.color = Colors.blue;
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
            child: Column(
              children: [
                TweenAnimationBuilder(
                  tween: ColorTween(begin: Colors.white, end: this.color),
                  duration: const Duration(milliseconds: 500),
                  builder: (context, value, child) {
                    return ColorFiltered(
                      colorFilter: ColorFilter.mode(value, BlendMode.modulate),
                      child: child,
                    );
                  },
                  child: Image.asset("assets/flutter_logo.png"),
                ),
                Text("color white to red"),
                Slider.adaptive(
                  value: status,
                  onChanged: (value) {
                    setState(() {
                      status = value;
                      color = Color.lerp(Colors.blue, Colors.green, value);
                    });
                  },
                ),
                Text("Size"),
              ],
            ),
          ),
        ));
  }
}
