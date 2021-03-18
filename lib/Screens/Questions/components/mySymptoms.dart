class User {
  int userId;
  String firstName;

  User({this.userId, this.firstName});

  static List<User> getUsers() {
    return <User>[
      User(userId: 1, firstName: "headache"),
      User(userId: 2, firstName: "flu"),
      User(userId: 3, firstName: "stomach"),
      User(userId: 4, firstName: "lower headache")
    ];
  }
}
