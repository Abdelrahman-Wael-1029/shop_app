class HomeModel {
  bool status;
  HomeDataModel data;

  HomeModel({
    required this.status,
    required this.data,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      status: json['status'],
      data: HomeDataModel.fromJson(json['data']),
    );
  }

  @override
  String toString() {
    return 'HomeModel(status: $status, data: $data)';
  }
}

class HomeDataModel {
  List<BannerModel> banners;
  List<ProductsModel> products;

  HomeDataModel({
    required this.banners,
    required this.products,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) {
    return HomeDataModel(
      banners: List<BannerModel>.from(
        json['banners'].map(
          (x) => BannerModel.fromJson(x),
        ),
      ),
      products: List<ProductsModel>.from(
        json['products'].map(
          (x) => ProductsModel.fromJson(x),
        ),
      ),
    );
  }

  @override
  String toString() {
    return 'HomeDataModel(banners: $banners, products: $products)';
  }
}

class BannerModel {
  int id;
  String image;

  BannerModel({
    required this.id,
    required this.image,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      image: json['image'],
    );
  }

  @override
  String toString() {
    return 'BannerModel(id: $id, image: $image)';
  }
}

class ProductsModel {
  int id;
  dynamic price;
  dynamic old_price;
  int discount;
  String image;
  String name;
  String description;
  List<String> images;
  bool in_favorites;
  bool in_cart;

  ProductsModel({
    required this.id,
    required this.price,
    required this.old_price,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.in_favorites,
    required this.in_cart,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'],
      price: json['price'],
      old_price: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      images: List<String>.from(json['images']),
      in_favorites: json['in_favorites'],
      in_cart: json['in_cart'],
    );
  }

  @override
  String toString() {
    return 'ProductsModel(id: $id, price: $price, old_price: $old_price, discount: $discount, image: $image, name: $name, description: $description, images: $images, in_favorites: $in_favorites, in_cart: $in_cart)';
  }
}
