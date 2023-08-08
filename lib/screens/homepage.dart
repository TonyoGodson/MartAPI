
import 'package:flutter/material.dart';
import 'package:testrun/screens/product_detail.dart';
import '../model/market_model.dart';
import '../model/product_model.dart';
import '../network/network_helper.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiHelper apiHelper = ApiHelper();

  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final fetchedProducts = await apiHelper.fetchProducts();
      setState(() {
        products = fetchedProducts;
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Market Products'),
      ),
      backgroundColor: Colors.white38,
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap:() {
              Navigator.of(context).pushNamed(ProductDetail.routeName, arguments: product);
            },
            child: Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.width * .65,
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.white
              ),
              child: Column(children: [
                      SizedBox(
                        height: 200.0,
                          width: 200.0,
                          child: Hero(
                            tag: product,
                              child: Image.network(product.image))),
                  Text(product.title ?? ''),
                // Text("Description:\n${product.description} "
                //     "\nPrice: ${product.price}" ?? '', textAlign: TextAlign.justify)
              ],),
              // trailing: Text('${product.price ?? 0.0}'),
            ),
          );
        },
      ),
    );
  }
}

//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../network/network.dart';
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   void getProducts(){
//     Network().getProducts().then((value) => debugPrint(value.toString()))
//         .catchError((e) => debugPrint(e));
//   }
//
//   @override
//   void initState(){
//     super.initState();
//     getProducts();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: const Text("Mini Market App"),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(""),
//             Text("",
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }