If you love learning about strings, you've come to the right place. This time around, we're going to discuss the ways Dart helps you to modify strings. Technically, Dart strings are *immutable*, meaning they cannot be mutated or changed in any way, but you can derive new strings based on the content of an existing string, and this can be effectively the same thing.

#### Just a Trim

One of the more common issues programmers have to deal with is sanitizing user input. I'm sure it will surprise you to learn that when users are asked for information, they don't always provide it in a nice, tidy way. For instance, they may unknowingly prepend or append spaces to their answers:

```dart
void main() {
  String userInput = "  John ";
  
  userInput = userInput.trim();
  print(userInput);
}
```

This hapless user has (hopefully) inadvertently included a bunch of unnecessary spaces before and after his name. We can use the String type's `trim()` method to wipe those out. Calling `userInput.trim()` does not actually alter the value of `userInput`, which is why we also need an assignment here. The `trim()` function produces a new string from the value of `userInput`, and then we assign that new string (sans extra spaces) back to our `userInput` variable. Again, strings are immutable, so this will always be how we "alter" them.

Also available are the `trimLeft()` and `trimRight()` methods if you only want to trim space off one end or the other.

#### Pad Me

If you need a string to be a minimum length, perhaps for layout purposes, you can do the opposite of trimming your string: You can pad it.

```dart
void main() {
  String name = "Terrence";

  print(name.padLeft(12));
  print(name.padLeft(12, '*'));
}
```

In this example, `padLeft()` is used to make sure the value of `name` is at least 12 characters long. If it falls short, spaces are added on the left to compensate. The second `print()` call demonstrates that you can specify a padding character other than a space. If the string is already 12 characters or longer, no padding will be added. You can use `padRight()` to pad the other side of the string.

#### I'm On the Case

Frequently, you will find yourself needing to alter the case of letters in a string.

##### Comparisons

When comparing strings in a case-insensitive way, the easiest thing to do is simply make both strings' cases match before comparing them:

```dart
void main() {
  String name1 = "Terrence";
  String name2 = "Philip";
  String name3 = "philip";

  print(compareStrings(name1, name2));
  print(compareStrings(name2, name3));
  print(compareStrings(name2, name3, caseSensitive: true));
}

bool compareStrings(String a, String b, {bool caseSensitive = false}) {
  if (!caseSensitive) {
    return a.toLowerCase() == b.toLowerCase();
  }

  return a == b;
}
```

Here, we've constructed a function to compare two strings, returning `true` if they are the same. By default, the comparison is case-insensitive, but the function allows the caller to override that behavior. If the `caseSensitive` parameter is `false`, as it is by default, both string parameters are first converted to lowercase for the purposes of the comparison. Again, remember that strings are immutable, so the original variables' values (`name1`, `name2`, etc.) are not modified by this process.

The `return` statement returns `true` or `false` based on Dart's standard string comparison rules.

No matter how you look at it, `name1` and `name2` are not equivalent, so that first comparison comes out `false`. Comparing `name2` and `name3` without case sensitivity results in a return value of `true`, since those strings are the same once they've both been converted to lowercase. In the last one, we use the named parameter `caseSensitive` to force the comparison to be case sensitive, which means the strings are considered distinct.

##### Capitalization

Now that you're an advanced student with a demonstrated ability to read and comprehend code documentation, I feel comfortable hitting you with two concepts at once in this section. What if you wanted to make sure a given string started with a capital letter? Many users can't be trusted to understand the rules of capitalization, even when it comes to their own names, so it falls to you to set them straight. To do this, we need to be able to convert strings to uppercase and construct new strings from parts of other strings.

```dart
void main() {
  String name = "philip";
  print(name.toUpperCase());
}
```

The first part is easy. If you call `toUpperCase()` on a string, you get a new version with all letters uppercase. In the example, the console screams `PHILIP` into the night.

The second part involves extracting a substring from a larger string. Let's see this in action:

```dart
void main() {
  String name = "philip";

  print(name.substring(2));       // result: "ilip"
  print(name.substring(2, 4));    // result: "il"
}
```

The `substring()` method creates a new string using select characters from an existing string. When you use it, you pass in the index where you want the substring to start, and optionally, the index where you want it to end. The "i" character is at index 2 (indexes start at 0), so both example results begin with that letter. If you don't specify an end index, `substring()` copies characters from the start index to the end of the string.

The second substring might confuse you a little bit. Shouldn't `name.substring(2, 4)` grab three characters, at indexes 2, 3, and 4? The end index is actually non-inclusive. A good way to think about it is that when `substring()` reaches index 4, it should stop taking characters. The result is that only indexes 2 and 3 are part of the substring.

With those tools in hand, we can capitalize the first character of a string!

```dart
void main() {
  String name = "philip";
  print(capitalize(name));
}

String capitalize(String input) {
  String firstLetter = input[0].toUpperCase();
  String restOfString = input.substring(1);

  return "$firstLetter$restOfString";
}
```

Yes! The `capitalize()` function uses the index operator (`[ ]`) to grab the first character of `input`, then calls `toUpperCase()` on it to make sure it's uppercase, and the result is assigned to `firstLetter`. To get the rest of the string, we call `substring()` with a starting index of 1, which is the input string's second character. At the end, we use string interpolation to concatenate the capital first letter and the remainder of the input string, returning the product to the function's caller.

The `capitalize()` function can be lots shorter than that, though. You could drop both variables and the `return` statement if you use a fat arrow function like this:

```dart
String capitalize(String s) => "${s[0].toUpperCase()}${s.substring(1)}";
```

#### You Are Replaceable

It's also possible to search for and replace patterns within a string. Suppose you want to replace all instances of "Trump" with "Duck". Easy!

```dart
void main() {
  String headline = "Donald Trump Orders Nuclear Strike On Disneyland";
  print(headline.replaceAll("Trump", "Duck"));
}
```

The `replaceAll()` method, true to its name, will replace every instance of the first argument with the second. It's also possible to replace only the first instance of the pattern with `replaceFirst()`.

> **One more time:** The replace methods do not modify the string they're called on. They create a new string with the replacements in place.