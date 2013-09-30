dotrepo
=======

finally setting up a repository for my dotfiles.

my profile is a mess; i had carried forward so much junk from old old linux (and bsd) boxes that it was just silly. i cut out a lot of it and there's probably still stuff in here that does nothing on Mac OS or modern Linux installations. but hey, it's here. and i'm syncing it to everywhere i want to have a prompt. so it's a place to start.

this assumes you have a file in your home dir called ".profile" of course, and that will check for and source this. this should be the sum contents of your local .profile:
```
if [ -f ~/.dotrepo/profile ]; then
    source ~/.dotrepo/profile
fi
```
whereas i put this repo into .dotrepo on all my shells.

this profile also checks if you have a file in your user dir called .dotlocal and sources it. that's where you can put private things that shouldn't be in a public repository.

also i keep saying "you" when i really mean "me."

 - mike
