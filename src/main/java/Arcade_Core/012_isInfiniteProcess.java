boolean isInfiniteProcess(int a, int b) {
	return a > b ? true : Math.abs(a - b) % 2 == 1;
}
