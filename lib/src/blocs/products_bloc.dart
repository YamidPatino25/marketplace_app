import 'package:marketplace_app/src/resource/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';

class ProductsBloc {
  final _repository = Repository();
  final _productsFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allProducts => _productsFetcher.stream;

  fetchAllProducts() async {
    ItemModel itemModel = await _repository.fetchProducts();
    _productsFetcher.sink.add(itemModel);
  }

  dispose() {
    _productsFetcher.close();
  }
}

final productsBloc = ProductsBloc();