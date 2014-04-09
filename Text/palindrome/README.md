# Palindrome

Checks if the string entered by the user is a palindrome. That is if it reads the same forwards and backwards, for example “racecar”.

## Extensions

- Read the first line from a given file and check if it is a palindrome.
- If the given input isn't a palindrome, find the largest substring that is
  a palindrome.
- Find all substring palindromes in the given input.

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
