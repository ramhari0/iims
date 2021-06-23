class User {
  String? username;
  String? email;
  Subject? subject;

  //constructor initializes the member variables
  User({this.username, this.email, this.subject});

  //named constructor
  factory User.fromJson(Map<String, dynamic> json) => User(
      username: json["user_name"] == null ? "Dummnoy" : json["user_name"],
      email: json["email"],
      subject: Subject.fromJson(json["subject"]));
}

class Subject {
  String? name;
  String? time;
  String? teacherName;

  Subject(this.name, this.time, this.teacherName);

  Subject.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        time = json["time"],
        teacherName = json["teacher_name"];
}

/*{
"user_name":"iims",
"email":"iims@gmail.com",
"subject":{
"name":"BBIITT",
"time":"10am",
"teacher_name":"jiten",
}
}*/
