import 'package:flutter_test/flutter_test.dart';
import 'package:quotation_app/services/session_service.dart';
import 'package:quotation_app/models/login_response_model.dart';

void main() {
  group('Session Service Tests', () {
    test('Should save and retrieve login session', () async {
      // Create test user
      final user = User(
        id: 38,
        first_name: 'Siva',
        last_name: 'Lambert',
        email: 'employee@gmail.com',
        last_login_at: '2026-01-23T07:32:39.000000Z',
        departments: [],
        designations: [],
      );
      
      // Create test login response
      final loginResponse = LoginResponse(
        success: true,
        message: 'Login successful',
        data: LoginData(
          user: user,
          token: 'test_token',
          token_type: 'Bearer',
        ),
      );
      
      // Save session
      await SessionService.saveLoginSession(loginResponse);
      
      // Check if logged in
      final isLoggedIn = await SessionService.isLoggedIn();
      expect(isLoggedIn, true);
      
      // Get token
      final token = await SessionService.getToken();
      expect(token, 'test_token');
      
      // Get user data
      final savedUser = await SessionService.getUserData();
      expect(savedUser?.first_name, 'Siva');
      expect(savedUser?.last_name, 'Lambert');
      expect(savedUser?.email, 'employee@gmail.com');
      
      // Clear session
      await SessionService.clearSession();
      
      // Check if logged out
      final isLoggedOut = await SessionService.isLoggedIn();
      expect(isLoggedOut, false);
    });
  });
}
