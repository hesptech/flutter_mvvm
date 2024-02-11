import 'package:flutter_mvvm/models/model.dart';


class ItemListViewModel {
  final ItemList _itemList = ItemList();

  List<String> get items => _itemList.items; 

  /* set itemList(ItemList itemList) {
    itemList = _itemList;
  } */ 
  
  void addItem(String item) {
    _itemList.items.add(item);
  }
}