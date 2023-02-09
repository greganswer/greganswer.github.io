---
layout: post
tags: problem-solving
---

I reminded the team that it’s important to create and use your own Problem Solving Template. This should be based on your strengths and weaknesses as an engineer. I highly recommend reading chapter 1 and 8 in the book Think Like a Programmer.

At the moment, my template is RIEBOC looks like this:

```
restate:
    - Restate the problem in my own words
input:
    - Write all the inputs
    - Ex: len(names)=[0, 1000], len(names[i])=[1,50], names[0][i]={UTF-8 characters}
examples:
    - Write out pseuducode functions with example inputs and expected outputs
        - Example: get_user(name: 'Greg') -> User{name: 'Greg',...}
    - Always remember to test null, "", [], ['single item'], [1, 2, 3,...], etc.
brute force:
    - What's the dumbest and fastest thing I can do to meet the requirements?
        - I emphasize "dumbest" because Engineers love to over-engineer
optimization:
    - Space time complexity
    - Readability and maintainability
components:
    - Write out functions, DB columns, services, etc., required to complete the task
```
