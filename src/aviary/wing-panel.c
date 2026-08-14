#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <sys/utsname.h>
#include <unistd.h>

static void print_panel_line(void) {
    char host[256];
    struct utsname uts;
    time_t now = time(NULL);
    struct tm *tm_now = localtime(&now);
    char stamp[32];

    if (uname(&uts) == 0) {
        snprintf(host, sizeof(host), "%s", uts.nodename);
    } else {
        snprintf(host, sizeof(host), "macaw0s");
    }

    if (tm_now == NULL || strftime(stamp, sizeof(stamp), "%Y-%m-%d %H:%M", tm_now) == 0) {
        snprintf(stamp, sizeof(stamp), "unknown-time");
    }

    printf("Macaw0S WingPanel | %s | %s\n", host, stamp);
}

int main(int argc, char **argv) {
    if (argc > 1 && strcmp(argv[1], "--once") == 0) {
        print_panel_line();
        return 0;
    }

    for (;;) {
        print_panel_line();
        fflush(stdout);
        sleep(30);
    }
}
