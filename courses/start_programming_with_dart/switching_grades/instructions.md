# Switching Grades

You might still be wondering when it's best to use `if` and `else` or `switch` to solve your problems. Even if you're not, listen up! This little exercise will demonstrate a way to use them both together.

## Making the Grade
Suppose you're a teacher, and you bear the awesome responsibility of assigning a letter grade to your students based on a numeric score. The table below illustrates the rules:

<table>
  <tr>
    <th>Score</th>
    <th>Grade</th>
  </tr>
  <tr>
    <td>90-100</td>
    <td>A</td>
  </tr>
  <tr>
    <td>80-89</td>
    <td>B</td>
  </tr>
  <tr>
    <td>70-79</td>
    <td>C</td>
  </tr>
  <tr>
    <td>60-69</td>
    <td>D</td>
  </tr>
  <tr>
    <td>0-59</td>
    <td>F</td>
  </tr>
</table>

Furthermore, once a letter grade is assigned, you'd like to automatically produce a descriptive rating, useful for making the student feel terrible, mediocre, or extraordinary, as their performance dictates:

<table>
  <tr>
    <th>Grade</th>
    <th>Rating</th>
  </tr>
  <tr>
    <td>A</td>
    <td>Excellent</td>
  </tr>
  <tr>
    <td>B</td>
    <td>Good</td>
  </tr>
  <tr>
    <td>C</td>
    <td>Average</td>
  </tr>
  <tr>
    <td>D</td>
    <td>Deficient</td>
  </tr>
  <tr>
    <td>F</td>
    <td>Failing</td>
  </tr>
</table>

### Switch? If? Or both?
For assigning the grade, a `switch` statement would be cumbersome. Some languages support ranges of numbers in a `case`, but sadly, Dart is not one of them. That means you'd need 11 `case` lines just to handle assigning a student an A grade (one for each value from 90 to 100). With `if`, on the other hand, you could nab all those values with one boolean expression: `grade >= 90`.

There are only five letter grades, though, so assigning a descriptive rating is a perfect scenario for a `switch`.

### Grade Assignment
Let's start with assigning a letter grade:

```dart
void main() {
  int score = 78;
  String grade;
  
  if (score >= 90) {
    grade = "A";
  } else if (score >= 80) {
    grade = "B";
  } else if (score >= 70) {
    grade = "C";
  } else if (score >= 60) {
    grade = "D";
  } else {
    grade = "F";
  }
  
  print("Score: $score");
  print("Grade: $grade");
}
```

Looking good. The `if` statement is great for acting on a result within a broad range.

### Rating
A `switch` statement might be the perfect thing for applying a rating to the grade. Add the following code to your `main()` function, below the `print()` calls, but above the `main()` function's closing brace:

```dart
String rating;
  
switch (grade) {
  case "A": rating = "Excellent"; break;
  case "B": rating = "Good"; break;
  case "C": rating = "Average"; break;
  case "D": rating = "Deficient"; break;
  case "F": rating = "Failing"; break;
  default: rating = "ERROR: Invalid grade.";
}

print("Rating: $rating");
```

You create a variable in which to store one of the five possible ratings, then assign a rating to that based on the letter grade. Note that even though we know `grade` will never have an invalid value in this code, we need to include the `default` clause to assuage Dart's concerns about accessing an uninitialized variable.

## You Can Do Better
Not satisfied with your C grade? Bump it up! Or maybe you're a dunce, you never study, and "Deficient" is the best you'll ever be. Play with different score values. What happens with a score of 105? How about -15? Or 88?