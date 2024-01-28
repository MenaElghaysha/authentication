class Users {
  List<User>? users;
  Users({this.users});
  Users.fromMap(List<dynamic> map) {
    users = [];
    for (var element in ((map))) {
      users!.add(User.fromMap(element));
    }
  }
  Map<String, dynamic> toMap() {
    List<Map> userList = [];
    for (var element in users!) {
      userList.add(element.toMap());
    }
    Map<String, dynamic> map = {'users': userList};

    return map;
  }
}

class User {
  int? id;
  String? email;
  String? username;
  String? password;
  Name? name;
  String? phone;
  String? profileImageURL;
  Address? address;

  User(
      {this.id,
      this.email,
      this.username,
      this.password,
      this.name,
      this.phone,
      this.address,
      this.profileImageURL});

  User.fromMap(Map<String, dynamic> map) {
    address = Address.fromMap(map['address']);
    id = map['id'];
    email = map['email'];
    username = map['username'];
    password = map['password'];
    name = Name.fromMap(map['name']);
    phone = map['phone'];
    profileImageURL = map['profileImageURL'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'address': address!.toMap(),
      'id': id,
      'email': email,
      'username': username,
      'password': password,
      'name': name!.toMap(),
      'phone': phone,
      'profileImageURL': profileImageURL
    };
    return map;
  }
}

class Name {
  String? firstname;
  String? lastname;

  Name({
    this.firstname,
    this.lastname,
  });

  Name.fromMap(Map<String, dynamic> map) {
    firstname = map['firstname'];
    lastname = map['lastname'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'firstname': firstname,
      'lastname': lastname,
    };
    return map;
  }
}

class Address {
  String? city;
  String? street;
  int? number;

  Address({
    this.city,
    this.street,
    this.number,
  });

  Address.fromMap(Map<String, dynamic> map) {
    city = map['city'];
    street = map['street'];
    number = map['number'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'city': city,
      'street': street,
      'number': number
    };
    return map;
  }
}
