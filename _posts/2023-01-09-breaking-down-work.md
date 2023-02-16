---
layout: post
tags: problem-solving
---

Every so often, I come across Merge Request that slowly grow in size. They start out as 100 lines of code change, then 20 commits later it’s 500 lines long! This is a symptom of poor planning and task break down.

**Each Merge Request should do one small thing that your team can build upon once merged.**  This makes it easier to review, faster to merge, and allows people to work in parallel. It has a bit of up front cost, but in my experience, it often saves time in the long run.

Consider breaking down each task into the following Merge Requests (in order):

1. Migrations and basic tests (associations, validations)
2. Model enhancements and tests (helper methods like `user.full_name`)
3. Services and first set of integration tests
4. Workers and minimal integration tests
5. Final Integration and tests (Additional Services, Controllers, Request specs, etc.)
6. User Interface
7. Refactoring, if time permits. Otherwise these are tech debt tickets for a later sprint

Of course each task is different and you may not need all of these. Three or more Merge Request are often easier and faster to merge than one large one. Also, you could break these down further, for example, 2 migration Merge Requests and 3 model Merge Requests, etc.

NOTE: **You should be refactoring as you go but don’t go over your time budget!**

If you get to step 5 and think of a way to refactor the code, save it for step 7. Refactoring should not change behaviour so it can be done once the feature is fully functioning.

If you need to change behaviour, perhaps you need to spend more time with upfront planning and sharing this plan with other senior engineers who have context and are good at breaking down work.
