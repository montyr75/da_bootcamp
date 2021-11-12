Once again, it's time that we demonstrate a way to use what you've learned to do something interesting. In this lesson, we will create a function that can detect whether a word is an isogram. It's the day all budding programmers dream of from the time they type their first keyword, and for you, it's finally here.

> **Isogram**: A word that has no repeating letters, either consecutive or nonconsecutive.

How can we figure out if a particular string contains no duplicate letters? Lists can help! So here are the steps we'll need to take:

- Convert the string to lowercase so that we won't be comparing uppercase and lowercase letters (they won't match!).
- Convert the string to a list where each element is one letter of the word.
- Sort the list alphabetically so that duplicate letters will end up together.
- Loop through the list. If two of the same letter is encountered sequentially, the word is not an isogram.

```dart
void main() {
  String word1 = "Anaconda";
  String word2 = "Flavor";

  print('"Anaconda" is an isogram: ${isIsogram(word1)}');
  print('"Flavor" is an isogram: ${isIsogram(word2)}');
}

bool isIsogram(String word) {
  // convert the lowercase version of the string into a list of letters
  List<String> letters = word.toLowerCase().split('');

  // sort the list
  letters.sort();

  // loop over the list, looking for duplicate letters
  String? lastLetter;
  for (String letter in letters) {
    if (letter == lastLetter) {
      return false;
    }

    lastLetter = letter;
  }

  // if we get this far, we found an isogram
  return true;
}
```

The `isIsogram()` function takes a string argument and pretty much assumes it's a word. It doesn't bother to check if the string contains spaces or characters other than letters. Maybe you could add code for that! The function will return `true` or `false` based on its findings.

You use `String`'s `split()` method to _split_ the lowercase version of the string into a list of single characters. You do this by telling `split()` to break on an empty string, since your word strings will contain no separator characters, like a comma. If you had a string like this...

```
1,2,3,4,5
```

...you could call `split(',')` to break the string into a list of number characters based on the comma separator. In a typical word, there are no characters separating the letters; thus the empty string passed to `split()`.

Now that we have a list of letters instead of a string containing an unbroken word, we can use the `sort()` method to reorder those letters. This will place any duplicate letters next to each other, which will help us find those duplicates easily in a loop.

We use the `lastLetter` variable to keep track of the last letter we examined. On the loop's first iteration, its value will still be `null`, while `letter` points to the first letter of the word. Since no letter is equal to `null`, the `if` statement will be `false`. At the end of the loop, we save the current letter as `lastLetter`, to be compared on the next iteration.

If `letter` is ever the same as `lastLetter`, we've found a duplicate, and the word is not an isogram. In that case, we immediately `return` from the function, ending the loop and the function early.

If we loop through the whole word without discovering duplicate letters, the word is an isogram, so we return `true`.

#### An Alternate Algorithm

Because the `isIsogram()` function uses a `for...in` loop, the solution isn't optimally elegant. We had to introduce the `lastLetter` variable to store the prior letter for comparison. Also, that type of loop always iterates over every element, which means the first iteration is always pointlessly comparing the first letter to `null`, which will never match. In this case, using a plain ol' `for` loop can be slightly more efficient:

```dart
bool isIsogram(String word) {
  List<String> letters = word.toLowerCase().split('');

  letters.sort();

  for (int i = 1; i < letters.length; i++) {
    if (letters[i] == letters[i - 1]) {
      return false;
    }
  }

  return true;
}
```

Here, we start our iterator variable, `i`, at `1` instead of `0`. This way, the first comparison is between `letters[1]` and `letters[1 - 1]` (or `letters[0]`), the current letter and the prior letter in the word. The loops starts on the second letter of the word and compares it to the first, then the following iteration compares the next two, and so on, until every pair has been compared.

#### Play With It!

If any of the logic in this code seems confusing or hard to follow, try inserting a few `print()` calls to help you understand what's going on. Print variables before and after they're changed, print what's going on in the loop, and print `i`. If you can see the state of variables as they're examined and mutated, the process may become clearer to you.