class ContactObject {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String picture;

  ContactObject(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.picture});

  ContactObject.fromJson(Map<String, dynamic> res)
      : id = res['id'],
        name = res['name'],
        email = res['email'],
        phone = res['phone'],
        picture = res['picture'];

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'picture': picture,
    };
  }
}
