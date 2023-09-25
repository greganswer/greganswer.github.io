---
layout: post
date: 2023-09-24 12:05:00
tags: product-management test-driven-development
---

I was working on ticket recently with a simple-looking front end change. There was a screenshot of the expected output. Modifying React code is rarely simple but that's topic for another time. I spent about 1 day on this.

I showed it to my co-worker and they told me I was missing a subtle change. I stared at the screenshot very carefully, scratched my head for bit, and then I saw what was different. I had to rewrite the code a bit to get that change but that only took half day. And then I was done. Or was I...

Although we write unit and integration tests, nothing beats opening up an app and manually clicking around. Do I understand this feature? Is it working as expected? Are there any unexpected bugs or quirky interactions? These are best answered by following a test plan that forces you to manually walk through the app and think like a user.

I asked the team if there were some QA steps since this area of the code was recently changed. They said no. No biggie, the QA engineer will write some steps. Nope! He was busy.

Alright, time to roll up my sleeves and write some QA steps. I've done this many times, but not recently because usually the QA engineer or the whole team will write the steps together.

The next few days were interesting to say the least.

### QA steps

There's an edit page for a business critical model. There's 2 "categories" for the type of model. I put that in quotes because there's really there's 6 types but they can be simplified into 2 categories that have different behaviours.

Software engineers should be aware of the acronym CRUD, which stands for Create, Read, Update, Delete, which is the basis of all actions you would do in an application.

Also, there's a feature flag that adds new functionality to one of the "categories".

So for those of you counting, technically there's `6 types * 4 CRUD * 2 flag states = 48` different tests cases that could be executed manually to confirm that all new and existing functionality is working as expected. Ouch!

Well maybe if I group them as the 2 categories I can reduce this 16 test cases instead of 48.

In order to update or delete something in the UI, you generally have to read it first. This reduced the test cases down to 12.

I wrote out the test cases and started testing the code. Time to watch the bugs fly in!

Remember the part about React not always being simple? I had inputs that were overriding data on the back end. I had inputs that were blank even when the value was present on the back end. I even had values that I "deleted" on the front end, partially deleted on the back end, and fully showed up on the front end like nothing happened. Some of these were from the new code, others from existing code. Fun times!

While poking around on the front end I realized that you could actually add/update/delete multiple values at the same time. Oh no! Do I have to add more tests now? Nope! I just updated the tests to say something like "I add 1 value, I see the results, I add 2 values, I see the result". I repeated this for the update and delete test cases. The back end already tests this in subtle way, but it's good to be explicit with End-to-End testing.

Throughout the week, each day felt like 2 steps forward, 1 step backward. The first few days felt like a regression. I had this "feature complete" but was unable to make my own test cases pass! Everyday at standup I felt like a bum but my team was supportive. Each day I told them what test cases I wrote, what bugs I found, and they were generally impressed with the depth of my testing strategy. As a company, we're improving out testing strategy and we said that we would reuse these tests for the rest of the project and for regression testing the part of the app in general. This is why I put in the extra effort. It will not be for waste.

### Takeaways

My main takeaway is that I wish I had found or written the QA steps before I began working on the ticket. Even if the QA steps already existed, I definitely gained a deeper understanding and appreciate of the feature by writing the QA steps my self. These should come first to ensure you understand what's expected of the feature.

My secondary takeaway is the value of my [Personal Problem Solving Template](/blog/personal-problem-solving-template). Though it keeps evolving slightly, this is the foundation of software development for me. In this situation, even though some high level examples were given to me on the ticket, taking the time to explore deeper will ensure that there are little or no unexpected behaviour, as I had encountered.
