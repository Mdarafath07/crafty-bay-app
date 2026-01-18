class SingUpParams {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phonNeumber;
  final String city;

  SingUpParams({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phonNeumber,
    required this.city,
  });
  Map<String, dynamic> toJeson(){
    return{
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "phone": phonNeumber,
      "city": city
    };
  }
}
