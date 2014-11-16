#include <iostream>
#include <cmath>
#include <string>

using namespace std;

int switchHex(char x) {
	int digit;
	switch (x) {
	case 'a':
	case 'A':
		digit = 10;
		break;
	case 'b':
	case 'B':
		digit = 11;
		break;
	case 'c':
	case 'C':
		digit = 12;
		break;
	case 'd':
	case 'D':
		digit = 13;
		break;
	case 'e':
	case 'E':
		digit = 14;
		break;
	case 'f':
	case 'F':
		digit = 15;
		break;
	default:
		digit = x - '0';
		break;
	} // end switch	
	return digit;
}

int main() {
	/*
	 * Input  32-bit = 8-digits hexadecimal integer
	 * Output decimal integer 16^31 - 1 -> 16^31
	 */
	string hex;
	long long int decimal = 0;
	int power, digit, carry, tmp;
	bool negative = false;

	cin >> hex;

	int* arr = new int[hex.length()];

	// MSB 0->7 Positive
	// MSB 8->f Negative
	if ((hex[0] - '0') > 7) {
		// get 2's complement by subtracting from 15
		negative = true;
		for (string::size_type i = hex.length() - 1; i >= 0; i--) {
			digit = switchHex(hex[i]);

			arr[i] = 15 - digit;

			if (i == hex.length() - 1) // first only
					{
				if (arr[i] + 1 >= 16)
					carry = 1;
				else
					carry = 0;
				arr[i] = arr[i] + 1 % 16;
			} else {
				if (arr[i] + 1 >= 16)
					carry = 1;
				else
					carry = 0;
				arr[i] = arr[i] + carry % 16;
			}

			// string::size_type unsigned
			if (i == 0)
				break;
		} // end for i: hex.length() to 0
	} // end if negative hex

	for (string::size_type i = 0; i < hex.length(); i++) {
		power = hex.length() - 1 - i;
		if (!negative) {
			digit = switchHex(hex[i]);
		} else {
			digit = arr[i]; // if negative, use 2's complement calculated above
		}
		decimal += digit * pow(16, power);
	} // end for i -> hex.length(32)

	if (negative) {
		decimal *= -1;
	}

	cout << decimal << endl;
	return (0);
} // end main
