import 'package:google_sign_in/google_sign_in.dart';
import 'package:youtube/core/constants/url/base_url.dart';

List<String> scopes = <String>['email', BaseUrl.authUrl];

final GoogleSignIn _googleSignIn = GoogleSignIn(
  // Optional clientId
  // clientId: 'your-client_id.apps.googleusercontent.com',
  scopes: scopes,
);
Future<void> handleSignIn() async {
  try {
    await _googleSignIn.signIn();
  } catch (error) {
    print(error);
  }
}
