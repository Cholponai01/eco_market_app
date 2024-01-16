class ShoppingCartItem {
  int _counter = 0;
  void incrementCounter() {
    _counter++;
  }

  decrementCounter() {
    if (_counter > 0) _counter--;
  }

  int getCounter() {
    return _counter;
  }
}
