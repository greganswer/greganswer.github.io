---
layout: post
date: 2023-09-30 12:05:00
tags: learning
---

I'm tired of over abstracting... and I'm over it. There. That's the blog post.

I can't tell you how many times I've written a class that has like 20 functions that just return 1 line. All to be used by the 3 or less public functions. Why do I do this? Is it really *"clean code"?*

I spend a decent amount of time rewriting code to learn from it. Sometimes I rewrite the same class or even a small sub system. Sometimes I rewrite it once or even 5 times.

One of my recent rewrites is an AWS lambda function. I previously wrote a version of it that has 10 functions in 3 files, not to mention the utility functions that it also calls.

I tried rewriting it in one big file. I found it "overwhelming" to approach at first. Once I realized that everything this lambda function does is in this one file I felt a bit of relief. No more jumping around between files!

In my defense, when I first wrote this lambda function, I was trying to keep it abstract because there were 3 other lambda functions that would share some of the same code. It turns out those functions maybe shared 10% of the code that was abstracted. Not worth the headache of jumping between files. Lesson learned.

So I left the one big file alone for a few days and recently came back to it. Why are there so many functions?! Before there was 10 functions in 3 files. Now there's over 20 in one file! About 5 of them were some of the utility functions from the previous version.

I did my best to make each function read from top to bottom, as mentioned in Chapter 5 of Uncle Bob's Clean Code book, but it's still too much jumping around. How is this any better?

Why do I have so many functions? Because I want named behaviour. Sometimes I read a few lines of code and have to think for 30 seconds in order to grasp the high level concept. This thinking is reduced to 1 second with a well named function that groups these few lines of code. But the jumping back and forth for a simple piece of code that is not being reused is not worth it.

So I rewrote the lambda function today. I've lost count how many times I've rewritten it. **Like a painter, I'll keep repainting the same bowl of fruit until I've learned all I can from it.**

I have not completed the functionality but so far there's only 3 functions. From what I can see in the previous rewrite, I'll only need about 5 more functions. 8 functions in 1 file. Depending on who you are, this sounds like a dream or a nightmare.

How will I compensate for the *"what the hell is going on here?"* affect? Code comments. Short descriptive comments that explain a grouping of 5 or so lines and prevent me from having to jump to the another part of the file or worse, another file.

I've long believed that code comments are bad. They're a sign that you did not explain the code well with good variable names and extracted functions. Sometimes code is too hard to explain in a function name. Sometimes extracting a private function to the bottom of a 200 line file is a bridge too far. Then you'll tell me to extract the 200 line file into two 100 line files. As Ryan Reynolds said in Harold & Kumar Go to White Castle, *"But why?"*

Clean code is more of an art form and a balancing act. What's clean to one individual or team is a dirty dumpster to another. One thing that doing a lot of Leetcode questions has really taught me is *"Make it work, then make it right".*

I've solved and re-solved hundreds of Leetcode questions with the average function length of 25 lines. At most I've used 4 functions for Union Find solutions just because functions named `union`, `find`, and `are_connected` just read a bit better. Otherwise it's just the problem's function and 1 or 2 helper functions.

Since "right" is really subjective, I rather "clean" the code days or weeks later once we actually have a need to clean it. Cleaning it too soon can lead to code that's actually messier for your future self.

