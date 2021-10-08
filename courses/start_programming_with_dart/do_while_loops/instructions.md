In the last lesson, we looked at `while` loops, which test a condition at the loop's entry point, then execute the loop's body when and while that condition is `true`. A `do-while` loop, by contrast, tests the condition at the loop's exit point. This means that unlike the `while` loop, a `do-while` loop's body will always be executed at least once.

#### A Typical Use Case
One of the most common uses of a the `do-while` loop is checking for valid input from a user in a console application. You can't actually get console input with the DartPad editor, so I'll demonstrate the idea here with _pseudo-code_, which gets the idea across without using real code:

```
do {
  print("Enter your answer:");
  answer = <get answer from console>
} while (<answer is invalid>);
```

If the user enters something invalid, the program will keep asking again until it likes what it gets.

#### A Bit More Pseudo-Code
Another place you'll see the `do-while` loop pop up often is when constructing a game loop. In many games, you need to set up a main loop that repeats the game code over and over until some kind of quit condition is met:

```dart
do {
  // move player and enemies
  // draw game graphics
  // get game input
} while (status != "quit");
```

Something like that.

#### Try It
Enough of the theoretical crap. Go ahead and enter this code into the editor:

```dart
void main() {
  int beers = 99;
  
  do {
    print("$beers bottles of beer on the wall, $beers bottles of beer.");
    print("You take one down, pass it around... ");
    print("${beers - 1} bottles of beer on the wall.\n");
    beers--;
  } while (beers > 0);
}
```

Look at that! You've gotten Dart drunk, and now it's singing. The variable `beers` is initialized to 99, then with each iteration of the loop's body, `beers` is decremented by 1. As long as `beers` is greater than 0, we loop back and keep singing. Once it hits 0, the beer is gone, the party is over, and the loop is done.

#### One Thing Remains Awkward
For those of you with a keen attention to detail and a good knowledge of English, you'll have noticed that there's one awkward thing about this loop. When `beers` is 1, Dart sings "1 bottles of beer on the wall..." The word "bottles" remains plural even though there's just one bottle left!

What can you do to keep Dart from looking stupid at the big kegger? See if you can use some kind of control statement to fix this up, maybe an `if`.