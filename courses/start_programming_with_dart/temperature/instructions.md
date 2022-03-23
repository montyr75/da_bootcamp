# Converting Temperatures

Are you ready to put some of these tools you've learned into practice? Up to now, you've learned a lot about variables and operators. Now it's time to see what can be done with all that stuff.

## Temperature Conversion
We've talked about computers and their mathematical competence, and now we'll see some of that in action. The United States is advanced in so many ways, but when it comes to systems of measurement, the nation is inexplicably living in the past. The wiser countries of the world have moved away from Imperial units and on to the metric system. Similarly, the U.S. defiantly continues to use the Fahrenheit scale for temperature measurement.

> **Note:** The American scientific community has left the laymen behind in this regard. It is only the general public who make regular use of these archaic systems.

Because there are so many different scales to represent the same things, it's often necessary to convert values between them. To convert temperatures from Fahrenheit to Celsius and back again, these complementary formulas can be used:

```dart
F = 1.8C + 32
C = (F – 32) / 1.8
```

You'll need to convert these mathematical formulas to Dart syntax before the computer will be able to perform the calculations. (`1.8C` implies multiplication in math, but Dart doesn't see it that way.)

```dart
void main() {
  // input values
  double f = 32;
  double c = 100;
  
  // convert
  double convertedC = (f - 32) / 1.8;
  double convertedF = 1.8 * c + 32;
  
  // output
  print("$f degrees Fahrenheit is $convertedC degrees Celsius.");
  print("$c degrees Celsius is $convertedF degrees Fahrenheit.");
}
```

### Analysis
In this case, it's best to declare the variables as type `double` since the input and converted values might contain decimals.

The program would be somewhat more useful if the values of `f` and `c` came from the user, but accepting user input will be addressed in a later lesson.

Notice that in the first conversion expression, `(f - 32) / 1.8`, parentheses are used to insure the calculations will be performed in the correct order. Multiplicative operations, such as division, normally have precedence over additive operations, like subtraction. This is not necessary in the other conversion.

## Extra Points
Play around with different input values to get different results. For extra practice, see if you can add another conversion type, perhaps to the Kelvin scale.