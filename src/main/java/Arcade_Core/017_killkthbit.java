int killKthBit(int n, int k) {
	return n & (~(1 << k - 1)) ;
}

int killKthBit(int n, int k) {
	return ~(n & (int)Math.pow(2, k - 1)) & n;
}

