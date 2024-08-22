# Function Parameters

Sometimes a function needs input in order to do its job. In earlier lessons, we examined a function called `greet()` that looked like this:

```dart
void greet() {
  print("Hi!");
}
```

The `greet()` function always prints "Hi" to the console, and it doesn't require any special information to do so. This is why the function's parentheses are empty. It is not prepared to accept any kind of input. Many functions can be made more useful by allowing for some kind of input. As an example, look at the call to `print()`; if you were not able to provide that call with a string, what would it print to the screen? The `print()` function is useful to you, again and again, because you can tell it *what* to print each time you use it. When you want your own functions to accept input, you'll use *function parameters*.

## How Do I Use Function Parameters?

So glad you asked! As previously mentioned, the `greet()` function has no parameters because it is expecting no input. Let's enhance that function to greet someone (or something) different each time it's executed:

```dart
void greet(String recipient) {
  print("Hi!");
}
```

Now it's possible to send a value to `greet()` when it's called. In fact, if you do, it will look a lot like calling `print()`, because now your function is expecting exactly one string value, just like `print()`:

```dart
greet("Joe");
```

Calling `greet()` like that will cause the variable `recipient` to contain the value "Joe". "Joe" is an *argument* being passed to `greet()`. Within the body of `greet()`, it's possible to use that value to customize the greeting. Enter the following code into the editor to try it out:

```dart
void main() {
  greet("Joe");
  greet("Fred");
}

void greet(String recipient) {
  print("Hi, $recipient!");
}
```

In this example, `recipient` is the parameter. It becomes a *local variable*, accessible only within the body of the `greet()` function, and it is assigned whatever argument is provided in the function call.

In its new form, the body of the `greet()` function uses string interpolation to greet "Joe", or whomever/whatever you desire.

## Sign Here

When you define a function, the return type, name, and parameter list make up that function's *signature*. A function's signature is like a contract, specifying what's expected when that function gets used. The parameter list tells the user how many values are expected, including what their types should be, and in what order they should be provided. If you invoke the function with a mismatched bunch of arguments, you are in violation of the contract.

Now that `greet()`'s definition includes that parameter, the Dart analyzer will become angry if you try to call the function without providing the expected arguments, in this case precisely one value of type String. Go ahead and try to call it the old way, with empty parentheses, and you'll see an error pop up.

## More Parameters

Functions can also accept more than one value as input:

```dart
void main() {
  sum(5, 10);
}

void sum(int a, int b) {
  print(a + b);
}
```

Here, the `sum()` function's signature includes two integer parameters, separated by commas. When you call the function, you provide all the required arguments within the parentheses, also separated by commas. As with English, the convention is to insert a space after each comma, though Dart doesn't care if you leave it out.

Within `sum()`, you can access the provided values as variables `a` and `b`. The function adds the two together and prints the result. Try it!

### Parameter vs. Argument Review

In the `sum()` example, `a` and `b` are the function's parameters. Arguments are the values provided when the function is invoked (`sum(5, 10);`). So `5` and `10` are the arguments in this example. You may occasionally hear the terms used interchangeably, because context usually makes it clear what the intended meaning is, but if you want to get technical (and as a programmer, you do), the terms are distinct.

## Mixed Types

A function can take any number of arguments of any valid type. Try a more complicated example:

```dart
void main() {
  repeatPrint("Hello!", 10);
}

void repeatPrint(String str, int repetitions) {
  for (int i = 0; i < repetitions; i++) {
    print(str);
  }
}
```

The `repeatPrint()` function expects a string to print and a number representing how many times to print it. The `for` loop will print the value of `str` as many times as indicated by the `repetitions` argument. Passing "Hello!" and `10` as arguments will result in a tower of greetings in your console.

## Your Turn!

Spend some time experimenting with your own functions. Vary the number and types of parameters. Take a look at earlier lessons to see if any of those examples could have made use of custom functions to become cleaner, better compartmentalized.