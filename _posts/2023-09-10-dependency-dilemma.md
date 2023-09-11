---
layout: post
date: 2023-09-10 12:05:00
tags: debugging problem-solving tech-debt
---

I was working on a microservice API that is used as mock integration for a third party API. We asked the vendor to make one for us but it’s not a priority on their roadmap so I built one for us. This API is used every day for testing and rarely has issues.

I needed to add a small change that should take 20 minutes to write, test, and deploy. I only modify this app once every few months for the past year and each time has been pretty easy.

I made the change locally. I tried to run the code and I got an error. The first of many.

The first error was about the version of the Serverless Framework I was using. The project was using v2 and I had reformatted my laptop a few months ago (another story) and only have v3 locally. I quickly checked the docs and there’s only some small changes to the config file and everything else should just work. Better change it now than later.

The second error was about the version of node I was using. The project was using v12 (ouch!)  and I only have v18 locally. Remember that reformat? I don’t want to download an old, security nightmare that nobody wants to maintain. No problem. Update Node.

AWS also no longer supports anything less than v16. I had to update this in Serverless config file as well. Not too bad.

The third error was about the incompatibility of a dev package and the new version of Node. Uh oh! Wait… This package is no longer being used in this project. Delete it!

The fourth error was about the local AWS Dynamo DB dev package I was using. This package allows you to run the Serverless code locally by pointing to a local instance of Dynamo DB. An hour of research later, this package is no longer being maintained and any forks of it are also questionable. This mean no more local development for this project. 😞

Oh well. I can alway just push the code to a “dev” server to not interfere with the actual APIs that depend on this mock service.

The fifth error was one of my favorite random Cloud Formation errors. Once or twice before, during a deployment, I’ve seen this error. Thankfully I was only deploying to the “dev” server. It basically says that I have to go into the AWS Console and manually delete some services that may have been corrupted during the attempted deploy. At least I’m vaguely familiar with this one and now moving in the right direction. Delete all the related resources and try again.

The sixth error… yes, there was a sixth error. The sixth error was something like, *“Undefined AWS package”*. Another hour of research to confirm that I have to update the AWS SDK from the v2 to v3. I’m not sure when this was deprecated but again, I’d rather update it now and hopefully not deal with it for a while. There's an AWS *“update script”* that is supposed to update the code to use the v3 syntax. I ran the script and verified that my code looked the same as the documentation examples.

The seventh error… how much longer is this going to take?! The seventh error was that Typescript was not happy with the return value of some of my functions. I double checked the AWS update script and docs and my code looked like the examples they gave. The Typescript error was not too helpful and nor was Google. I knew I either had to change the expected return value or the actual return value.

I went for a walk around the house.

I came back and said the easiest thing to do is remove the `promise()` function that was being returned from the 7 functions that called the AWS SDK and see if the new error is more helpful. Now only 6 Typescript errors. Ok. Let’s remove them all. Now no Typescript errors. Try to deploy to “dev” server now…

The eighth error… nah just kidding! Finally. Back to baseline. And I still haven’t implemented the small change yet!

After a few days, I had to take step back and think about what I would do differently:

1. **Avoid local dev for Serverless projects.** I was a pain to setup, a breeze to use, then a pain to update. That evaluates to a pain sandwich I’d rather not eat again. If the tech was more stable and better maintained it might be a different story.
2. **Avoid Typescript for small projects/teams.** Another pain sandwich. Yes it did help me identify the wrong return type but initial setup and making small changes can be quite time consuming. I think It makes sense for mission critical apps and large teams. Maybe even mission critical functions in an app but not necessarily the whole thing.
3. **Avoid Serverless Framework for small projects.** This one is a bit tricky because there are some nice features to it. This project has 4 lambda functions, 2 SQS queues (which are probably unnecessary), and 1 API gateway. For this project, the framework is just another layer to maintain and configuring this app for 2 “environments” is not that much harder using AWS Console.

I believe 5 of these 7 errors would have been eliminated if I avoided the 3 things in the list above. I learned a lot using these tools and I have no regrets but I would not use them again for small projects.

I’m very cautious with production dependencies. I check for longevity, activity, popularity, and maintenance of packages before pulling them into my personal or professional projects.

I have a few stories and there are many other stories of popular package that just stopped working one day. Just google “colors.js and faker.js”.

I once worked with an engineer who avoided dependencies as much as possible. Forget about production dependencies. Every time I wanted to add a dev dependency he would ask why I need it. I’d explain it to him and he say, *“You can just write that yourself.”* I thought he was crazy and paranoid. Now I am him.
