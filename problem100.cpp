#include <iostream>

int main(int argc, char **argv) {
	long long size = 4;
	long long a = 3;
	while (size < 1000000000000) {
		while (a * (a - 1) * 2 <  size * (size - 1)) a++;
		while (a * (a - 1) * 2 >  size * (size - 1)) size++;
		if (a * (a - 1) * 2 ==  size * (size - 1)) {
			std::cout << a << ' ' << size << '\n';
			size++;
		}
	}
	std::cout << a << ' ' << size << '\n';
}