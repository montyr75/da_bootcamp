# Variable Scope

Now that you're compartmentalizing your code into separate blocks, it's high time we discussed how it will affect the variables you create and use. Every variable you declare has a *scope*. A variable's scope defines which parts of your code can "see" it. In most situations, you can count on curly braces being the scope border, meaning that if you define a variable between opening and closing curly braces, its scope is limited to that block of code and any blocks nested within.

## Local Variables

An example or two will help you visualize the concept:

```dart
void main() {
  String name = "Jack";
  print(name);
}
```

Here, the variable `name` is defined inside the `main()` function, between the function's opening and closing curly braces. It is a local variable to `main()`. The call to `print()` has access to `name` because it exists within that same scope.

But how about this?

```dart
void main() {
  print(name);
}

void createName() {
  String name = "Jack";
}
```

This time, `name` is created in the body of `createName()`. It's local to, and can only be accessed within, that function. If you try to access `name` in `main()`, or from any function except `createName()`, you'll find it's impossible. The variable has function scope.

### How Local Can You Go?

Variables can be scoped even more specifically than at the function level. Take a look at this example:

```dart
void main() {
  bool adult = false;
  
  if (!adult) {
    int age = 15;
  }
  
  if (age >= 21) {
    adult = true;
  }
}
```

This code doesn't make much sense, but it illustrates the point we're making. If you put that code into the code editor, you'll find you get an error in the second `if` statement. That `if` can't see `age`, because `age` was defined within the first `if` code block and is local to that block. The `adult` variable has function scope, so it can be manipulated anywhere in the function, including inside the `if` blocks.

## The Big Picture

It's also possible for variables to have a more global scope. A variable declared outside any code block is a *top-level variable*, accessible anywhere in the current file. Of course, using our interactive code editor, you only ever have a single file, so top-level variables can be accessed by all your code.

```dart
int age = 15;

void main() {
  bool adult;
  
  if (age >= 21) {
    adult = true;
  } else {
    adult = false;
  }
  
  printAgeCategory(adult);
}

void printAgeCategory(bool adult) {
  if (adult) {
    print("Adult, age $age.");
  } else {
    print("Minor, age $age.");
  }
}
```

The first thing to notice here is that `age` is accessible everywhere. It can be seen in `main()` and in `printAgeCategory()` because it's a top-level variable.

The `adult` variable is a bit more interesting. It was originally defined within the scope of `main()`, so how can it be accessed in `printAgeCategory()`? The answer is that it can't. The `printAgeCategory()` function takes a boolean parameter that happens to also be called `adult`, but it could have had any name. When `main()` calls `printAgeCategory()`, it passes the *value* of `main()`'s local `adult` variable, which is `false`. That value (the argument) gets assigned to `printAgeCategory()`'s `adult` parameter, which becomes a local variable within `printAgeCategory()`. So they are two separate variables that happen to have the same name.

Let's look at it with a name change to see if that clears things up:

```dart
int age = 15;

void main() {
  bool adult;
  
  if (age >= 21) {
    adult = true;
  } else {
    adult = false;
  }
  
  printAgeCategory(adult);
}

void printAgeCategory(bool isAdult) {
  if (isAdult) {
    print("Adult, age $age.");
  } else {
    print("Minor, age $age.");
  }
}
```

Now the function parameter is called `isAdult`, but that doesn't change how the code works. Calling `printAgeCategory(adult)` still passes whatever the current value of `main()`'s local `adult` variable is, because `adult` resolves to its value before the call to `printAgeCategory()` is made. Either `true` or `false` is sent to `printAgeCategory()` and gets assigned to that function's local variable, now named `isAdult`. Note that it was not a problem to reuse the name `adult`, and in fact it happens all the time in real-world code, but we've disambiguated it here for instructional clarity.

## Always Check the Scope

It's very important that when you read code (yours or someone else's), whenever you see a variable being accessed, take a moment to discover that variable's scope. There may be any number of variables with the same name in one program, so you need to be sure of which one you're looking at.

```dart
int age = 15;

void main() {
  int age = 30;
  
  print(age);
}
```

What does this code print? There is an `age` variable defined at the top level, and another defined as a local variable within `main()`. In this case, the output will be `30`. When Dart tries to resolve a variable, it checks the most local scope first, then expands upward. In fact, the local `age` completely obscures the top-level `age` variable inside of `main()`. There is no way to refer to the top-level version, because Dart will always assume you are trying to access the local one. In a situation like this, you would need to change the name of one of the variables to access both.