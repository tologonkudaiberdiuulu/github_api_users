import 'package:http/http.dart' as http;

class GithubApiUsers {
  final String url = 'https://api.github.com/users';
  static String clientId = '68db445067740a3044a';
  static String clientSecret = '90e9da8b0207bf3abdade5bde4f25d4cb96bb2cb';
  static String token = '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';
  static String newToken = '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';

  final String query = 'client_id=$clientId&client_secret=$clientSecret';

  GithubApiUsers();

  Future<http.Response> fetchSingleUser(String userName) {
    final getQuery = '$url/$userName?' + query;
    return http.get(
      Uri.parse(getQuery),
      headers: {'Authorization': 'token $newToken'},
    );
  }

  Future<http.Response> fetchAllUsers({
    required int startId,
    required int perPage,
  }) {
    final getQuery = '$url?since=$startId&per_page=$perPage&' + query;
    return http.get(
      Uri.parse(getQuery),
      headers: {'Authorization': 'token $newToken'},
    );
  }
}
