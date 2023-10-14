import 'package:project_one/book.dart';
import 'package:project_one/bookstore.dart';

class Cart {
  late Map<Book, int> cart;
  late double total;
  late int items;

  Cart() {
    cart = {};
    total = 0;
    items = 0;
  }

  void addTocart(Bookstore bookstore, String name) {
    for (Book b in bookstore.bookstore.keys) {
      if (b.title.toLowerCase() == name.toLowerCase()) {
        if (b.getCopies() < 1) {
          print('');
          print(
              '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
          print(
              ' Sorry, no copies of ${b.getTitle()} are available at the moment');
          print(
              '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
          return;
        }
        b.setCopies(b.getCopies() - 1);
        if (cart.containsKey(b)) {
          cart.update(b, (value) => value + 1);
        } else {
          cart[b] = 1;
        }
        items++;
        total += b.getPrice();
        print('');
        print(
            '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
        print("      ${b.getTitle()} was added to your cart successfully!    ");
        print('            You have $items items in your cart                ');
        print(
            '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
        b.printDetails();
        print('');
        return;
      }
    }
    print('');
    print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    print(' The book you want to purchase does not exist in store');
    print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
  }

  void displayCart() {
    if (items > 0) {
      print('');
      print(
          '======================= PURCHASES REPORT =========================');
      this.cart.forEach((key, value) {
        key.printDetails();
        print('Number of copies: $value');
      });
      print('');
      print('=======================================');
      print('Total: $total');
      print('=======================================');
    } else {
      print('');
      print('=======================================');
      print('=        YOUR CART IS EMPTY           =');
      print('=======================================');
    }
  }
}
