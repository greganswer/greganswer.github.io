---
layout: post
tags: test-driven-development time-management personal-favorite
---

Note the order. Red, then Green, then Refactor. Those of you who practice Test Driven Development will deeply understand the importance of this mantra for the three phases of development. I’d like to take it a step further and explain examples of not following the order or spending too much time in the wrong phase.

Often times I see discussion on Merge Request that are mostly about refactoring. I appreciate when people say something like “Optional” or “Non-blocking”.

The issue is when the author feels compelled to address the issues right now. I’d like to break down my perspective of Red, Green, Refactor and why it’s important to work in this order.

1. **Red=Specifications**
    1. Describe the behaviour of the system and the observable results
    2. Focus on the smallest testable slice of functionality
    3. Consider functional and non-functional requirements
    4. Consider edge cases, even if they’ll be handled in a separate Merge Request
2. **Green=MVP**
    1. Do the **dumbest** thing that can work and meets specifications
    2. This part should take the least amount of time, assuming you were diligent with Red
    3. Only the market will tell you if this is truly “Green” (Desirable)
    4. The more time you spend with “Red”, the less time you should *need* in “Green”
3. **Refactor=Black hole of infinite possibility**
    1. Rename things (classes, functions, variables)
    2. Restructure things (folders, files, order of operations that don’t cause tests to fail)
    3. [INSERT_DESIGN_PATTERN_HERE]
    4. Improve performance while maintaining behaviour*
    5. Anything else that makes engineers excited, while forgetting about deadlines and customer impact
    6. The less time you spend in “Red” and “Green”, the more time you *have* in “Refactor”

Red and Green are deterministic. We can agree with the customer and Product Manager on the Minimal Viable Product (MVP) and use this to control the scope. Only the market will tell you if this is truly “Green”. This needs to be repeated.

**Only the market will tell you if this is truly “Green”.**  If users don’t like it, you need to go back to “Red” and try something different. **How would you feel if you spent several days refactoring something that users don’t even like?**

I put an asterisk beside *“Improve performance while maintaining behaviour”* because if your “bad performance” is causing you to loose customers then I think it should be part of the “Green” MVP. It’s a non-functional **requirement**, meaning it is **necessary**.

Otherwise, it’s over-engineering while forgetting about customers and business. If users tell you it’s bad performance, then it’s bad performance. If your monthly AWS bill tells you it’s bad performance, then it’s bad performance. Otherwise, leave it alone.

Refactoring is important for maintaining code, but you don’t need to do it now. You can create a tech debt ticket to address it later.

I can hear all the engineers saying, *“But we never get to tech debt!”* If you’re given 2 weeks to complete something and you get to Green in 2 days, then you have a week and a half to Refactor.

If you spend a week and a half thinking about all the crazy ways you can make it, now you only have 2 days to put together your sloppy code and hope for the best. One way is intentional, the other is haphazard.

If you’re only given 2 days, now you need to reduce scope in order to have a similar ratio of time in each of the Red, Green, Refactor phases.

Another important distinction is micro refactor versus macro refactor.

A micro refactor would be something like “extract method”. This should be done almost immediately after reaching Green and even committing the changes.

I love this [Catalog of Refactoring](https://refactoring.guru/refactoring/catalog) and I use many of the “extract” refactorings intuitively now. When you do these doesn’t matter but don’t wait too long and don’t spend too much time.

A macro refactor is something like modify code structure to design pattern. This should wait until the whole Merge Request is Green. Anything before that is a distraction that could make you miss the deadline or worse, miss the opportunity to find out if this is even what the customer wants. This can even wait till a separate Merge Request.

I know making perfect code is exciting but **this is not what customers pay for**. We don’t want to spend too much time in this area while opportunities pass us by.
