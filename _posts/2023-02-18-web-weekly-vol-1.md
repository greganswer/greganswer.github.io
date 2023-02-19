---
layout: post
date: 2023-02-18 21:05:00
tags: web-weekly
title: 'Web Weekly: Vol. 1'
---

Here’s some interesting articles I found on the web this week.

## [How a single line of code brought down a half-billion euro rocket launch](https://jam.dev/blog/famous-bugs-rocket-launch)

I think the title is pretty self explanatory. Takeaways:

1. Avoid leaving “dead” code lying around
2. Remember to test upper and lower bounds of inputs.
3. Use realistic data when performance testing your code. If they had used the expected rocket speeds, they would have seen the *integer overflow error* during testing.
4. Verify your assumptions with your end user. Who authorized the *"sequence of code should run for an extra 40 seconds after the scheduled liftoff”*?

## [One common behavior seen in "mature" software engineers](https://www.luu.io/posts/mature-engineer)

A simple reminder to *“leave the camp ground cleaner than you found it”.* Also, don’t let people trip over the same stone you tripped over.

## [Visual design rules you can safely follow every time](https://anthonyhobday.com/sideprojects/saferules/)

Definitely going to use this as a reference the next time I need frontend design. Some of my favorite suggestions:

1. Use near-black and near-white instead of pure black and white
2. Use high contrast for important elements
3. Everything should be aligned with something else
4. Measurements should be mathematically related
5. Use a line length around 70 characters

## [How Levels.fyi scaled to millions of users with Google Sheets as a backend](https://www.levels.fyi/blog/scaling-to-millions-with-google-sheets.html)

Some quotes:

1. *"Our philosophy to scaling is simple, avoid premature optimization"*
2. *"The user interface can be replaced by Google Forms. The database can be replaced by Google Sheets."*

Takeaways:

1. Focus more on the product/idea fit
2. Save effort and money, until necessary
3. This could work for several months (24 months for Levels.fyi)

## [Content Delivery Network (CDN): Explained in simple words](https://levelup.gitconnected.com/content-delivery-network-cnd-explained-in-simple-words-674e971b06c3)

High level explanation about CDNs role in website performance improvements. I love the *“simple words”* the author uses to explain the concept. Summary:

1. CDN is a set of servers located geographically close to the users for accelerating the delivery of content.
2. Browsers or Mobile Apps request static data from the CDN instead of the Origin server.
3. The CDNs fetch the data from the Origin servers and cache it. The subsequent requests are served from the CDN server.
4. CDNs improve performance, reduce bandwidth consumption, and improve availability of websites.

## [The technology behind GitHub’s new code search](https://github.blog/2023-02-06-the-technology-behind-githubs-new-code-search/)

**Warning:** very nerdy read after the first few paragraphs.

1. Sometimes you just  have to build from scratch
2. System Design is an underrated skill (back of the envelop math, hardware knowledge, data structures, etc.)
