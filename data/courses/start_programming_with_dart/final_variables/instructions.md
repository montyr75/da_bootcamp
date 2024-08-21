# Final Variables

It's a best practice in Dart to mark any variable that should not have its value altered after initialization as `final`. Hold the phone! That sounds a lot like using `const`, doesn't it? As a matter of fact, it is similar, but there are some key differences.

## Using Constants

Let's look at an example before we dig into the details of the difference between constants and finals:

```dart
void main() {
  const String firstName = "Ashton";
  const String lastName = "Kutcher";
  const String name = "$firstName $lastName";

  print(name);
}
```

In the example, `name` can be declared as `const` only because both `firstName` and `lastName` are also `const`. The string interpolation is actually done at compile time here. Essentially, even before running the code, Dart will put the name together for you, so it'll be exactly as if you'd written this yourself:

```dart
const String name = "Ashton Kutcher";
```

Now, consider this modified version:

```dart
void main() {
  String firstName = "Ashton";
  String lastName = "Kutcher";
  const String name = "$firstName $lastName";

  print(name);
}
```

The first two are no longer constants at all. They're variables. You might be asking your program's user for his first and last name, and in that case, you'd store the user's responses in variables, as they wouldn't be eligible to be constants. Constants must be known before the code executes. This code will not run, since you're asking Dart to construct the `name` constant from string data that doesn't exist until the code executes. Variables are not initialized until runtime, as opposed to compile time.

## Using Final Variables

To fix the errors, we might do something like this:

```dart
void main() {
  String firstName = "Ashton";
  String lastName = "Kutcher";
  final String name = "$firstName $lastName";

  print(name);
}
```

This code works! The `final` keyword tells Dart that we want to create a normal variable, but we don't want it to be modified after it receives an initial value. With this code, `firstName` and `lastName` could come from the user at runtime, then `name` would be created from those variables' values, also at runtime. We get one of the benefits of constants (immutability), but using variables instead.

## What's the Point?

You may be wondering why all this fuss about mutability. When a variable's value can be changed (mutated) anywhere within its scope, all the code in that scope is suspect when the value ends up being something unexpected. That may or may not be a lot of code to examine to track down a bug. If you know that a variable's value should never change, it's best to let Dart help you prevent it. Then if the value isn't what it should be, there's really only one place to check: where it was initialized. In other words, immutability, whether by `const` or `final`, is a tool to help you contain or even prevent bugs.

## Which One Should I Use?

When should you use `const` as opposed to `final`? The short answer is, you should always use `const` when you can. Compile-time constants perform better and use less memory, since no variable object needs to be created at runtime. In the many situations where you can't use a `const`, but you still want to protect your variable from being modified, you need `final`. If you don't know a value before you run the program, you won't be able to use `const`.

## Type Inference

Pretty often, you'll see final variables declared this way for brevity:

```dart
final age = 25;
```

It's not technically necessary to include the variable's type, `int`, here, because Dart can figure out the type by examining the value you assign. Dart knows an integer when it sees it. Don't be fooled, though. When the type is inferred in this manner, the variable is treated the same as if you'd explicitly declared its type, so if you pass `age` to a function expecting a `bool`, you're gonna have a bad time.