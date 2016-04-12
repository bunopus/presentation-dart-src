class LimitedList<E> extends Iterable<E>{
  List<E> _base = [];
  int limit;

  LimitedList({int limit}) : this.fromList([], limit: limit);
  LimitedList.fromList(List source, {int this.limit}) {
    _base = source;
  }

  void add(E value) {
    _base.add(value);
    if(limit != null && _base.length > limit) {
      _base.removeAt(0);
    }
  }

  // TODO: implement iterator
  @override
  Iterator<E> get iterator => _base.iterator;
}