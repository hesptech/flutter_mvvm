import 'package:flutter_mvvm/models/item_list_model.dart';


class ItemListViewModel {
  final ItemListModel _itemList = ItemListModel();

  List<String> get items => _itemList.items; 

  /* set itemList(ItemList itemList) {
    itemList = _itemList;
  } */ 
  
  void addItem(String item) {
    _itemList.items.add(item);
  }
}