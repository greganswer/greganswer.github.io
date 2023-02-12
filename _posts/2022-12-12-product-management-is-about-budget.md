---
layout: post
tags: product-management tech-debt time-management personal-favorite
---

Those of you who’ve done freelancing will know if you say to the client *“Feature X will take 3 weeks at $1,000 a week… that’ll be $3,000 plus tax”* they’re going to have a fit. *“We want it cheaper, faster, blah blah blah…”* **Think of it from the client’s perspective. $3K is a lot!** For one feature. And we don’t even know if they’ll get that $3K back. They’ve got other things that might take priority and get that money instead. Now imagine someone else walked in and said, *“I can do a $600 version for you in 3 days and if need be, I can spend another 7 days and enhance it for another $1,400. That’d be 10 days and $2,000 plus tax.”* Who you gonna work with (all other things equal)?

As engineers, we complain that we don’t get to do tech debt. That’s often because we’re already over budget. If we always offer a short, mid, and long term approach, the product manager can work with the time budget and manage stakeholder expectations. Moving forward, I’m going to do my best to avoid working on tech debt unless:

**(A)** We’ve finished the latest project, under budget

**(B)** The tech debt is a blocker/inconvenience to an upcoming project

I believe that 80-90% of the tech debt tickets I’ve ever created on any project will never be worth doing. Maybe even 90%, but that’s another story for another time. You can search Jira for countless examples of my closed tickets and my open tickets that should be closed.

Here’s an example of a “simple” tech debt that was not worth doing. There was a class attribute that had a singular name because it initially returned a single string. It was later changed to return an array of strings. I wrote a tech debt ticket to rename it and fix all the tests.

I initially thought it would take 20-60 minutes to update all references using RubyMine’s advanced, context-aware “find and replace”. Simply run the tests and update as necessary right? Wrong!

3 months later, this ticketed ended being given to another team. There was some back and forth conversation. The developer had issues. I tried to get it to work on my local machine but it kept failing. After I spent at least 2 hours (1 hour in different synchronous/asynchronous conversations before implementation and 1 hour trying for myself), I threw in the towel because this small tech debt was not worth the effort. Not to mention if there’s any pipeline failures during deployment. I told the dev to stop working on it and I closed the ticket. I could have just spent 2 minutes adding a comment like, *“Hey there, there could be one or more of these. Be careful.”* And no one even ran in to this issue as far as I know!

2 Product Managers and 2 devs had to talk about this and try to make this work before giving up. How did any of this benefit the end user? How did the company increase profit or reduce expense from this? Who’s going to pay for this wasted effort? If there was a benefit, it would have been worth the time and money but there was no benefit as far as I saw. Feel free to spend your time looking for more examples like this if it helps drive the point home.

**Each Tech Debt should represent a genuine opportunity/threat for the business and should be prioritized accordingly.** This is not to say, “Don’t do tech debt”. This is so important it bears repeating. Moving forward, I’m going to do my best to avoid working on tech debt unless:

**(A)** We’ve finished the latest project, under budget

**(B)** The tech debt is a blocker/inconvenience to an upcoming project (opportunity/threat)

So before we spend too much time on something, we should ask ourselves, *“Who’s paying for this, how much will it cost, and what’s the return on investment?”* I’m definitely open to feedback on this perspective.
