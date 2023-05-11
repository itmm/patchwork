#include <filesystem>
#include <iostream>
#include <map>

int main(int argc, const char *argv[]) {
	std::map<int, std::string> deltas;
	for (const auto &f : std::filesystem::directory_iterator { "delta" }) {
		std::string p = f.path().filename().string();
		int v = 0;
		for (const char *c = p.c_str(); isdigit(*c); ++c) {
			v = v * 10 + (*c - '0');
		}
		deltas[v] = p;
	}
	for (const auto &e : deltas) {
		std::cout << e.second << '\n';
	}
	return 0;
}
