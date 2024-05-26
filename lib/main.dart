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
    factorial(5);
  }

  int? binarySearch(List<int> items, int item) {
    var min = 0;
    var max = items.length - 1;
    // индексы
    while (min <= max) {
      var mid = (min + max) / 2;
      var guess = items[mid.toInt()];
      debugPrint("while $guess");
      if (guess == item) {
        debugPrint("guess == item $guess");
        return mid.toInt();
      }
      if (guess > item) {
        max = mid.toInt() - 1;
        // смещение шага влево
        debugPrint("> $max");
      } else {
        min = mid.toInt() + 1;
        // смещение шага вправо
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

  int factorial(int x) {
    int factorialInt;
    // Факториал — это произведение всех натуральных чисел от 1 до данного числа
    // факториал числа 5 будет равен 1 × 2 × 3 × 4 × 5 = 120
    if (x == 1) {
      factorialInt = 1;
      debugPrint("factorial $factorialInt");
      return factorialInt;
    } else {
      factorialInt = x * factorial(x - 1);
      debugPrint("factorial $factorialInt");
      return factorialInt;
    }
  }
}
