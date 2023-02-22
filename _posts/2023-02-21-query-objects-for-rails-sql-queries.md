---
layout: post
date: 2023-02-21 21:05:00
tags: ruby-on-rails design-patterns
title: Query Objects for Rails SQL Queries
---

Are you tired of tangled and complex SQL queries in your Rails applications? Do you want a better way to manage, test, and optimize your SQL queries? If so, you might want to explore the benefits of Query Objects.

**Query Objects are a design pattern in Ruby on Rails that can help you organize, modularize, and reuse your SQL queries.** In this article, I’ll break down the [5Ws](https://en.wikipedia.org/wiki/Five_Ws) of Query Objects and give a simple example.

### What

Query Objects are a design pattern used in [ORM frameworks](https://en.wikipedia.org/wiki/Object%E2%80%93relational_mapping), such as Ruby on Rails, to separate the SQL query logic from the rest of the application code. This pattern allows for more modular and reusable code by creating separate objects that encapsulate the SQL query logic.

### Why

Query Objects often have the following attributes:

1. They’re easier to read and maintain than SQL
2. They adhere to the [Single Responsibility Principle](https://en.wikipedia.org/wiki/Single-responsibility_principle)
3. They’re easily reused
4. They can use [ActiveRecord query chaining](https://guides.rubyonrails.org/active_record_querying.html#understanding-method-chaining) for better SQL performance

### When

Typically they are used to replace complex SQL queries, especially when they’re reused in different parts of the app.

If your queries are simple one liners, prefer [model scopes](https://guides.rubyonrails.org/active_record_querying.html#scopes). If you have a set of model scopes that are often used together, this also may be an opportunity for a Query Object.

### Where

Query Objects should be located in the `app/queries` directory of a Ruby on Rails application. This is a convention used by most developers and makes it easy to find and organize Query Objects. The location maybe different in other languages and frameworks.

### How

Typically Query Objects are created as a class with a single public method. The Ruby on Rails convention is to have a descriptive class name suffixed with `Query`. Example: `CustomersWithOverdueOrdersQuery`

Simply instantiate the object with any necessary parameters, and then call the main public function. In ruby it’s usually named `call` but you could use `run`, `execute` or anything similar. The Query Object will then execute the SQL query and return the results.

## Example

Say we want the list of overdue orders, that are not complete, for customers that don’t have due date exemptions, so we can send them an email reminder. Here’s some example code (*UNTESTED*):

```ruby
class CustomersWithOverdueOrdersQuery

  def call(initial_customers: Customer.all)
     initial_customers.joins(:orders)
        .where('orders.due_date < ?', Date.current)
        .where.not(orders: { status: :complete })
        .where(overdue_exemption: false)
  end
end
```

We pass in the `initial_customers` relations to make this more reusable. Note that Ruby on Rails does not make any database calls or instantiate any `ActiveRecord::Relations` until the object is actually needed so there's no performance penalty.

Now we can use this in a background worker:

```ruby
class SendOverdueEmailsWorker
  def perform
    customers = CustomersWithOverdueOrdersQuery.call
    customers.each do |customer|
      # Send email using customer.email address...
    end
  end
end
```

This is a simplified example, so you’ll need to consider things like:

- **Fault Tolerance:** Each email send should happen in a separate worker for better error handling and retrying
- **Performance**: If the query returns thousands of Customers, you’ll need to batch them into groups of 1,000 and split this up into multiple background workers
- **[Idempotency](https://en.wikipedia.org/wiki/Idempotence)**: You don’t want to send the same email too many times so you’ll need a table to track who you’ve sent what and when
- **Readability:** If your Query Object is more complex, you can extract different method calls to private methods and chain them as needed

## Remember

1. It’s bests to return an `ActiveRecord::Relation` object. Not an Array of `ActiveRecord`  models and certainly not a hash. The goal is to be able to chain additional query filtering on the results object as needed.
2. Query Objects should allow composition with other Query Objects and ActiveRecord relations.

## Conclusion

Query Objects are a helpful pattern for separating SQL query logic in any application. They can make code more modular, reusable, and maintainable while also improving query performance.

For a deeper dive into Query Objects, checkout [A Case for Query Objects in Rails](https://thoughtbot.com/blog/a-case-for-query-objects-in-rails) from Thoughtbot.
