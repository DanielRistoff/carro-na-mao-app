class ApiUtil {
  static Uri mountUri(String path) {
    var uri = Uri(
      scheme: 'http',
      host: '10.0.2.2',
      port: 4200,
      path: path,
    );
    return uri;
  }
}
