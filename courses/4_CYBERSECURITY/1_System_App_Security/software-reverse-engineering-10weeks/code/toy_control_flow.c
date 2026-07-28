#include <errno.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>

int classify_score(int score) {
    if (score < 0 || score > 100) return -1;
    if (score >= 80) return 2;
    if (score >= 50) return 1;
    return 0;
}

static int parse_score(const char *text, int *output) {
    char *end = NULL;
    errno = 0;
    long value = strtol(text, &end, 10);
    if (errno != 0 || end == text || *end != '\0' || value < INT_MIN || value > INT_MAX) {
        return 0;
    }
    *output = (int)value;
    return 1;
}

int main(int argc, char **argv) {
    if (argc != 2) {
        fprintf(stderr, "usage: %s <score>\n", argv[0]);
        return 2;
    }

    int score = 0;
    if (!parse_score(argv[1], &score)) {
        fprintf(stderr, "invalid integer\n");
        return 2;
    }

    printf("class=%d\n", classify_score(score));
    return 0;
}

