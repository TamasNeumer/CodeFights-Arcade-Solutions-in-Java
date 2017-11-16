int sumDigits(int n) {
	return n % 10 + n / 10;
}

int lateRide(int n) {
	return sumDigits(n / 60) + sumDigits(n % 60);
}
