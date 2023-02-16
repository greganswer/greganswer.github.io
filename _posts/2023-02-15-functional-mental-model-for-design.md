---
layout: post
date: 2023-02-15 21:05:00
tags: math problem-solving
---

Having a simple mental that can be used to solve different problems is quintessential to speed and quality in software engineering. Previously in [Y equals f of x]({% post_url 2023-02-12-y-equals-f-of-x %}) we talked about using the `y = f(x)` functional notation mental model to help with designing and debugging code.

When designing code, defining `y` and `x` is the most difficult and most important part of the software development process.

Another way to look at it `out = f(in)` or fully expanded as `output = f(input)`. I like to keep the function name as `f` because the function name will be determined by how the inputs are transformed to outputs. Until inputs and outputs are defined, naming the function is just a distraction. I’m going to walk through a simplified example of a recent experience of using this mental model.

## Example

Let’s say we have a t-shirt company and we need a way of creating an order’s line items based on the inputs of the order. We need inputs such as `items`, `address`, and `language`. Each of these could change which t-shirt you might get and a certain combination will send the customer a free mug.

In order to break this down, we need to work with our customer or product manager to understand what the output would like for different inputs.

Let's say given these inputs:

```ruby
user_input = {
  language: 'English',
  address: {
    # Additional address details not relevant to this new piece of code...
    state: 'TX'
  },
  items: [
    'black t-shirt'
  ]
}
```

we expect these outputs:

```ruby
order = {
  line_items: [
    'black t-shirt'
  ]
}
```

and let’s say we offer a free *“I love Texas”* mug for Spanish speakers in Texas:

```ruby
user_input = {
  language: 'Spanish',
  address: {
    state: 'TX'
  },
  items: [
    'black t-shirt'
  ]
}
```

then our output would be:
```ruby
order = {
  line_items: [
    'black t-shirt',
    'Me Encanta Texas mug'
  ]
}
```

Notice the extra `'Me Encanta Texas mug'` line item in this output. Without caring what programming language this is or how the system is actually designed, we can quickly communicate with stakeholders and engineers to determine if this is the desired behaviour for the feature.

This is a simplified example of a real problem I faced recently. This setup could have had:

- The user language and address already saved in the database
- A very different data model
- A serialized order that's sent to a backend system that stores and processes it differently

It doesn’t matter. **We know that given the set of inputs, we’re expecting a certain set of outputs.**

## Lessons

- Simple mental can help solve different problems
- Defining `y` and `x` is the most difficult and most important part
- Share your simplified `y` and `x` to customers/product managers for feedback

## Series

1. [Y equals f of x]({% post_url 2023-02-12-y-equals-f-of-x %})
1. Functional mental model for design *(current)*
