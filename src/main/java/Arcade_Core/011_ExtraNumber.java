int extraNumber(int a, int b, int c) {
	if (a == b) return c;
	if (a == c) return b;
	return a;
}

int extraNumber(int a, int b, int c) {
	return a == b ? c : a == c ? b : a;
}


int extraNumber(int a, int b, int c) {
	return a ^ b ^ c;
}