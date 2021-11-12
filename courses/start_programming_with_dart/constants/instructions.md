Sometimes you may find it convenient to access a particular value by a descriptive name, especially when you may need to refer to that value repeatedly in your code. "Wait," you say, "isn't that what variables are for?" Yes! But what if this value never varies, and in fact, should never be changed while a program is running? *Constants* are one way to accomplish this.

#### Circular Logic

Suppose you wanted to calculate the circumference of a circle (the distance around), which is something we all want to do from time to time. Two formulas exist for accomplishing this task:

```matlab
C = π ⋅ d
    or
C = 2π ⋅ r
```

To find the circumference, you can multiply the value of pi and the circle's diameter (the length of a line drawn through the circle's center), or you can multiply double the value of pi and the circle's radius (half the diameter). The value of pi is approximately 3.14, and its value is constant. That makes it a prime candidate for using Dart constants.

```dart
const num pi = 3.14;

void main() {
  print("Diameter: 6 -> Circumference: ${circumferenceFromDiameter(6)}");
  print("Radius: 3 -> Circumference: ${circumferenceFromRadius(3)}");
}

num circumferenceFromDiameter(num diameter) => pi * diameter;

num circumferenceFromRadius(num radius) => (2 * pi) * radius;
```

At the top, we define a constant with the `const` keyword. This one is of type `num` (an `int` or `double` value). It's appropriately named `pi`, and it's given a value of `3.14`. Now, whenever we need to use pi in a calculation, we can do so using its name. As a bonus, if we ever wanted to increase the precision of the calculations, we could add more digits to `pi`'s value, and the rest of the code would continue to operate correctly without changes:

```dart
const num pi = 3.14159;
```

There are two arrow functions to perform the actual calculations, and the `main()` function prints the results. Simple, right? Easy as pie...

#### Using Dart's Pi Constant

Of course, the Dart core libraries already include a fairly precise `pi` constant that you can use:

```dart
import 'dart:math';

void main() {
  print("Pi: $pi");
  print("Diameter: 6 -> Circumference: ${circumferenceFromDiameter(6)}");
  print("Radius: 3 -> Circumference: ${circumferenceFromRadius(3)}");
}

num circumferenceFromDiameter(num diameter) => pi * diameter;

num circumferenceFromRadius(num radius) => (2 * pi) * radius;
```

Future lessons will go into more detail about importing code libraries, but for now, just note that `import 'dart:math`;' gives your code access to Dart's core math library, which includes the definitions of many handy constants and functions related to mathematics. Even though we've removed our constant `pi` from the code, we can continue to use `pi`, because it is defined in `dart:math`.

#### Convert Month Number to Month Name

Let's try a more interesting example and write a function that will take a month's numeric representation as input and return that month's full name. One way to accomplish this would be to create a list of the months. A Dart `List` automatically assigns each element a numeric index that we can use to look up the names:

```dart
const List<String> months = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];

void main() {
  print("Month 6: ${monthName(6)}");
}

String monthName(int monthNumber) {
  assert(monthNumber >= 1 && monthNumber <= 12, "Out of range.");
  return months[monthNumber];
}
```

The first thing to notice here is that we can define even complex constructs like lists as constants. If any code tries to modify `months` in any way, it will fail. The other interesting thing about this code is the use of Dart's `assert()` function to help us keep the month's numeric range under control. If the user of `monthName()` passes a value that is less than 1 or greater than 12, `assert()` will throw an error, including the string "Out of range."

##### There's Just One Problem...

If you ran this code and noticed a problem, way to go! That kind of attention to detail will serve you well as a programmer. The program incorrectly reports July as the sixth month, when it should have printed June. This is because lists are zero-indexed; the first month's index is 0, not 1. To account for that, we need to use a bit of math:

```dart
String monthName(int monthNumber) {
  assert(monthNumber >= 1 && monthNumber <= 12, "Out of range.");
  return months[monthNumber - 1];
}
```

When `monthNumber` is 1, the result should be January, which is at index 0. Therefore, we need to subtract 1 from whatever comes in when accessing the list.

#### Try Everything!

Remember, you'll learn the most by tinkering with the code examples. See what happens when you pass `monthName()` an out-of-range value. Observe how circle calculations are altered when you add more digits to pi. Write your own similar geometric functions, maybe some to calculate the area or perimeter of a rectangle. You get the idea!