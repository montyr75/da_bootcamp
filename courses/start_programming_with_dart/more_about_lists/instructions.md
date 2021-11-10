Welcome back! And now, more about lists.

#### Adding and Removing Elements

Sometimes you don't have every element handy at the time you create your list. Maybe a user is giving you items one at a time, or maybe you're generating each element with code. In cases like these, you need to be able to add elements to an existing list:

```dart
void main() {
  List<String> students = [];

  String userInput = "Mary";

  students.add(userInput);

  userInput = "Jon";

  students.add(userInput);

  print(students);
}
```

In this code, we first create an empty list, specifying that its elements will be strings. Then we simulate user input using a `String` variable, aptly named `userInput`. Once that's got a name in it, it gets added to the list by means of the `add()` method. We reuse `userInput` by assigning a new string to it, then add that one to `students`. Finally, we print the whole list to the console to show off.

Unfortunately, Jon is a terrible student, so you decide to kick him out of the class. Let's see how we can remove him from the list of students:

```dart
void main() {
  List<String> students = ["Mary", "Jon", "Sally", "Bob"];
  print(students);

  students.remove("Jon");
  print(students);
}
```

And he's out of there! Goodbye, Jon. We won't miss you.

It's important to notice that when we removed the student at index `1`, the other names shuffled up the line to fill that gap, so Sally's index became `1` and Bob's became `2`. Gaps are not tolerated in a Dart `List`. In fact, let's enhance our print logic to make this clearer:

```dart
void main() {
  List<String> students = ["Mary", "Jon", "Sally", "Bob"];
  printList(students);

  print('');

  students.remove("Jon");
  printList(students);
}

void printList(List<String> list) {
  for (int i = 0; i < list.length; i++) {
    print("$i: ${list[i]}");
  }
}
```

We replace the standard `print()` call with our own custom function, `printList()`. This will print any list of strings along with each element's index, represented by `i`. This will highlight the effect of Jon's expulsion. Note that we print an empty string with `print('')` just to create some vertical whitespace between the two versions of the list.

#### Sort it Out

As you've seen, Dart's `List` data structure helps you keep things organized when you have a lot of data to store. It also provides a number of methods meant to help you modify the content and order of the elements. One of the most useful is the `sort()` method:

```dart
void main() {
  List<String> students = ["Mary", "Jon", "Sally", "Bob"];
  print(students);

  students.sort();
  print(students);
}
```

Yeah, Jon's back. Turns out his father was a big donor to the school, so you'll just have to put up with his crap.

This code prints the list both before and after a sort to illustrate the changes. The `sort()` method sorts strings alphabetically and numbers numerically. It's possible to customize the behavior of the sort, and doing so is even required for more complex element types, but we won't be covering that just yet.

#### From First to Last

Sometimes you need to retrieve only the first or last element in a list:

```dart
List<String> students = ["Mary", "Jon", "Sally", "Bob"];

// the dumb way
String first = students[0];		// Mary
String last = students[3];		// Bob
```

You can certainly access the first and last elements by index, but this is not always the best way. The first element in a non-empty list will always be at index `0`, but what about the last? It's common to be unaware of how many elements the list has when querying for the last one. You could make the index relative, like this:

```dart
// the less dumb way
String last = students[students.length - 1];		// Bob
```

The last element's index will always be one less than the full length of the list (since indexes start at `0`), but this method isn't very readable.

Dart to the rescue! You can access these elements through properties on `List`:

```dart
// the best way
String first = students.first;    // Mary
String last = students.last;      // Bob
```

Now it's easy to tell at a glance what's going on here. Just as using `isEmpty` instead of manually checking a list's length is a best practice, so too is using `first` and `last` instead of guessing at indexes.

#### Another Way to Loop

If you ever get tired of iterating over lists with integers and indexes, you can try out another form of `for` loop: the `for...in` loop. This is a more convenient loop construct in some ways, but at the cost of some flexibility. The `for...in` loop always loops through every element of a list, and it does not provide an easy way to know what index you're operating on. Pretty often, these constraints are not a problem.

Let's rewrite the `printList()` function from earlier, this time using `for...in`:

```dart
void main() {
  printList(["Dart", "JavaScript", "TypeScript", "C++"]);
}

void printList(List<String> list) {
  for (String element in list) {
    print(element);
  }
}
```

With this version, the `element` variable points to each of the list's elements in sequence, one per iteration. The first time the loop's body executes, `element` will be "Dart", then "JavaScript", and on down the line. If `list` has no elements, the loop will not run at all, just as when we're manually checking the list's length. This loop is great when you want to iterate over an entire list and perform some action on each element.