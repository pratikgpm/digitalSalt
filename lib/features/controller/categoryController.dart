import 'package:flutter_riverpod/flutter_riverpod.dart';

final SelectedCategoriesNotifierProvider = NotifierProvider<SelectedCategoriesNotifier,List<String>>
  ((){
  return SelectedCategoriesNotifier();
});

class SelectedCategoriesNotifier extends Notifier<List<String>>{

  @override
  List<String> build() {

    return ([]);
  }

  void addCategory(String name){
    state = [...state,name];
  }
  void remoreCatefory(String name){
    state = state.where((element) => element != name).toList();
  }
  bool isAvailable(String name){
    return state.any((element) => element == name);
  }

}
