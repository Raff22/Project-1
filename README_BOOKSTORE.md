# Bookstore project
The program mimic a real life bookstore services.

## Description
This CLI program provides operations that the user can use to find books and purchase them. It also display books for view and includes a purchase report.
## Getting Started

### Executing program
Run program project_one.dart inside bin directory to start bookstore.

### Program guide and opreations:
* Front page: 
This is the first page that appeares to user.
User then insert a number of desired operation or "q" to exit program. 
<img width="628" alt="frontpage" src="https://github.com/Raff22/Project-1/assets/86999942/122db20d-df9d-4799-a901-c5ae61a6e8d4">

* Find a book:

If user insert "1" to find a book the program asks the user to select attribute to find a book.
<img width="359" alt="findbook" src="https://github.com/Raff22/Project-1/assets/86999942/b0a29e1c-5faa-41ce-a06d-678ae5cb3ac4">

The user then selects which attribute they want to look for book by. if the user selescts "1" then the program search for book by title.
If the book is in store it display book info to user.

<img width="625" alt="Screenshot 2023-10-14 at 12 47 15 PM" src="https://github.com/Raff22/Project-1/assets/86999942/71480e5e-136e-46e8-8975-d770a892ec49">

If the book does not exist in store, the program diplay the following.

<img width="354" alt="Screenshot 2023-10-14 at 12 52 58 PM" src="https://github.com/Raff22/Project-1/assets/86999942/47f54cc1-788f-4625-b42b-30e4cd9e293b">

So, depending on the attribute the user is selescting the diplay of books appear. If the user chooses to find a book by "author name" , all the books in store that is written by the author will be displayed. The same condition applies to "category".

* Add a book to store:

if the user chooses to add a book then the program promots the user for book information and display the book with default 10 copies in store.

<img width="793" alt="Screenshot 2023-10-14 at 1 03 41 PM" src="https://github.com/Raff22/Project-1/assets/86999942/2cd9b57c-d745-4e88-a1a5-1cb464694462">

if the user add an existing book in store, the programs process that as a additional copy of the book.
<img width="619" alt="Screenshot 2023-10-14 at 1 10 45 PM" src="https://github.com/Raff22/Project-1/assets/86999942/7bed83cd-3a75-4a88-b0bc-323f9378afff">

* Remove a book from store:

if the user chooses to remove a book from store, the program will ask the user for the title of the book and then remove it (all copies).

<img width="651" alt="Screenshot 2023-10-14 at 1 22 41 PM" src="https://github.com/Raff22/Project-1/assets/86999942/64b5d883-8e1b-434b-9d20-fec3975d6453">

if the book user inserted not in store

<img width="632" alt="nonexistantremove" src="https://github.com/Raff22/Project-1/assets/86999942/2d70a9aa-1475-476f-9d8f-2a61ec52285c">

* Purchase a book from store:

If the user enters "4" to purchase an existing book, the program asks the user for book title and the following will display

<img width="661" alt="Screenshot 2023-10-14 at 1 34 46 PM" src="https://github.com/Raff22/Project-1/assets/86999942/05efc3ea-66c4-4f53-aab4-d5321b043f55">

If the book the user is trying to purchase does not exist in store, the following will display

<img width="583" alt="Screenshot 2023-10-14 at 1 47 20 PM" src="https://github.com/Raff22/Project-1/assets/86999942/8b0641cb-e01a-430b-bfb6-f91b2cbce72d">


If the book the user is trying to purchase do exist in store, but no available copies in store, the following will display. 
NOTE: I updated number of copies to zero for this example.

<img width="616" alt="Screenshot 2023-10-14 at 1 40 53 PM" src="https://github.com/Raff22/Project-1/assets/86999942/26f7992d-77e4-4aca-8c46-b93760942a2b">


* Show purchases report:

this method display a report the user purchases and total of their purchase.

<img width="640" alt="Screenshot 2023-10-14 at 1 57 09 PM" src="https://github.com/Raff22/Project-1/assets/86999942/1aa0f9bb-0f6e-4eb1-8f67-4ebb2ba63d8a">


* Modifiy a book from store:
* Display all books in store:
* Display all books in store by categories:
* Display all books in store by a category:
  





## Handling errors
## Authors
Raffal Abu Eshey

## Version History
* 0.1
    * Initial Release


