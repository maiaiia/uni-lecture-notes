# Subjects

| Project                     | PHP | SpringBoot | ASP.NET | Node.js |
| --------------------------- | :-: | :--------: | :-----: | :-----: |
| Task Management             |  X  |     X      |    X    |    X    |
| Gym                         |     |            |         |    X    |
| Orders                      |     |            |         |         |
| Hotels                      |  X  |     X      |         |         |
| Flights-Hotels-Reservations |     |            |         |         |
| SWE Project                 |     |            |         |         |


## Orders 
Write a web application in php that uses the following 4 tables:
 table User: id(int), username(string)
 table Product: id(int), name(string), price(decimal)
 (the category of a producf is specified as a prefix in its name, eg "BOOK-Math","TOY-Car")
 table Order: id(int), userId(int),totalPrice(decimal)
 table OrderItem: id(int), orderId(int), productId(int)

The user should specify his name prior to using the application (no authentification or other checks are required, you should assume that the user exists in the User tbale) After logging in, the user can begin building an order by selecting products. The selected products are added to a new order (they are saved in the database only when the user confirms the order)

Discount Logic:
Before confirming the order, the total price is computed based n the following dynamic discount rules:
0 if the order contains 3 or more products, apply a 10% discount
0 if 2 or more products share the same category(derived from the product name prefix), apply an additional 5% discount
Discounts are applied only once per condition and cannot be combined multiple times (maximum 2 discounts can be applied)

The category is not stored in a separate column. It must be extracted from the product name (eg. "BOOK-History" -> "BOOK")

ONLY When the user confirms the order:
	a) the discounted price is computed
	b) the Order and related OrderItem entries are saved in the database 
	c) the final total (without discount applied) is displayed

The application should track the last 3 orders from this user. If the user tries to add (in the current order) a product whoce category already exists in all of the last 3 orders, the system should warn the user that they are not diversifying their product choices)

## Gym
Write a web application for a gym class booking system. The application should use the following 4 tables:
1. Users: id (int), username(string), membershipType(string: Basic / Premium)
2. Class: id(int), className(string), instructorName(string), classDate(date), maxCapacity(int); the intensity level of each class is encoded as a suffix (e.g. "Yoga-Low")
3. Booking: id(int), userId(int), classId(int), bookedAt(datetime), cancelled(bit)
4. WaitList: id(int), userId(int), classId(int), addedAt(datetime)

The user should authenticate prior to using the application by specifying their username; we assume it exists in the User table.

The application should display upcoming gym classes (classDate >= today). For each class, the number of remaining spots must be shown, computed in the backend as maxCapacity - the count of active (non-cancelled) bookings

Booking Rules:
1. A "Basic" member may not book a class with intensity "High". If they try, display: "High intensity classes are available for Premium members only"
2. If no spots are available, the user is automatically added to the WaitList instead of being booked. Display: "You've been added to the waitlist for \<ClassName>"
3. A user cannot book (or be waitlisted for) the same class twice

Cancellation and Waitlist Promotion:
When a user cancels an active booking (sets cancelled = 1), the application must:
1. Check in the backend whether the WaitList for that class has any entries (ordered by addedAt)
2. If so, take the first user from the WaitList, remove their entry, and create a new Booking for them
3. Display: "\<Username> has been automatically moved from the waitlist to a confirmed booking"

Weekly Intensity Balance Check:
When a user successfully books a class, the application must inspect all of that user's active bookings, extracting the intensity from each className suffix. If the user now has 3 or more bookings and all of them share the same intensity level, display: "All your bookings this week are \<Intensity> intensity. Consider balancing your workout routine!".
The application should also display the logged-in user's booking history (active and cancelled), including class name, date, time, and status


| Task                                                                 | Mark |
| -------------------------------------------------------------------- | ---- |
| configure web environment, create DB, authentication                 | 1    |
| display upcoming classes with remaining spot count                   | 1    |
| book a class (with membership / intensity check and duplicate check) | 1.5  |
| waitlist logic when class is full                                    | 1    |
| cancellation + automatic waitlist promotion                          | 2    |
| weekly intensity balance check                                       | 1.5  |
| display user booking history                                         | 1    |
| default                                                              | 1    |

## Hotels 
Write a web application in PHP for a hotel dynamic price calculation app. The application should use the following 3 tables:
1. Users: id (int), username(string)
2. HotelRoom: id (int), roomNumber(string), capacity (int), basePrice (int)
3. Reservation: id (int), userId (int), roomId checkInDate(date), checkOutDate (date), numberOfGuests (int), totalPrice(int)

The user should authenticate prior to using the application. After authentication, the user should be able to reserve rooms. When reserving, the room price depends on how many reservations already exist for that date range. The following pricing logic is used:
- If <= 50% rooms are already booked: basePrice
- If > 50% but <= 80% rooms are already booked: basePrice + 20%
- If > 80%: basePrice + 50%

The user should be able to view the list of rooms that are free / available in a specific time period (given by 2 dates). The user can then reserve one of those rooms. The application should also display the total number of guests that are staying in the hotel in a specific date (i.e. they have reservations and the reservation period includes that day).

The application should display all reservations for the user, with actual prices applied. Also, when reserving a room, the applications should prevent overlapping reservations for the same user.

---
Grading scale:

|                                                                              |     |
| ---------------------------------------------------------------------------- | --- |
| configure web environment, create DB, authentication                         | 1   |
| view list of available rooms in a specific time period                       | 1.5 |
| reserve a free room<br>(reservation - 1pt, middleware pricing logic - 1.5pt) | 2.5 |
| total number of guests staying in the hotel in a specific day                | 1.5 |
| display all reservations for the user, with actual prices                    | 1   |
| prevent overlapping bookings                                                 | 1.5 |
| default                                                                      | 1   |
## X Task Management
Write a web application in JSP for task management. The application should use the following 3 tables:
- User: id (int), username (string)
- Task: id (int), title (string), status (enum: todo, in_progress, done), assignedTo (int), lastUpdated (datetime)
- TaskLog: id (int), taskId (int), userId (int), oldStatus (string), newStatus (string), timestamp (datetime)

