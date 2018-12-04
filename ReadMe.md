## automatically commit a file every n seconds

I wrote this in order to automatically post a script as it's being
develop, in a live-coding workshop.

Run like:

    autocommit.rb [filename] [n]

where `filename` is the file to repeatedly commit and push
and `n` is the number of seconds to delay between attempts.
If `n` is missing, we use 10 sec; if `n`<2 we use 2.

You need to be in the git repository that contains the file,
and you need to have already set up a remote.
