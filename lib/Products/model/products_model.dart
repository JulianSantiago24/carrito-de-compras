
class ProductsModel {

  int id;
  String title;
  double price;
  String description;
  Rating rating;
  String image;

  ProductsModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.rating,
    this.image
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
  ProductsModel(
    id: json['id'],
    title: json['title'],
    price: json['price'] == null ? 0.0 : json['price'].toDouble(),
    description: json['description'],
    rating: Rating.fromJsonMap(json['rating']),
    image: json['image'],
  );
}

class Rating{
  double rate;
  int count;

  Rating({
    this.rate,
    this.count
  });

  factory Rating.fromJsonMap(Map<dynamic, dynamic> json) =>
   Rating( 
    rate: json['rate'] == null ? 0.0 : json['rate'].toDouble(),
    count: json['count']
  );
}



