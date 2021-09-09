In addition to the operators already discussed, Dart supports a number of convenience operators that combine multiple operations. Typically, they combine math and assignment operations, and using them can save you some typing.

#### Add and Assign

Suppose you wanted to perform a simple addition, like so:

```dart
int x = 5;
x = x + 5;
```

That's a perfectly good way to add 5 to `x`, and after this code executes, `x` will contain the value `10`. But what if it could be even easier?

```dart
int x = 5;
x += 5;
```

This code uses one of the compound assignment operators, `+=`, to get the same result with less typing. The two code examples are exactly equivalent. In each case, the initial value of `x` is added to 5, and `x` ends up being `10`.

##### Try It

Try running this code in the code editor:

```dart
void main() {
  int x = 5;
  
  print(x += 5);
  print(x);
}
```

As you may have predicted, the first `print()` call puts a `10` in the console, but the important thing to note here is that `x` has been updated with the new value, so the second `print()` call also gives you `10`.

For comparison:

```dart
void main() {
  int x = 5;
  
  print(x + 5);
  print(x);
}
```

In this version, the addition occurs and the result is printed, but the sum is then thrown away. Without the `=`, `x` is not modified. It remains `5`.

#### Take It Away

You can also subtract as you assign:

```dart
int x = 5;
x -= 5;
```

After this code has executed, `x` will be `0`.

#### Multiply

It's true! You can do this, too:

```dart
int x = 5;
x *= 2;
```

In this snippet, `x` is multiplied by 2, and the result is saved back to `x`, which means `x` becomes `10`.

#### Be Careful with Division!

The mathematicians among you may have started wondering if division, which can result in fractional quotients, could cause problems:

```dart
void main() {
  int x = 5;
  x /= 2;
}
```

This code creates an error, because the result of a division operation is always of type `double`, and `x` was declared as an `int`. Let's fix it:

```dart
void main() {
  double x = 5;
  x /= 2;
}
```

What the...? Another error! Will nothing satisfy Dart? The problem now is that we're initializing a `double` with an integer, the value `5`. Another adjustment:

```dart
void main() {
  double x = 5.0;
  x /= 2;
}
```

Now it works, since `5.0` is a `double` literal with its fractional component explicitly included. Kind of annoying like this, though, since `.0` is technically unnecessary. Let's make one more change:

```dart
void main() {
  num x = 5;

  x /= 2;
  print(x);
}
```

There we go! Since a variable typed as `num` can hold `int` or `double` values, this version of `x` works just as you'd expect. When you print `x`, you see that it's now the `double` value `2.5`.

#### Integer Division

Dart does include one more interesting math operator you've not yet seen: The integer division operator. Using it, we could approach the type problems of division another way. This operator performs a division as usual, but always returns an integer result instead of a `double`. Any fractional part is just thrown away:

```dart
void main() {
  int x = 5;

  x ~/= 2;
  print(x);
}
```

Here, we're back to declaring `x` as an `int`, which works because integer division will always return an `int`.

The non-compound version of this operator, without doing an assignment, looks like this:

```dart
6 ~/ 2;     // result: 3 (not 3.0)
```

If you're not sure what the little squiggly line is, it's the tilde character (`~`), often found in the upper left of your keyboard. In some contexts, it's used to represent the concept of approximation, and that's why it's perfect for integer division.