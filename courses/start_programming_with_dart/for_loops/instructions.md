It's time to talk about yet another way to make a loop. Why are there so many different kinds of loops? With a bit of cleverness, you really could do most jobs with just one loop type, but some types are better suited to certain problems than others. Don't feel bad if you can't yet identify which is best in a given situation. Only three of us were born with that knowledge ingrained, and the rest of you have to be taught.

#### What's a For Loop For?
The `for` loop is custom built for situations where you need an index variable. You might remember those from a few lessons back. By convention, they're often named `i`, which could stand for _index_. When you're counting something, or you need to know where a value falls in an ordinal sequence, the `for` loop is the loop for you.

Let's start with the old standby, counting:

```dart
void main() {
  for (int i = 0; i < 10; i++) {
    print(i);
  }
}
```

That's about as typical a `for` loop as you'll ever see. They can get trickier, but this is the most common structure. Within the parentheses following the `for` keyword, you place three statements, separated by semicolons.

In the first statement, you have the opportunity to initialize a variable, or even declare one, as we have here. With other loop types, you had to declare and initialize an index variable outside the loop context, but the `for` loop has a special place set aside just for this kind of thing. What's more, the variable is _scoped_ to the loop, which means it exists only within the loop's body and is not accessible anywhere else. Go ahead and try to `print(i);` after the loop's body. It won't go well.

The second statement is where you place the boolean expression that governs whether the loop's body will be executed. As in other loops, if this evaluates to `true`, the loop's code is executed, and if not, execution continues after the loop's closing curly brace. In this example, you can think of it like, "If `i` is less than 10, do the loop again." Kinda rhymes, eh? Nice.

With the third statement, you are expected to provide an expression that will mutate the index variable in some way, the most typical being a simple increment. Each time after the first time, this loop will add 1 to `i`, and when `i` equals or exceeds 10, there will be no more looping.

#### When Does All This Happen?
It's important to understand the sequence of operations when it comes to the three statements in the parentheses. The first time Dart encounters the loop, the first statement happens, where `i` is created and set to `0`. Then the boolean expression is evaluated. If it's `false`, the body of the loop is never executed. If it's `true`, the body is executed, but the third statement is not run at this time.

Think about this. If all three `for` statements happened from the beginning, the first number printed would be `1`, but in the output, `0` is printed first. This is because the final statement is evaluated only at the end of the loop. If the increment operation happened right away, the index variable would hold a value of 1 before `print()` was called for the first time.

#### The Output
Looking at the loop, one might reasonably expect the output to start with `0` and end with `10`. Of course, this is only reasonable if your understanding of the `for` loop is shallow, as yours will not be for long.

Because `i` starts at 0, and the increment operation doesn't occur until after a full loop iteration, `0` is the first value to appear in the console. After the `0` is printed, the mutator expression is evaluated, and `i` is then 1. Then the boolean expression is evaluated to determine whether the loop's body should run again. In this case, since 1 is less than 10, it runs.

This continues until `i` becomes 9. After printing `9`, the usual procedure is followed. The index variable is incremented to 10, but this time when `i < 10` is evaluated, it's `false`, and the loop is finished. Thus, `9` is the last value printed.

#### Printing From 1 to 10
The following example code shows three different ways to achieve the lofty goal of printing out the values `1` through `10`:

```dart
void main() {
  for (int i = 1; i < 11; i++) {
    print(i);
  }

  for (int i = 1; i <= 10; i++) {
    print(i);
  }

  for (int i = 0; i < 10; i++) {
    print(i + 1);
  }
}
```

Look over each solution and make sure you understand how they're producing the same output. Note that since `i` is _local_ to each loop individually, it's okay to reuse the name `i`. The first loop has its own version of `i`, which equals 10 by the time that loop is finished, and then the second loop creates an entirely separate index variable that just happens to also be named `i`.

#### More Beer!
The `for` loop can also count backwards. Use it now to recreate the beer song from earlier lessons:

```dart
void main() {
  for (int beers = 99; beers > 0; beers--) {
    print("$beers bottles of beer on the wall, $beers bottles of beer.");
    print("You take one down, pass it around... ");
    print("${beers - 1} bottles of beer on the wall.\n");
  }
}
```

You start the index variable, this time called `beers`, at 99, and with each iteration of the loop, you subtract 1 from that. While `beers` is still more than 0, Dart keeps singing. Easy, right? Sure!

#### One More Time
In this last example, you'll see how a `for` loop can be made to do something more interesting:

```dart
void main() {
  int total = 0;
  
  for (int i = 1; i <= 10; i++) {
    total += i;
  }
  
  print("Sum of numbers 1-10: $total");
}
```

This time, `total` will end up containing the sum of all numbers from 1 to 10 (1 + 2 + 3...and so on). Neat trick!