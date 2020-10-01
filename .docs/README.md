# **Legend of the Ruby Dragon**

A text-based adventure CLI application inspired by Legend of the Green Dragon (LotGD).

### **GitHub**

[GitHub Remote Repo](https://www.github.com/thejayneo/cli-app)

## **Software Development Plan**

### **Purpose and Scope**

Since the mobile revolution in 2007, on average, people are spending more and more time on their phones. Messaging apps, dating apps, social media, game apps; suddenly we have this information overload constantly bombarding us with distractors vying for our attention. However, a survey from OfficeTeam found that the average employee spent 56 minutes a day using their phone for personal activity while at work. If you include the distraction of notifications and the burden of cognitive task switching, there is a lot of wasted time in an average work day.

The purpose of this application is to provide an alternative method of distraction at work for programmers and developers. Rather than instinctively picking up their phone which is a device made for distraction and losing a lot more time, the intent is to allow them to be distracted at their terminals for a shorter duration and still allow them a reprieve from the monotony of a task. As such, this text-based game is quick to launch, portable and designed to be entertaining in short periods. As the target audience is developers and programmers, the application is designed to run from command line interfaces (CLIs) as they are comfortable within this environment and does not require opening websites or other apps which can elicit unneccessary distraction.

The app is a text-based adventure game allowing the user to create their character and go on adventures battling randomly generated enemies, with narrative progression and encountering random events to be added in a future update. Progress will be stored locally and will be convenient for users to sync between devices using a simple cloud service such as Google Drive or OneDrive.

The limitations of this application are; text-based adventures do not cater for the varying genres of games that users may like and can diminish the value of likelihood of this application being useful, local plain text save files can be easily modified and diminish the psychological reward mechanisms of planned quest systems and application may be too accessible and distracting.

The user will ideally use this application for 10-15 minutes every hour or depending on individual users, whenever they feel their attention span waning while completing a work task.

### **Features:**

The user will install this application and relevant prerequisites using a script and then launch the application using the Ruby command `ruby lotrd.rb`.

The user will then either generate a character for the first time or resume their existing adventure and be able to access the following functions:

- Adventure mode: The user character will be matched against randomly-generated enemies and turn-based combat simulation based on character and opponent stats will be carried out with user input at every turn (For example: 'Attack', 'Cast spell', 'Run away'.)

- Bank mode: To safely store accrued gold in the event of character death.

- Leaderboard/scoreboard to see their best progress.

### **User Interaction:**

Character generation will ask the user to input an integer within a range to select character race and job class. This input method was used as it allows the incorporation of certain easter eggs. `Case`, `when` and `else` statements are used to validate inputs in the character generation section and bank deposit and withdraw features to handle errors and provide an informative feedback to the user.

All other user interactions will be displayed, captured and managed using the select menu from Ruby Gem TTY-Prompt. This serves as input instruction as it renders a directive for users to use the up and down arrow keys to navigate the menu, and input validation/error handling as the user cannot make an invalid input.

### **Control Flow Diagram**

### **Implementation Plan**

[Trello Board](https://trello.com/b/LUZCBm3l/cli-app)

### **Installation Instructions**

Hardware Requirements:
* Computer
* Keyboard
* Monitor

Software Requirements:
* *nix OS
* Ruby

Instructions:
1. Create/Navigate to directory where you want to install application in terminal.

2. Run:

```git clone https://github.com/thejayneo/cli-app```

3. Run:

design help documentaiton which includes a set of instructions which accurately descibe how to use and install the application
you must include steps to install the application
any dependenscies required by the application to operate
any system/hardware requiremenets
