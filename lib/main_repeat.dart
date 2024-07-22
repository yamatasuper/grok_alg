import 'dart:core';

import 'package:flutter/material.dart';

class MyAppRepeat extends StatelessWidget {
  const MyAppRepeat({super.key});
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
    List<int> numbers = [4, 2, 1, 4, 5, 3, 8, 9, 12, 11, 13, 15, 14, 16];
    // debugPrint('binarySearch ${binarySearch(numbers, 16)}');

    // debugPrint('getSmallestIndex ${getSmallestIndex(numbers)}');

    // debugPrint('selectionSort ${selectionSort(numbers)}');

    // debugPrint('factorial ${factorial(5)}');

    // debugPrint('quicksort ${quicksort(numbers)}');
  }

  // int? binarySearch(List<int> numbers, int selected) {
  //   int min = 0;
  //   int max = numbers.length - 1;

  //   while (min <= max) {
  //     double mid = (min + max) / 2;
  //     int guess = numbers[mid.toInt()];

  //     debugPrint("while $guess");

  //     if (guess == selected) {
  //       return guess;
  //     }

  //     if (guess > selected) {
  //       max = mid.toInt() - 1;
  //     }

  //     if (guess < selected) {
  //       min = mid.toInt() + 1;
  //     }
  //   }

  //   return null;
  // }

  // int getSmallestIndex(List<int> numbers) {
  //   int smallestNumber = numbers[0];
  //   int smallestIndex = 0;

  //   for (var i = 0; i < numbers.length; i++) {
  //     if (numbers[i] < smallestNumber) {
  //       smallestNumber = numbers[i];
  //       smallestIndex = i;
  //     }
  //   }
  //   return smallestIndex;
  // }

  // List<int> selectionSort(List<int> numbers) {
  //   List<int> sortedArray = [];
  //   int originalLength = numbers.length;
  //   for (var i = 0; i < originalLength; i++) {
  //     int smallestIndex = getSmallestIndex(numbers);
  //     sortedArray.add(numbers[smallestIndex]);
  //     numbers.removeAt(smallestIndex);
  //   }
  //   debugPrint("sortedArray $sortedArray");
  //   return sortedArray;
  // }

  // int factorial(int x) {
  //   if (x == 1) {
  //     return x;
  //   } else {
  //     return x * factorial(x - 1);
  //   }
  // }

  // List<int> quicksort(List<int> list) {
  //   if (list.length < 2) {
  //     return list;
  //   } else {
  //     var pivot = list[0];
  //     var min = list.where((element) => element < pivot).toList();
  //     var mid = list.where((element) => element == pivot).toList();
  //     var max = list.where((element) => element > pivot).toList();
  //     return quicksort(min) + mid + quicksort(max);
  //   }
  // }
}
