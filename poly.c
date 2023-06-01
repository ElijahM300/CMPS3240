void mypoly( float* a, float* x, float* y, float* z, int n ) {
	for ( int i = 0; i < n; i++ ) {
		a[i] = x[i] * x[i] + y[i] + z[i];
	}
}
