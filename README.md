# Inkly: Your Habit-Forming Journaling App

<div align="center">
  	<img src="https://github.com/shivaneej/Inkly/blob/main/app/Inkly/Assets.xcassets/AppIcon.appiconset/AppIcon.png" height="150" width="150">
</div>





# Inkly: Your Habit-Forming Journaling App

## Overview
Inkly is an app designed to make journaling easy to start, easy to do, and easy to maintain. It focuses on improving mental health, forming journaling habits, and encouraging social engagement by allowing users to remind their friends to journal. What sets Inkly apart is its ease of use; it starts with a blank page, avoiding unnecessary complexity, and offers structured prompts for those who prefer to use them. Although we don't have any partnerships or endorsements from mental health professionals yet, we plan to incorporate this in our premium plan.

## Links
- [Devpost](https://devpost.com/software/inkly)
- [Github Pages](https://shivaneej.github.io/Inkly/)
- [Expo]()

## Motivation
The app aims to simplify mental unloading and make journaling habit-forming. All team members felt that journaling often turns into a chore; Inkly aims to turn it into a more enjoyable experience. The added social element not only makes it easier for friends to keep track of their journaling, but also provides positive reinforcement through stickers and leverages network effects to keep users engaged.

## Features
- **Streaks**: Keep track of how consistent you are with your journaling. Streaks are mainly for positive reinforcement.
- **Friends**: Add friends to build new habits together. You can also send them stickers to remind them to journal.
- **Stickers**: Send stickers to friends to encourage them to journal. All users have access to a collection of pre-designed stickers, while custom stickers are a premium feature.

## Future Scope
- Implement LLM algorithms to predict user moods based on journal entries. Sentiment analysis will be run on the thought dumps and follow-ups to gauge the user's mood.
- Enable gradual cleanup of stickers from user profiles to avoid clutter. Stickers will be removed 7 days after they are received.

## Getting Started

### Prerequisites
- Swift UI
- Firebase Account
- Additional dependencies include Langchain and Gunicorn.

### Setup
1. Clone this repository.
2. Install necessary packages, including SwiftUI, Firebase, Langchain dependencies, and Gunicorn.
3. Configure Firebase settings.

### How to Use
1. Register/Login through the Firebase Authentication.
2. Start journaling!
3. Add friends and keep track of each other's progress.

## Tech Stack
- Firebase Auth
- Firebase Realtime Database
- Swift UI
- Flask
- Langchain: The backend for multiple LLM features like sentiment analysis and dynamic prompts.
- Heroku for backend hosting: Backend is scalable due to the managed resources of Firebase and Heroku.

## Architecture
- Built with Swift UI frontend, Firebase backend.
- Authentication via Firebase Authentication.
- Utilizes Langchain and GPT-3.5 Turbo for dynamic journaling prompts.
- Backend hosted on Heroku.
- Data privacy is maintained; none of the journaling activities are shared outside the app.

## Demos
[Youtube Link]()

## Contributors
- [Shivanee Jaiswal](mailto:sjaiswal45@gatech.edu)
- [Tanya Garg](mailto:tgarg40@gatech.edu)
- [Alexandru Florea](mailto:aflorea6@gatech.edu)
- [Pratiksha Pai](mailto:ppai33@gatech.edu)
- All members contributed equally to the project.