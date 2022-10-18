# Solar Schedule
## Context
Important: Considering the short timeframe and open-endedness of the problem, it is recommended to focus on creating a minimum viable solution meeting the basic requirements of the problem. Do not worry about covering all edge cases or finding an optimal solution. We will mainly assess basic functionality/correctness and code quality. Please provide proof that your code runs with a few test cases.
## Task Overview
Aurora is adding thousands of projects/week and growing steadily. Many of these projects end up being sold and need to be installed. Smaller installers often struggle scheduling their installation crew efficiently. Aurora is expanding its product offering into the scheduling space.
Please build a small program that helps solar installers prioritize and manage their installation crew given a list of buildings that they need to install a PV system on. The output of the program should be the work schedule (who works on what building for each day). No UI or persistence (DB, files etc.) required.
## Task
Given a list of buildings and a list of employees, generate the schedule for the coming work week by implementing the method schedule(buildings, employees) and providing some proof that it works,i.e.generatesthecorrectresults. Listanyedgecases,improvements,andtestsyoudidnot have time to add and how long you think it would take to finish them.
## Details
● The output schedule is for the next 5 days: assume Monday through Friday.
● All employees work full days, but can be unavailable on certain days (sick/vacation etc.)
● Assume buildings are given in the order of their importance -- no need for anything but a
simple in-order scheduling
● There are 3 types of employees:
  ○ Certified installers
  ○ Installers pending certification
  ○ Laborers
● There are 3 types of buildings, each requiring a different set of employees. All installs are done in 1 day.
  ○ Single story homes require: - 1 certified installer
  ○ Two story homes require:
    - 1 certified installer AND
    - 1 installer pending certification OR a laborer
  ○ Commercial buildings require:
    - 2 certified installer AND
    - 2 installers pending certification AND
    - 4 workers of any type (cert, pending or laborer)

## Setup and run
Built on ruby 3.1.2 but should work with anything greater than or equal to ruby 3.
* `bundle`
* `rails db:create db:migrate db:seed`
* `rails schedule`

## tests
* `rails test`

## edge cases, improvements, untested, etc.
* buildings are pretty basic. there's not even a location so no sure how the crew will know where to go :D
* crew members don't have names so hopefully they know their ID so they know where to go work... ;)
* employees could have a better relationship to their schedule. right now I just pop each available employee off the stack
* could probably do ranges for pto days insted of just single days. would be more work to implement but would be easier to interact with as a user
* there could be more tests around `employee_ptos` and how they interact with scheduling
* the seeds are built specifically for the schedule
  * assumes that the day you're running is monday even if it really isn't
* querying employees for each day isn't super efficient and could be improved
* schedule itself can be way better.
  * it thinks that the current day is always monday and kind of ignores the actual day
    * this could be so much better
  * it could be a model and not just a class
  * could be something that can be viewed daily/weekly/monthly.
  * I spent more time on the different objects that make it up and decided to just have schedule be a rake task
* I could write more tests around the job and the Schedule class
* I just commited everything in one gigantic commit instead of breaking things up more. Individual commits for each file/change/feature would have been _way, way, way_ better but I only had a few hours to get to a solution.
