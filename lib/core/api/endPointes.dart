class EndPoint {
  static String baseUrl = "http://10.0.2.2:8000/api/";
  static String signin = "login";
  static String signup = "register";
  static String getuserDataEndPoint(String id) {
    print("enter method");
    return "ENDPOINT/$id";
  }

  static String logout = "logout";
}

class ApiKey {
  static String status = "status";
  static String message = "message";

  //sign up
  static String data = "data";
  static String user = "user";
  static String id = "id";
  static String name = "name";
  static String email = "email";
  static String email_verified_at = "email_verified_at"; //null
  static String created_at = "created_at"; // null
  static String password = "password";
  static String updated_at = "updated_at"; //null
  static String token = "token";

// user info

  static String phone = "phone";
  static String confirmPassword = "confirmPassword";
  static String location = "location";
  static String profilePic = "profilePic";
}
