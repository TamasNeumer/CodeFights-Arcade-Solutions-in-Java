boolean willYou(boolean young, boolean beautiful, boolean loved) {
	return
	    (
	        (young && beautiful && !loved) ||
	        (loved && !young) ||
	        (loved && !beautiful)
	    );
}
