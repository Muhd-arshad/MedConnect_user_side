

class Usermodel {
    final String? firstName;
    final String? lastName;
    final int? phoneNumber;
    final String? email;
    final String? password;
    final String? confirmPassword;

    Usermodel({
         this.firstName,
         this.lastName,
         this.phoneNumber,
         this.email,
         this.password,
         this.confirmPassword,
    });

    factory Usermodel.fromJson(Map<String, dynamic> json) => Usermodel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
    };
}