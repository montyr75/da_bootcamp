Variables in Dart come in many different types. Some variables are meant to hold numbers, some characters, and some point to more complex values. When declaring variables, you can allow Dart to attempt to infer your variable's intended type or you can be explicit.

#### Inferred Types
In the last lesson, you declared your variables using the `var` keyword (short for "variable"), like this:

```dart
var x;
```

When you declare a variable using `var`, Dart tries to infer the variable's type. If you don't initialize the new variable with a value in the same statement as the declaration, Dart has nothing on which to base an inference, so the variable is considered to be of type `dynamic`. As a dynamic variable, `x` is able to accept values of any valid type. If you don't initialize a dynamic variable with a value, it is automatically initialized with the special value of `null`.

#### Mixing it Up
In this example, a variable called `x` is declared but not initialized with a value, so it starts out with a value of `null`. The variable's type in this instance is `dynamic`, which means it can contain values of any type, so code like this wouldn't be a problem:

```dart
var x;
x = 5;
x = "Dart is great.";
```

The code declares `x`, then instructs Dart to store a value of `5` at the memory location aliased as `x`. That value is an _integer_, a whole number with no fractional part. The next line assigns the value `"Dart is great."`, a string of characters, to `x`. That's a versatile variable.

#### Disappearing Number Trick
Try out this code:

```dart
void main() {
  var x;
  x = 5;
  x = "Dart is great.";
  print(x);
}
```

Can you predict what will be printed? If you run the code, you'll see that "Dart is great." appears in the console. What happened to the `5`? After `x` was declared, it was assigned the value `5`. The `5` replaced the initial `null` value. The next instruction assigns a string of characters to `x`, obliterating the numeric value. Since `x` is of type `dynamic`, the code analyzer does not flag the potential issue.

Modify the code to print the variable's value after each assignment to see the action one step at a time:

```dart
void main() {
  var x;
  print(x);
  x = 5;
  print(x);
  x = "Dart is great.";
  print(x);
}
```

Most often when we create variables, we have a particular type of value in mind for it, which means assigning values of different types to that variable is likely unintentional, and may produce unintended results. For instance, if you create a variable intended to store the cost of an item (a number), you probably don't want to later store someone's name in there, and if you accidentally did so, it may produce an error. Later, you'll see how Dart's code analyzer can help us avoid this kind of problem.

#### You Can't Do That
Modify the code to look like this:

```dart
void main() {
  var x = 5;
  x = "Dart is great.";
  print(x);
}
```

This code causes DartPad to display an error, saying that you're mixing types. Because you've initialized `x` with an integer number value at the same time you declared it, Dart infers that `x` is supposed to hold integers from that point on. Now `x` is of type `int` instead of `dynamic`, even though it was declared with the generic keyword `var`.

You can override Dart's inference by specifying that you want your variable to be dynamic. Try changing the declaration to look like this and see the error disappear:

```dart
dynamic x = 5;
```

Or you could explicitly declare and initialize `x` as an `int`, which is probably the best option under most circumstances:

```dart
int x = 5;
```

Using the `int` keyword, you've created a variable explicitly meant to hold integers, so if you later try to assign a string of characters to it (a `String` type), Dart complains. The error is back. The analyzer is just trying to keep you from shooting yourself in the foot.

#### Errors Stop Execution
Note that if you run the code with mismatched types, execution will fail. You should always eliminate all reported errors before attempting to run your code.

#### Why Use Explicit Types?
Dart was perfectly happy to let you assign any value to your variable without errors when you declared `x` to be of type `dynamic`, so why would you restrict yourself with more specific types? The language has a sound type system that's designed to help you find problems before running your code. If you intend to use `x` to hold integer values, like grid coordinates maybe, then it's probably a mistake to assign it a string of characters. When you use explicit type annotations such as `int`, Dart can help you catch these kinds of problems before they become run-time errors&mdash;bugs.

#### The Fix is In
To fix things up, try this:

```dart
void main() {
  String x = "Dart is great.";
  print(x);
}
```

Now that `x` is explicitly declared to be of type `String`, DartPad is happy, secure in the assumption that you know what you're doing. In this example, you could also have used `var` and allowed Dart to infer the `String` type from the initialization value.

> **Hey! Why is `int` lowercase, but `String` is capitalized?** This may seem like a plot to make things more confusing for you than they need to be, but really the reason lies in the way programming languages have evolved over time. Dart was built to be familiar to those coming from other languages, like Java or C++. Unlike Dart, those languages have the concept of _primitive_ types, special types that are fundamentally supported. Primitives are typically denoted by lowercase language keywords, while complex or user-defined types are capitalized. Even though all Dart types are simply _objects_, and Dart has no primitives, the language designers opted for familiarity in this case. Don't worry about what objects are for now&mdash;we'll get into that stuff later on.

#### Fundamental Types
There is no limit to the number of types a program may have, but there are a few types that are fundamental to Dart:

<table>
  <tr>
    <th>Type</th>
    <th>Description</th>
    <th>Examples</th>
  </tr>
  <tr>
    <td>int</td>
    <td>Integer (whole number)</td>
    <td>5, -13, 0</td>
  </tr>
  <tr>
    <td>double</td>
    <td>Floating-point number (decimals)</td>
    <td>3.14, 18.0, -33.999</td>
  </tr>
  <tr>
    <td>num</td>
    <td>Integer or floating-point number</td>
    <td>5, 3.14, -13, 999.666</td>
  </tr>
  <tr>
    <td>bool</td>
    <td>Boolean</td>
    <td>true, false</td>
  </tr>
  <tr>
    <td>String</td>
    <td>String of zero or more characters</td>
    <td>"hi", "John Smith", "X", ""</td>
  </tr>
  <tr>
    <td>List</td>
    <td>List of values in series</td>
    <td>[1, 2, 3], ["one", "two", "three"]</td>
  </tr>
  <tr>
    <td>Map</td>
    <td>Map of values by key</td>
    <td>{"x": 8, "y": 16}</td>
  </tr>
  <tr>
    <td>dynamic</td>
    <td>Any type</td>
    <td></td>
  </tr>
</table>

#### `var` Recap
Remember, if you declare a variable with `var`, but don't assign a value in the same statement, Dart will assume it should be `dynamic` and assign it a value of `null` to start out. If you do initialize the value as you declare the variable, Dart will infer the type based on that value's type. So the following two lines are equivalent:

```dart
var z;

dynamic z;
```

And these are equivalent:

```dart
var y = 99;

int y = 99;
```

#### What's Next?
You haven't yet seen examples of using types like `double`, `num`, `bool`, `List`, or `Map`, but that's coming up soon.