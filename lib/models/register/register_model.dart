class RegisterModel {
  late bool status;
  late String message;
  userData? data;

  RegisterModel({
    required this.status,
    required this.message,
    this.data,
  });

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? userData.fromJson(json['data']) : null;
  }

  @override
  String toString() {
    return 'RegisterModel{status: $status, message: $message, data: $data}';
  }
}

class userData {
  /*
   "name": "abdelrahman wael",
        "email": "Abd44o.12@gmail.com",
        "phone": "01478520369454",
        "id": 62162,
        "image": "https://student.valuxapps.com/storage/assets/defaults/user.jpg",
        "token": "s9Ou00EgGPXwKuSorKbS2ybmOAlijSuqXtQRg9I7fb7WtDSp0Ku4UAJgSDCVUkxcRnVecI"
   */
  late int id;
  late String name;
  late String email;
  late String phone;
  String? image;
  late String token;

  userData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.image,
    required this.token,
  });

  userData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    token = json['token'];
  }


  @override
  String toString() {
    return 'userData{id: $id, name: $name, email: $email, phone: $phone, image: $image, token: $token}';
  }
}
