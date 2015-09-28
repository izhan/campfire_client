## Overview
This is the web client for Campfire built with ReactJS & Reflux on a Express server.  You can find it here: https://damp-bastion-4478.herokuapp.com/

## Installation
- Run `npm install` to get your packages setup
- Run `npm run devserve` to start the dev server

## Why Campfire?
For some employees, much of their day-to-day revolves around their calendars and scheduling meetings. Campfire groups people together, and I could see this becoming a productivity tool for a company if more features such as meeting scheduling or task management were added.

In reality though, I just had some existing images that I designed for an event last year (camp-related items like a tent, lantern, trees, etc), and threw them together to fit the playful vibe I wanted from this product :)

## Goals
I love this coding challenge because I had always wanted to build this! Because I plan to continue working on Campfire, I had some particular goals with this first implementation:
- Create an api-only server for future mobile work
- Add user authentication
- Get this app production-ready and deployed to Heroku
- Careful planning of UI, design, and branding.

## Features
- Login/Logout & API authentication with your Google Plus account
- Fetch multiple Google Calendars (public & private) with corresponding calendar (not event) colors
- Toggle specific calendars on and off in the view
- API-only server for future mobile work
- Deployed to production! (https://damp-bastion-4478.herokuapp.com/)

## Future
Campfire isn't as feature-rich as I had hoped, but I invested a tremendous amount of time on code that hopefully enables more features to be built quickly in the future.  Moving forward, here's how you might use the existing code to continue building this site:
- FullCalendar isn't as customizable as I'd like.  The current ReactJS code (and any other heavy-duty client framework in general) can greatly help rollout a custom calendar implementation
- We can use the sync tokens stored in the db to periodically update data.  Google API has a neat notification feature that posts new data to a specified endpoint when an update to a calendar is made.  However, Google has specified that this isn't reliable (some requests will not make it through).  We can use our sync tokens to sync up data whenever we receive this notification, therefore updating our data with data that it might have missed. Using Faye middleware, we can update the client in real-time.   
- Reflux helps us continue building features such as allowing users to add/edit events without worrying about managing data.  For instance, the Reflux stores can be modified to easily sync to the server any changes made on the client by any React component.  It can also quickly notify any React component whenever server data has updated.  Adding an event and having it persist on Google may be as simple as adding the relevant Reflux code & server proxy.
- Authentication was the hardest part of this coding challenge (nearly took a day!), and wasn't 100% necessary to create Campfire.  However, user authentication is essential for getting this app production-ready.
- Creating a pure API server and client frontend was painful, but useful for a microservices architecture and mobile applications in the future!

## Quirks
My first time ever using Webpack/Express and Rails-API, and using ReactJS outside of my summer internship.  At Vessel (summer internship), we had some interesting code quirks that I picked up as well.  I tried to research as much as I could about coding conventions for these frameworks, but I don't think I adjusted to all of them yet.  Feedback would therefore be greatly appreciated!

This code uses Coffeescript & ReactJS, the setup used at Vessel, a combination that doesn't work well with each other all the time.  As a result, you might see some random bits of code within the ReactJS stuff that might make no sense like `div null`.

Reflux's trigger is usually called with an argument.  I personally favor caching results in the store and refetching them from a React component.  Much simpler to reason about the code that way.
