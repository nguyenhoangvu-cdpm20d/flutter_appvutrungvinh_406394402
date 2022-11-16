class UserObject {
  final int id;
  final String name;
  final String username;
  final String email;
  UserObject(this.id, this.name, this.username, this.email);
  UserObject.fromJson(Map<String, dynamic> r)
      : id = r['id'],
        name = r['name'],
        username = r['username'],
        email = r['email'];
}
