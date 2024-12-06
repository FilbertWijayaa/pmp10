import 'package:flutter/material.dart';
import 'package:fw/models/product_model.dart';
import 'package:fw/repository/product_repository.dart';
import 'package:fw/response/product_response.dart';

class Homepage extends StatefulWidget {
   Homepage({super.key});

  final productRepository = ProductRepository();

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final productRepository = ProductRepository();
  late final Future<ProductResponse> futureProduct;

  @override
  void initState() {
    futureProduct = productRepository.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan API Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FutureBuilder(
        future: futureProduct,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.listProduct.length,
              itemBuilder: (context, index) {
                ProductModel productModel =
                  snapshot.data!.listProduct[index];
                debugPrint(productModel.title);
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(productModel.id.toString()),
                  ),
                  title: Text(productModel.title),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(productModel.stock.toString()),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return Center(child: CircularProgressIndicator());
        }),
    );
  }
}
