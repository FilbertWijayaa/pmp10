import 'package:bloc/bloc.dart';
import 'package:fw/repository/product_repository.dart';
import 'package:fw/response/product_response.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final productRepository = ProductRepository();
  ProductBloc() : super(ProductInitial()) {
    on<GetProductsEvent>((event, emit) async {
      emit(ProductLoading());
      try{
        ProductResponse response = await productRepository.getProducts();
        emit(ProductLoaded(productResponse: response));
      }on Exception catch(e){
        emit(ProductError(message: e.toString()));
      }
    });
  }
}
