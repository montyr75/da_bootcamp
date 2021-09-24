Now it's time to discuss the variable type with the funny name: `bool`. Like so many things with silly monikers, this one is named after a man. George Boole was an English mathematician, educator, philosopher, and logician. He's best known for his creation of Boolean algebra, a branch of algebra in which the value of variables is always _true_ or _false_.

Normally, a true value is denoted as the integer 1, while a false value is 0. Some programming languages actually use 1 and 0 for these values, but higher-level languages often support boolean values directly in the language as `true` and `false`, which is more convenient for coders. Dart is such a language.

#### What's True is True
In the previous lesson, you were introduced to the basics of `if` statements and making decisions. Here, we will examine the logic behind those constructs more formally.

```dart
void main() {
  if (true) {
    print("It's true!");
  } else {
    print("It's not true. (It's false.)");
  }
}
```

When you enter that code, DartPad will underline the `else` code block to let you know that it's _dead code_, code that can never be reached or executed. This is because the `if` statement is evaluating a very simple boolean expression, the value `true` itself. Since `true` will never be `false`, the `else` block can never be run.

#### What's Not True is False
Try it this way:

```dart
if (!true) {
  print("It's true!");
} else {
  print("It's not true. (It's false.)");
}
```

The `!` operator, called "not" or sometimes "bang", _negates_ a boolean value, essentially reversing it. The expression `!true` (not true) evaluates to `false`, and `!false` is equivalent to `true`. Since the `if` statement's boolean expression resolves to `false`, the `else` block is executed. Once again, the Dart analyzer lets you know that some of your code will never execute, marking it as dead code.

But what about this?

```dart
if (5 > 3) {
  print("It's true!");
} else {
  print("It's not true. (It's false.)");
}
```

Interestingly, DartPad isn't quite bright enough to recognize that the second call to `print()` is dead code here, because unlike with the simple values `true` or `!true`, the analyzer does not know ahead of time what a more complex expression will yield until it's evaluated.

#### Only `true` is True
Will this work?

```dart
void main() {
  if (1) {
    print("It's true!");
  }
}
```

It was mentioned that some languages equate 1 and `true`. Dart is not one of them. In Dart, to keep things simple, only `true` is true. That might seem self-evident, but anyone who's used a more confounding language (JavaScript, anyone?) will know that lots of things can be true, and lots of other things can be false, and memorizing how it all works can be a challenge.

With Dart, this code produces a warning that an `if` statement isn't happy with anything that doesn't resolve to a boolean value. This code will not execute.

#### Boolean Variables
Most of the time, you won't ask an `if` statement to test whether `true` is true. There will be a bit more mystery to it, the tested value encased within a variable:

```dart
void main() {
  bool b = true;
  
  if (b) {
    print("It's true!");
  } else {
    print("It's not true. (It's false.)");
  }
}
```

Hopefully at this point, you can predict the outcome of the test. The variable `b` resolves to `true` when evaluated in this case.

Try changing the value:

    bool b = false;

Yep. Now the `else` happens.

Try using the `!` operator to alter the results, both when `b` is initialized to `true` and when it's `false`. As with so many things in life, playing with it is how you learn what you like.

#### Uninitialized
What if you've forgotten to set your boolean variable? Or maybe you just haven't gotten around to it yet.

```dart
void main() {
  bool b;
  
  if (b) {
    print("It's true!");
  } else {
    print("It's not true. (It's false.)");
  }
}
```

This example will produce an error, because a `bool` variable cannot be `null`, so Dart cannot auto-initialize it with that value. At the point of the `if` statement, `b` has no value at all, not even `null`. The variable essentially doesn't exist, so it cannot be evaluated as a boolean expression.

You could make the variable nullable by changing its type to `bool?`:

```dart
void main() {
  bool? b;

  if (b) {
    print("It's true!");
  } else {
    print("It's not true. (It's false.)");
  }
}
```

Like all uninitialized nullable variables, `b` will default to the value `null`. A `null` value is not true, because it's not `true`, but nor is it `false`. The value `null` cannot be resolved as a boolean expression, so this code still does not work.

#### Toggling
It can be useful in a number of situations to toggle a boolean variable to its complement, even when you don't know its current value. If you had a button that could turn a light on and off, each press of the button would simply set the light to the opposite of the state it was in at the time of the press.

```dart
void main() {
  bool isLightOn = false;
  print(isLightOn);
  
  // someone presses the button
  isLightOn = !isLightOn;
  print(isLightOn); 

  // someone presses the button again
  isLightOn = !isLightOn;
  print(isLightOn); 
}
```

You can use the `!` operator to set a boolean variable to the opposite of itself, toggling it back and forth between two values. Cool trick!

> **Notes on naming stuff:** When a variable in Dart has a name comprised of more than one word, it's customary to use _camel case_. If your variable will reflect whether or not a light is on, you might use `isLightOn` as the name. Spaces are not allowed in variable names, so capital letters are used to differentiate the separate words, producing "camel humps" in the string of characters. Other examples might be `userInput`, `mySuperCoolVariable`, or `lessonTitle`.
>
> It's common in Dart to start boolean variable names with words like "is" or "has", since that makes them easier to read in an `if` statement. You might see code like `if (isLightOn)` or `if (hasWeapon)`.

You can also use the `!` operator to test if a variable is not true, like so:

```dart
void main() {
  bool isLightOn = false;
  print(isLightOn);

  if (!isLightOn) {
    print("I can't see!");
  }
}
```

Here, you might read the `if` statement as, "If not is light on..." Admittedly, that's somewhat awkward English, but sensible enough to be useful in comprehending the code's purpose (testing whether the light is off). Since `isLightOn` is initialized to `false`, the `if` statement's boolean expression resolves to its opposite, `true`. This allows the `if` code block to execute.

#### Anything Else?

Yes! Much more. In fact, Boolean logic is so important in the world of coding, the next lesson will keep the boolean party rolling. Huzzah!