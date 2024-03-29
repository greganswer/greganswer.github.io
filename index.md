---
layout: default
---

I’m a Ruby on Rails Full Stack Developer from Toronto, Canada. I have a decade of experience from starting my own software company, to freelancing, to Lead Senior Software Engineering.

I'm deeply focused on rapid prototyping and excellent user experience. I'm not satisfied until my code is clean, readable, and maintainable. I strive towards delivering the most impact with the least input. This level of efficiency helps to ensure user satisfaction as well as developer satisfaction.

I strive to better myself every day, even if it's a 1% improvement. This compounds over time. I am constantly reading and watching content that helps me improve not only for myself but also so I can share it with others. I don't measure success by how much money I make. I measure success by how much I've grown.

On this site, I share my experience on important concepts like:

- [How To Work With Product Managers]({% post_url 2022-11-21-how-to-work-with-product-managers %})
- [Red Green Refactor]({% post_url 2023-01-17-red-green-refactor %})
- [Breaking Down Work]({% post_url 2023-01-09-breaking-down-work %})
- [Personal Problem Solving Template]({% post_url 2022-10-03-personal-problem-solving-template %})

My most recent posts include:

<ul>
    {% for post in site.posts limit:3 %}
        <li>
            <a href="{{ site.baseurl }}{{ post.url }}">{{ post.title }}</a>
        </li>
    {% endfor %}
</ul>

My hobbies include studying software engineering, weight lifting, yoga, and of course, I couldn't live without [Star Trek](/tags/star-trek).

If you liked the posts linked above, check out [more blog posts](/blog). Also [follow me on LinkedIn](https://www.linkedin.com/mynetwork/discovery-see-all/?usecase=PEOPLE_FOLLOWS&followMember=greganswer).
