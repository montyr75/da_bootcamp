

The term "operator" is taken from mathematics, but in a programming language, its meaning is slightly different. In math, an operator is symbolic and abstract. In Dart, operators instruct the computer to perform operations on operands. An operand is any value upon which an operation is to be carried out.

#### Your Assignment
If you've completed the previous lessons in this series, you've already been using one of Dart's operators: the assignment operator, or `=`. As already discussed, that symbol signifies equivalence in mathematics, but Dart uses it to assign values to a location in computer memory.

```dart
x = 5;
```

The above expression instructs Dart to take the value `5` and store it at location `x`. When that line of code is executed, that's exactly what Dart does.

#### Add It Up

```dart
5 + 5;
```

That line instructs the computer to add the two operands together, producing the answer, `10`.

Try it:

```dart
void main() {
  5 + 5;
}
```

This is a valid program, and if executed, an answer will be generated, but since you haven't instructed the computer to print anything to the console, you never see the result.

```dart
void main() {
  print(5 + 5);
}
```

Better! Now you see that the math was done and the answer is displayed. Used in this context, `+` is an arithmetic operator. It's important to note, though, that context is key. Combining `+` with numeric operands tells Dart to perform the familiar addition operation. With operands of another type, the operator may function differently.

#### What About Strings?

```dart
void main() {
  print("John" + "Smith");
}
```

This code may look a little strange to you if you expect `+` to signify addition, but remember that even in written English, these kinds of symbols can take on different meanings in new contexts:

![Ned + Trudy](https://i.imgur.com/kkPKfpe.png)

On the tree, the symbol is meant to stand in for the word "and," or possibly a more abstract concept, such as suggesting Ned's and Trudy's lives are joined. The point is that "Ned + Trudy" doesn't invite you to add the value of "Ned" to the value of "Trudy" in a mathematical sense. You know from context that the meaning is different here.

Running the last code snippet will produce the following output:

```
JohnSmith
```

#### Better with Spaces
What's happened here? With `String` operands, the `+` operator _concatenates_ the values, producing a new string containing all the characters. The second string is appended to the first. Of course, it's a bit awkward that this man's first and last names have been concatenated without a space, so go ahead and fix that:

```dart
void main() {
  print("John " + "Smith");
  print("John" + " Smith");
  print("John" + " " + "Smith");
}
```

Demonstrated here are three of many possible solutions to the problem. You could add the space into only the first or second string, or you could use two `+` operators to concatenate three `String` operands, one of which contains only a space.

There are a number of other ways this could be done, but I wanted to point out here that programming solutions are many and varied. Any solution that produces the desired output is "correct," but do remember that every solution falls somewhere on a subjective spectrum of elegance.

#### Make a Comment
Before moving on to more operators, I want to interject one concept that will assist us as we move forward. Try it out with the following code:

```dart
void main() {
  print("John" + " " + "Smith");  // concatenation
}
```

Running this code prints `John Smith`, as expected. Whenever Dart encounters the double-slash syntax (`//`), it ignores everything from there until the next line break. This is known as a _comment_. Comments are useful for documenting sections of code for humans. They are stripped out of the code before execution.

#### Arithmetic
Now, some more arithmetic operators:

```dart
void main() {
  print(5 + 7);          // addition
  print(10 - 8);         // subtraction
  print(8 * 8);          // multiplication
  print(10 / 5);         // division
}
```

These operators do exactly what you'd expect. Check the answers. Go ahead. Computers are pretty good at math, it turns out.

#### Order of Operations
Fortunately, Dart's operator precedence rules pretty much match what you learned in math class. Anything in parentheses is evaluated first, and inside or outside parentheses, multiplicative operations (`*`, `/`)  are resolved, followed by additive operations (`+`, `-`). Whenever two operators have the same precedence, they are evaluated in order from left to right.

```dart
void main() {
  print((5 * 5) + 5);    // 30
  print(5 * (5 + 5));    // 50
  print(7 - 4 / 2);      // 5
  print(6 * 2 + 4);      // 16
}
```

#### Use the Variables
While you may occasionally do some calculations on number literals, like those in the code snippet above, it's much more common to do so with variables:

```dart
void main() {
  int x = 7;
  int y = 5;
  int product = x * y;
  
  print(product);
}
```

Here, the values stored at location `x` and `y` are multiplied, and the answer is stored in `product`. You check the value of `product` with the `print()` function.

#### One More or Less
Now that variables are back in the picture, you can be introduced to a couple of operators that are common in programming languages, but that you never saw in your math book. Another thing that computers are great at is counting, and this is something you'll ask them to do so often, there are dedicated operators for the task.

```dart
void main() {
  int x = 0;
  print(x);
  
  x++;
  print(x);
  
  x--;
  print(x);
}
```

This code will declare a new integer variable called `x`, initialize it to `0`, then print the value to the console. Next, you use the increment operator (`++`) to add 1 to `x`, then print the value again. Last, you use the decrement operator (`--`) to subtract 1 from `x`, which takes its value back down to `0`.

#### Incremental Understanding
The following two lines of code are equivalent:

```dart
x++;

x = x + 1;
```

The second code statement might look a bit strange to anyone with training in mathematics but none in programming. How can `x` be equal to `x + 1`? If `x` has the value `5`, is this thing trying to say that `5 = 5 + 1`?

Of course, it's not saying that at all. You need to remember that `=` is not used for equality. It's the assignment operator, just another operator that acts on operands, only this time with very low precedence. When Dart begins to execute that statement, it first takes the value of `x` and adds it to 1, then it assigns the result of the addition to `x`, overwriting whatever value was in it before. It happens this way because additive operators have precedence over assignment operators. The expression `x++` is syntactic shorthand for `x = x + 1`.

#### The Operators
Here are the operators discussed so far, in order of precedence:

<table>
  <tr>
    <th>Operator(s)</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>++ &nbsp;&nbsp;&dash;&dash;</td>
    <td>Increment or decrement value by 1</td>
  </tr>
  <tr>
    <td>* &nbsp;&nbsp;/</td>
    <td>Multiplicative (multiply or divide)</td>
  </tr>
  <tr>
    <td>+ &nbsp;&nbsp;-</td>
    <td>Additive (add or subtract)</td>
  </tr>
  <tr>
    <td>=</td>
    <td>Assignment</td>
  </tr>
</table>
