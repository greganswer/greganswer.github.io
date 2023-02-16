---
layout: post
tags: math debugging time-management problem-solving personal-favorite
title: Y equals f of x
---

We're going to talk about a little bit of math and why it's important for designing and debugging code. `y = f(x)` is commonly referred to as a "functional notation”. It is a mathematical equation that represents a relationship between two variables, `x` and `y`.

Think of `x` as the input, and `y` as the output. The function `f` takes in the input `x`, processes it in some way, and then produces an output, represented by `y`.

I chose to display it as `y = f(x)` instead of `f(x) = y` because I wanted to emphasize the output of the function. As a *“user-centric”* and *“product-centric”* developer I prefer to focus on outputs and desired behaviour.

Why is this important for designing and debugging? **We often over complicate things, especially while designing and debugging code.**

This can lead us in the wrong direction. Best case scenario, we waste time and start over. Worst case scenario we end up designing or fixing the wrong thing. The simplicity of `y = f(x)` can help guide us back in the right direction.

For designing, consider the following:

1. **What’s the big picture `y = f(x)`?** We need to know the expected inputs and outputs before we can design the code.
2. **How can we document this?** What’s simplest way that we can show `y = f(x)` to users and stakeholders so they can verify that the system is working as expected? Rely on diagrams, screenshots, and videos.
3. **How do we design this?** By using `y = f(x)` functional notation, we can break down complex algorithms into smaller, more manageable parts that can be tested and debugged more easily.

For debugging, consider the following:

1. If the output `y` is correct, the function `f` and the input `x` don’t really matter. The **user is getting the desired behaviour.**
2. If the output `y` is incorrect, the first thing you should check the input `x`. In my experience, 80% of the time the input is incorrect. **User error.** Can’t blame the code.
3. If the input `x` is correct, then the problem lies in the function `f`. If you’re unfamiliar with this code, this will require a **deep dive, line by line.**

### Real Life Example

Recently a coworker, let’s call him John, was trying to determine why a subset of users were getting orders with the wrong line item. Fortunately the products were correct, so there was no harm to the user experience.

John spent an hour or so looking through some of the obvious things but couldn’t figure out why the wrong line items were being set.

This particular bug was isolated to a class with one of the most complex and important pieces of logic. I told John he needs to “unit test the class” with production data and I offered to pair with him to debug this. This is the `y = f(x)` I was talking about.

When I paired with John, I walked through the class from the entry point function, and through all the private functions.

I used production inputs and ran each function in the terminal with these inputs to see their output. For each function, I described the expected behaviour to John, then I documented it’s inputs and outputs in the Jira ticket.

About 5 functions in, we encountered a function that neither of us were familiar with. It also needed information about the user, which none of the other functions needed.

We ran it with the user input from production and it return the value that was causing the bug. It turns out the user’s previous orders can affected which line items they would receive on their next order.

**Neither one of us would have figured this out with our existing knowledge. It was necessary to go deep in order to first understand, then identify what was happening.**

This reminds me why it's important to **time box debugging sessions.** I use 15 minute Pomodors. Depending on your knowledge of the codebase, you can set a time box of 2-4 Pomodoros to find the bug “quickly”.

For me this works 8 times out of 10. The other 2 times out of 10, I’ll have to grab a pair programmer and/or run the code line by line to understand what’s happening.

Part of the reason why I consistently think of code in the form of `y = f(x)` is because I spend a lot of time doing Leetcode questions. This has helped me see every problem as just a set of smaller problems consisting of different inputs and outputs. A deeper discussion for another time.

### Lessons

- Use the `y = f(x)` functional notation mental model to help with designing and debugging code
- Time-box your "quick" debugging sessions and then switch to "long" debugging sessions (with a pair when possible)
- Be prepared to read code line-by-line when necessary


## Series

1. Y equals f of x *(current)*
1. [Functional mental model for design]({% post_url 2023-02-15-functional-mental-model-for-design %})
