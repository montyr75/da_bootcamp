# Variables

Variables are a basic building block of most modern programs. In short, a variable is an alias for a computer memory location, at which something of interest will be stored. Whatever is stored there is said to be the variable's value. If you've studied the basics of algebra, you might remember variables mostly as single-letter stand-ins for numbers that helped you conceptualize and solve complex equations. Dart's variables are similar but not exactly the same, as they're capable of standing in for all kinds of values: numbers, strings of characters, or even more complex structures representing people, economic transactions, or geographic locations.

## There's Nothing There
To start simply, enter the following program into the editor and run it:

```dart
void main() {
  var x;
  print(x);
}
```

The first line of `main()` declares a variable called `x` using Dart's `var` keyword. When this line is executed, Dart sets aside a place in memory for a value, and you can later make use of that value by its name, `x`. In this case, you send the value to the `print()` function in order to see it printed to your system console.

Variables declared with the `var` keyword in Dart are initially given the special value of `null`. This means the variable is uninitialized. It has no value. Even 0 (zero) would be a value, but `null` really is, in programming terms, _nothing_. This is why you see `null` in the console when you print the value of `x`.

You may have noticed that the Dart code analyzer has underlined `x`, and there is a warning message attached: "Prefer typing uninitialized variables and fields." We'll address that in the next section by turning the uninitialized variable into an initialized one. Typing variables will be discussed further in the next lesson.

## Initialize
As `null` is not a very useful value for your variable, try initializing it with a numeric value, like so:

```dart
void main() {
  var x = 5;
  print(x);
}
```

Unlike in algebra class, the `=` operator in Dart does not strictly represent equivalence. It's known as the assignment operator, so `x = 5` is an expression instructing the computer to assign the value `5` to a memory location named `x`. Then, when you print `x`, the result is `5`.

Now that you're initializing the `x` variable with a value, the Dart analyzer can *infer* the variable's type from the type of the value, in this case an *integer* (a whole number). Dart uses variable type information to help you avoid errors in your code. In later lessons, you'll learn how to explicitly type your variables to better declare your intentions.

## Printing "x"
What if you were actually trying to print the letter X to the screen? You could do that this way:

```dart
void main() {
  var x = 5;
  print("x");
}
```

With quotes around the X, the computer will now interpret it as the character X, instead of looking for a variable with the name `x`. This means you're now creating a variable and assigning in the value `5` uselessly. The analyzer will become annoyed by this code, informing you that you've declared a variable that you're not using.

## Does Not Compute
Try removing the quotes once again, and also remove the line declaring and initializing the `x` variable:

```dart
void main() {
  print(x);
}
```

With the quotes gone, Dart believes you're referring to a variable called `x`, and it dutifully looks for it to try and print out its value for you. It quickly notices that you've never declared such a variable, and it helpfully lets you know with an error message. You cannot successfully execute code that has errors.

## Just Print the Number
You might now be thinking to yourself, "If I want to print a 5, couldn't I just do this?"

```dart
void main() {
  print(5);
}
```

Yes! This would also work, but in a slightly different way, discussed later:

```dart
void main() {
  print("5");
}
```

## What's Next?
In upcoming lessons, you'll see the point of using variables in the first place. For now, just take my word for it that the concept is fundamental to making a computer do much of anything.

> **Note:** This gets more complicated later, but for now, you should assume that Dart reads code the same way you do: top-to-bottom and left-to-right. So the first line of code is executed first, the second next, and so on, and each line is read and executed starting from the left and proceeding right. Obviously, this assumes you come from a western culture.