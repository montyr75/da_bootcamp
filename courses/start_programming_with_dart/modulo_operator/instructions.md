Once again, it's time to see how all these esoteric concepts you're absorbing can be used to produce something of use. This exercise is a trifle, of course, but Rome wasn't built in a day, after all.

#### Even or Odd
In this exercise, you'll write some Dart code to determine whether a number is even or odd. Now, you might be wondering why you'd ask a computer to do something you can easily do yourself (assuming you've had schooling equivalent to Kindergarten in the U.S.). You need to remember that you won't always be around when your program is examining data, and your program may need to determine whether hundreds or thousands of numbers are even/odd. This is useful, for example, in creating a striped table, one with every other row highlighted.

One of the easiest ways to make the even/odd distinction is using a multiplicative operator not yet introduced in this course: _modulo_. This operator is meant to return the remainder of an integer division.

#### Modulo Examples

```dart
void main() {
  print(10 % 5);
  print(11 % 5);
  print(13 % 8);
}
```

As mentioned earlier, the modulo operator (`%`) is like the division operator, but instead of returning the quotient, it returns the remainder. Run the above code snippet in the DartPad editor and examine the results. Because 5 divides evenly into 10, the modulus is 0, but dividing 11 by 5 leaves a remainder of 1.

#### Solving the Problem
How can you use the modulo operator to determine a number's parity? Like this:

```dart
void main() {
  int number = 7;
  String parity;
  
  if (number % 2 == 0) {
    parity = "even";
  } else {
    parity = "odd";
  }
  
  print("The number $number is $parity.");
}
```

Using a bit of math, an `if` statement, and some boolean logic, the problem is brought low. Any number that leaves no remainder when divided by 2 is even.

#### Out of the Box

This is a great time to bring up a habit you should cultivate as a new programmer. Whenever you find you need to solve a problem like determining the parity of a number, you might wonder if someone has already solved it. Solutions to common problems can often be found right in Dart's core libraries, or at least in an available third-party package. 

It turns out that Dart's integer variables have *getters* (special types of functions) defined for them that can tell you their parity. You can access these getters using the dot (`.`) operator, and they return a boolean value. They're accessible both on integer variables and integer literals (like `118` in the example below):

```dart
void main() {
  int number = 7;

  print(number.isEven);   // false
  print(number.isOdd);    // true
  print(118.isEven);      // true
}
```



#### Always be Playing
Be sure to try numbers other than 7. What's the parity of 0? What about negative numbers?