import 'package:mobx/mobx.dart';
import 'package:panucci_delivery/models/item.dart';

part 'carrinho_store.g.dart';

class CarrinhoStore = _CarrinhoStore with _$CarrinhoStore;

abstract class _CarrinhoStore with Store {
  @observable
  List<Item> listaItem = ObservableList<Item>();

  @computed
  int get quantidadeItem {
    return listaItem.length;
  }

  @computed
  bool get listaVazia => listaItem.isEmpty;

  @action
  void adicionaItem(Item item) {
    listaItem.add(item);
  }

  @action
  void removeItem(Item item) {
    listaItem.remove(item);
  }
}
