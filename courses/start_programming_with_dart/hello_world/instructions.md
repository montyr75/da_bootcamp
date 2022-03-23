# "Hello!"

Welcome to the first step in your journey to learning how to make the computers in your life do your bidding. Traditionally, the journey begins with a digital salutation: "Hello, World!" Greeting the world in this manner takes just a few lines of cryptic syntax:

```dart
void main() {
  print("Hello, World!");
}
```

Enter the code above, exactly as shown, into your Dart code editor, then run it. You should see the text "Hello, World!" appear in the console.

If this was your first program ever, congratulations! Already you're showing that computer who's boss. Admittedly, it's not a great program, but you have to start somewhere, right?

## The Function Junction
Let's see if we can demystify some of these crazy words and symbols:

```dart
void main() {
```

Every Dart program starts with a _function_ called `main()`. For now, you don't need to worry too much about what that means, but in short, a function defines a block of code statements that the computer executes when it is "called" by its name. Since `main()` is Dart's standard entry point, it is called automatically when you run the program.

Functions can take _input_ (data going in), and they can produce _output_ (data going out). The empty parentheses attached to the function's name indicate that it's expecting no input, while the `void` keyword tells Dart that `main()` will produce no output.

Like a good story, every function has a beginning, a middle, and an end. Opening and closing curly braces denote the beginning and end of a function. You've probably wondered for years why your computer keyboard even _has_ those keys. Well, now you know. Between the curly braces, you place the instructions you want the computer to follow when your function is executed.

## Putting Things on the Screen
The `main()` function has only one instruction statement in its _body_:

```dart
print("Hello, World!");
```

Notice that this line is indented two spaces. By convention, indentation is used in Dart code to make the hierarchy apparent. For the most part, whitespace of all kinds (spaces, newlines, etc.) is ignored by the Dart interpreter, but as humans, we use it to make relationships clear. The call to the `print()` function _belongs_ to the `main()` function.

The `print()` function is defined in Dart's core library, available to all Dart programs. Like your `main()` function, it returns no values (produces no code output), but it does expect input. The input should take the form of a _string_. A string is a series of characters strung together (a string of characters), delineated by quotes. Of course, in this case, you're sending the characters that make up the sentence "Hello, World!" to the `print()` function. The `print()` function accepts the input and prints it to the system console, usually a screen.

## So _That's_ What a Semicolon is For
Because Dart ignores whitespace, you need to use a semicolon to tell the code interpreter where your statement ends. If you forget the semicolon, the interpreter will get confused, and it may even complain to you. Try deleting the semicolon in your code editor. You should see an error appear. Correct the problem and the editor settles back into a blissful homeostasis.

## Time to Play
Now, take a minute to play around with this code. Change the string of characters you're sending to `print()`. You can even make it say naughty things, if you want to. I know you're dying to try that. I'll close my eyes while you experiment.