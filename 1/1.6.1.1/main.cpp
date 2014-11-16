#include <iostream>
#include <cmath>
#include <string>

using namespace std;

int main()
{
	/*
	* Input  8-bit binary string
	* Output decimal integer 2^7 - 1 -> 2^7
	*/
	int decimal = 0, power;
	bool negative = false;
	string binary;
	cin >> binary;

	if(binary[0] == '1')
	{
		negative = true;
		// get two's complement
		bool flag = false;
		for(string::size_type i = binary.length() - 1; i >= 0; i--)
		{
			if(flag)
				binary[i] = (binary[i] == '0') ? '1':'0';
			if(binary[i] == '1' && !flag)
				flag = true;

			// string::size_type is unsigned
			if(i == 0)
				break;
		} // end for i: binary.length -> 0
	} // end if negative

	for(string::size_type i = 0; i < binary.length(); i++)
	{
		power = binary.length() - 1 - i;
		decimal += (binary[i] - '0') * pow(2, power);
	} // end for i -> binary.length

	if(negative)
	{
		decimal *= -1; // signed binary
	}

	cout << decimal << endl;
	return(0);
} // end main
