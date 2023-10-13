import 'dart:io';

import 'package:project_one/book.dart';
import 'package:project_one/bookstore.dart';
import 'package:project_one/purchase.dart';

void main(List<String> arguments) {
  Bookstore store = Bookstore();
  Cart cart = Cart();
  print('');
  print('Welcome to bookstore');
  dynamic selection = 0;
  while (true) {
    print('----------------------------');
    print('Please select from the menu:');
    print('');
    print('1: find a book');
    print('2: add new book to store');
    print('3: remove book from store');
    print('4: purchase book from store');
    print('5: show purchase from store');
    print('6: modifiy book from store');
    print('7: display all books from store');
    print('q: exit');
    print('');
    print('----------------------------');
    print('');

    selection = stdin.readLineSync();
    if (selection == '1') {
      findbook(store);
    }
    if (selection == '2') {
      addbook(store);
    }
    if (selection == '3') {
      removebook(store);
    }
    if (selection == '4') {
      purchase(store, cart);
    }
    if (selection == '5') {
      cart.displayCart();
    }
    if (selection == '6') {
      modifiy(store);
    }
    if (selection == '7') {
      store.displayAll();
    }
    if (selection == 'q') {
      exit(0);
    }
  }
}

void modifiy(Bookstore store) {
  dynamic selection;
  dynamic modfication;
  String title;
  String change = 't';
  dynamic value;
  print('Please enter the title of the book you want to modifiy:');
  selection = stdin.readLineSync();
  title = selection.toString().toLowerCase();
  while (true) {
    print('');
    print('Please select the section you want to modifiy:');
    print('========----------------------------========');
    print('1) Title');
    print('2) Author');
    print('3) Category');
    print('4) Publisher');
    print('5) Price');
    print('6) Number of copies');
    print('');
    selection = stdin.readLineSync();
    if (selection == '1') {
      print('Please enter new title:');
      modfication = stdin.readLineSync();
      value = modfication.toString();
      store.editBook(title, change, value);
      return;
    }
    if (selection == '2') {
      print('Please enter new author');
      modfication = stdin.readLineSync();
      value = modfication.toString();
      change = 'a';
      store.editBook(title, change, value);
      return;
    }
    if (selection == '3') {
      change = 'c';
      print('Please enter new category:');
      modfication = stdin.readLineSync();
      value = modfication.toString();
      store.editBook(title, change, value);
      return;
    }
    if (selection == '4') {
      print('Please enter new publisher:');
      modfication = stdin.readLineSync();
      value = modfication.toString();
      change = 'p';
      if (value == "") {
        value = null;
      }
      store.editBook(title, change, value);
      return;
    }
    if (selection == '5') {
      change = 'pr';
      while (true) {
        print('Please enter new price:');
        modfication = stdin.readLineSync();
        value = modfication.toString();
        if (value == "") {
          value = null;
          break;
        }
        try {
          value = double.parse(value);
          break;
        } catch (error) {
          print('please enter valid price');
        }
      }
      store.editBook(title, change, value);
      return;
    }
    if (selection == '6') {
      change = 'cpy';
      while (true) {
        print('Please enter new number of copies:');
        modfication = stdin.readLineSync();
        try {
          value = int.parse(modfication);
          break;
        } catch (error) {
          print('Please enter a valid number of copies');
        }
      }
      store.editBook(title, change, value);
      return;
    }
  }
}

void purchase(Bookstore store, Cart cart) {
  dynamic selection;
  dynamic selectionA;
  print('Please enter the title of the book you want to purchase:');
  selection = stdin.readLineSync().toString().toLowerCase();
  print('Please enter the Author of the book you want to purchase:');
  selectionA = stdin.readLineSync().toString().toLowerCase();
  store.purchase(selection, selectionA);
  cart.addTocart(store, selection, selectionA);
}

void removebook(Bookstore store) {
  dynamic selection = 0;
  String t = "";
  String a = "";
  String c = "";
  print('Please enter book title:');
  selection = stdin.readLineSync();
  t = selection.toString();
  print('Please enter book author:');
  selection = stdin.readLineSync();
  a = selection.toString();
  print('Please enter book category:');
  selection = stdin.readLineSync();
  c = selection.toString();
  Book b = store.createBook(t, a, c, null, null);
  store.deleteBook(b);
}

void addbook(Bookstore store) {
  dynamic selection = 0;
  String t = "";
  String a = "";
  String c = "";
  String? p;
  double? pr;
  print('Please enter book title:');
  selection = stdin.readLineSync();
  t = selection.toString();
  print('Please enter book author:');
  selection = stdin.readLineSync();
  a = selection.toString();
  print('Please enter book category:');
  selection = stdin.readLineSync();
  c = selection.toString();
  print('Please enter book publisher or hit enter if not known:');
  selection = stdin.readLineSync();
  p = selection.toString();
  if (p == "") {
    p = null;
  }
  print('Please enter book price or hit enter if not known:');
  while (true) {
    selection = stdin.readLineSync();
    selection = selection.toString();
    if (selection == "") {
      pr = null;
      break;
    }
    try {
      pr = double.parse(selection);
      break;
    } catch (error) {
      print('please enter valid price');
    }
  }
  Book b = store.createBook(t, a, c, p, pr);
  store.addTostore(b);
}

void findbook(Bookstore store) {
  dynamic selection = 0;
  while (true) {
    print('Please select from the following:');
    print('1: find by title');
    print('2: find by author');
    print('3: find by category');
    print('r: return to main menue');
    selection = stdin.readLineSync();
    if (selection == '1') {
      print('Please enter the title of the book:');
      selection = stdin.readLineSync();
      selection = selection.toString().toLowerCase();
      store.findBytitle(selection);
      return;
    }
    if (selection == '2') {
      print('Please enter the author of the book:');
      selection = stdin.readLineSync();
      selection = selection.toString().toLowerCase();
      store.findByauthor(selection);
      return;
    }
    if (selection == '3') {
      print('Please enter the category of the book:');
      selection = stdin.readLineSync();
      selection = selection.toString().toLowerCase();
      store.findBycategory(selection);
      return;
    }
    if (selection == 'r') {
      return;
    }
  }
}
