# Fibonacci Sequence

Enter a number, `N`, and have the program generate the Fibonacci sequence to Nth number.

## Solution

You can view the solution in
[`lib/fibonacci.rb`](https://github.com/jbranchaud/ruby-projects/blob/master/Numbers/fibonacci/lib/fibonacci.rb)

You can run the solution with rake like so:

    rake

Or directly with ruby like so:

    ruby ./lib/fibonacci.rb

## Tests

    $ fib(0) => 0

    $ fib(1) => 0,1

    $ fib(2) => 0,1,1

    $ fib(13) => 0,1,1,2,3,5,8,13,21,34,55,89,144

    $ fib(-2) => yo, no negatives

    $ fib(10**999) => oooh, too many
