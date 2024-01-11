class UserModel {
  final String uId;
  final String username;
  final String email;
  final String phone;
  final String userImg;
  final String userDeviceToken;
  final String country;
  final String userAddress;
  final String street;
  final bool isAdmin;
  final bool isActive;
  final dynamic createdOn;
  final String city;

  UserModel(
      {required this.uId,
      required this.username,
      required this.email,
      required this.phone,
      required this.userImg,
      required this.userDeviceToken,
      required this.country,
      required this.userAddress,
      required this.street,
      required this.isAdmin,
      required this.isActive,
      required this.createdOn,
      required this.city});
}
