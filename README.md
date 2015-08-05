# jda-misc-scripts
Miscellaneous scripts I've written

I was motivated to write the yargs script after annoyances with xargs.
I started looking through the xargs C source, and decided that for the
kind of uses I put xargs to, I was better rewriting it in python3.
One major advantage, especially with typical GNU utilities, is that
if you write a simple alternative tool yourself, you won't get caught
out either by strange switches you weren't aware of (and let's face it,
who reads every man page from beginning to end?)

Sometimes I want a simple shorthand. Bash functions are nice (and
faster often due to not having to fork()+exec()+etc) but often
when it is commands I type myself, this doesn't matter. The problem
with functions is that (for good reason) they don't get passed to 
something run under another user id via sudo. That and when using
tools like watch, the commnd line to run must be something that works
when stuck through execvp(...), so can't use bash functions or aliases.

Thus I end up just writing one liners in bash script, or short bits
of python.

On my machines I make my own directory /usr/jda
and in it have a bin/ lib/ etc.
Then there is a script in /etc/profile.d/early
to ensure these are in the path.
I modify /etc/profile to run stuff in /etc/profile.d/early first
(before anything else) for stuff like this, so that for other scripts
(and especially stuff like bashrc) these are guarnateed already to
have run.



The listed license is GPLv3, but, seriously, if you want the code under
any other license, given the ease of writing your own version from scratch,
I would suggest that you do exactly that: write your own version and stick
it under whatever license you like. If you really can't be bothered, then
I can't be bothered to give you a version under a different license.

