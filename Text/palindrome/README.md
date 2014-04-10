# Palindrome

Checks if the string entered by the user is a palindrome. That is if it reads the same forwards and backwards, for example “racecar”.

## Extensions

- :ballot_box_with_check: Read the first line from a given file and check if it is a palindrome.
- :ballot_box_with_check: If the given input isn't a palindrome, find the largest substring that is
  a palindrome.
- Find all substring palindromes in the given input.

## Solution

You can view the solution in
[`lib/palindrome.rb`](https://github.com/jbranchaud/ruby-projects/blob/master/text/palindrome/lib/palindrome.rb)

You can run the solution with rake like so:

    rake

Or directly with ruby like so:

    ruby ./lib/palindrome.rb

## Tests

    $ palindrome("palindrome") => false
    $ palindrome("") => true
    $ palindrome("racecar") => true
    $ palindrome("google") => false
    $ palindrome("deified") => true
    $ palindrome("amanaplanacanalpanama") => true
    $ palindrome("AManAPlanACanalPanama") => false
    $ palindrome("AMANAPLANACANALPANAMA") => true
    $ palindrome("1234567654321") => true
