# Making Decisions

Every day, you make assessments and comparisons, and based on your findings, you make decisions. Is it cold outside? Yes, I may need to dress warmly. But is it _really_ cold? If so, I may have to dig out my winter coat instead of relying on this flimsy jacket.

Programs need to make decisions, too. Is there a valid user signed in? If so, let the user interact with the UI. Does the file we need to load exist? If so, load it, but if not, create it.

## If Only
Making decisions is an essential part of all but the simplest of computer programs. You could model some of your internal dialogue about what to wear outside with code like this:

```dart
void main() {
  int cold = 60;
  int temperature = 57;

  print("Is it cold outside?");
  
  if (temperature < cold) {
    print("Yes, a bit.");
  }
}
```

If you execute this code in the editor, of course you'll see two strings printed, because 57 is, indeed, less than 60. Notice that here we type the variables as `int`, which means we expect the temperature values to be integers (whole numbers). The numbers themselves are on the Fahrenheit scale most commonly used in the United States, in case 60&deg; doesn't seem cold to you.

One of the ways Dart makes decisions is using the `if` keyword, one of several control structures available in the language. Between the parentheses following `if`, you must place an expression that resolves to a boolean value, either `true` or `false`. In the next lesson, you will learn more about Boolean logic and Dart's comparison operators, but for now, let's concentrate on `if`.

After the parenthetical boolean expression comes the opening curly brace defining the beginning of the code block to execute in the event the expression is `true`. If the expression is `false`, everything within the `if` code block will be skipped. Naturally, the code block is ended with a closing curly brace.

### Getting Warmer
Try changing the value of `temperature`:

```dart
int temperature = 71;
```

Running the code this time will print the question, but no answer, leaving everyone confused and distraught. Since 71 is not less than 60, the second call to `print()` is never executed.

### What Else?
It simply won't do to leave the question unanswered, so add an `else` clause to your `if` statement to handle a `false` expression:

```dart
if (temperature < cold) {
  print("Yes, a bit.");
} else {
  print("No, it's quite warm.");
}
```

Now, with `temperature` at 71&deg; and the definition of `cold` still set to 60&deg;, the comparison expression will resolve to `false`, because 71 is _not_ less than 60. The `else` code block will be executed in this case.

> **Note:** It is technically permitted to omit the opening and closing curly braces for `if` or `else` code blocks containing only a single statement to execute, but it's not recommended.

## Jacket or Coat?
With `if` and `else`, you can make simple decisions, but in the intro to this lesson, you struggled with a more complicated question. How can that be represented in code?

```dart
void main() {
  int cold = 60;
  int freezing = 40;
  int temperature = 57;

  print("Is it cold outside?");
  
  if (temperature > cold) {
    print("No, quite toasty, really.");
  } else if (temperature > freezing) {
    print("It is a bit cold. Perhaps a jacket.");
  } else {
    print("It's freezing! Where's my coat?");
  }
}
```

Using the `else if` statement, you can handle more decision branches. The code above will print "It is a bit cold. Perhaps a jacket." Dart examines each boolean expression in order. The temperature, at 57, is not greater than 60, so the first code block is skipped. Next, the `else if` portion is examined. Since 57 _is_ greater than 40, that expression is `true`, and the second code block is executed. The final `else` block will be executed only in the event that all the prior `if` and `else if` expressions were found to be `false`.

You can use as many `else if` statements as you want, but if you have too many, it's possible that you'll want to restructure your code to make things simpler, or maybe use another control structure, such as `switch`. More on that later.

## Always Be Playing

Play with different values for `temperature`, `cold`, and `freezing` to get each of the `print()` calls to execute.