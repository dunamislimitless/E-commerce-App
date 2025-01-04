class ApiUrls {
  static const baseUrl = 'https://api.escuelajs.co/api/v1/';
  static const register = '${baseUrl}users';
  static const userProfile = "${baseUrl}auth/profile";
  static const signIn = "${baseUrl}auth/login";
  static const getProduct = "${baseUrl}products/";
  static const getProductCategory = "${baseUrl}categories/";
  static String getOneProduct(String id) => "${baseUrl}products/$id";
}
