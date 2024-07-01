import 'package:mobx/mobx.dart';
import 'package:panucci_delivery/models/item.dart';

part 'carrinho_store.g.dart';

class CarrinhoStore = _CarrinhoStore with _$CarrinhoStore;

abstract class _CarrinhoStore with Store {
  @observable
  List<Item> listaItem = ObservableList<Item>();

  @observable
  double totalDaCompra = 0;

  @computed
  int get quantidadeItem {
    return listaItem.length;
  }

  @computed
  bool get listaVazia => listaItem.isEmpty;

  @action
  void adicionaItem(Item item) {
    listaItem.add(item);

    calculaTotal();
  }

  @action
  void removeItem(Item item) {
    listaItem.remove(item);

    calculaTotal();
  }

  @action
  void calculaTotal() {
    totalDaCompra = 0;
    for (var item in listaItem) {
      totalDaCompra += item.preco;
    }
  }
}
