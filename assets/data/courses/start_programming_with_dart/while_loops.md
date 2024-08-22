# While Loops

It's important that you really internalize the concept of boolean expressions, because in the world of programming, those things come up again and again. Many of Dart's control structures use them to decide what to do. This includes loops, which we'll start discussing in this lesson.

## What's a Loop?
When writing computer programs, situations often come up where you want to do the same thing many, many times, or you need to perform the same basic action on tens, hundreds, thousands, or even millions of pieces of data. Obviously, it would be impractical to write all of that code by hand. In fact, what would something like that look like?

```dart
void main() {
  print(1);
  print(2);
  print(3);
  print(4);
  print(5);
  print(6);
  print(7);
  print(8);
  print(9);
  print(10);
}
```

That's how silly your code might look if you needed to do the same thing a mere 10 times, with only the slightest variation each time. There's got to be a better way, perhaps using variables, boolean expressions, and what else...? Loops!

```dart
void main() {
  int i = 1;
  
  while (i <= 10) {
    print(i);
    i++;
  }
}
```

If you've run both of the previous code examples in the DartPad editor, you've seen that they produce exactly the same output. The `while` loop, one of several types of loops supported by Dart, evaluates the boolean expression contained in the parentheses following the keyword `while`. If that expression evaluates to `true`, the code block defined between the loop's opening and closing braces is executed. You might even say that _while_ the expression remains true, the body of the loop will be run.

### Blow by Blow
Let's think through the loop-based code example one line at a time.

First, you create an integer variable called `i` and initialize it to the value `1`, because you want to count from 1 to 10.

> **Why `i`?** It's been a long-standing tradition to name loop control variables `i`. In most cases, such a short, nondescript variable name would be discouraged, but typical exceptions are `i`, short for _iterator_ or possibly _index_, and `x` and `y` for representing Cartesian coordinates.

At the point the computer evaluates the boolean expression controlling the `while` loop, `i` holds the value `1`. Since 1 is less than or equal to 10 (`true`), the body of the loop runs. The first statement within the loop prints `i` (1), then `i` is incremented (increased by 1) using the increment operator.

> **To infinity...** It's extremely important that the value of `i` is adjusted during the running of the loop. If the value remained `1`, the loop would continue to execute its body infinitely (or at least until Dart decided it had gone on long enough and stepped in to stop it by force).

With the loop's body finished, program control _loops back_ to once again evaluate the `while` loop's boolean expression.

On the second iteration, `i` is `2`. Once again, the expression resolves to `true`, and the loop body is executed, printing and incrementing `i`. This continues on, looping over and over, until `i <= 10` becomes `false`. This happens when `i` makes it to 11. By then, the values 1 through 10 have been printed to the console.

### Even Shorter
Because of a peculiarity of Dart's order of operations, it's possible to shorten this code even further without compromising the desired outcome. The name of a variable, by itself, is actually an expression. Like all expressions, it evaluates to a final value, in this case whatever value the variable contains.

```dart
int x = 1;
x;
```

The second line of code above evaluates to `1`. Not very useful since you don't print or use the value in any way, but it's important to understand that it's a perfectly valid expression. The increment operator (`++`) has such low precedence that even lone variable evaluation occurs first, so if `i` is 1 and you have an expression `i++`, any surrounding expression/statement making use of `i` will get to do so before the increment operation occurs.

```dart
void main() {
  int i = 1;
  
  while (i <= 10) {
    print(i++);
  }
}
```

The first time the loop's body runs, it prints `1`, and _then_ it increments `i` to 2. The value of `i` gets printed before its value has 1 added to it. Now, there are some who frown on this approach, arguing that it's less clear, that you need to understand an obscure rule to see what's going on. You can make up your own mind.

### Prefix It
Try putting the increment operator on the other side of `i`, as a prefix instead of a postfix: `print(++i)`. How does that change your output? You get the numbers 2 through 11 printed out, because on the loop's first iteration, the value of 1 is incremented to 2 before the `print()` call happens.

```dart
void main() {
  int i = 0;
  
  while (i < 10) {
    print(++i);
  }
}
```

Above, you can see that to print out 1 through 10 using the prefix version of the increment operator, you need to initialize `i` to `0` and change the comparison operator from `<=` to just `<`. The variable `i` is incremented prior to printing the value with each loop iteration, so even though it enters the loop for the first time with a value of 0, it becomes 1 before getting printed. The last time `i < 10` evaluates to `true`, `i` is 9, but it gets pushed up to 10 before it's printed to the console.

### Easy to Adjust
Now you've got this killer program that can count to 10, but your boss comes back and tells you that your users' most requested feature is counting to 50. You gasp. What? But 50 is so much more than 10. At least 5 times as much! Can one coder accomplish such a thing in a single lifetime?

Well, without loops, it would be quite tedious. You'd stack up 50 calls to `print()`. With the loop, you can accomplish what seemed impossible by changing only a single character:

```dart
void main() {
  int i = 1;
  
  while (i <= 50) {
    print(i++);
  }
}
```

Unlike people, computers are great at doing things over and over very quickly. Using loops, you can harness this awesome power for world domination (or at least to count to a really high number).