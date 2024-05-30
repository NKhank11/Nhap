#include <iostream>
#include <string>
#include <regex>
#include <stdexcept>

using namespace std;

class Validator {
  public:
    void validateEmail(const string& email) {
        // Check for presence of forbidden characters
        if (email.find_first_of("+-*/") != string::npos) {
            throw invalid_argument("Email contains invalid characters.");
        }

        // Check for exactly one '@' and at least one '.' after '@'
        size_t atPos = email.find('@');
        if (atPos == string::npos) {
            throw invalid_argument("Email must contain exactly one '@'.");
        }

        size_t dotPos = email.find('.', atPos);
        if (dotPos == string::npos) {
            throw invalid_argument("Email must contain at least one '.' after '@'.");
        }
    }

    void validatePassword(const string& password) {
        // Check if password length is at least 8 characters
        if (password.length() < 8) {
            throw invalid_argument("Password must be at least 8 characters long.");
        }

        // Check for at least one uppercase letter, one lowercase letter, and one digit
        bool hasUpper = false, hasLower = false, hasDigit = false;
        for (char ch : password) {
            if (isupper(ch)) hasUpper = true;
            if (islower(ch)) hasLower = true;
            if (isdigit(ch)) hasDigit = true;
        }

        if (!hasUpper) {
            throw invalid_argument("Password must contain at least one uppercase letter.");
        }

        if (!hasLower) {
            throw invalid_argument("Password must contain at least one lowercase letter.");
        }

        if (!hasDigit) {
            throw invalid_argument("Password must contain at least one digit.");
        }
    }
};

int main() {
    Validator validator;
    string email, password;
    bool emailValid = false, passwordValid = false;

    while (!emailValid) {
        cout << "Enter email: ";
        cin >> email;
        try {
            validator.validateEmail(email);
            cout << "Email is valid." << endl;
            emailValid = true;
        } catch (const invalid_argument& e) {
            cout << "Email is invalid: " << e.what() << endl;
        }
    }

    while (!passwordValid) {
        cout << "Enter password: ";
        cin >> password;
        try {
            validator.validatePassword(password);
            cout << "Password is valid." << endl;
            passwordValid = true;
        } catch (const invalid_argument& e) {
            cout << "Password is invalid: " << e.what() << endl;
        }
    }

    return 0;
}
