import 'dart:io';
import 'package:project_one/book.dart';
import 'package:project_one/bookstore.dart';
import 'package:project_one/purchase.dart';

void main(List<String> arguments) {
  Bookstore store = Bookstore();
  Cart cart = Cart();
  print('');
  print('====================================================================');
  print('==================== WELCOME TO BOOKSTORE ==========================');
  print('====================================================================');
  dynamic selection = 0;
  while (true) {
    print('');
    print('********************************');
    print('* Please select from the menu: *');
    print('********************************');
    print('1: Find a book');
    print('2: Add a book to store');
    print('3: Remove a book from store');
    print('4: Purchase a book from store');
    print('5: Show purchases report');
    print('6: Modifiy a book from store');
    print('7: Display all books in store');
    print('8: Display all books in store by categories');
    print('9: Display all books in store by a category');
    print('q: Exit');
    print('--------------------------------');

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
    if (selection == '8') {
      store.displayByCategory();
    }
    if (selection == '9') {
      print('');
      print('===--------------------------------------------------===');
      print('Please type the name of the category you want to diplay:');
      print('===--------------------------------------------------===');
      store.allCat();
      selection = stdin.readLineSync();
      selection = selection.toString().toLowerCase();
      store.findBycategory(selection, true);
    }
    if (selection == 'q') {
      exit(0);
    }
  }
}

/*
  This function 
*/
void modifiy(Bookstore store) {
  dynamic selection;
  dynamic modfication;
  String title;
  String change = 't';
  dynamic value;
  print('');
  print('========--------------------------------------=========');
  print('Please enter the title of the book you want to modifiy:');
  print('========--------------------------------------=========');
  selection = stdin.readLineSync();
  title = selection.toString().toLowerCase();
  while (true) {
    print('');
    print('========----------------------------=========');
    print('Please select the section you want to modifiy:');
    print('========----------------------------=========');
    print('1) Title');
    print('2) Author');
    print('3) Category');
    print('4) Publisher');
    print('5) Price');
    print('6) Number of copies');
    print('r) Return to main menu');
    print('---------------------------------------------');
    print('');
    selection = stdin.readLineSync();
    if (selection == '1') {
      print('');
      print('===-----------------===');
      print('Please enter new title:');
      print('===-----------------===');
      modfication = stdin.readLineSync();
      value = modfication.toString();
      store.editBook(title, change, value);
      return;
    }
    if (selection == '2') {
      print('');
      print('===-----------------===');
      print('Please enter new author');
      print('===-----------------===');
      modfication = stdin.readLineSync();
      value = modfication.toString();
      change = 'a';
      store.editBook(title, change, value);
      return;
    }
    if (selection == '3') {
      change = 'c';
      print('');
      print('===-------------------===');
      print('Please enter new category:');
      print('===-------------------===');
      modfication = stdin.readLineSync();
      value = modfication.toString();
      store.editBook(title, change, value);
      return;
    }
    if (selection == '4') {
      print('');
      print('===--------------------===');
      print('Please enter new publisher:');
      print('===--------------------===');
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
        print('');
        print('===------------------===');
        print('Please enter new price:');
        print('===------------------===');
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
          print('');
          print('!!!!!!!!!!!!!!!!!!!');
          print('! INPUT NOT VALID !');
          print('!!!!!!!!!!!!!!!!!!!');
        }
      }
      store.editBook(title, change, value);
      return;
    }
    if (selection == '6') {
      change = 'cpy';
      while (true) {
        print('');
        print('===---------------------------===');
        print('Please enter new number of copies:');
        print('===---------------------------===');
        modfication = stdin.readLineSync();
        try {
          value = int.parse(modfication);
          break;
        } catch (error) {
          print('');
          print('!!!!!!!!!!!!!!!!!!!');
          print('! INPUT NOT VALID !');
          print('!!!!!!!!!!!!!!!!!!!');
        }
      }
      store.editBook(title, change, value);
      return;
    }
    if (selection == 'r') {
      return;
    }
  }
}

void purchase(Bookstore store, Cart cart) {
  dynamic selection;
  print('');
  print('===--------------------------------------------------===');
  print('Please enter the title of the book you want to purchase:');
  print('===--------------------------------------------------===');
  selection = stdin.readLineSync().toString();
  if (selection == 'r') {
    return;
  }
  store.purchase(selection);
  cart.addTocart(store, selection);
}

void removebook(Bookstore store) {
  dynamic selection = 0;
  print('');
  print('===----------------------------------===');
  print('Please enter book title:');
  print('===----------------------------------===');
  selection = stdin.readLineSync().toString();
  if (selection == 'r') {
    return;
  }
  store.deleteBook(selection);
}

void addbook(Bookstore store) {
  dynamic selection = 0;
  String t = "";
  String a = "";
  String c = "";
  String? p;
  double? pr;
  print('');
  print('===-------------------===');
  print('Please enter book title:');
  print('===-------------------===');
  selection = stdin.readLineSync();
  if (selection == 'r') {
    return;
  }
  t = selection.toString();
  print('');
  print('===-------------------===');
  print('Please enter book author:');
  print('===-------------------===');
  selection = stdin.readLineSync();
  if (selection == 'r') {
    return;
  }
  a = selection.toString();
  print('');
  print('===--------------------===');
  print('Please enter book category:');
  print('===--------------------===');
  selection = stdin.readLineSync();
  if (selection == 'r') {
    return;
  }
  c = selection.toString();
  print('');
  print('===------------------------------------------------===');
  print('Please enter book publisher or hit enter if not known:');
  print('===------------------------------------------------===');
  selection = stdin.readLineSync();
  if (selection == 'r') {
    return;
  }
  p = selection.toString();
  if (p == "") {
    p = null;
  }
  print('');
  print('===---------------------------------------------===');
  print('Please enter book price or hit enter if not known:');
  print('===---------------------------------------------===');
  while (true) {
    selection = stdin.readLineSync();
    selection = selection.toString();
    if (selection == 'r') {
      return;
    }
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
  print('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
  print('               The book was added sucessfully! ');
  print('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
  store.addTostore(b, true);
}

void findbook(Bookstore store) {
  dynamic selection = 0;
  while (true) {
    print('');
    print('===---------------------------===');
    print('Please select from the following:');
    print('===---------------------------===');
    print('1: find by title');
    print('2: find by author');
    print('3: find by category');
    print('r: return to main menue');
    print('---------------------------------');
    selection = stdin.readLineSync();
    if (selection == '1') {
      print('');
      print('===----------------------------===');
      print('Please enter the title of the book:');
      print('===----------------------------===');
      selection = stdin.readLineSync();
      selection = selection.toString().toLowerCase();
      store.findBytitle(selection);
      return;
    }
    if (selection == '2') {
      print('');
      print('===------------------------------===');
      print('Please enter the author of the book:');
      print('===------------------------------===');
      selection = stdin.readLineSync();
      selection = selection.toString().toLowerCase();
      store.findByauthor(selection);
      return;
    }
    if (selection == '3') {
      print('');
      print('===--------------------------------===');
      print('Please enter the category of the book:');
      print('===--------------------------------===');
      selection = stdin.readLineSync();
      selection = selection.toString().toLowerCase();
      store.findBycategory(selection, false);
      return;
    }
    if (selection == 'r') {
      return;
    }
  }
}
