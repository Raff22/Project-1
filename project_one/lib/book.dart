class Book {
  late String title;
  late String author;
  late String category;
  String? publisher;
  double? price;
  int copiesDefault = 10;
  late int copies;

  Book(
      {required String title,
      required String author,
      required String category,
      String? publisher,
      double? price}) {
    this.title = title;
    this.author = author;
    this.category = category;
    this.publisher = publisher;
    this.price = price;
    this.copies = copiesDefault;
  }

  void printDetails() {
    print('');
    print('-----------------------------BOOK---------------------------------');
    print('------------------------------------------------------------------');
    print('| Title: $title');
    print('| Author: $author');
    print('| Category: $category');
    print('| Publisher: $publisher');
    print('| Price: $price');
    print('| Copies: $copies');
    print('------------------------------------------------------------------');
    print('');
  }

  String getTitle() {
    return this.title;
  }

  void setTitle(String title) {
    this.title = title;
  }

  String getAuthor() {
    return this.author;
  }

  void setAuthor(String author) {
    this.author = author;
  }

  String getCategory() {
    return this.category;
  }

  void setCategory(String category) {
    this.category = category;
  }

  String? getPublisher() {
    return this.publisher;
  }

  void setPublisher(String? publisher) {
    this.publisher = publisher;
  }

  double getPrice() {
    return this.price ?? 0.0;
  }

  void setPrice(double? price) {
    this.price = price;
  }

  int getCopies() {
    return this.copies;
  }

  void setCopies(int num) {
    this.copies = num;
  }
}
