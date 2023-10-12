import 'package:project_one/book.dart';
import 'package:project_one/bookstore.dart';

void main(List<String> arguments) {
  Bookstore store = Bookstore();
  store.createBook('title', 'author', 'category', 'publisher', 90.0);
  // store.displayAll();
  Book? s = store.editBook('title');
  if (s != null) {
    s.setPrice(0);
  }
  store.displayAll();
}
