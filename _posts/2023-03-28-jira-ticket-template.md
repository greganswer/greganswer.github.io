---
layout: post
date: 2023-03-28 21:05:00
tags: time-management product-management
---

I’ve been writing a lot of Jira tickets lately. About 10 in the past week. I’ve refined my personal Jira ticket template over the course of the last few months. Here are the sections I add and why I add them.

## Title

- Most issue tracking software has a title or summary field that is required.
- The title should be short and descriptive.
    - This makes them easy to find in different views like board view.
    - This makes it easier to reference while talking/texting.
- Preferably starts with a verb.
- Examples:
    - *Allow admin to set email notification frequency for subscription X*
    - *Update endpoint X to handle bulk data*
    - *Add alert when orders exceed 10K*
    - *Document instructions for manual process X*

## Body

The body should be short and skim-able. Respect that the reader is a busy stakeholder who needs to quickly find out why this ticket is necessary. I borrowed from the [Problem Statement template](https://en.wikipedia.org/wiki/Problem_statement#Writing_the_problem_statement) and customized it based on my uses.

I use H2 headings so that I can jump to the appropriate sections as needed. It contains the following H2 headings (in order): *Objective, Consequences, Workaround, Proposal.*

### Objective

- I reuse the *title* and add *“so that…”* along with the benefits.
- This is similar to the User Story format of *“As a [PERSONA] I can [ACTION] so that [RESULT]”*
- Using the title examples above, the objective might look like:
    - *Allow admin to set email notification frequency for subscription X so that we can increase customer retention*
    - *Update endpoint X to handle bulk data so that we can reduce server costs*
    - *Add alert when orders exceed 10K so that admins can notify our vendors of incoming large orders*
    - *Document instructions for manual process X so that on-call teams can run this process*
- If necessary, you could try some date specific Objectives. Examples:
    - *Integrate with API X by June 5th so that we can avoid the service fee increase of API Y on June 6th*
    - *Complete feature X by August 12th so that we can secure the contract with client Y*
    - *Create video describing feature X by March 27th so that we can present it at the XYZ conference on March 28th*
- Occasionally I add specific “Key Results” as additional bullet points. Examples:
    - *Reduce CPU usage by 10%*
    - *Reduce Cost of Goods Sold (COGS) by $1.20 per order*
    - *Increase customer retention by 15% throughout the third quarter*

### Consequences

- The benefits should be clearly stated in the Objective section, but we also need to know **what happens if we don’t do this ticket**.
- This helps us prioritize against other competing tickets.
- If the consequences are low or unknown, I usually reduce the priority of the ticket (i.e: from a P3 to a P4)
- Examples:
    1. *Users may get frustrated and abandon their cart*
    2. *Server may become overloaded and data processing may fail*
    3. *Our Cost of Goods Sold (COGS) will be $3 higher than expected*

### Workaround

- This section is optional. If there is no workaround, I do not include it.
- If there are workarounds, I list them here and I usually reduce the priority of the ticket (i.e: from a P2 to a P3).
- The workarounds aren’t perfect. They ofter a temporary solution until this better solution can be implemented.
- Examples:
    - *User can follow the manual process in document X*
    - *Engineer can manually run code on the server*
    - *Hire part time staff to help deal with the influx of orders*

### Proposal

- Briefly describe your proposed solution to achieve the objective.
- Use short bullet points. Skim-able is key.
    - I can’t stress this enough. Most engineers don’t read the whole thing anyway.
- Break them up into sections as needed.
    - For example, I may have a bullet point titled *“Frontend”* with some sub points, and another bullet point titled *“Backend”*.
- Be as prescriptive or as generic as you prefer.
    - I tend to be prescriptive when I already know the solution or this has a tight timeline
- If it’s a feature ticket, this is where I’ll add a short User Story in a code block using the [Gherkin syntax](https://cucumber.io/docs/gherkin/reference/).
- Include code examples/prototypes but tuck them in an “expand” section so that the body of the Jira ticket is still skim-able.
- I use “expand” sections for any part of the body that gets too long. Sometimes this is a sign that I should move this info to a separate document. The ticket is about getting things done, not telling a long winded story.

I kee these four H2 headings saved in Notion with one bullet point each. Whenever I need to write a new ticket, I just copy and paste it and start filling in the bullet points. With a good high level understanding of what needs to be done, I usually write a descriptive Jira ticket in under 15 minutes.

When I come back to the ticket later, I can quickly see the info I need without too much reading.

With Jira having so many fields that only a handful of people use, I find a simple *Title* and *Body* is sufficient for me to understand the task at hand. Other than the *Priority, Sprint, and Epic* fields, I hardly pay attention to anything else added to a ticket.

This template I find easiest to read and write. I can use it in any ticket tracking platform. This is just my preference. Maybe your team has one template for all issues. Maybe everyone writes however they feel that day. Do whatever works best for you and your team.
