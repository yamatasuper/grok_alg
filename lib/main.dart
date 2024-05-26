import 'dart:core';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Algoritms',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _incrementCounter() {
    binarySearch([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 2);
    selectionSort([4, 5, 3, 2, 6, 1]);
  }

  int? binarySearch(List<int> items, int item) {
    var min = 0;
    var max = items.length + 1;
    while (min <= max) {
      var mid = (min + max) / 2;
      var guess = items[mid.toInt()];
      debugPrint("while $guess");
      if (guess == item) {
        debugPrint("guess == item $guess");
        return mid.toInt();
      }
      if (guess > item) {
        max = mid.toInt();
        debugPrint("> $max");
      } else {
        min = mid.toInt();
        debugPrint("< $min");
      }
    }
    return null;
  }

  int getSmallest(List<int> items) {
    var smallest = items[0];
    var index = 0;
    for (var i = 0; i < items.length; i++) {
      if (items[i] < smallest) {
        smallest = items[i];
        index = i;
        debugPrint("getSmallest $index");
      }
    }
    return index;
  }

  List<int> selectionSort(List<int> items) {
    List<int> sortedArray = [];
    int originalLength = items.length;
    for (var i = 0; i < originalLength; i++) {
      var smallestIndex = getSmallest(items);
      sortedArray.add(items[smallestIndex]);
      items.removeAt(smallestIndex);
    }
    debugPrint("sortedArray $sortedArray");
    return sortedArray;
  }
}