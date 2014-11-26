# Review

## Startup

App installed cleanly and ran.  Thanks.

## Design

App looks really cool.  Good design choices.

## Core Function

I was able to log in and create an account. I was able to pick a song from
soundcloud (good API integration) but I was unable to leave a note.  It strikes
me that this is the sort of thing that test are designed to catch.

Also I can't really seem to create an entry, the redirect doesn't work, the
`/entries` route doesn't seem to actually show any entries.  I'm confused about
why we're not following RESTful expectations.

Speaking of tests....

## Tests

For an app that's ostensibly "TDD" you only have 7 tests.  That's surprising.
Your controller tests _do_ test the basic CRUDability of Entry, but there's not
too much more than that.  This feels a little bit light to me.

## Models

Not much to talk about really.  No tests.  Not housing any interesting work.
Based on this, why even bother creating the factories?

## Controllers

Skinny, but there's clearly a gotcha around that horrible query.

## Views

Good, but that whole User.new thing is very unusual, see inline comments

## JS

You should really have abstracted out a class to encapsulate working with
soundcloud and getting back a single song.  Also, use of application.js was
incorrect and is a big no-no.  See comments.

## Migrations

Good use of migrations and I like that you put constraints in :) <3



