#include <iostream>
#include <sstream>
#include <algorithm>
#include <string>

using namespace std;

string stringRev(string x) {
	string ret;
	string::size_type i = x.length() - 1;
	while (i >= 0) {
		ret.push_back(x[i]);
		if (i == 0) // string::size_type unsigned
			break;
		i--;
	}
	return ret;
} // end stringRev

string twosCompl(string x) {
	bool flag = false;
	for (string::size_type i = 0; i < x.length(); i++) {
		if (flag)
			x[i] = (x[i] == '0') ? '1' : '0';
		if (x[i] == '1' && !flag)
			flag = true;
	} // end for i: 0->x.length()
	return x;
} // end twosComplement

string dec2bin(int _dec, int _len) {
	bool negative = false;
	if (_dec < 0) {
		negative = true;
		_dec *= -1; // operate on positive
	}

	stringstream ss;

	int rem, counter = 1;
	ss << _dec % 2;
	rem = _dec / 2;
	while (rem != 0) {
		ss << rem % 2;
		rem /= 2;
		counter++;
	} // end while rem

	// fill remaining 0s
	while (counter <= _len) {
		if (counter == _len && negative) // aka last bit MSB
			ss << "1";
		else
			ss << "0";
		counter++;
	} // end while counter <= length

	string bin = ss.str();

	if (negative)
		twosCompl(bin);

	return stringRev(bin);
} // end dec2binary

int main() {
	int dec, len;
	cin >> dec >> len;
	cout << dec2bin(dec, len) << endl;
	return (0);
} // end main