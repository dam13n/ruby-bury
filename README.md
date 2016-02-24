# ruby-bury
Hash#bury and Array#bury core method additions

## Extracted from my ruby-lang post
In Matz's recent Rubyconf talk, he used this example for the new 'dig' feature coming in Ruby 2.3:

# we want this
data[:users][0][:name]

# we can do this w/o nil errors
data.dig(:users, 0, :name)
What I'm proposing is a 'bury' feature that is the opposite of 'dig' in a sense. It inserts a value at an arbitrary depth, for example:

data.bury(:users, 0, :name, 'Matz')
This will create a nested hash or an array automatically at each step if it doesn't already exist, and that can be inferred from the what the user is passing (such as a symbol or string for a hash or an integer for an array). It's similar to autovivification but more powerful!

This behavior is very common, at least in my experience, so a dry method built into Ruby would be awesome!

## Follow-up

This is an idea I had to help with a really common issue I run into. I posted it to Ruby dev forums, but it got rejected after little discussion - completely understandable. https://bugs.ruby-lang.org/issues/11747

However, I am hoping to find a solution to the issues presented; namely, how do we 'infer' or assign Array, Hash, Struct, etc. types on buries?

The overridden core classes for Hash and Array here only handle those two types. A hash hands off a bury to an Array if it encounter a nested array. Similarly, an Array hands off a bury if it encounters a non-integer or a nested hash.

I find this really useful personally already but not nearly robust enough for a Ruby feature. Hoping to hear some clever solutions to address the issues.
