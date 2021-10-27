It can often be useful to make some function parameters optional, or to require the function's caller to refer to a parameter by name for extra clarity. In this lesson, we'll explore your options regarding function parameters in more detail.

There are two types of optional parameters in Dart functions. There are *positional* optional parameters and *named* optional parameters.

#### Positional Optional Parameters

Positional parameters (optional or not) are differentiated by their order in the list of parameters, like so:

```dart
void myFunction(String param1, int param2, bool param3)
```

A call to a function with a signature like that might look something like this:

```dart
myFunction("Bob", 54, true);
```

Dart expects the function to get a String, an integer, and a boolean value, in that order. If your function call mixes up the order or leaves out any of them, the Dart analyzer will complain.

##### Make It Optional

To make these kinds of parameters optional, you use square brackets:

```dart
void myFunction([String? param1, int? param2, bool? param3])
```

All of the parameters between the brackets are considered optional. Note that we need to make the parameter types nullable with a `?` for this to work properly. Now, these would all be valid ways to call this function:

```dart
myFunction("Bob", 54, true);
myFunction("Bob", 54);
myFunction("Bob");
myFunction();
```

Any arguments not provided will be `null`, like any other uninitialized, nullable variable. Since these are positional parameters, the order still matters. You cannot call the function and pass only the integer, for instance. Though if you had to, you could preserve the order by passing `null` values like this:

```dart
myFunction(null, null, true);
```

Typically, this kind of thing should be avoided, as it makes for a cryptic function call. If you regularly need to call a function in this manner, consider using named parameters instead (discussed below).

##### Better Defaults

If `null` doesn't work well as a default for a positional optional parameter, you can add more sensible defaults to the function declaration:

```dart
void myFunction([String name = "Jim", int age = 30, bool retired = false])
```

Now `myFunction()` will use these default values for any missing arguments. Note that this version has more descriptive parameter names, as well, which is a very good habit.

##### Example

Try it!

```dart
void main() {
  print("First run:");
  myFunction();
  print("\nSecond run:");
  myFunction("Bob", 54);
}

void myFunction([String name = "Jim", int age = 30, bool retired = false]) {
  print(name);
  print(age);
  print(retired);
}
```

##### Mixing Optional and Required Parameters

With positional parameters, it is possible for some to be optional and others required, but the optional ones must come at the end of the list:

```dart
void myFunction(String name, int age, [bool retired = false])
```

In this version of the function, the caller must provide arguments for `name` and `age`, but if no value is provided for `retired`, it will default to `false`.

#### Named Optional Parameters

Named optional parameters allow arguments to be passed in any order. They are designated by curly braces instead of square brackets:

```dart
void setFlags({bool bold, bool hidden})
```

The names of named parameters must be included in the function call. The `setFlags()` function can be called in these ways:

```dart
setFlags(bold: true, hidden: true);
setFlags(hidden: true, bold: true);
setFlags(bold: true);
setFlags(hidden: true);
setFlags();
```

As with the positional variety, missing arguments are simply `null` unless you have other defaults in place:

```dart
void setFlags({bool bold = false, bool hidden = false})
```

With that signature, calling `setFlags()` without arguments will set both flags to `false`.

> **Note:** In Dart, named function parameters are always optional. You cannot create a named, required parameter.

##### Example

Give it a shot!

```dart
void main() {
  print("First run:");
  setFlags();
  print("\nSecond run:");
  setFlags(hidden: true);
}

void setFlags({bool bold = false, bool hidden = false}) {
  print(bold);
  print(hidden);
}
```

##### Mixing Optional and Required Parameters (Revisited)

Optional parameters, even named ones, must come at the end of the list if there are also required parameters in a function's signature:

```dart
void myFunction(String name, int age, {bool retired = false})
```

Calling this function with all three arguments would look like this:

```dart
myFunction("Bob", 54, retired: true);
```

Boolean parameters are great candidates for being named, as it makes the function call much clearer for anyone reading the code. Just remember that if there isn't a default value in the function's declaration, it will default to `null`, which is not a valid boolean value.

#### Mixing Positional and Named Optional Parameters

Dart won't let you do this, so don't try it. A function can have required and optional parameters, but optional parameters must either be all named or all positional.