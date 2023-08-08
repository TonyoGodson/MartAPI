import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testrun/model/product_model.dart';

class ProductDetail extends StatefulWidget {
  static const routeName = '/product_details';
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    ProductModel product = ModalRoute.of(context)?.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(title: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(product.title, style: GoogleFonts.aladin(
            fontSize: 21.0)),
      ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              Container(
                padding: const EdgeInsets.all(10.0),
                width: double.maxFinite,
                height: 350.0,
                child: Hero(
                  tag: product,
                    child: Image.network(product.image)),
              ),
              Text("\$${product.price}¢", style: GoogleFonts.aladin(
                fontSize: 18.0
              ),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Text(product.description, style: GoogleFonts.abel(
                    fontSize: 18.0
                  ), textAlign: TextAlign.justify,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
