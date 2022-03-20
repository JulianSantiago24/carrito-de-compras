
class ProductsModel {

  int id;
  String title;
  double price;
  String description;
  String image;

  ProductsModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.image
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
  ProductsModel(
    id: json['id'],
    title: json['title'],
    price: json['price'] == null ? 0.0 : json['price'].toDouble(),
    description: json['description'],
    image: json['image'],
  );

}

// List<ProductsModel> products = [

//   ProductsModel(
//     id: 1, 
//     title: "Pencil",
//     //price: 2,
//     description: "So beatiful Pencil",
//     image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'
//   ),

//   ProductsModel(
//     id: 2, 
//     title: "Colors",
//     //price: 3,
//     description: "So beatiful Colors",
//     image: 'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg'
//   ),

//   ProductsModel(
//     id: 3, 
//     title: "Oil Colors",
//     //price: 5,
//     description: "So beatiful Colors",
//     image: 'https://images.freeimages.com/images/small-previews/bb8/squeezed-1192540.jpg'
//   )

// ];



