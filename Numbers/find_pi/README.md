# Find PI to the Nth Digit

Enter a number and have the program generate PI up to that many decimal places.

Keep a limit to how far the program will go.

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