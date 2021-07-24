
class UserProfileDetails {
  final String name;
  final String dob;
  final String postcode;
  final String email;
  final String phone;
  final String sex;

  UserProfileDetails(
      this.name,
      this.dob,
      this.postcode,
      this.email,
      this.phone,
      this.sex
      );

  UserProfileDetails.fromSnapshot(Map<dynamic, dynamic> snapshot) :
        name = snapshot["name"],
        dob = snapshot["dob"],
        postcode = snapshot["postcode"],
        email = snapshot["email"],
        phone = snapshot["phone"],
        sex = snapshot["sex"];
}
