At this point, you have functions that can take input, but your journey through the magical world of Dart functions won't be complete until you can produce output with them as well. When you place the keyword `void` at the beginning of a function definition, you're saying the function will not produce any useful output, it will not *return* a value of consequence. Technically, even `void` functions still return a `null` value, but that typically won't matter to you as a coder. You may not be surprised to learn that it's possible to declare a type other than `void` as your function's *return type*. Compare these two versions of a `sum()` function:

```dart
void sum(int a, int b) {
  int total = a + b;
  print(total);
}

int sum(int a, int b) {
  int total = a + b;
  return total;
}
```

In both versions, you first declare an integer variable called `total` and assign it the result of adding the values of `a` and `b`. Afterward, the first version prints `total`,  but the second uses the `return` keyword to indicate you'd like to output the value of `total` to the caller of the `sum()` function. The new function's signature includes `int` in place of the usual `void`, which indicates `sum()` is expected to return an integer value as its final act.

Why bother with the new version? Don't they do the same thing? Functions that return values are much more flexible, and that broadens their appeal. The user of the first `sum()` function gets an answer printed to the console every time. It can't be stopped. Using the second version allows for options. The result can be printed, discarded, saved to become part of a larger calculation, or whatever else is desired.

#### Using a Function's Return Value

Since `sum()` is not printing the result of the calculation, how will your program make use of it? Like this:

```dart
void main() {
  int answer = sum(5, 10);
  print(answer);
}

int sum(int a, int b) {
  int total = a + b;
  return total;
}
```

The first line of the `main()` function creates an integer variable called `answer` and assigns it the result of calling `sum(5, 10)`. The `sum()` function accepts the arguments `5` and `10`, adds them together, then returns the sum to the caller. Essentially, the code `sum(5, 10)` *resolves* to the return value of `sum()`, and `15` is placed into `answer`. Next, the value of `answer` is printed to the console.

#### Brevity is the Soul of Wit

To help illustrate the steps more clearly, the examples so far have created some variables that aren't strictly necessary. The code could be written more succinctly:

```dart
void main() {
  print(sum(5, 10));
}

int sum(int a, int b) {
  return a + b;
}
```

This code produces the exact same output as before, but with fewer lines. We're no longer creating the `answer` or `total` variables, since there is no need to save their values for future operations. The expression `sum(5, 10)`, when evaluated, still resolves to the integer `15`, which gets sent to the `print()` function. If that call to `print()` looks like a confusing mess of parentheses to you, trust me, you'll get used to it as your coding career progresses. That said, if you prefer to keep the long form to preserve clarity, there's certainly nothing wrong with that.

##### The Incredible Shrinking Function

Sometimes using more code is clearer, but sometimes it's just long. With very simple functions such as `sum()`, Dart allows you to reduce the verbosity even further:

```dart
int sum(int a, int b) => a + b;
```

This might look a bit esoteric at first glance, but hang in there and we'll take it apart piece by piece. First, you have a typical function signature: `int sum(int a, int b)`. Directly following the signature is the *fat arrow* syntax: `=>`. After the arrow, you are allowed only a single expression, in this case `a + b`. The result of that expression will be returned by the fat arrow function. The `return` keyword is absent but implied, and there is no need for an opening or closing brace to delimit the function's body.

As your code becomes more complex, terseness can become an asset. In this example, the advantage may not be completely obvious, but as you tackle more advanced lessons, you'll see that the designers of the Dart language included this syntax for a good reason.

If you try the code in its latest incarnation, you should find that it performs identically to earlier forms:

```dart
void main() {
  print(sum(5, 10));
}

int sum(int a, int b) => a + b;
```

#### Revisiting Grades

In an earlier lesson, you used `if` and `else if` to determine a student's letter grade based on a given score. This is an excellent example of a feature that could be nicely encapsulated into a function:

```dart
void main() {
  print("My grade: ${getGrade(81.5)}");
}

String getGrade(num score) {
  String grade;
  
  if (score >= 90) {
    grade = "A";
  } else if (score >= 80) {
    grade = "B";
  } else if (score >= 70) {
    grade = "C";
  } else if (score >= 60) {
    grade = "D";
  } else {
    grade = "F";
  }
  
  return grade;
}
```

Functions can return types other than `int`, and this one returns a `String`. With your grade calculator being a function, you can easily get a letter grade for a score repeatedly throughout a program. Without functions, you'd have to type out or copy all that code every time you wanted another grade. Since any valid Dart expression can be interpolated into a string, it's possible to make a call to `getgrade()` conveniently within the `print()` function's string argument.

#### Refactoring FTW!

Programmers spend a lot of time *refactoring* their (or someone else's) code. What does that mean? Sometimes you realize that existing code could be done better. Maybe you learned new code techniques, or maybe you became more familiar with your problem domain. It's a good habit to regularly go over old code and refactor it. This could be as simple as renaming a variable or function to better represent its role, or as involved as rearranging or rewriting whole segments to read better or run more efficiently.

Now that you've got all the basics down for writing your own functions, look back over previous lessons to see if any code could benefit from a refactor.