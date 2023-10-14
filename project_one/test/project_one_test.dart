import 'package:project_one/book.dart';
import 'package:project_one/bookstore.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  Book book = Book(title: 'Cooking', author: 'cheif', category: 'cooking');
  Bookstore store = Bookstore();
  test('getSize', () {
    expect(store.getSize(), 9);
  });
  test('getAuthor', () {
    expect(book.getAuthor(), 'cheif');
  });
  test('getTitle', () {
    expect(book.getTitle(), 'Cooking');
  });
  test('getCategory', () {
    expect(book.getCategory(), 'cooking');
  });
  test('getCopies', () {
    expect(book.getCopies(), 10);
  });
  test('getPublisher', () {
    expect(book.getPublisher(), null);
  });
  test('getPrice', () {
    expect(book.getPrice(), 0.0);
  });
}
