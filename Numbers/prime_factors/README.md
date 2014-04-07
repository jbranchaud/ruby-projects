# Prime Factorization

Have the user enter a number and find all Prime Factors (if there are any) and display them.

## Solution

You can view the solution in
[`lib/prime_factors.rb`](https://github.com/jbranchaud/ruby-projects/blob/master/Numbers/prime_factors/lib/prime_factors.rb)

You can run the solution with rake like so:

    rake

Or directly with ruby like so:

    ruby ./lib/prime_factors.rb

## Tests

    $ prime_factors(2) => 2

    $ prime_factors(3) => 3

    $ prime_factors(4) => 2,2

    $ prime_factors(44) => 2,2,11

    $ prime_factors(360) => 2,2,2,3,3,5

    $ prime_factors(1) => # nothing, must use value greater than 1

    $ prime_factors(0) => # nothing, must use value greater than 1

    $ prime_factors(390) => 2,3,5,13
