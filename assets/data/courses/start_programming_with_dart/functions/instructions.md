# Functions

You may remember the concept of functions from your math class. In math, a function is a construct that relates an input to an output. What comes out is related to what goes in. The classic way of writing a math function is `f(x)`. When `f(x) = 2x`, what you're saying is that the function, called `f`, takes an input, `x`, and doubles it, producing an output. So if `x = 4`, then you'd have `f(4) = 8`. The `4` goes in, it's multiplied by 2, and the output is `8`.

## What Are Functions in Dart?

Now, if you don't remember math functions fondly, or you've never encountered the concept at all, fear not! We will show you everything you need to know right here.

Functions in Dart are sometimes used to produce a certain output given a particular input, but many of them are simpler than that, acting as nothing more than reusable code blocks, or *procedures*. They are one of the basic units for organizing code in a program. When programs get lengthy, functions help you keep things clean and readable, and they keep you from repeating yourself all the time.

### What Do They Look Like?

If you've completed the earlier lessons, you've already seen and used several functions. All Dart programs begin execution with the `main()` function:

```dart
void main() {
  // code for the main() function goes here
}
```

By now, you've also made extensive use of the `print()` function:

```dart
print("Print me!");
```

The `print()` function takes a string as input, and it prints the characters to the system console. (Technically, the `print()` function takes an Object type as input, which is then converted into a String, but we'll get into those details later.) Putting characters on the screen involves the use of many lower-level instructions, helpfully written for you by the good people at Google. Your program would be an unreadable mess if you had to type out all of those instructions every time you wanted to push a message to the console. When you call the `print()` function, you use one line of code to execute many others, and you can do so again and again. You will create your own functions for much the same purpose.

> You will discover that Google employees and Dart community members have written lots of useful functions and made them available for free as *open source* code. A big part of mastering a programming language is becoming familiar with all the tools and code written by others for your use.

### An Example

You might find that you need to print a greeting to the console with some regularity. Your program is both chatty and overly friendly, if not a bit promiscuous, so you create a function that looks like this:

```dart
void greet() {
  print("Hi!");
}
```

Now, whenever it's time to issue a salutation, you can execute this function:

```dart
greet();
```

In this simple case, encapsulating your greeting in a function hasn't saved you a lot of typing, but there are other important benefits. For instance, what if you later realized that the exclamation point in "Hi!" made you sound too eager, or perhaps your program found itself in a more formal setting? If you have 30 greetings scattered throughout your code, changing each and every one of those to print a new string would be laborious, but if all those greetings make use of the `greet()` function, changing the string in that one place is all you'll need to do:

```dart
void greet() {
  print("Hello.");
}
```

Now, every call to `greet()` will produce the string "Hello." instead of "Hi!"

## Where Do I Put My Functions?

For now, your custom functions can live alongside the required `main()` function. Later, when you've graduated beyond our simple coding environment, you'll sometimes group functions in different files.

Try this code in the code editor:

```dart
void main() {
  greet();
}

void greet() {
  print("Hi!");
}
```

When you run it, you should see the string "Hi!" appear in the console. The program begins by executing `main()`, and the only instruction in `main()` calls your custom function `greet()`, which causes your greeting to appear on screen.

## Function Anatomy

Earlier, we said that functions can take input and produce output. Strictly speaking, the `greet()` function does neither. It's a procedure, existing only for convenience and to group commonly used actions.

### Into the Void

When you place the keyword `void` before the name of a function you're defining, you're saying you don't intend for the function to produce any output, or in programming parlance, it has no *return value*.

### The Name Game

The next part of your function definition is the function's name, `greet`. This name can be any valid identifier, which is a word that starts with either a letter or an underscore (`_`), followed by any combination of letters, numbers, and underscores. For now, don't start one with an underscore, as that means something special in Dart, to be discussed later.

By convention, function names use *lower camel case*. This means you should capitalize the first letter of each word in the identifier, *except* the first, which is always lowercase. Example: `myFavoriteFunction()`.

### Parenthetically Speaking

The `greet()` function has an empty set of parentheses because it takes no input. In later lessons, you'll pass values as input in the form of a list of *function parameters*.

## Play Time!

Try changing the greeting string. Run the `greet()` function multiple times within `main()`. Write another simple function and execute it. Remember, you can execute your functions from inside of `main()` or from within any other custom function. Functions can call functions that call functions...ad infinitum.