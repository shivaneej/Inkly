### What is the App About?
- A journaling app designed to build and maintain the habit of journaling with a focus on mental health. Ease of use is a distinguishing feature; the app starts with a blank canvas and offers structured prompts as needed.

### Motivation
- Aims to make journaling habit-forming and simplify the process of mental unloading. 
- Adds a social element by allowing you to remind friends to journal. This feature facilitates mutual accountability and offers positive reinforcement through sticker sharing.

### Main Focus
- Mental Health
- Habit Formation
- Social Engagement

### Features
- **Streaks**: Track your journaling streaks for positive reinforcement.
- **Stickers**: Send stickers to friends to remind them to journal. Custom stickers will be available as a premium feature, but pre-designed stickers are available to all users.

### Future Scope
- Implement LLM to predict user mood based on sentiment analysis of thought dumps and follow-ups.
- Allow gradual removal of stickers from profiles to avoid clutter. Stickers will be removed 7 days after being received.

### Architecture
- Built with Swift UI, backend on Firebase.
- Authentication via Firebase Authentication.
- Utilizes Langchain and GPT-3.5 Turbo for dynamic journaling prompts.
- Backend hosted on Heroku. 
- Ensures data privacy as no journaling activities are shared outside the app.

### Technologies Used
- Firebase Auth
- Firebase Realtime Database
- Swift UI
- Langchain: Used for multiple LLM features like sentiment analysis and dynamic prompts.
- Heroku: Scalable backend hosting.

### Prerequisites
- Swift UI
- Firebase Account
- Langchain Dependencies
- Gunicorn

### Demos
(TBD)

### Contributors
- Jaiswal, Shivanee (sjaiswal45@gatech.edu)
- Garg, Tanya (tgarg40@gatech.edu)
- Florea, Alexandru (aflorea6@gatech.edu)
- Pai, Pratiksha (ppai33@gatech.edu)
- All members contributed equally to the project.