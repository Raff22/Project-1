import 'package:project_one/book.dart';
import 'dart:math';
import 'package:project_one/database.dart';

class Bookstore {
  Map<Book, int> bookstore = {};
  Map<String, List<Book>> categories = {};
  final copies = 10;

  Bookstore() {
    _storeBuilder(booksList);
  }
  void _storeBuilder(List list) {
    for (List element in list) {
      _lineCleaner(element);
    }
  }

  void _lineCleaner(List line) {
    String t = line[0]; //getting title
    String a = line[1]; //getting author
    String c = line[2]; //getting category
    String p = line[3]; //getting publisher

    //creating a book price
    double pr = Random().nextDouble() * 256;
    String to2 = pr.toStringAsFixed(2);
    pr = double.parse(to2);
    Book book = createBook(t, a, c, p, pr);
    addTostore(book, false);
  }

  int getSize() {
    return bookstore.length;
  }

  void findBytitle(String name) {
    //find by title
    bool notfound = true;
    for (Book b in bookstore.keys) {
      if (b.title.toLowerCase() == name) {
        print('');
        print("Found your book!");
        print('++++++++++++++++');
        b.printDetails();
        notfound = false;
        break;
      }
    }
    if (notfound) {
      print("");
      print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      print('Sorry, we did not find your book');
      print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    }
  }

  void findByauthor(String name) {
    //find by author
    bool notfound = true;
    for (Book b in bookstore.keys) {
      if (b.author.toLowerCase() == name) {
        b.printDetails();
        print('');
        notfound = false;
      }
    }
    if (notfound) {
      print("");
      print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      print(' Sorry, we did not find your book');
      print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    }
  }

  void findBycategory(String name, bool all) {
    //find by category
    bool notfound = true;
    for (Book b in bookstore.keys) {
      if (b.category.toLowerCase() == name.toLowerCase()) {
        b.printDetails();
        print('');
        notfound = false;
      }
    }
    if (notfound) {
      if (all) {
        print("");
        print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
        print(' No books found withen this category');
        print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      } else {
        print("");
        print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
        print(' Sorry, we did not find your book');
        print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      }
    }
  }

  Book createBook(String title, String author, String category,
      String? publisher, double? price) {
    Book book = Book(
        title: title,
        author: author,
        category: category,
        price: price,
        publisher: publisher);
    return book;
  }

  void addTostore(Book b, bool notBuilder) {
    for (Book key in bookstore.keys) {
      if (key.title.toLowerCase() == b.title.toLowerCase() &&
          key.author.toLowerCase() == b.author.toLowerCase() &&
          key.category.toLowerCase() == b.category.toLowerCase()) {
        bookstore.update(key, (value) => value + 1);
        key.setCopies(key.getCopies() + 1);
        if (notBuilder) {
          key.printDetails();
        }
        return;
      }
    }
    bookstore[b] = copies;
    if (notBuilder) {
      b.printDetails();
    }
  }

  void deleteBook(String book) {
    bool notfound = true;
    for (Book b in bookstore.keys) {
      if (b.title.toLowerCase() == book.toLowerCase()) {
        bookstore.remove(b);
        notfound = false;
        print("");
        print(
            '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
        print('               The book was removed sucessfully! ');
        print(
            '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
        break;
      }
    }
    if (notfound) {
      print('');
      print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      print(" The book you want to remove does not exist in bookstore");
      print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    }
  }

  void purchase(String name) {
    for (Book b in bookstore.keys) {
      if (b.title.toLowerCase() == name.toLowerCase()) {
        if (b.getCopies() < 1) {
          return;
        }
        bookstore.update(b, (value) => value - 1);
        return;
      }
    }
  }

  void displayAll() {
    print('');
    print('   ===-------------------------------------------------------===');
    print('   ===-                    ALL BOOKS                        -===');
    print('   ===-------------------------------------------------------===');
    this.bookstore.keys.forEach((key) {
      key.printDetails();
    });
  }

  void editBook(String name, String change, dynamic val) {
    for (Book b in bookstore.keys) {
      if (b.title.toLowerCase() == name) {
        if (change == 't') {
          //title
          b.setTitle(val);
        }
        if (change == 'a') {
          //author
          b.setAuthor(val);
        }
        if (change == 'c') {
          //category
          b.setCategory(val);
        }
        if (change == 'p') {
          //publisher
          b.setPublisher(val);
        }
        if (change == 'pr') {
          //price
          b.setPrice(val);
        }
        if (change == 'cpy') {
          //copies
          print('got here');
          b.setCopies(val);
          bookstore[b] = val;
        }
        print(
            '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
        print('               The book was modified sucessfully! ');
        print(
            '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
        b.printDetails();
        return;
      }
    }
    print('');
    print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    print(' Sorry, we did not find the book you want to edit');
    print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
  }

  void createCat() {
    categories = {};
    for (Book book in bookstore.keys) {
      if (categories.containsKey(book.getCategory())) {
        categories[book.getCategory()]?.add(book);
      } else {
        categories[book.getCategory()] = [book];
      }
    }
  }

  void allCat() {
    createCat();
    print('');
    print('Available Categoreies:');
    print('----------------------');
    for (String cat in categories.keys) {
      print('- $cat');
    }
    print('----------------------');
  }

  void displayByCategory() {
    createCat();
    print('   ===-------------------------------------------------------===');
    print('   ===-                    CATEGORIES                       -===');
    print('   ===-------------------------------------------------------===');
    categories.forEach((key, value) {
      key = key.toUpperCase();
      print('');
      print(
          '$key:                                       BOOKS: ${value.length}');
      print(
          '===------------------------------------------------------------===');
      for (Book b in value) {
        b.printDetails();
      }
      print(
          '===-----------------------end of category----------------------===');
      print('');
    });
  }
}
