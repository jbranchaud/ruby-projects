# Find PI to the Nth Digit

Enter a number and have the program generate PI up to that many decimal places.

Keep a limit to how far the program will go.

## Solution

You can view the solution in
[`lib/find_pi.rb`](https://github.com/jbranchaud/ruby-projects/blob/master/Numbers/find_pi/lib/find_pi.rb).

You can run the solution with rake like so:

    rake

Or directly with ruby like so:

    ruby ./lib/find_pi.rb

## Tests

    $ ./find-pi.rb 1
    $ 3.1

    $ ./find-pi.rb 2
    $ 3.14

    $ ./find-pi.rb 17
    $ 3.14159265358979323

    $ ./find-pi.rb 0
    $ 3

    $ ./find-pi.rb -3
    $ error: no negative numbers

    # ./find-pi.rb 10001
    $ error: too big, not gonna do that to your CPU

## Resources

- [Similar problem and some solutions in
  Ruby](http://rubyquiz.strd6.com/quizzes/202-digits-of-pi)
- [High precision solution in Python using Machin
  formula](http://en.literateprograms.org/Pi_with_Machin%27s_formula_(Python\))
