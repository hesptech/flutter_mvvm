import 'package:flutter_mvvm/models/model.dart';


class ItemListViewModel {
  final ItemList _itemList = ItemList();

  List<String> get items => _itemList.items; 
  
  void addItem(String item) {
    _itemList.items.add(item);
  }
}