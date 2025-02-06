import 'package:flutter/material.dart';
import 'package:incubyte_tdd_app/string_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _controller = TextEditingController();
  String sum = '';

  StringCalculator calculator = StringCalculator();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: const Text('String Calculator',
                style: TextStyle(color: Colors.white)),
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Enter numbers separated by commas or new lines:'),
                const SizedBox(height: 20),
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: '1,2,3 ....',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Add button logic here
                    add();
                  },
                  child: const Text('Add'),
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: const BoxDecoration(color: Colors.black),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Output: ",
                        style: TextStyle(color: Colors.white),
                      ),
                      Expanded(
                        child: Text(
                          sum.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  void add() {
    try {
      setState(() {
        sum = calculator.add(_controller.text).toString();
      });
    } catch (e) {
      if (e.toString().contains("Exception:")) {
        setState(() {
          // remove the "Exception:" prefix
          sum = e.toString().substring(10);
        });
      }
    }
  }
}
