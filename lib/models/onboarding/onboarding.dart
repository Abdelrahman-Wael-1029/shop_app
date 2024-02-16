class OnBoardingModel {
  String title;
  String body;
  String image;

  OnBoardingModel({
    required this.title,
    required this.body,
    required this.image,
  });

  factory OnBoardingModel.fromJson(Map<String, dynamic> json) {
    return OnBoardingModel(
      title: json['title'],
      body: json['body'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'image': image,
    };
  }

  @override
  String toString() {
    return 'OnBoardingModel{title: $title, body: $body, image: $image}';
  }
}
