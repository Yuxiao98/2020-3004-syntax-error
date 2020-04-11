class User{
  String uid;
  String firstName;
  String lastName;
  String phoneNumber;
  String password;
  String email;
  String gender;
  User({this.uid});
  User.detailedUser(String id , String fName, String lName, String phone, String pass, String email, String gender){
    uid = id;
    firstName = fName;
    lastName = lName;
    phoneNumber = phone;
    password = pass;
    this.email = email;
    this.gender = gender;

  }
}