The user should authenticate prior to using the application (by specifying the username which should exist in the User table). After authentication, the user sees a task board with three columns: To Do, In Progress, Done; tasks are grouped by status.

A user can move a task between statuses. This status change must be saved in the Task table. Also, this change should be immediately visible to all users (i.e. their task boards are updated in real-time). The name of the user who last moved the task must be displayed as a tooltip (e.g. "Last updated by Alex"). %%fuckfuckfuck%%

Every task move must generate a record in the TaskLog table containing: which user moved the task, previous and new status, timestamp of the change.

During a session, count how many tasks the user has moved and show this number.

---
Grading scale:

|                                                                       |     |
| --------------------------------------------------------------------- | --- |
| configure web environment, create DB, authentication                  | 1   |
| view all tasks grouped by status                                      | 1.5 |
| move a task between statuses and save change in the Task table        | 1.5 |
| real-time update of taskboards                                        | 1.5 |
| show tooltip with the name of the user who last moved the task        | 1   |
| save task move log in the TaskLog table                               | 1.5 |
| show how many tsks were moved by the user in the current HTTP session | 1   |
| default                                                               | 1   |
## SWE Project
1. Write a web application in PHP/JSP/ASP which uses the following 2 database tables:
- table SoftwareDeveloper: id (int), name (string), age (int), skills (string)
- table Project: id (int), ProjectManagerID (int), name (string), description
  (string),   members (string)

The 'members' column from the Project table contains a list of persons
who are part of this project. The 'ProjectManagerID' is a foreign key and
references an entry in the SoftwareDeveloper table. The user should be able to specify
his/her name in a text field when starting to use the application. The user is a
software developer who can be a member of several projects. The user should be able
to see all the projects (display all the data of a project) in the database.
The user should be able to view all the projects (their names) he/she is member of. 
The current user should be able to assign another developer to a list of
projects (in one single HTTP request sent to the server - you should not send separate
HTTP requests to the server for each project). If the developer who should be
added to a project does not already exist in the SoftwareDeveloper table, nothing
happens (the non-existing developer is not added to any project). If the developer
has to be added to a non-existing project, this project is automatically added to
the Project table by the server-side (you are free to specify only the 'name' of the
project and leave the other fields of the project record empty).
There should also be a button that displays all the Software Developers from
the database and a javascript code should filter only those that have a
specific skill (e.g. 'Java'), skill that is chosen by the user using a text
input.


Grading scale:
- 1 point by default (oficiu) 
- configure web environment, create DB, display all projects in the database  : 2
- display all projects (only the project's name) the user is member of	      : 2.5
- assign other developer to a list of projects				      : 3
(nothing happens if the developer is not already in the SoftwareDeveloper table; 
add a new project if the project the developer should be member of doesn't exist 
in the Project table)
- display all software developers (server-side) and filter only the developers
that have a specific skill (client-side, javascript)			      : 1.5

You are not allowed to use any other DB tables except the ones specified above.
Also, all the data should be stored at the server-side in databases, not text files
or something similar.

---
The server-side technology (PHP or JSP or ASP.NET) is not at your choice, it is 
fixed by the exam subject. However, you can change this technology to another 
one of your preference, but in this case the final grade that you receive will 
be cut at 6 (i.e. the maximum grade that you can get for this practical exam is 6).

## Flights-Hotels-Reservations

Write a web application in ASP.NET for planning reservations. The application should use the following 3 tables:
- Flights: flightID (int), date(date / string), destinationCity (string), availableSets (int)
- Hotels: hotelID (int), hotelName (string), date (date / string), city (string), availableRooms (int)
- Reservations: id(int), person (string), type (Flight / Hote), idReservedResource (int)

The application assists the user in order to book reservations to a concert. In order to go to a concert, the user has to book a flight and a hote. For simplicity, we assume that all these bookings should be done for the same date (i.e. the flight and the hotel room are booked for the same date) and the same destination city. Also, we assume the user can book one flight seat at a time and one hotel room at a time. 

When the user starts using the application, he / she should specify their **name**, choose a **specific date** and a **destination city** and should then click on a *Begin Reservation* button. After this, the user is shown 2 menu items: *Flights* and *Hotels*. If the user chooses the *Flight* menu item, the application will show the user all the flights that are scheduled on that specific date, go to that specific destination city and have available seats (i.e. the *availableSeats* field is > 0). The user can reserve one seat on a flight: the *availableSeats* field will be decremented and a new record will be added to the Reservations table. They can then reserve another seat on the same flight or on a different flight from the same date and with the same destination. At any time, the user can choose the *Hotel* menu item where they can book a room to a hotel from a city which has available rooms in that specific date; the hotel reservation is done in a similar manner as the flight reservation: the user sees a list of these hotels: the *availableRooms* field of that hotel is decremented and a new record is added to the Reservation table (person = the name of the user, type = *Hotel*, idReservedResource = hotelID)

In all web pages of the application the menu items *Flights* and *Hotels* should be visible and there should also be a *Cancel All Reservations* button. If the user clicks this button, all the reservations (flight or hotel) that the user has done from the beginning of this session are cancelled (the corresponding records are deleted from the table and the available Seats/Rooms fields are updated accordingly). You cannot assume that all records in the Reservations table for the current user belong to the current session. Nor can you assume that the user always reserves one seat flight and one hotel room in an HTTP session.
