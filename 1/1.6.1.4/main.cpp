#include <iostream>
#include <string>

using namespace std;

const int BASE16 = 16;

char dig2hex(int x)
{
	if(x > 9)
		return ('A' + (x - 10) );
	else
		return x + '0';
}

int hex2dig(char x)
{
	if( x >= 'A')
		return 10 + (x - 'A');
	else
		return x - '0';	
}

string dec2hex(int in)
{
	string ret;
	if(in < 0) in *= -1;
	ret.insert(ret.begin(), dig2hex(in % BASE16));
	int rem = in / BASE16;
	while(rem)
	{
		ret.insert(ret.begin(), dig2hex(rem % BASE16));
		rem /= BASE16;
	}
	return ret;
}

string two2comp(string in)
{
	string ret;
	for(int i = ( in.length() / sizeof(char) ) - 1; i >= 0; i--)
	{
		ret.insert( ret.begin(),  dig2hex(15 - hex2dig(in[i]) ) );
	}
	return ret;
}

string hex1inc(string in)
{
	string ret;
	int carry = 1, tmp;
	for(int i = ( in.length() / sizeof(char) ) - 1; i >= 0; i--)
	{
		tmp = ( hex2dig(in[i]) + carry );
		ret.insert( ret.begin(), dig2hex(tmp % BASE16) );
		carry = tmp / BASE16;
	}
	return ret;
}

int main()
{
	int n;
	cin >> n;
	string hex = dec2hex(n);
	if(n < 0)
	{
		hex = two2comp(hex);
		hex = hex1inc(hex);
	}
	cout << hex << endl;
	return(0);
}
