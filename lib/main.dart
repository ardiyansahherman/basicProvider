import 'package:flutter/material.dart';
import 'package:learn_provider/provider/aplication_color.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<ApplicationColor>(
        create: (BuildContext context) => ApplicationColor(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Consumer<ApplicationColor>(
              builder: (context, value, _) => Text(
                "StateM Provider",
                style: TextStyle(color: value.color),
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<ApplicationColor>(
                  builder: (context, value, _) => AnimatedContainer(
                    margin: const EdgeInsets.all(5),
                    width: 100,
                    height: 100,
                    color: value.color,
                    duration: const Duration(milliseconds: 500),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("AB"),
                    Consumer<ApplicationColor>(
                      builder: (context, valuecolor, _) => Switch(
                        value: valuecolor.isLightBlue,
                        onChanged: (value) {
                          valuecolor.isLightBlue = value;
                        },
                      ),
                    ),
                    const Text("LB"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
