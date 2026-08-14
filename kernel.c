typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned long long u64;

enum {
    VGA_WIDTH = 80,
    VGA_HEIGHT = 25,
    MB2_BOOTLOADER_MAGIC = 0x36D76289,
    MB2_TAG_TYPE_FRAMEBUFFER = 8,
    MB2_TAG_TYPE_END = 0,
    FALLBACK_FB_ADDR = 0xE0000000,
    FALLBACK_FB_WIDTH = 640,
    FALLBACK_FB_HEIGHT = 480,
    FALLBACK_FB_BPP = 32
};

struct framebuffer {
    u32 *addr;
    u32 width;
    u32 height;
    u32 pitch;
    u32 bpp;
};

static volatile u16 *const vga = (u16 *)0xB8000;
static struct framebuffer fb;

static u32 align8(u32 value) {
    return (value + 7U) & ~7U;
}

static void vga_puts(const char *s) {
    u32 i = 0;
    while (s[i] && i < (VGA_WIDTH * VGA_HEIGHT)) {
        vga[i] = (u16)(0x0FU << 8) | (u8)s[i];
        i++;
    }
}

static void fallback_framebuffer(void) {
    fb.addr = (u32 *)FALLBACK_FB_ADDR;
    fb.width = FALLBACK_FB_WIDTH;
    fb.height = FALLBACK_FB_HEIGHT;
    fb.pitch = FALLBACK_FB_WIDTH * 4U;
    fb.bpp = FALLBACK_FB_BPP;
}

static void parse_mb2(u32 magic, u32 mb2_addr) {
    if (magic != MB2_BOOTLOADER_MAGIC || mb2_addr == 0) {
        fallback_framebuffer();
        return;
    }

    u32 total_size = *(u32 *)mb2_addr;
    u32 offset = 8;

    fallback_framebuffer();

    while (offset < total_size) {
        u32 tag_addr = mb2_addr + offset;
        u32 type = *(u32 *)tag_addr;
        u32 size = *(u32 *)(tag_addr + 4);

        if (type == MB2_TAG_TYPE_END || size == 0) {
            break;
        }

        if (type == MB2_TAG_TYPE_FRAMEBUFFER) {
            u64 framebuffer_addr = *(u64 *)(tag_addr + 8);
            u32 framebuffer_pitch = *(u32 *)(tag_addr + 16);
            u32 framebuffer_width = *(u32 *)(tag_addr + 20);
            u32 framebuffer_height = *(u32 *)(tag_addr + 24);
            u8 framebuffer_bpp = *(u8 *)(tag_addr + 28);

            if (framebuffer_addr != 0 && framebuffer_bpp == 32) {
                fb.addr = (u32 *)(u32)framebuffer_addr;
                fb.width = framebuffer_width;
                fb.height = framebuffer_height;
                fb.pitch = framebuffer_pitch;
                fb.bpp = framebuffer_bpp;
            }
            return;
        }

        offset += align8(size);
    }
}

void draw_pixel(u32 x, u32 y, u32 color) {
    if (!fb.addr || x >= fb.width || y >= fb.height || fb.bpp != 32) {
        return;
    }

    u32 pixels_per_line = fb.pitch / 4U;
    fb.addr[(y * pixels_per_line) + x] = color;
}

void draw_rect(u32 x, u32 y, u32 width, u32 height, u32 color) {
    for (u32 row = 0; row < height; row++) {
        for (u32 col = 0; col < width; col++) {
            draw_pixel(x + col, y + row, color);
        }
    }
}

void draw_parrot_pixelized(u32 origin_x, u32 origin_y, u32 scale) {
    static const char *art[] = {
        "................",
        ".....BBBB.......",
        "....BCCCCB......",
        "...BCCYYCCB.....",
        "..BCCCGGCCB.....",
        "..BCGGGGGCB.....",
        ".BCGGGRRGGCB....",
        ".BCGGGRRGGCB....",
        "..BCGGGGCB......",
        "...BCGGB........",
        "....BBBB........",
        ".....B..B.......",
        "....B....B......",
        "...B......B.....",
        "................",
        "................"
    };

    for (u32 y = 0; y < 16; y++) {
        for (u32 x = 0; x < 16; x++) {
            u32 color = 0;
            switch (art[y][x]) {
                case 'B': color = 0xFF123A36; break;
                case 'C': color = 0xFF23A7C7; break;
                case 'G': color = 0xFF2FD17C; break;
                case 'Y': color = 0xFFE8C547; break;
                case 'R': color = 0xFFFF6B6B; break;
                default: continue;
            }
            draw_rect(origin_x + (x * scale), origin_y + (y * scale), scale, scale, color);
        }
    }
}

static void clear_framebuffer(u32 color) {
    draw_rect(0, 0, fb.width, fb.height, color);
}

void kmain(u32 magic, u32 mb2_addr) {
    vga_puts("Macaw0S kernel starting...");
    parse_mb2(magic, mb2_addr);
    clear_framebuffer(0xFF071B1A);
    draw_rect(32, 32, 240, 120, 0xFF0E2A27);
    draw_rect(40, 40, 224, 104, 0xFF153A34);
    draw_parrot_pixelized(96, 72, 8);

    for (;;) {
        __asm__ volatile ("hlt");
    }
}
