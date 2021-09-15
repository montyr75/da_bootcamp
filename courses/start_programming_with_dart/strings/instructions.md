In previous lessons, you've used strings several times already, but you might be surprised to learn there's more to know!

> **Hint:** There's always more to know.

#### String Definition
Strings are how you keep track of text in your programs. You can define strings in several ways. You can use single- or double-quotes to define a `String`:

```dart
void main() {
  String message1 = "Dart is great.";
  String message2 = 'JavaScript is not great.';
  
  print(message1);
  print(message2);
}
```

#### Neighbors
Adjacent string literals are automatically concatenated:

```dart
void main() {
  print("Hello, " "World.");
}
```

#### Dialogue
What if you want quotes _inside_ your strings? Won't that confuse Dart? Yes, indeed. Try this:

```dart
void main() {
  print(""Could Dart save my marriage?" he asked.");
}
```

Errors! Warnings! The solution in this case is to define the string with single-quotes:

```dart
void main() {
  print('"Could Dart save my marriage?" he asked.');
}
```

#### Contractions
What if you had an apostrophe in there, too? An apostrophe is the same character as a single-quote!

```dart
void main() {
  print('"She isn't worth it," his friend replied.');
}
```

More problems. You can fix that, as well. You can _escape_ the apostrophe using a backslash (`\`):

```dart
void main() {
  print('"She isn\'t worth it," his friend replied.');
}
```

#### The Need to Escape
The backslash preceding the apostrophe tells Dart that it's just an apostrophe and shouldn't be interpreted as a string delimiter. You could define the string with double-quotes, in fact, and escape those within the string instead:

```dart
void main() {
  print("\"She isn't worth it,\" his friend replied.");
}
```

Once again, there's more than one way to skin a cat.

> **Note:** You should not skin cats.

#### Interpolation
The dollar sign (`$`) is another character that's special in the context of Dart strings. It's used to do _string interpolation_. Here's an example:

```dart
void main() {
  String name = "Amber";
  print("$name is my best friend.");
}
```

When Dart encounters a `$` in the string, it expects what follows to be a variable, then it takes the value of that variable and inserts it into the string. This turns out to be quite a bit nicer than using the `+` operator to concatenate:

```dart
void main() {
  String name = "Amber";
  print(name + " is my best friend.");
}
```

In Dart code, you should always favor using string interpolation when possible, as it leads to much more readable code.

#### Show Me the Money
But wait! Now I can't use a dollar sign in my strings?

```dart
void main() {
  print("The doily costs $4.99.");
}
```

More errors. Here are a few fixes for that problem:

```dart
void main() {
  print("The doily costs \$4.99.");
  print(r"The doily costs $4.99.");
}
```

You can escape the dollar sign with a backslash, or you can precede the string with a lowercase "r" to tell Dart the string should be considered _raw_, which means no string interpolation will be performed within it.

#### Paths
Now that you know the backslash is used to escape special characters, and since you're such an astute reader, you must be wondering how you can include a backslash in your string. That doesn't come up much under most circumstances, but you can't just live the rest of your life without printing backslashes, can you? In fact, you can use a backslash to escape a backslash, like so:

```dart
void main() {
  print("Windows path: C:\\Program Files\\Dart");
}
```

Run that code, and you'll see the backslash show up just like you'd expect.

#### More Interpolation
Let's talk a bit more about string interpolation. Whenever you want to insert the value of a simple variable, like `name`, into a string, the dollar sign will get you by. If you want to do anything more complex, like a real code expression, you need to throw in a pair of curly braces:

```dart
void main() {
  print("16 + 4 = ${16 + 4}");
}
```

This time, Dart will print out the math problem, then when it hits the interpolated expression, it'll perform the calculation and spit out the result, inserting it in to the string in place of the expression. Run the code to see it in action.

#### Interpolated Expressions
What other kinds of expressions are possible in there? Pretty much any valid Dart expression. Take a look at this example:

```dart
void main() {
  String name = "Rachel";
  
  print("$name starts with ${name[0]}.");
  print("Her name contains ${name.length} letters.");
}
```

Pretty nifty, eh? You can use the index operator (`[]`), manifested by square brackets, to access individual characters within a string variable. To grab the first letter of `name`, you use the expression `name[0]`. Why not `name[1]`? In most programming languages, counting typically starts from 0. This makes looping over a series of values more convenient, as you'll discover in a later lesson on loops. "R" is at position 0 in the string `name`.

The second call to `print()` interpolates another new type of expression: `name.length`. String variables have _properties_ on them. These properties contain information pertinent to string variables, such as how many characters they're holding. You access these properties using the dot operator (`.`).

#### Now What?
That concludes our introduction to Dart strings. Tune in next time as we continue our journey to fame and fortune via code.
