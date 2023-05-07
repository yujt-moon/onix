#include <onix/assert.h>
#include <onix/stdarg.h>
#include <onix/types.h>
#include <onix/stdio.h>

static u8 buf[1024];

// 强制阻塞
static void spin(char *name)
{
    printf("spinning in %s ...\n", name);
    while (true)
        ;
}

void assertion_failure(char *exp, char *file, char *base, int line)
{
    
}