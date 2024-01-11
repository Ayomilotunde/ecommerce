class BaseUrl {
  static String get getProductBaseUrl => 'https://fakestoreapi.com';
}

class EndpointDirectory {
  static String get loginEndpoint => '/auth/login';
  static String get registerEndpoint => '/users';
  static String get allProductEndpoint => '/products';
  static String get favoriteEndpoint => '/carts';
}
