In order to efficiently solve more complex problems, we're going to need more advanced data structures. This lesson will introduce a new Dart type, the `List`. A list is exactly what it sounds like: It's a bunch of items stored sequentially. In everyday life, you make lists all the time. Lists of groceries to pick up, lists of people to call, lists of tasks to do, and so on. Sometimes your lists are numbered, which makes it easy to refer directly to any item in the list using its place in the list ("I have completed item #7!"). You could even think of Dart's `String` type as a specialized form of list, one that strictly deals with sequences of individual characters.

What kinds of information might you collect into a list within a computer program? In a game app, a character's inventory might be stored as a list. For ecommerce, the contents of the shopping cart could be a list. A deck of cards could be modeled as a list, with each card being one *element* of the list. It can even be useful to convert a `String` into a `List` of characters in order to solve certain kinds of string-related problems.

#### Keep It Together

A list can be of any length, and items (elements) can be added and removed as needed. This makes lists far more flexible than trying to use a collection of individual variables:

```dart
void main() {
  int number1 = 5;
  int number2 = 7;
  int number3 = 10;

  // add 3 numbers
  int total = number1 + number2 + number3;

  print("Total: $total");
}
```

This code works fine as long as you want to add exactly three numbers, but it's not very flexible. You might be writing a calculator app, and the user could enter pretty much any number of values to add. For this, a list would work better:

```dart
void main() {
  List<int> numbers = [5, 7, 10];

  // add 3 numbers
  int total = numbers[0] + numbers[1] + numbers[2];

  print("Total: $total");
}
```

This time, we created a `List` variable called `numbers`. You can use angled brackets along with `List` to specify a type for the list's individual elements, in this case `<int>`. A Dart `List` is denoted by a comma-delimited sequence of values enclosed within square brackets. As with strings, each list element can be accessed by index, and the first index is `0`. The value at `numbers[0]` is `5`, because `5` is the first element in that list.

Now that you've got a list instead of individual variables, it's possible to store any number of values to be added in there. The addition code is still handling exactly three values, though. The true power of lists becomes apparent when you combine them with loops:

```dart
void main() {
  List<int> numbers = [5, 7, 10];

  // add all the numbers
  int total = 0;
  for (int i = 0; i < numbers.length; i++) {
    total += numbers[i];
  }

  print("Total: $total");
}
```

In this version, we use a `for` loop to iterate over every element in the list. The first time the loop runs, we'll add the value at `numbers[0]` to `total`, because `i` will be `0`. On the next iteration, `numbers[1]` will be accessed and its value, `7`, will be added to the running `total`. Lists have a `length` property you can use to determine how many elements are currently stored within. Using that, you can make sure your loop runs the correct number of times. As soon as `i` matches the length of the list (`3`), the loop will stop running.

Let's throw a few more values into the list to test the flexibility, then run the code again:

```dart
List<int> numbers = [5, 7, 10, 3, 19];
```

As you can see, the loop combined with a list can add any quantity of values together. Neat! Also, keeping all the values in one variable, `numbers`, is much easier to manage than a ton of separate variables. What if you had to store 100 values or more? Can you imagine creating that many individual variables? If you see anyone do this, kick their chair out from under them and immediately demote them.

#### It's Empty

It's entirely possible to have a list with zero elements, an empty list:

```dart
List<int> myList = [];
```

If you try running the earlier code with an empty list, you'll find that the printed total is `0`, because the loop never runs, so nothing is ever added to `total` after it's initialized. This is because an empty list has a `length` of `0`, and the loop's iterator, `i`, starts at `0`. Since `0` is not less than `0`, the loop condition fails immediately and the loop's body is not executed.

Lists have two special properties for checking their state, as well as a method for emptying a list:

```dart
void main() {
  List<int> numbers = [5, 7, 10, 3, 19];

  print("Empty? ${numbers.isEmpty}");
  print("Not empty? ${numbers.isNotEmpty}");
  print("Length: ${numbers.length}");

  // empty the list
  numbers.clear();

  print("\nEmpty? ${numbers.isEmpty}");
  print("Not empty? ${numbers.isNotEmpty}");
  print("Length: ${numbers.length}");
}
```

These convenience properties are great when used with `if` statements, more succinct and readable than checking `length` manually:

```dart
if (numbers.isEmpty) {
  // We have no numbers! Panic!
}

if (numbers.length == 0) {
  // Also works, but isn't as cool.
}

if (numbers.isNotEmpty) {
  // Process the numbers, since we have some.
}
```

#### Other Element Types

We've already seen that a `List` can hold a sequence of integer elements, but what about other types?

```dart
void main() {
  List<String> names = ["Bob", "Jerry", "Tim"];

  // print all the names
  for (int i = 0; i < names.length; i++) {
    print(names[i]);
  }
}
```

Yes, lists can hold strings, boolean values, or any other valid Dart data type. In fact, in this example, you could even mix and match:

```dart
void main() {
  List stuff = ["Bob", "Jerry", "Tim", 15, 3.14, true];

  // print all the stuff
  for (int i = 0; i < stuff.length; i++) {
    print(stuff[i]);
  }
}
```

This works because when you declare a variable of type `List`, you're implicitly saying you want a list that can store any type. The long way to declare this kind of list would be:

```dart
List<dynamic> stuff = ["Bob", "Jerry", "Tim", 15, 3.14, true];
```

The `dynamic` type encompasses all types, and it's the default for list elements. Most of the time you create a list, you'll have a particular type in mind for all of its elements, and you should include that type in your declaration to make sure nothing invalid ends up in there:

```dart
List<int> stuff = ["Bob", "Jerry", "Tim", 15, 3.14, true];
```

That example will cause the Dart analyzer to complain that you're trying to put types other than `int` into a list of integers.

```dart
List<int> numbers = [5, 7, 10, 3, 19];
```

That's better! Now your development environment can help you make sure no incompatible entities are floating around in your list of numbers. Homogeneity for the win!

#### An Adding Function

We can highlight the advantages of typing your lists by separating the code to perform addition into its own reusable function:

```dart
void main() {
  List<int> numbers = [5, 7, 10, 3, 19];

  int total = sum(numbers);
  print("Total: $total");
}

int sum(List<int> values) {
  int total = 0;

  for (int i = 0; i < values.length; i++) {
    total += values[i];
  }

  return total;
}
```

Using a typed list here ensures that the `sum()` function doesn't crash when it tries to add strings, numbers, and boolean values together. The parameter `values` can only be assigned a list of integers, so the code within the function can safely assume every element is an integer.

#### More is More

There's a lot more to know about lists. Read on to find out even more!