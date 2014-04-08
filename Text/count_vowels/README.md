# Count Vowels

Enter a string and the program counts the number of vowels in the text.

## Extensions

- For added complexity have it report a sum of each vowel found.
- Prompt the user to input a file name instead of a string and count the
  vowels in that file.

## Solution

You can view the solution in
[`lib/count_vowels.rb`](https://github.com/jbranchaud/ruby-projects/blob/master/text/count_vowels/lib/count_vowels.rb)

You can run the solution with rake like so:

    rake

Or directly with ruby like so:

    ruby ./lib/count_vowels.rb

## Tests

    "a" =>  1,
    "b" =>  0,
    "abcdefg" =>  2,
    "hello, world" =>  3,
    "this is a long sentence with lots of words and letters in it." =>  16,
    ".,/'()" =>  0
