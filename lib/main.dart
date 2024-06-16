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
    // binarySearch([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 2);
    // selectionSort([4, 5, 3, 2, 6, 1]);
    // factorial(5);
    print(quicksort([1, 5, 10, 25, 16, 1])); // => [1, 1, 5, 10, 16, 25];
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

  // loop sum

  int sum(List<int> list) {
    var total = 0;
    for (var element in list) {
      total += element;
    }
    return total;
  }

  // recursive sum

  int sumRecusive(List<int> list) {
    if (list.isEmpty) {
      return 0;
    }
    var tempArray = list;
    tempArray.removeAt(0);
    return list[0] + sumRecusive(tempArray);
  }

  // recursive count

  int count(List<int> list) {
    if (list.isEmpty) {
      return 0;
    }
    var tempArray = list;
    tempArray.removeAt(0);
    return 1 + count(tempArray);
  }

  // recursive max

  int max(List<int> list) {
    if (list.length == 2) {
      return (list[0] > list[1]) ? list[0] : list[1];
    } else if (list.length < 2) {
      return list.first;
    }
    var tempArray = list;
    tempArray.removeAt(0);
    var subMax = max(tempArray);
    return (list[0] > subMax) ? list[0] : subMax;
  }

// quicksort

  List<int> quicksort(List<int> list) {
    if (list.length < 2) {
      return list;
    } else {
      var pivot = list[0];
      var less = list.where((element) => element < pivot).toList();
      var equal = list.where((element) => element == pivot).toList();
      var greater = list.where((element) => element > pivot).toList();
      return quicksort(less) + equal + quicksort(greater);
    }
  }

  printHashBook() {
    Map<String, double> book = {};
    book["apple"] = 0.67;
    book["milk"] = 1.49;
    book["avacado"] = 1.49;
    debugPrint(book.toString());
  }

// // Qustion: Why is "apple" is 0.67000000000000004 instead of 0.67?
// // Answer: Double cannot store the value 0.67 exactly. Swift uses (like many other languages) binary floating point numbers according to the IEEE 754 standard.
// // This topic is not related to Algorithms, but you can play with .description and .debugDescription for making workarounds
// print(book["apple"]?.description ?? "Not exist") // => 0.67
// print(book["apple"]?.debugDescription ?? "Not exist") // => 0.67000000000000004

  printHashVoter() {
    Map<String, bool> voter = {};

    checkVoter(String name) {
      if (voter[name] != null) {
        debugPrint("kick them out!");
      } else {
        voter[name] = true;
        debugPrint("let them vote!");
      }
    }

    checkVoter("tom");
    checkVoter("mike");
    checkVoter("mike");
  }
}
