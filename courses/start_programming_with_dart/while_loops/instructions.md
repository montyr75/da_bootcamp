A bunch of lessons ago, you were introduced to the `String` data type. You created, printed, concatenated, and interpolated them. What if I told you that Dart's String type contains properties and functions that help you do more advanced string operations? This shouldn't be a complete surprise, because you've already seen at least one of these hidden treasures: The `length` property. It's accessed using the dot operator (`.`), as in this example:

```dart
void main() {
  String name = "Russell";
  print("This name contains ${name.length} letters.");
}
```

#### Is It Empty?

Strings can tell you other interesting things about themselves, such as whether they're empty or not:

```dart
void main() {
  String firstName = "Russell";
  String lastName = "";
  
  print("firstName\n  Empty: ${firstName.isEmpty}\n  Not Empty: ${firstName.isNotEmpty}");
  print("lastName\n  Empty: ${lastName.isEmpty}\n  Not Empty: ${lastName.isNotEmpty}");
}
```

Whoa! That's a bit crazy, isn't it? I snuck a new concept in there on you. We have gone over using the backslash (`\`) to *escape* special characters, such as when you want to display a dollar sign (`$`) instead of using it for interpolation, but it turns out there's another use for that concept. There are a handful of special instructions you can access in strings. In the above example, we use `\n` escape sequence to indicate we want to print a *newline*. The `print()` function automatically appends that character to the end of every string it prints, but sometimes we want them in the middle of our output, as well.

The `isEmpty` and `isNotEmpty` properties each return a `bool` value. Normally you wouldn't print these unless you're debugging, but you will often use them in a conditional statement:

```dart
if (lastName.isEmpty) {
  print("You don't seem to have a last name!");
}
```

Remember, the definition of an empty string is one with a `length` of 0. It has no characters. To wit:

```dart
" ".isEmpty;       // false (contains a space)
"".isEmpty;        // true
"Fun".isNotEmpty;  // true
```

Some characters, like spaces, are invisible! Tricky, but they still count. As a bonus, this code demonstrates that it's possible to access String properties even on string literals, not just on string variables.

#### Examining String Content

Helpfully, Strings provide a number of functions for examining their contents.

##### Starting and Ending Characters

You may need to find out if a string starts or ends with certain characters. The `startsWith()` and `endsWith()` string methods can assist you:

```dart
void main() {
  String str = "Dart is great.";
    
  if (str.startsWith("D")) {
    print('The string starts with "D"');
  }
    
  if (str.endsWith("eat.")) {
    print('The last characters of the string are "eat."');
  }
}
```

These two methods will return either `true` or `false`, as appropriate, which makes them great for use in `if` statements.

> Keep in mind that all string comparisons and tests are case sensitive. "D" and "d" are not the same character when testing for equivalence. 

##### It's All In the Index

Sometimes you need to know exactly where within a string something exists. You can find out the index of a particular character sequence within a string using `indexOf()` and `lastIndexOf()`:

```dart
void main() {
  String str = "Dart is great.";
    
  int indexOfS = str.indexOf("s");
  int indexOfGreat = str.indexOf("great");
  int indexOfJavaScript = str.indexOf("JavaScript");
  int indexOfT = str.lastIndexOf("t");
  
  print("Index of s: $indexOfS");
  print("Index of great: $indexOfGreat");
  print("Index of JavaScript: $indexOfJavaScript");
  print("Last index of t: $indexOfT");
}
```

In most programming languages, positions and indexes are 0-based. This means that the "D" in "Dart" is at index 0, the following "a" is at index 1, and so on. If the character sequence you're searching for does not exist within the string, a value of -1 is returned, which means you could test for the presence of something like this:

```dart
if (str.indexOf("JavaScript") != -1) {
  // found it!
}
```

If the returned index is not -1, we know the pattern was found. We'll look at a nicer way of doing the same thing in the next section.

The `lastIndexOf()` method returns the very last index of the search pattern that appears in the string, again returning -1 if it's not found at all.

##### You Contain Me

As promised, here's a somewhat more readable way to find out if a string contains a particular pattern. Behold, the `contains()` method:

```dart
void main() {
  String str = "Dart is great.";
    
  if (str.contains("t")) {
    print('This string definitely has a "T"');
  }
  
  if (!str.contains("JavaScript")) {
    print("No JavaScript here!");
  }
}
```

Notice that the second `if` statement uses the *not operator* (`!`) to test for a value of `false`, which means the second `print()` call will occur, since "JavaScript" is not part of the string. You might say it in your mind as, "If not string contains JavaScript, then declare it to the world." A little awkward, but perfectly understandable. Programming languages like Dart are designed to resemble human language to an extent.

##### Return of the Index

Using the *index operator* (`[ ]`), you can access individual string characters by index:

```dart
void main() {
  String str = "Dart is great.";
  
  print("Index 3 (the fourth character): ${str[3]}");
    
  if (str[5] == "i") {
    print('The character at index 5 is "i"');
  }

  for (int i = 0; i < str.length; i++) {
    print(str[i]);
  }
}
```

You can print individual characters, test them, or even loop through them one at a time and perform some kind of operation on each. Pretty great!

#### Playing Around: Reverse a String

Now that you know a bit about what you can do with strings, let's use that knowledge to write a little algorithm that can reverse the characters of a string. So if the input is "I love you", the output will be "uoy evol I":

```dart
void main() {
  print(reverseString("I love you"));
}

String reverseString(String input) {
  String output = '';
  
  for (int i = input.length - 1; i >= 0; i--) {
    output += input[i];
  }
  
  return output;
}
```

There are many ways to perform this operation, but this is one of the most succinct ways using the techniques we've learned about so far. Let's examine how `reverseString()` does its duty.

The function's signature states that it takes a String variable as input and returns a String as output. Then the body sets up a variable to store the output as it works. The `output` variable is initialized to an empty string. This is required because if you were to leave it uninitialized, it would be assigned a value of `null`, which is not technically a string at all, and you cannot perform string operations on that.

Next, we use a somewhat unconventional `for` loop that initializes its iterator (`i`) to the last index of the input string, which can be calculated by taking the string's length and subtracting 1. Why the subtraction? The string "I love you" has 10 characters altogether, so its last index is 9, because the first index is 0. As long as `i` is greater than or equal to 0 (the first index), the loop should continue. On each iteration of the loop, `i` is decremented using the `--` operator, so it is counting backwards from 9 to 0.

The body of the loop uses the `+=` operator to concatenate each character of `input`, in reverse order, to `output`. Yes, it's true that you can use `+` or `+=` on strings, just as you can on numbers, but "addition" for strings is actually concatenation, as in this example:

```dart
String fullName = "John " + "Jones";    // result: "John Jones"
```

At the end of `reverseString()`, we `return` the value of `output` to the caller and it gets printed to the screen.

#### Keep Playing!

That's a lot of new tools to mess around with. Use the code editor as a playground. Be creative with your strings. Try to imagine real world situations where you might need to examine the content of a string variable. Maybe you've asked your users to provide a password of a minimum length, or one that is required to contain a particular mix of special characters for extra security. Check on those shifty users, and don't let them get away with anything!