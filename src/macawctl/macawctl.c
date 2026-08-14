#include <stdio.h>
#include <string.h>

static void usage(void) {
    puts("macawctl - Macaw0S native control utility");
    puts("");
    puts("Commands:");
    puts("  status");
    puts("  cores");
    puts("  route <daily-desktop|network-storage|portable-low-resource|legacy-dos-apps|heavy-workloads>");
}

static int route(const char *workload) {
    if (strcmp(workload, "daily-desktop") == 0 || strcmp(workload, "network-storage") == 0) {
        puts("freebsd-core");
        return 0;
    }
    if (strcmp(workload, "portable-low-resource") == 0) {
        puts("netbsd-utility-core");
        return 0;
    }
    if (strcmp(workload, "legacy-dos-apps") == 0) {
        puts("dos-personality-core");
        return 0;
    }
    if (strcmp(workload, "heavy-workloads") == 0) {
        puts("freebsd-core:bhyve,qemu,jail");
        return 0;
    }
    fprintf(stderr, "unknown workload: %s\n", workload);
    return 1;
}

int main(int argc, char **argv) {
    if (argc < 2 || strcmp(argv[1], "help") == 0 || strcmp(argv[1], "--help") == 0) {
        usage();
        return 0;
    }
    if (strcmp(argv[1], "status") == 0) {
        puts("Macaw0S status");
        puts("  desktop: Aviary Shell");
        puts("  default core: freebsd-core");
        puts("  native: c");
        return 0;
    }
    if (strcmp(argv[1], "cores") == 0) {
        puts("freebsd-core");
        puts("netbsd-utility-core");
        puts("dos-personality-core");
        return 0;
    }
    if (strcmp(argv[1], "route") == 0) {
        if (argc < 3) {
            fputs("route requires a workload\n", stderr);
            return 1;
        }
        return route(argv[2]);
    }
    fprintf(stderr, "unknown command: %s\n", argv[1]);
    return 1;
}
