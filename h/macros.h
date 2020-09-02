#ifndef macros_h
#define macros_h
#define hardlock asm { pushf; cli; }
#define hardunlock asm popf
#define softlock asm { pushf; cli; }
#define softunlock asm popf
#endif