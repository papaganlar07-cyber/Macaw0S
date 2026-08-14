typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef int i32;

#define PS2_DATA 0x60
#define PS2_STATUS 0x64
#define PS2_COMMAND 0x64
#define PS2_STATUS_OUTPUT 0x01
#define PS2_STATUS_INPUT 0x02

static i32 mouse_x = 320;
static i32 mouse_y = 240;
static u8 packet[3];
static u8 packet_index = 0;

static inline void outb(u16 port, u8 value);
static inline u8 inb(u16 port);

static inline void io_wait(void) {
    __asm__ volatile ("outb %%al, $0x80" : : "a"(0));
}

static inline void outb(u16 port, u8 value) {
    __asm__ volatile ("outb %0, %1" : : "a"(value), "Nd"(port));
}

static inline u8 inb(u16 port) {
    u8 value;
    __asm__ volatile ("inb %1, %0" : "=a"(value) : "Nd"(port));
    return value;
}

static void ps2_wait_input_clear(void) {
    for (u32 i = 0; i < 100000; i++) {
        if ((inb(PS2_STATUS) & PS2_STATUS_INPUT) == 0) {
            return;
        }
    }
}

static void ps2_wait_output_full(void) {
    for (u32 i = 0; i < 100000; i++) {
        if ((inb(PS2_STATUS) & PS2_STATUS_OUTPUT) != 0) {
            return;
        }
    }
}

static void ps2_write_mouse(u8 value) {
    ps2_wait_input_clear();
    outb(PS2_COMMAND, 0xD4);
    ps2_wait_input_clear();
    outb(PS2_DATA, value);
    ps2_wait_output_full();
    (void)inb(PS2_DATA);
}

void ps2_mouse_init(void) {
    ps2_wait_input_clear();
    outb(PS2_COMMAND, 0xA8);
    io_wait();

    ps2_wait_input_clear();
    outb(PS2_COMMAND, 0x20);
    ps2_wait_output_full();
    u8 status = inb(PS2_DATA) | 0x02;

    ps2_wait_input_clear();
    outb(PS2_COMMAND, 0x60);
    ps2_wait_input_clear();
    outb(PS2_DATA, status);

    ps2_write_mouse(0xF6);
    ps2_write_mouse(0xF4);
}

static void clamp_cursor(void) {
    if (mouse_x < 0) {
        mouse_x = 0;
    }
    if (mouse_y < 0) {
        mouse_y = 0;
    }
    if (mouse_x > 632) {
        mouse_x = 632;
    }
    if (mouse_y > 472) {
        mouse_y = 472;
    }
}

static int parse_packet(void) {
    i32 dx = (packet[0] & 0x10) ? (i32)(0xFFFFFF00 | packet[1]) : (i32)packet[1];
    i32 dy = (packet[0] & 0x20) ? (i32)(0xFFFFFF00 | packet[2]) : (i32)packet[2];

    mouse_x += dx;
    mouse_y -= dy;
    clamp_cursor();
    return dx != 0 || dy != 0;
}

int ps2_mouse_poll(void) {
    if ((inb(PS2_STATUS) & PS2_STATUS_OUTPUT) == 0) {
        return 0;
    }

    u8 data = inb(PS2_DATA);
    if (packet_index == 0 && (data & 0x08) == 0) {
        return 0;
    }

    packet[packet_index++] = data;
    if (packet_index < 3) {
        return 0;
    }

    packet_index = 0;
    return parse_packet();
}

int ps2_mouse_x(void) {
    return mouse_x;
}

int ps2_mouse_y(void) {
    return mouse_y;
}
