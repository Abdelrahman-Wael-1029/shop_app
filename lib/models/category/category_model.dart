class CategoryModel{
  bool status;
  CategoryData data;

  CategoryModel({
    required this.status,
    required this.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json){
    return CategoryModel(
      status: json['status'],
      data: CategoryData.fromJson(json['data']),
    );
  }
}

class CategoryData {
  int current_page;
  List<CategoryDataModel>data;

  CategoryData({
    required this.current_page,
    required this.data,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json){
    return CategoryData(
      current_page: json['current_page'],
      data: List<CategoryDataModel>.from(
        json['data'].map(
          (x) => CategoryDataModel.fromJson(x),
        ),
      ),
    );
  }

}

class CategoryDataModel {
  int id;
  String name;
  String image;

  CategoryDataModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoryDataModel.fromJson(Map<String, dynamic> json){
    return CategoryDataModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}