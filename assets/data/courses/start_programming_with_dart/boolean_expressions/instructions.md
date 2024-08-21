# Boolean Expressions

In the last lesson, we took a cold, hard look at boolean variables, learning that they could contain one of two values: `true` or `false`. In the lesson before that, you wrote `if` statements comparing values in order to make a decision. Now it's time to examine these comparisons, these boolean expressions, more deeply.

## Evaluating Expressions

```dart
void main() {
  if (1 < 2) {
    print("1 is less than 2.");
  } else {
    print("The world makes no sense.");
  }
}
```

If you enter the above code and run it, of course the first `print()` call is executed, because 1 is less than 2 in all but the most extraordinary circumstances. The boolean expression in that code is `1 < 2`, because when evaluated, that expression resolves to a boolean value, either `true` or `false`. Once that evaluation has occurred, you could imagine the statement as: `if (true)`.

## Another Perspective
Here's another way you could represent the same situation:

```dart
bool result1 = 1 < 2;
bool result2 = true;
```

Again, when the Dart interpreter encounters the boolean expression `1 < 2`, the expression is evaluated and _replaced by_ the result, which is `true`. Therefore, `result1` and `result2` have the same value.

## Boolean Operators
Before we go any further, allow me to introduce Dart's boolean operators:

<table>
  <tr>
    <th>Operator</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>==</td>
    <td>Equal To</td>
  </tr>
  <tr>
    <td>!=</td>
    <td>Not Equal To</td>
  </tr>
  <tr>
    <td>&gt;</td>
    <td>Greater Than</td>
  </tr>
  <tr>
    <td>&lt;</td>
    <td>Less Than</td>
  </tr>
  <tr>
    <td>&gt;=</td>
    <td>Greater Than or Equal To</td>
  </tr>
  <tr>
    <td>&lt;=</td>
    <td>Less Than or Equal To</td>
  </tr>
</table>

Because Dart uses `=` as the assignment operator, it's not available for evaluating equivalency, so `==` is used instead. You learned earlier that `!` means _not_, thus `!=` is _not equal_. You're probably familiar with `>` and `<` from your school days. As with `!=`, Dart combines two operators in sequence to create `>=` and `<=`, respectively.

## Operators in Action
Use the code editor to examine the results of a few of these boolean expressions.

##### This `==` That
It's important to recognize that you and Dart may have differing opinions about whether two values are equal, and Dart always wins.

```dart
void main() {
  bool result1 = 1 < 2;
  bool result2 = true;

  print("1. 8 == 2: ${8 == 2}");
  print("2. 8 == 8: ${8 == 8}");
  print("3. 1 == '1': ${1 == '1'}");
  print("4. 3.0 == 3: ${3.0 == 3}");
  print("5. 'Cat' == 'cat': ${'Cat' == 'cat'}");
  print("6. 'Cat' == 'Cat': ${'Cat' == 'Cat'}");
  print("7. result1 == result2: ${result1 == result2}");
}
```

The first two numbered expressions contain no surprises. You know that 8 does not equal 2, but 8 does equal 8 (right?).

The third example is more interesting. There, you compare the integer value `1` to the character `'1'` (remember, a string can be delimited by single quotes). In Dart, these values are not equivalent because they are not of the same type. The string `'1'` is nothing more than a symbol, but the integer literal `1` represents a quantity. They are fundamentally different entities.

Perhaps surprisingly, the fourth expression evaluates to `true` even though there is a type mismatch. The `double` value `3.0` and the integer value `3` represent equal quantities, so Dart does the right thing and recognizes that.

The fifth and sixth examples demonstrate that strings need to be *exactly* alike in order to evaluate as equal. Case matters, because to a computer, "C" and "c" are different characters.

Example 7's expression demonstrates the concept we explored earlier. The expression `1 < 2` is `true`, so result1 is assigned `true`, just like `result2`. When compared, the two variables are found to be equivalent, and `result1 == result2` evaluates to `true`.

## This `!=` That
As the opposite of `==`, the `!=` operator is an easy one. In the example code for `==` above, replace every instance of `==` with `!=`, run it, and note the results. Should be enlightening. Every result will be the opposite of what it was before your meddling.

#### `>`,  `<`, `>=`, and `<=`
These operators work pretty much like they did when you were a wee lad/lass in a one-room schoolhouse out on the prairie, aside from the new appearance of the equivalence versions. Here are a few examples to run:

```dart
void main() {
  print("1. 8 > 2: ${8 > 2}");
  print("2. 8 <= 8: ${8 <= 8}");
  print("3. 3.58 > 3: ${3.58 > 3}");
  print("4. 20 >= 85: ${20 >= 85}");
  print("4. 145 < 146: ${145 < 146}");
}
```

The thing to notice here is that these operators cannot be used to compare non-numeric types. Attempting compare other types will result in warnings, errors, even explosions. If you're feeling adventurous, try replacing some of the values with a `String` or `bool` to familiarize yourself with the Dart analyzer's complaints.

## Enter Password
With all your new knowledge of boolean logic, we'll take a look at a more practical example of using it:

```dart
void main() {
  String password = "iamawesome";
  String userInput = "iamawsome";
  
  if (userInput == password) {
    print("Access granted.");
  } else {
    print("Password incorrect. Authorities notified.");
  }
}
```

The user has erred entering his password! Perhaps you could fix it for him before he's hauled away and tortured for his secrets.

## Have a Drink!

```dart
void main() {
  int drinkingAge = 21;
  int userAge = 23;
  bool isAdult = userAge >= drinkingAge;

  if (isAdult) {
    print("Have a beer!");
  } else {
    print("Come back in a few years, kid.");
  }
}
```

In most of the United States, you must be 21 years of age or older to legally imbibe an adult beverage, even though you could be sent to war at 18. Boolean logic and this code could save your restaurant business one day. You're welcome.

## Coming Up
There's more to know? Yes, we discussed this. There is always more to know. Later, you'll see that there are other language constructs, aside from `if`, for making decisions.
