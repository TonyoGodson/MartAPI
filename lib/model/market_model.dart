class MarketModel{
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? imageLink;
  String? rating;

  MarketModel({this.id, this.title, this.price, this.description, this.category, this.imageLink, this.rating});

  MarketModel.fromJson(Map<dynamic, dynamic> json){
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    imageLink = json['imageLink'];
    rating = json['rating'];
  }

  MarketModel.fromMap(Map<dynamic, dynamic> map){
    id = int.parse(map['id']);
    title = map['title'];
    price = double.parse(map['price']);
    description = map['description'];
    category = map['category'];
    imageLink = map['imageLink'];
    rating = map['rating'];
  }
}

//
// class ProductModel {
//   final int id;
//   final String title;
//   final double price;
//   final String description;
//   final String category;
//   final String image;
//   final RatingModel rating;
//
//   ProductModel({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.description,
//     required this.category,
//     required this.image,
//     required this.rating,
//   });
//
//   factory ProductModel.fromMap(Map<dynamic, dynamic> map) {
//     return ProductModel(
//       id: map['id'],
//       title: map['title'],
//       price: map['price'].toDouble(),
//       description: map['description'],
//       category: map['category'],
//       image: map['image'],
//       rating: RatingModel.fromMap(map['rating']),
//     );
//   }
// }
//
// class RatingModel {
//   final double rate;
//   final int count;
//
//   RatingModel({
//     required this.rate,
//     required this.count,
//   });
//
//   factory RatingModel.fromMap(Map<String, dynamic> map) {
//     return RatingModel(
//       rate: map['rate'].toDouble(),
//       count: map['count'],
//     );
//   }
// }