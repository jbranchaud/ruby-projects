# Caesar cipher

Implement a Caesar cipher, both encoding and decoding. The key is an integer from 1 to 26. This cipher rotates the letters of the alphabet (A to Z). The encoding replaces each letter with the 1st to 26th next letter in the alphabet (wrapping Z to A). So key 2 encrypts "HI" to "JK", but key 20 encrypts "HI" to "BC". This simple "monoalphabetic substitution cipher" provides almost no security, because an attacker who has the encoded message can either use frequency analysis to guess the key, or just try all 26 keys.

## Usage

ruby ./lib/caesar_cipher.rb [-e|-d] [-o output] num filename

The default functionality is to encode the given file using the given encode
number. Thus,

    ruby ./lib/caesar_cipher.rb 11 test.txt

will by default encode `test.txt` with an offset of `11`. The output file,
`test.txt.cc`, can be decoded using the value of `11`.

To explicitly invoke the encode functionality, use the `-e` or `--encode`
command line argument, like so:

    ruby ./lib/caesar_cipher.rb -e 11 test.txt

To decode an encoded file, use either the `-d` or `--decode` command line
arguments along with the number it was encoded with and the encoded filename,
like so:

    ruby ./lib/caesar_cipher.rb -d 11 test.txt.cc

Use the `-o` option to specify a name for the output file. This is optional
and if not used, a default name based on the input file will be used.

    ruby ./lib/caesar_cipher.rb -o decoded.txt -d encoded.txt

## Solution

You can view the solution in
[`lib/caesar_cipher.rb`](https://github.com/jbranchaud/ruby-projects/blob/master/security/caesar_cipher/lib/caesar_cipher.rb)

Or directly with ruby like so:

    ruby ./lib/caesar_cipher.rb <num> <filename>

See the Usage section for more details on running the program and the
command line arguments that are available.
