
float dot(const int n, float *a, float *b){
    float r = 0.0;
    for(int i=0; i<n; i++){
        r += a[i] * b[i];
    }
    return r;
}
