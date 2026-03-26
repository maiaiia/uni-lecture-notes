---
Class: "[[MPP]]"
date: 2026-03-23
type:
---
# FrontendTechComparison

My app is quite small in scope
this semester i'll have to use angular for wp (so learning how to work w it here might make my life easier later on).

Stack Overflow questions for each framework -- could also be an indicator that react is a pain to use
![](https://private-user-images.githubusercontent.com/643434/380726702-a99b1ff2-80b6-4f39-8ab5-21da2f5a4e9d.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NzQyNTY2MjgsIm5iZiI6MTc3NDI1NjMyOCwicGF0aCI6Ii82NDM0MzQvMzgwNzI2NzAyLWE5OWIxZmYyLTgwYjYtNGYzOS04YWI1LTIxZGEyZjVhNGU5ZC5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjYwMzIzJTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI2MDMyM1QwODU4NDhaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT04YmJhMWI0Yjc0YmI1ZDFhOWYyNzkyNmE0MjhkNWI5ZTdlM2MzMDliMjhmZTNkY2ViNmViNmYwMmU5NWYzNzQ5JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.A2A9cPmSq2Kq8PjKHHEX03w9oL-YguVa5maku_TjAyM)

Github repos depending on each
![](https://private-user-images.githubusercontent.com/643434/533056213-434abcb7-1854-43b6-ab4d-d1a897195d49.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NzQyNTY2MjgsIm5iZiI6MTc3NDI1NjMyOCwicGF0aCI6Ii82NDM0MzQvNTMzMDU2MjEzLTQzNGFiY2I3LTE4NTQtNDNiNi1hYjRkLWQxYTg5NzE5NWQ0OS5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjYwMzIzJTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI2MDMyM1QwODU4NDhaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1kYzlkZWY1Y2IxYjMwNTg4ZmNiY2I3MGM1MmUxYTI0NTQzMmQyNjA1NDQ0YjY4ZmE3M2ZlNGQ4YmU1MGQzYmE4JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.3bd5tfHJCLC_Bdkz7j3md3Z33mGrjxOZ7P1xeZ8dtS0)
## React
React uses a virtual DOM to efficiently update and manage changes made to the ui
Component-based architecture --> reusable UI components 
Unidirectional data flow? 
Fast rendering, efficient updates
Large community
Steep learning curve for complex projects, but easy to learn for basic JavaScript
Tf is JSX syntax
Complex setup 

easy to learn and use, allows reusability for components, has virtual dom, increased productivity and maintenance, huge code base and community, by far the most popular framework

## Angular
TypeScript -based (i don't like typescript)
open source (cute)
will be used in web programming course 
two-way data binding 
dependency injection 
fast development (!!!)
scalable
code reusability
Advanced features -- **steep learning curve** 
too complex for small simple application 

directives allow developers to play around with the DOM and create rich content using HTML, dependency injectors allow the developers to decouple interdependent components of code and **reuse** them, big community

steep learning curve, sometimes laggy for dynamic applications
## Vue.js
lightweight, flexible, easy to learn
MVVM
component-based, reusable
flexible and versatile
virtual DOM
powerful

not complex like angular, much smaller in size and similar to angular, offers two-way binding, visual dom and component-based programming, detailed documentation for learners, supports both complex dynamic applications and simpler smaller applications, easy syntax, virtual dom, good for projects that need great flexibility because it allows you to design everything from scratch

much of the documentation is in chinese -- language barrier?, still in its growing stages
limited ecosystem, lack of official support, lack of backward compatibility with updates, not very stable

## Svelte
very trendy (??), easy to use, has compiler and puts all the codes as one compiled step rather than posting inthe browser, which makes updating the DOM and synching easy, uses current javascript libraries, lightweight and responsive, minimal coding with feature-focused architecture, good for small projects that limited people handle, ideal for beginners due to simple syntax

lack of technical support and tutorials, small and limited ecosystem, limited tooling and less popular amongst developers, bad for complex projects, small community --> challenging to deal with bugs
## Bootstrap
Twitter's CSS framework (no ty)

large community, cross-browser compatibility, easy to use
design is tired, limited customization
## Material Design Lite
developed by Google
provides a set of CSS classes, JavaScript components, and pre-built UI elements 

limited customization

## Tailwind CSS
Utility-first CSS framework that provides a set of pre-built classes that can be used to quickly build responsive web designs
Highly costumizable 
Really fast development time
Flexible (CSS utility classes)
Large learning curve due to said utility classes 
Limited creativity 
Large file size :(