import 'package:flutter/material.dart';
import 'package:hybrid_composition_crash_demo/text_platform_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hybrid Composition Crash Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FlatButton(
          color: Colors.red,
          child: Text('Click Me'),
          onPressed: _launchHybridCompositionViewPage,
        ),
      ),
    );
  }

  void _launchHybridCompositionViewPage() {
    final body = Stack(
      fit: StackFit.expand,
      children: [
        TextPlatformView(),
        Center(child: CircularProgressIndicator()),
      ],
    );
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Scaffold(body: body)));
  }
}