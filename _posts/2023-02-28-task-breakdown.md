---
layout: post
date: 2023-02-28 21:05:00
tags: problem-solving
title: "Task Breakdown: My Recent Reverse Planning Experience"
---

Yesterday I assigned myself a task to implement some backend logic in a microservice.

The first thing I did was plan how I was going to write it. I said to myself, *“Pretend like you were going to write this right now without checking if it works. How would you do that?”* And then I started writing code in a scratch file.

I just wrote the prototype as quickly and simply as possible. There were 6 classes that needed to be created or updated. I relied heavily on copy and paste from similar pieces of code throughout the app.

I paid close attention to questions like, *“Will this actually work? Is there any state that I need to update? Any major performance issues?”*. I was more focused on getting the idea “on paper” so to speak. Like a good artist, you need to sketch before you paint.

An hour and a half later I had a prototype of the code. I took a short break. When I returned I started creating sub-tasks based on the prototype that I made.

I looked at all the code I just wrote and started grouping related pieces together. I knew that I wanted small, single purpose Merge Requests that are easy to read and critique. I was able to break it down into 7 subtasks.

For each subtask I took the pieces of code from my prototype scratch file and placed it on the ticket. This way I had a reference of what this subtask was about without having to spend time writing a description. This project has a tight deadline so I need to fly by the seat of my pants a little bit.

I ordered these subtasks by priority and then I started working on them right away.

The way I broke down these tasks, most of them could have been done in parallel. This means that I could delegate this task to one or more people. I decided to delegate them to myself so that I can time how long each sub task took.

I like to experiment with different methodologies to see what works best with my personality. Rather than blindly accepting one way of doing things, I can explore different ways and learn about their tradeoffs.

You only know if you’re plan is good after the results so I decide to write the results first (the prototype) then write the plan after. This allowed me to see what a good plan looks like.

I didn’t worry about having all subtask created “up front”. As I thought of new sub tasks, I added them and arranged them in order. This can be more relaxing than forcing yourself to plan everything before starting. The time spent over planning could be used towards building and learning.

At one point today I had 15 minutes between a meeting. So rather than doing nothing or looking at emails, I decided to tackle one of the smaller tasks near the bottom of the list. I estimated it would take the full 15 minutes. I did the brute force solution and got it done on time.

There were times when I was stuck on something or I needed something from another branch. In that moment I would pause, and see if there’s something else I could work on while waiting. This is one of the major benefits of task break down. Being able to pause on something and start or continue something else makes it feel like I’m continuously making progress.

I didn’t worry about spelling or clean code or maintainability. I was focused on getting it done with raw speed to determine what are my strengths and where can I improve. I wrote some tech debt tickets to address some minor things later (performance, structure, etc.).

During the coding session, my only guide was Test Driven Development. Since I already knew what the code was going to look like, it made it really easy to write tests first. At this point I could focus more on testing various inputs rather than wondering what the code should look like.

In the end, I had 5 Merge Request that were reviewed quickly.

Each Merge Request does one thing (Single Responsibility Principle). Each Merge Request is less than 100 lines of changes. Only 2 Merge Requests depended on another but I still managed to stub behaviour and merge the main branch in with few merge conflicts.

At the time of this post, the task shows that I’m 50% complete with the other 50% in code review. I spent approximately 5 hours over 2 days. I did 1.5 hours prototyping in a scratch file. The other 3.5 hours were used across the 7 sub tasks. Each sub task took anywhere from 15 minutes to 1 hour.

It may seem excessive to monitor time so closely but it essential to keep me on track. Anytime I don’t set a timer I find myself going down rabbit holes. This is terribly inefficient. I have a lot things I want to do personally and professionally. I don’t have time to waste [bike shedding](https://en.wikipedia.org/wiki/Law_of_triviality).

This was an interesting experiment in reverse planning. I was hoping to gain some insights into how to move faster with tickets. It definitely feels faster when you start building something within the first day of the task. I look forward to trying this again in the future.
