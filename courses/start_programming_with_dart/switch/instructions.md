The `if` statement is probably the most common control structure you'll use when programming with Dart, and it can handle most jobs, but when you need to make a decision between a large number of possibilities, `if` can become unwieldy.

#### Not the Best Way
Suppose you were writing a program for users playing a fantasy role-playing game. Your program suggests appropriate weapons for a character based on the fantasy race the player has elected to play.

```dart
void main() {
  String characterRace = "elf";

  if (characterRace == "dwarf") {
    print("Battle Axe");
  } else if (characterRace == "elf") {
    print("Longbow");
  } else if (characterRace == "goblin") {
    print("Short Sword");
  } else if (characterRace == "halfling") {
    print("Dagger");
  } else if (characterRace == "human") {
    print("Longsword");
  } else if (characterRace == "orc") {
    print("Mace");
  } else {
    print("Club");
  }
}
```

This giant stack of `if`, `else if`, and `else` statements makes a weapon recommendation for six different character races and offers up a club in the event the player has chosen something else. The code works and works well. It does the job. But can we do better?

#### A Better Way
Introducing the `switch` statement! Yes, `switch` was designed to handle just this sort of thing, and with less typing:

```dart
void main() {
  String characterRace = "elf";
  
  switch (characterRace) {
    case "dwarf":
      print("Battle Axe");
      break;
    case "elf":
      print("Longbow");
      break;
    case "goblin":
      print("Short Sword");
      break;
    case "halfling":
      print("Dagger");
      break;
    case "human":
      print("Longsword");
      break;
    case "orc":
      print("Mace");
      break;
    default:
      print("Club");
  }
}
```

Using the `switch` statement is a bit more succinct. It doesn't necessarily use fewer lines, but it's easier to see what options are handled at a glance.

In the parentheses following the `switch` keyword, you specify the variable to be examined. For each value you want to support, you include a `case` keyword, followed immediately by a valid value. If the variable's value matches any particular case, the instructions after that case's colon (`:`) are executed. When the `break` keyword is encountered, Dart breaks out of the `switch` statement, continuing execution below the closing brace.

The `default` case, which you'll note does not require a `break`, is optional, but acts much like an `else` statement in that it handles the case when all previous tests are `false`. If `characterRace` doesn't match any of the races specified, the `default` instructions will run.

#### To Break or Not to Break?
There are times when you might omit the `break` instruction in a `case`. In our fictional fantasy game, maybe you want to handle the result of a die roll during a battle:

```dart
void main() {
  int attackRoll = 5;
  
  switch (attackRoll) {
    case 1:
    case 2:
    case 3:
      print("You missed!");
      break;
    case 4:
    case 5:
    case 6:
      print("You hit!");
      break;
  }
}
```

Here, if `attackRoll` is 1, Dart begins executing that case, but finds no `break`, so it _falls through_ to the next case until a `break` is encountered. A roll of 1, 2, or 3 will result in a miss, while a roll of 4, 5, or 6 will not. No `default` clause is provided this time because an attack roll in this fictional game should always fall between 1 and 6.

Try changing the value of `attackRoll` to produce different results.