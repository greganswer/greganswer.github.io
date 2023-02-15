---
layout: post
tags: problem-solving
---

I reminded the team that it’s important to create and use your own Problem Solving Template. This should be based on your strengths and weaknesses as an engineer. I highly recommend reading chapter 1 and 8 in the book Think Like a Programmer.

At the moment, my template is RIEBOC looks like this:

```
Restate:
    - Restate the problem in my own words

Input:
    - Write all the inputs
    - len(names)=[0, 1000], len(names[i])=[1,50], names[0][i]={lowercase}

Examples:
    - Write pseuducode functions with expected inputs and outputs
        - Example: get_user(name: 'Greg') -> User{name: 'Greg',...}
    - Remember to test null, "", [], ['single item'], [1, 2, 3,...], etc.

Brute force:
    - What's the dumbest thing I can do to meet the requirements?
        - I emphasize "dumbest" because Engineers love to over-engineer

Optimization:
    - Space time complexity
    - Readability and maintainability

Components:
    - Write functions, DB columns, services, etc., required for the task
```
