
main.elf:     file format elf32-msp430


Disassembly of section .text:

00000000 <__crt0_begin>:
   0:	38 40 00 c0 	mov	#-16384,r8	;#0xc000
   4:	11 42 fa ff 	mov	&0xfffa,r1	;0xfffa
   8:	02 43       	clr	r2		;
   a:	01 58       	add	r8,	r1	;
   c:	21 83       	decd	r1		;
   e:	b2 40 00 47 	mov	#18176,	&0xffb8	;#0x4700
  12:	b8 ff 
  14:	39 40 80 ff 	mov	#-128,	r9	;#0xff80

00000018 <__crt0_clr_io>:
  18:	09 93       	cmp	#0,	r9	;r3 As==00
  1a:	04 24       	jz	$+10     	;abs 0x24
  1c:	89 43 00 00 	mov	#0,	0(r9)	;r3 As==00
  20:	29 53       	incd	r9		;
  22:	fa 3f       	jmp	$-10     	;abs 0x18

00000024 <__crt0_clr_dmem>:
  24:	01 98       	cmp	r8,	r1	;
  26:	04 24       	jz	$+10     	;abs 0x30
  28:	88 43 00 00 	mov	#0,	0(r8)	;r3 As==00
  2c:	28 53       	incd	r8		;
  2e:	fa 3f       	jmp	$-10     	;abs 0x24

00000030 <__crt0_clr_dmem_end>:
  30:	35 40 40 0e 	mov	#3648,	r5	;#0x0e40
  34:	36 40 40 0e 	mov	#3648,	r6	;#0x0e40
  38:	37 40 08 c0 	mov	#-16376,r7	;#0xc008

0000003c <__crt0_cpy_data>:
  3c:	06 95       	cmp	r5,	r6	;
  3e:	04 24       	jz	$+10     	;abs 0x48
  40:	b7 45 00 00 	mov	@r5+,	0(r7)	;
  44:	27 53       	incd	r7		;
  46:	fa 3f       	jmp	$-10     	;abs 0x3c

00000048 <__crt0_cpy_data_end>:
  48:	32 40 00 40 	mov	#16384,	r2	;#0x4000
  4c:	04 43       	clr	r4		;
  4e:	0a 43       	clr	r10		;
  50:	0b 43       	clr	r11		;
  52:	0c 43       	clr	r12		;
  54:	0d 43       	clr	r13		;
  56:	0e 43       	clr	r14		;
  58:	0f 43       	clr	r15		;

0000005a <__crt0_start_main>:
  5a:	b0 12 1a 02 	call	#538		;#0x021a

0000005e <__crt0_this_is_the_end>:
  5e:	02 43       	clr	r2		;
  60:	b2 40 00 47 	mov	#18176,	&0xffb8	;#0x4700
  64:	b8 ff 
  66:	32 40 10 00 	mov	#16,	r2	;#0x0010
  6a:	03 43       	nop			

0000006c <set_speed>:
  6c:	0a 12       	push	r10		;
  6e:	09 12       	push	r9		;
  70:	31 82       	sub	#8,	r1	;r2 As==11
  72:	39 40 64 04 	mov	#1124,	r9	;#0x0464
  76:	3c 40 5e 09 	mov	#2398,	r12	;#0x095e
  7a:	89 12       	call	r9		;
  7c:	5e 43       	mov.b	#1,	r14	;r3 As==01
  7e:	6d 43       	mov.b	#2,	r13	;r3 As==10
  80:	0c 41       	mov	r1,	r12	;
  82:	3c 50 06 00 	add	#6,	r12	;
  86:	b0 12 8a 04 	call	#1162		;#0x048a
  8a:	0c 41       	mov	r1,	r12	;
  8c:	3c 50 06 00 	add	#6,	r12	;
  90:	b0 12 4c 09 	call	#2380		;#0x094c
  94:	4d 4c       	mov.b	r12,	r13	;
  96:	0c 41       	mov	r1,	r12	;
  98:	3c 50 06 00 	add	#6,	r12	;
  9c:	b0 12 c2 07 	call	#1986		;#0x07c2
  a0:	4a 4c       	mov.b	r12,	r10	;
  a2:	7d 40 07 00 	mov.b	#7,	r13	;
  a6:	4d 9c       	cmp.b	r12,	r13	;
  a8:	24 28       	jnc	$+74     	;abs 0xf2
  aa:	82 43 e8 ff 	mov	#0,	&0xffe8	;r3 As==00
  ae:	0c 4a       	mov	r10,	r12	;
  b0:	0c 5c       	rla	r12		;
  b2:	0c 5c       	rla	r12		;
  b4:	0c 5c       	rla	r12		;
  b6:	0c 5c       	rla	r12		;
  b8:	1c d3       	bis	#1,	r12	;r3 As==01
  ba:	82 4c e8 ff 	mov	r12,	&0xffe8	;
  be:	3c 40 82 09 	mov	#2434,	r12	;#0x0982
  c2:	89 12       	call	r9		;
  c4:	1c 42 fc ff 	mov	&0xfffc,r12	;0xfffc
  c8:	1d 42 fe ff 	mov	&0xfffe,r13	;0xfffe
  cc:	7a 53       	add.b	#-1,	r10	;r3 As==11
  ce:	7e 40 06 00 	mov.b	#6,	r14	;
  d2:	4e 9a       	cmp.b	r10,	r14	;
  d4:	14 28       	jnc	$+42     	;abs 0xfe
  d6:	3a f0 ff 00 	and	#255,	r10	;#0x00ff
  da:	0a 5a       	rla	r10		;
  dc:	3a 50 e4 00 	add	#228,	r10	;#0x00e4
  e0:	2e 4a       	mov	@r10,	r14	;
  e2:	00 4e       	br	r14		;

000000e4 <.L5>:
  e4:	18 01       	mova	@r1+,	r8	;
  e6:	26 01 30 01 	mova	&65840,	r6	;0x10130
  ea:	36 01 3c 01 	mova	316(r1),r6	;0x0013c
  ee:	42 01       	rram.a	#1,	r2	;
  f0:	48 01       	rram.a	#1,	r8	;

000000f2 <.L2>:
  f2:	3c 40 8a 09 	mov	#2442,	r12	;#0x098a
  f6:	89 12       	call	r9		;

000000f8 <.L1>:
  f8:	31 52       	add	#8,	r1	;r2 As==11
  fa:	30 40 f2 08 	br	#0x08f2		;

000000fe <.L3>:
  fe:	12 c3       	clrc			
 100:	0d 10       	rrc	r13		;
 102:	0c 10       	rrc	r12		;

00000104 <.L13>:
 104:	81 4c 02 00 	mov	r12,	2(r1)	;
 108:	81 4d 04 00 	mov	r13,	4(r1)	;
 10c:	b1 40 9f 09 	mov	#2463,	0(r1)	;#0x099f
 110:	00 00 
 112:	b0 12 84 06 	call	#1668		;#0x0684
 116:	f0 3f       	jmp	$-30     	;abs 0xf8

00000118 <.L11>:
 118:	12 c3       	clrc			
 11a:	0d 10       	rrc	r13		;
 11c:	0c 10       	rrc	r12		;
 11e:	12 c3       	clrc			
 120:	0d 10       	rrc	r13		;
 122:	0c 10       	rrc	r12		;
 124:	ef 3f       	jmp	$-32     	;abs 0x104

00000126 <.L10>:
 126:	7e 40 03 00 	mov.b	#3,	r14	;

0000012a <.L14>:
 12a:	b0 12 22 09 	call	#2338		;#0x0922
 12e:	ea 3f       	jmp	$-42     	;abs 0x104

00000130 <.L9>:
 130:	7e 40 06 00 	mov.b	#6,	r14	;
 134:	fa 3f       	jmp	$-10     	;abs 0x12a

00000136 <.L8>:
 136:	7e 40 07 00 	mov.b	#7,	r14	;
 13a:	f7 3f       	jmp	$-16     	;abs 0x12a

0000013c <.L7>:
 13c:	7e 40 0a 00 	mov.b	#10,	r14	;#0x000a
 140:	f4 3f       	jmp	$-22     	;abs 0x12a

00000142 <.L6>:
 142:	7e 40 0b 00 	mov.b	#11,	r14	;#0x000b
 146:	f1 3f       	jmp	$-28     	;abs 0x12a

00000148 <.L4>:
 148:	7e 40 0c 00 	mov.b	#12,	r14	;#0x000c
 14c:	ee 3f       	jmp	$-34     	;abs 0x12a
 14e:	00 00       	beq			

00000150 <scan_twi>:
 150:	0a 12       	push	r10		;
 152:	09 12       	push	r9		;
 154:	08 12       	push	r8		;
 156:	07 12       	push	r7		;
 158:	3c 40 b5 09 	mov	#2485,	r12	;#0x09b5
 15c:	b0 12 64 04 	call	#1124		;#0x0464
 160:	4a 43       	clr.b	r10		;
 162:	49 43       	clr.b	r9		;

00000164 <.L17>:
 164:	0c 49       	mov	r9,	r12	;
 166:	0c 5c       	rla	r12		;
 168:	47 4c       	mov.b	r12,	r7	;
 16a:	5c 53       	inc.b	r12		;
 16c:	b0 12 a4 03 	call	#932		;#0x03a4
 170:	48 4c       	mov.b	r12,	r8	;
 172:	b0 12 8c 03 	call	#908		;#0x038c
 176:	08 93       	cmp	#0,	r8	;r3 As==00
 178:	0e 20       	jnz	$+30     	;abs 0x196
 17a:	38 40 64 04 	mov	#1124,	r8	;#0x0464
 17e:	3c 40 ca 09 	mov	#2506,	r12	;#0x09ca
 182:	88 12       	call	r8		;
 184:	4c 47       	mov.b	r7,	r12	;
 186:	b0 12 14 05 	call	#1300		;#0x0514
 18a:	3c 40 e4 0a 	mov	#2788,	r12	;#0x0ae4
 18e:	88 12       	call	r8		;
 190:	5a 53       	inc.b	r10		;
 192:	3a f0 ff 00 	and	#255,	r10	;#0x00ff

00000196 <.L16>:
 196:	4c 49       	mov.b	r9,	r12	;
 198:	5c 53       	inc.b	r12		;
 19a:	49 4c       	mov.b	r12,	r9	;
 19c:	7c 90 80 ff 	cmp.b	#-128,	r12	;#0xff80
 1a0:	e1 23       	jnz	$-60     	;abs 0x164
 1a2:	0a 93       	cmp	#0,	r10	;r3 As==00
 1a4:	04 20       	jnz	$+10     	;abs 0x1ae
 1a6:	3c 40 ed 09 	mov	#2541,	r12	;#0x09ed
 1aa:	b0 12 64 04 	call	#1124		;#0x0464

000001ae <.L15>:
 1ae:	30 40 ee 08 	br	#0x08ee		;

000001b2 <send_twi>:
 1b2:	0a 12       	push	r10		;
 1b4:	09 12       	push	r9		;
 1b6:	21 82       	sub	#4,	r1	;r2 As==10
 1b8:	82 93 08 c0 	cmp	#0,	&0xc008	;r3 As==00
 1bc:	07 20       	jnz	$+16     	;abs 0x1cc
 1be:	3c 40 00 0a 	mov	#2560,	r12	;#0x0a00
 1c2:	b0 12 64 04 	call	#1124		;#0x0464

000001c6 <.L20>:
 1c6:	21 52       	add	#4,	r1	;r2 As==10
 1c8:	30 40 f2 08 	br	#0x08f2		;

000001cc <.L21>:
 1cc:	3a 40 64 04 	mov	#1124,	r10	;#0x0464
 1d0:	3c 40 3f 0a 	mov	#2623,	r12	;#0x0a3f
 1d4:	8a 12       	call	r10		;
 1d6:	5e 43       	mov.b	#1,	r14	;r3 As==01
 1d8:	7d 40 03 00 	mov.b	#3,	r13	;
 1dc:	0c 41       	mov	r1,	r12	;
 1de:	b0 12 8a 04 	call	#1162		;#0x048a
 1e2:	0c 41       	mov	r1,	r12	;
 1e4:	b0 12 4c 09 	call	#2380		;#0x094c
 1e8:	4d 4c       	mov.b	r12,	r13	;
 1ea:	0c 41       	mov	r1,	r12	;
 1ec:	b0 12 c2 07 	call	#1986		;#0x07c2
 1f0:	b0 12 68 03 	call	#872		;#0x0368
 1f4:	49 4c       	mov.b	r12,	r9	;
 1f6:	3c 40 5d 0a 	mov	#2653,	r12	;#0x0a5d
 1fa:	8a 12       	call	r10		;
 1fc:	b0 12 86 03 	call	#902		;#0x0386
 200:	b0 12 14 05 	call	#1300		;#0x0514
 204:	3c 40 6b 0a 	mov	#2667,	r12	;#0x0a6b
 208:	8a 12       	call	r10		;
 20a:	3c 40 78 0a 	mov	#2680,	r12	;#0x0a78
 20e:	09 93       	cmp	#0,	r9	;r3 As==00
 210:	02 24       	jz	$+6      	;abs 0x216
 212:	3c 40 77 0a 	mov	#2679,	r12	;#0x0a77

00000216 <.L25>:
 216:	8a 12       	call	r10		;
 218:	d6 3f       	jmp	$-82     	;abs 0x1c6

0000021a <main>:
 21a:	0a 12       	push	r10		;
 21c:	09 12       	push	r9		;
 21e:	31 82       	sub	#8,	r1	;r2 As==11
 220:	3c 40 00 4b 	mov	#19200,	r12	;#0x4b00
 224:	4d 43       	clr.b	r13		;
 226:	b0 12 c8 03 	call	#968		;#0x03c8
 22a:	3a 40 64 04 	mov	#1124,	r10	;#0x0464
 22e:	3c 40 7d 0a 	mov	#2685,	r12	;#0x0a7d
 232:	8a 12       	call	r10		;
 234:	b2 b0 00 10 	bit	#4096,	&0xfff2	;#0x1000
 238:	f2 ff 
 23a:	7e 24       	jz	$+254    	;abs 0x338
 23c:	3c 40 01 0b 	mov	#2817,	r12	;#0x0b01
 240:	8a 12       	call	r10		;
 242:	7c 40 06 00 	mov.b	#6,	r12	;
 246:	b0 12 46 03 	call	#838		;#0x0346

0000024a <.L48>:
 24a:	82 43 08 c0 	mov	#0,	&0xc008	;r3 As==00

0000024e <.L29>:
 24e:	39 40 64 04 	mov	#1124,	r9	;#0x0464
 252:	3c 40 5a 0b 	mov	#2906,	r12	;#0x0b5a
 256:	89 12       	call	r9		;
 258:	5e 43       	mov.b	#1,	r14	;r3 As==01
 25a:	7d 42       	mov.b	#8,	r13	;r2 As==11
 25c:	0c 41       	mov	r1,	r12	;
 25e:	b0 12 8a 04 	call	#1162		;#0x048a
 262:	0a 4c       	mov	r12,	r10	;
 264:	3c 40 e4 0a 	mov	#2788,	r12	;#0x0ae4
 268:	89 12       	call	r9		;
 26a:	0a 93       	cmp	#0,	r10	;r3 As==00
 26c:	f0 27       	jz	$-30     	;abs 0x24e
 26e:	3a 40 3a 09 	mov	#2362,	r10	;#0x093a
 272:	3d 40 6a 0b 	mov	#2922,	r13	;#0x0b6a
 276:	0c 41       	mov	r1,	r12	;
 278:	8a 12       	call	r10		;
 27a:	0c 93       	cmp	#0,	r12	;r3 As==00
 27c:	04 20       	jnz	$+10     	;abs 0x286
 27e:	3c 40 6f 0b 	mov	#2927,	r12	;#0x0b6f

00000282 <.L47>:
 282:	89 12       	call	r9		;
 284:	e4 3f       	jmp	$-54     	;abs 0x24e

00000286 <.L30>:
 286:	3d 40 a0 0d 	mov	#3488,	r13	;#0x0da0
 28a:	0c 41       	mov	r1,	r12	;
 28c:	8a 12       	call	r10		;
 28e:	0c 93       	cmp	#0,	r12	;r3 As==00
 290:	05 20       	jnz	$+12     	;abs 0x29c
 292:	b0 12 98 03 	call	#920		;#0x0398
 296:	92 43 08 c0 	mov	#1,	&0xc008	;r3 As==01
 29a:	d9 3f       	jmp	$-76     	;abs 0x24e

0000029c <.L32>:
 29c:	3d 40 a6 0d 	mov	#3494,	r13	;#0x0da6
 2a0:	0c 41       	mov	r1,	r12	;
 2a2:	8a 12       	call	r10		;
 2a4:	0c 93       	cmp	#0,	r12	;r3 As==00
 2a6:	09 20       	jnz	$+20     	;abs 0x2ba
 2a8:	82 93 08 c0 	cmp	#0,	&0xc008	;r3 As==00
 2ac:	03 20       	jnz	$+8      	;abs 0x2b4
 2ae:	3c 40 ab 0d 	mov	#3499,	r12	;#0x0dab
 2b2:	e7 3f       	jmp	$-48     	;abs 0x282

000002b4 <.L34>:
 2b4:	b0 12 8c 03 	call	#908		;#0x038c
 2b8:	c8 3f       	jmp	$-110    	;abs 0x24a

000002ba <.L33>:
 2ba:	3d 40 c8 0d 	mov	#3528,	r13	;#0x0dc8
 2be:	0c 41       	mov	r1,	r12	;
 2c0:	8a 12       	call	r10		;
 2c2:	0c 93       	cmp	#0,	r12	;r3 As==00
 2c4:	03 20       	jnz	$+8      	;abs 0x2cc
 2c6:	b0 12 50 01 	call	#336		;#0x0150
 2ca:	c1 3f       	jmp	$-124    	;abs 0x24e

000002cc <.L35>:
 2cc:	3d 40 cd 0d 	mov	#3533,	r13	;#0x0dcd
 2d0:	0c 41       	mov	r1,	r12	;
 2d2:	8a 12       	call	r10		;
 2d4:	0c 93       	cmp	#0,	r12	;r3 As==00
 2d6:	03 20       	jnz	$+8      	;abs 0x2de
 2d8:	b0 12 6c 00 	call	#108		;#0x006c
 2dc:	b8 3f       	jmp	$-142    	;abs 0x24e

000002de <.L36>:
 2de:	3d 40 d3 0d 	mov	#3539,	r13	;#0x0dd3
 2e2:	0c 41       	mov	r1,	r12	;
 2e4:	8a 12       	call	r10		;
 2e6:	0c 93       	cmp	#0,	r12	;r3 As==00
 2e8:	03 20       	jnz	$+8      	;abs 0x2f0
 2ea:	b0 12 b2 01 	call	#434		;#0x01b2
 2ee:	af 3f       	jmp	$-160    	;abs 0x24e

000002f0 <.L37>:
 2f0:	3d 40 d8 0d 	mov	#3544,	r13	;#0x0dd8
 2f4:	0c 41       	mov	r1,	r12	;
 2f6:	8a 12       	call	r10		;
 2f8:	0c 93       	cmp	#0,	r12	;r3 As==00
 2fa:	09 20       	jnz	$+20     	;abs 0x30e

000002fc <.L39>:
 2fc:	1c 42 a0 ff 	mov	&0xffa0,r12	;0xffa0
 300:	0c 93       	cmp	#0,	r12	;r3 As==00
 302:	fc 3b       	jl	$-6      	;abs 0x2fc
 304:	b0 12 62 03 	call	#866		;#0x0362
 308:	b0 12 42 08 	call	#2114		;#0x0842
 30c:	a0 3f       	jmp	$-190    	;abs 0x24e

0000030e <.L38>:
 30e:	3d 40 de 0d 	mov	#3550,	r13	;#0x0dde
 312:	0c 41       	mov	r1,	r12	;
 314:	8a 12       	call	r10		;
 316:	0c 93       	cmp	#0,	r12	;r3 As==00
 318:	0c 20       	jnz	$+26     	;abs 0x332
 31a:	b2 b0 80 00 	bit	#128,	&0xfff2	;#0x0080
 31e:	f2 ff 
 320:	05 20       	jnz	$+12     	;abs 0x32c
 322:	3c 40 e3 0d 	mov	#3555,	r12	;#0x0de3
 326:	b0 12 64 04 	call	#1124		;#0x0464
 32a:	91 3f       	jmp	$-220    	;abs 0x24e

0000032c <.L41>:
 32c:	30 40 00 f0 	br	#0xf000		;
 330:	8e 3f       	jmp	$-226    	;abs 0x24e

00000332 <.L40>:
 332:	3c 40 fd 0d 	mov	#3581,	r12	;#0x0dfd
 336:	a5 3f       	jmp	$-180    	;abs 0x282

00000338 <.L46>:
 338:	3c 40 e6 0a 	mov	#2790,	r12	;#0x0ae6
 33c:	8a 12       	call	r10		;
 33e:	5c 43       	mov.b	#1,	r12	;r3 As==01
 340:	31 52       	add	#8,	r1	;r2 As==11
 342:	30 40 f2 08 	br	#0x08f2		;

00000346 <neo430_twi_enable>:
 346:	3c f0 ff 00 	and	#255,	r12	;#0x00ff
 34a:	3d 40 e8 ff 	mov	#-24,	r13	;#0xffe8
 34e:	8d 43 00 00 	mov	#0,	0(r13)	;r3 As==00
 352:	0c 5c       	rla	r12		;
 354:	0c 5c       	rla	r12		;
 356:	0c 5c       	rla	r12		;
 358:	0c 5c       	rla	r12		;
 35a:	1c d3       	bis	#1,	r12	;r3 As==01
 35c:	8d 4c 00 00 	mov	r12,	0(r13)	;
 360:	30 41       	ret			

00000362 <neo430_twi_disable>:
 362:	82 43 e8 ff 	mov	#0,	&0xffe8	;r3 As==00
 366:	30 41       	ret			

00000368 <neo430_twi_trans>:
 368:	3c f0 ff 00 	and	#255,	r12	;#0x00ff
 36c:	82 4c ea ff 	mov	r12,	&0xffea	;

00000370 <.L6>:
 370:	b2 b2 e8 ff 	bit	#8,	&0xffe8	;r2 As==11
 374:	fd 23       	jnz	$-4      	;abs 0x370
 376:	1c 42 ea ff 	mov	&0xffea,r12	;0xffea
 37a:	3c e3       	inv	r12		;
 37c:	7d 40 0f 00 	mov.b	#15,	r13	;#0x000f
 380:	b0 12 14 09 	call	#2324		;#0x0914
 384:	30 41       	ret			

00000386 <neo430_twi_get_data>:
 386:	1c 42 ea ff 	mov	&0xffea,r12	;0xffea
 38a:	30 41       	ret			

0000038c <neo430_twi_generate_stop>:
 38c:	a2 d2 e8 ff 	bis	#4,	&0xffe8	;r2 As==10

00000390 <.L10>:
 390:	b2 b2 e8 ff 	bit	#8,	&0xffe8	;r2 As==11
 394:	fd 23       	jnz	$-4      	;abs 0x390
 396:	30 41       	ret			

00000398 <neo430_twi_generate_start>:
 398:	a2 d3 e8 ff 	bis	#2,	&0xffe8	;r3 As==10

0000039c <.L13>:
 39c:	b2 b2 e8 ff 	bit	#8,	&0xffe8	;r2 As==11
 3a0:	fd 23       	jnz	$-4      	;abs 0x39c
 3a2:	30 41       	ret			

000003a4 <neo430_twi_start_trans>:
 3a4:	0a 12       	push	r10		;
 3a6:	4a 4c       	mov.b	r12,	r10	;
 3a8:	b0 12 98 03 	call	#920		;#0x0398
 3ac:	82 4a ea ff 	mov	r10,	&0xffea	;

000003b0 <.L16>:
 3b0:	b2 b2 e8 ff 	bit	#8,	&0xffe8	;r2 As==11
 3b4:	fd 23       	jnz	$-4      	;abs 0x3b0
 3b6:	1c 42 ea ff 	mov	&0xffea,r12	;0xffea
 3ba:	3c e3       	inv	r12		;
 3bc:	7d 40 0f 00 	mov.b	#15,	r13	;#0x000f
 3c0:	b0 12 14 09 	call	#2324		;#0x0914
 3c4:	3a 41       	pop	r10		;
 3c6:	30 41       	ret			

000003c8 <neo430_uart_setup>:
 3c8:	0a 12       	push	r10		;
 3ca:	1e 42 fc ff 	mov	&0xfffc,r14	;0xfffc
 3ce:	1f 42 fe ff 	mov	&0xfffe,r15	;0xfffe
 3d2:	0c 5c       	rla	r12		;
 3d4:	0d 6d       	rlc	r13		;
 3d6:	4a 43       	clr.b	r10		;

000003d8 <.L2>:
 3d8:	0f 9d       	cmp	r13,	r15	;
 3da:	04 28       	jnc	$+10     	;abs 0x3e4
 3dc:	0d 9f       	cmp	r15,	r13	;
 3de:	13 20       	jnz	$+40     	;abs 0x406
 3e0:	0e 9c       	cmp	r12,	r14	;
 3e2:	11 2c       	jc	$+36     	;abs 0x406

000003e4 <.L9>:
 3e4:	4c 43       	clr.b	r12		;

000003e6 <.L5>:
 3e6:	7d 40 ff 00 	mov.b	#255,	r13	;#0x00ff
 3ea:	0d 9a       	cmp	r10,	r13	;
 3ec:	10 28       	jnc	$+34     	;abs 0x40e
 3ee:	82 43 a0 ff 	mov	#0,	&0xffa0	;r3 As==00
 3f2:	7d 42       	mov.b	#8,	r13	;r2 As==11
 3f4:	b0 12 fc 08 	call	#2300		;#0x08fc
 3f8:	0a dc       	bis	r12,	r10	;
 3fa:	3a d0 00 10 	bis	#4096,	r10	;#0x1000
 3fe:	82 4a a0 ff 	mov	r10,	&0xffa0	;
 402:	3a 41       	pop	r10		;
 404:	30 41       	ret			

00000406 <.L3>:
 406:	0e 8c       	sub	r12,	r14	;
 408:	0f 7d       	subc	r13,	r15	;
 40a:	1a 53       	inc	r10		;
 40c:	e5 3f       	jmp	$-52     	;abs 0x3d8

0000040e <.L8>:
 40e:	4d 4c       	mov.b	r12,	r13	;
 410:	7d 50 fe ff 	add.b	#-2,	r13	;#0xfffe
 414:	7d b0 fd ff 	bit.b	#-3,	r13	;#0xfffd
 418:	0a 20       	jnz	$+22     	;abs 0x42e
 41a:	12 c3       	clrc			
 41c:	0a 10       	rrc	r10		;
 41e:	12 c3       	clrc			
 420:	0a 10       	rrc	r10		;
 422:	12 c3       	clrc			
 424:	0a 10       	rrc	r10		;

00000426 <.L7>:
 426:	5c 53       	inc.b	r12		;
 428:	3c f0 ff 00 	and	#255,	r12	;#0x00ff
 42c:	dc 3f       	jmp	$-70     	;abs 0x3e6

0000042e <.L6>:
 42e:	12 c3       	clrc			
 430:	0a 10       	rrc	r10		;
 432:	f9 3f       	jmp	$-12     	;abs 0x426

00000434 <neo430_uart_putc>:
 434:	3c f0 ff 00 	and	#255,	r12	;#0x00ff

00000438 <.L15>:
 438:	1d 42 a0 ff 	mov	&0xffa0,r13	;0xffa0
 43c:	0d 93       	cmp	#0,	r13	;r3 As==00
 43e:	fc 3b       	jl	$-6      	;abs 0x438
 440:	82 4c a2 ff 	mov	r12,	&0xffa2	;
 444:	30 41       	ret			

00000446 <neo430_uart_getc>:
 446:	1c 42 a2 ff 	mov	&0xffa2,r12	;0xffa2
 44a:	0c 93       	cmp	#0,	r12	;r3 As==00
 44c:	fc 37       	jge	$-6      	;abs 0x446
 44e:	30 41       	ret			

00000450 <neo430_uart_print>:
 450:	0a 12       	push	r10		;
 452:	0a 4c       	mov	r12,	r10	;

00000454 <.L23>:
 454:	7c 4a       	mov.b	@r10+,	r12	;
 456:	0c 93       	cmp	#0,	r12	;r3 As==00
 458:	02 20       	jnz	$+6      	;abs 0x45e
 45a:	3a 41       	pop	r10		;
 45c:	30 41       	ret			

0000045e <.L24>:
 45e:	b0 12 34 04 	call	#1076		;#0x0434
 462:	f8 3f       	jmp	$-14     	;abs 0x454

00000464 <neo430_uart_br_print>:
 464:	0a 12       	push	r10		;
 466:	09 12       	push	r9		;
 468:	0a 4c       	mov	r12,	r10	;

0000046a <.L26>:
 46a:	79 4a       	mov.b	@r10+,	r9	;
 46c:	09 93       	cmp	#0,	r9	;r3 As==00
 46e:	02 20       	jnz	$+6      	;abs 0x474
 470:	30 40 f2 08 	br	#0x08f2		;

00000474 <.L28>:
 474:	39 90 0a 00 	cmp	#10,	r9	;#0x000a
 478:	04 20       	jnz	$+10     	;abs 0x482
 47a:	7c 40 0d 00 	mov.b	#13,	r12	;#0x000d
 47e:	b0 12 34 04 	call	#1076		;#0x0434

00000482 <.L27>:
 482:	4c 49       	mov.b	r9,	r12	;
 484:	b0 12 34 04 	call	#1076		;#0x0434
 488:	f0 3f       	jmp	$-30     	;abs 0x46a

0000048a <neo430_uart_scan>:
 48a:	0a 12       	push	r10		;
 48c:	09 12       	push	r9		;
 48e:	08 12       	push	r8		;
 490:	07 12       	push	r7		;
 492:	06 12       	push	r6		;
 494:	0a 4c       	mov	r12,	r10	;
 496:	06 4d       	mov	r13,	r6	;
 498:	07 4e       	mov	r14,	r7	;
 49a:	49 43       	clr.b	r9		;

0000049c <.L30>:
 49c:	b0 12 46 04 	call	#1094		;#0x0446
 4a0:	48 4c       	mov.b	r12,	r8	;
 4a2:	7c 92       	cmp.b	#8,	r12	;r2 As==11
 4a4:	0b 20       	jnz	$+24     	;abs 0x4bc
 4a6:	09 93       	cmp	#0,	r9	;r3 As==00
 4a8:	f9 27       	jz	$-12     	;abs 0x49c
 4aa:	07 93       	cmp	#0,	r7	;r3 As==00
 4ac:	04 24       	jz	$+10     	;abs 0x4b6
 4ae:	3c 40 30 0e 	mov	#3632,	r12	;#0x0e30
 4b2:	b0 12 50 04 	call	#1104		;#0x0450

000004b6 <.L33>:
 4b6:	3a 53       	add	#-1,	r10	;r3 As==11
 4b8:	39 53       	add	#-1,	r9	;r3 As==11
 4ba:	f0 3f       	jmp	$-30     	;abs 0x49c

000004bc <.L31>:
 4bc:	7c 90 0d 00 	cmp.b	#13,	r12	;#0x000d
 4c0:	14 24       	jz	$+42     	;abs 0x4ea
 4c2:	4d 4c       	mov.b	r12,	r13	;
 4c4:	7d 50 e0 ff 	add.b	#-32,	r13	;#0xffe0
 4c8:	7e 40 5e 00 	mov.b	#94,	r14	;#0x005e
 4cc:	4e 9d       	cmp.b	r13,	r14	;
 4ce:	e6 2b       	jnc	$-50     	;abs 0x49c
 4d0:	0d 46       	mov	r6,	r13	;
 4d2:	3d 53       	add	#-1,	r13	;r3 As==11
 4d4:	09 9d       	cmp	r13,	r9	;
 4d6:	e2 2f       	jc	$-58     	;abs 0x49c
 4d8:	07 93       	cmp	#0,	r7	;r3 As==00
 4da:	02 24       	jz	$+6      	;abs 0x4e0
 4dc:	b0 12 34 04 	call	#1076		;#0x0434

000004e0 <.L35>:
 4e0:	ca 48 00 00 	mov.b	r8,	0(r10)	;
 4e4:	19 53       	inc	r9		;
 4e6:	1a 53       	inc	r10		;
 4e8:	d9 3f       	jmp	$-76     	;abs 0x49c

000004ea <.L34>:
 4ea:	ca 43 00 00 	mov.b	#0,	0(r10)	;r3 As==00
 4ee:	0c 49       	mov	r9,	r12	;
 4f0:	30 40 ec 08 	br	#0x08ec		;

000004f4 <neo430_uart_print_hex_char>:
 4f4:	7c f0 0f 00 	and.b	#15,	r12	;#0x000f
 4f8:	7d 40 09 00 	mov.b	#9,	r13	;
 4fc:	4d 9c       	cmp.b	r12,	r13	;
 4fe:	07 28       	jnc	$+16     	;abs 0x50e
 500:	7c 50 30 00 	add.b	#48,	r12	;#0x0030

00000504 <.L48>:
 504:	3c f0 ff 00 	and	#255,	r12	;#0x00ff
 508:	b0 12 34 04 	call	#1076		;#0x0434
 50c:	30 41       	ret			

0000050e <.L46>:
 50e:	7c 50 57 00 	add.b	#87,	r12	;#0x0057
 512:	f8 3f       	jmp	$-14     	;abs 0x504

00000514 <neo430_uart_print_hex_byte>:
 514:	0a 12       	push	r10		;
 516:	09 12       	push	r9		;
 518:	49 4c       	mov.b	r12,	r9	;
 51a:	0c 49       	mov	r9,	r12	;
 51c:	12 c3       	clrc			
 51e:	0c 10       	rrc	r12		;
 520:	12 c3       	clrc			
 522:	0c 10       	rrc	r12		;
 524:	12 c3       	clrc			
 526:	0c 10       	rrc	r12		;
 528:	12 c3       	clrc			
 52a:	0c 10       	rrc	r12		;
 52c:	3a 40 f4 04 	mov	#1268,	r10	;#0x04f4
 530:	8a 12       	call	r10		;
 532:	4c 49       	mov.b	r9,	r12	;
 534:	8a 12       	call	r10		;
 536:	dd 3d       	jmp	$+956    	;abs 0x8f2

00000538 <neo430_uart_print_hex_word>:
 538:	0a 12       	push	r10		;
 53a:	09 12       	push	r9		;
 53c:	0a 4c       	mov	r12,	r10	;
 53e:	7d 42       	mov.b	#8,	r13	;r2 As==11
 540:	b0 12 14 09 	call	#2324		;#0x0914
 544:	39 40 14 05 	mov	#1300,	r9	;#0x0514
 548:	89 12       	call	r9		;
 54a:	4c 4a       	mov.b	r10,	r12	;
 54c:	89 12       	call	r9		;
 54e:	d1 3d       	jmp	$+932    	;abs 0x8f2

00000550 <neo430_uart_print_hex_dword>:
 550:	0a 12       	push	r10		;
 552:	09 12       	push	r9		;
 554:	08 12       	push	r8		;
 556:	09 4c       	mov	r12,	r9	;
 558:	08 4d       	mov	r13,	r8	;
 55a:	0c 4d       	mov	r13,	r12	;
 55c:	7d 42       	mov.b	#8,	r13	;r2 As==11
 55e:	b0 12 14 09 	call	#2324		;#0x0914
 562:	3a 40 14 05 	mov	#1300,	r10	;#0x0514
 566:	8a 12       	call	r10		;
 568:	4c 48       	mov.b	r8,	r12	;
 56a:	8a 12       	call	r10		;
 56c:	0c 49       	mov	r9,	r12	;
 56e:	7d 42       	mov.b	#8,	r13	;r2 As==11
 570:	b0 12 14 09 	call	#2324		;#0x0914
 574:	8a 12       	call	r10		;
 576:	4c 49       	mov.b	r9,	r12	;
 578:	8a 12       	call	r10		;
 57a:	ba 3d       	jmp	$+886    	;abs 0x8f0

0000057c <neo430_uart_print_bin_byte>:
 57c:	0a 12       	push	r10		;
 57e:	09 12       	push	r9		;
 580:	08 12       	push	r8		;
 582:	48 4c       	mov.b	r12,	r8	;
 584:	7a 42       	mov.b	#8,	r10	;r2 As==11
 586:	79 40 80 00 	mov.b	#128,	r9	;#0x0080

0000058a <.L56>:
 58a:	7c 40 31 00 	mov.b	#49,	r12	;#0x0031
 58e:	48 b9       	bit.b	r9,	r8	;
 590:	02 20       	jnz	$+6      	;abs 0x596
 592:	7c 40 30 00 	mov.b	#48,	r12	;#0x0030

00000596 <.L58>:
 596:	b0 12 34 04 	call	#1076		;#0x0434
 59a:	12 c3       	clrc			
 59c:	09 10       	rrc	r9		;
 59e:	3a 53       	add	#-1,	r10	;r3 As==11
 5a0:	0a 93       	cmp	#0,	r10	;r3 As==00
 5a2:	f3 23       	jnz	$-24     	;abs 0x58a
 5a4:	a5 3d       	jmp	$+844    	;abs 0x8f0

000005a6 <neo430_uart_print_bin_word>:
 5a6:	0a 12       	push	r10		;
 5a8:	09 12       	push	r9		;
 5aa:	0a 4c       	mov	r12,	r10	;
 5ac:	7d 42       	mov.b	#8,	r13	;r2 As==11
 5ae:	b0 12 14 09 	call	#2324		;#0x0914
 5b2:	39 40 7c 05 	mov	#1404,	r9	;#0x057c
 5b6:	89 12       	call	r9		;
 5b8:	4c 4a       	mov.b	r10,	r12	;
 5ba:	89 12       	call	r9		;
 5bc:	9a 3d       	jmp	$+822    	;abs 0x8f2

000005be <neo430_itoa>:
 5be:	0a 12       	push	r10		;
 5c0:	09 12       	push	r9		;
 5c2:	08 12       	push	r8		;
 5c4:	07 12       	push	r7		;
 5c6:	06 12       	push	r6		;
 5c8:	05 12       	push	r5		;
 5ca:	04 12       	push	r4		;
 5cc:	31 80 16 00 	sub	#22,	r1	;#0x0016
 5d0:	08 4c       	mov	r12,	r8	;
 5d2:	09 4d       	mov	r13,	r9	;
 5d4:	05 4e       	mov	r14,	r5	;
 5d6:	0a 4f       	mov	r15,	r10	;
 5d8:	7e 40 0a 00 	mov.b	#10,	r14	;#0x000a
 5dc:	3d 40 34 0e 	mov	#3636,	r13	;#0x0e34
 5e0:	0c 41       	mov	r1,	r12	;
 5e2:	1c 53       	inc	r12		;
 5e4:	b0 12 28 09 	call	#2344		;#0x0928
 5e8:	c1 43 15 00 	mov.b	#0,	21(r1)	;r3 As==00, 0x0015
 5ec:	ca 43 0a 00 	mov.b	#0,	10(r10)	;r3 As==00, 0x000a
 5f0:	07 41       	mov	r1,	r7	;
 5f2:	37 50 0b 00 	add	#11,	r7	;#0x000b
 5f6:	04 41       	mov	r1,	r4	;
 5f8:	34 50 15 00 	add	#21,	r4	;#0x0015
 5fc:	06 47       	mov	r7,	r6	;

000005fe <.L62>:
 5fe:	7e 40 0a 00 	mov.b	#10,	r14	;#0x000a
 602:	4f 43       	clr.b	r15		;
 604:	0c 48       	mov	r8,	r12	;
 606:	0d 49       	mov	r9,	r13	;
 608:	b0 12 da 08 	call	#2266		;#0x08da
 60c:	7d 40 16 00 	mov.b	#22,	r13	;#0x0016
 610:	0d 51       	add	r1,	r13	;
 612:	0c 5d       	add	r13,	r12	;
 614:	d6 4c eb ff 	mov.b	-21(r12),0(r6)	;0xffffffeb
 618:	00 00 
 61a:	16 53       	inc	r6		;
 61c:	7e 40 0a 00 	mov.b	#10,	r14	;#0x000a
 620:	4f 43       	clr.b	r15		;
 622:	0c 48       	mov	r8,	r12	;
 624:	0d 49       	mov	r9,	r13	;
 626:	b0 12 cc 08 	call	#2252		;#0x08cc
 62a:	08 4c       	mov	r12,	r8	;
 62c:	09 4d       	mov	r13,	r9	;
 62e:	06 94       	cmp	r4,	r6	;
 630:	e6 23       	jnz	$-50     	;abs 0x5fe
 632:	7c 40 09 00 	mov.b	#9,	r12	;

00000636 <.L63>:
 636:	0c 95       	cmp	r5,	r12	;
 638:	18 20       	jnz	$+50     	;abs 0x66a

0000063a <.L64>:
 63a:	4f 43       	clr.b	r15		;

0000063c <.L67>:
 63c:	7d 40 16 00 	mov.b	#22,	r13	;#0x0016
 640:	0d 51       	add	r1,	r13	;
 642:	0d 5c       	add	r12,	r13	;
 644:	5e 4d f5 ff 	mov.b	-11(r13),r14	;0xfffffff5
 648:	cd 93 f5 ff 	cmp.b	#0,	-11(r13);r3 As==00, 0xfff5
 64c:	05 24       	jz	$+12     	;abs 0x658
 64e:	0d 4a       	mov	r10,	r13	;
 650:	0d 5f       	add	r15,	r13	;
 652:	cd 4e 00 00 	mov.b	r14,	0(r13)	;
 656:	1f 53       	inc	r15		;

00000658 <.L66>:
 658:	3c 53       	add	#-1,	r12	;r3 As==11
 65a:	3c 93       	cmp	#-1,	r12	;r3 As==11
 65c:	ef 23       	jnz	$-32     	;abs 0x63c
 65e:	0a 5f       	add	r15,	r10	;
 660:	ca 43 00 00 	mov.b	#0,	0(r10)	;r3 As==00
 664:	31 50 16 00 	add	#22,	r1	;#0x0016
 668:	3f 3d       	jmp	$+640    	;abs 0x8e8

0000066a <.L65>:
 66a:	5e 47 09 00 	mov.b	9(r7),	r14	;
 66e:	0d 4c       	mov	r12,	r13	;
 670:	3d 53       	add	#-1,	r13	;r3 As==11
 672:	37 53       	add	#-1,	r7	;r3 As==11
 674:	3e 90 30 00 	cmp	#48,	r14	;#0x0030
 678:	e0 23       	jnz	$-62     	;abs 0x63a
 67a:	c7 43 0a 00 	mov.b	#0,	10(r7)	;r3 As==00, 0x000a
 67e:	0c 4d       	mov	r13,	r12	;
 680:	da 3f       	jmp	$-74     	;abs 0x636
 682:	00 00       	beq			

00000684 <neo430_printf>:
 684:	0a 12       	push	r10		;
 686:	09 12       	push	r9		;
 688:	08 12       	push	r8		;
 68a:	07 12       	push	r7		;
 68c:	06 12       	push	r6		;
 68e:	31 80 0c 00 	sub	#12,	r1	;#0x000c
 692:	0a 41       	mov	r1,	r10	;
 694:	3a 50 18 00 	add	#24,	r10	;#0x0018
 698:	38 4a       	mov	@r10+,	r8	;

0000069a <.L74>:
 69a:	67 48       	mov.b	@r8,	r7	;
 69c:	c8 93 00 00 	cmp.b	#0,	0(r8)	;r3 As==00
 6a0:	03 20       	jnz	$+8      	;abs 0x6a8

000006a2 <.L73>:
 6a2:	31 50 0c 00 	add	#12,	r1	;#0x000c
 6a6:	22 3d       	jmp	$+582    	;abs 0x8ec

000006a8 <.L94>:
 6a8:	77 90 25 00 	cmp.b	#37,	r7	;#0x0025
 6ac:	7f 20       	jnz	$+256    	;abs 0x7ac
 6ae:	09 48       	mov	r8,	r9	;
 6b0:	29 53       	incd	r9		;
 6b2:	5c 48 01 00 	mov.b	1(r8),	r12	;
 6b6:	3c 90 58 00 	cmp	#88,	r12	;#0x0058
 6ba:	71 24       	jz	$+228    	;abs 0x79e
 6bc:	7c 50 9e ff 	add.b	#-98,	r12	;#0xff9e
 6c0:	78 40 16 00 	mov.b	#22,	r8	;#0x0016
 6c4:	48 9c       	cmp.b	r12,	r8	;
 6c6:	ed 2b       	jnc	$-36     	;abs 0x6a2
 6c8:	3c f0 ff 00 	and	#255,	r12	;#0x00ff
 6cc:	0c 5c       	rla	r12		;
 6ce:	3c 50 d6 06 	add	#1750,	r12	;#0x06d6
 6d2:	2c 4c       	mov	@r12,	r12	;
 6d4:	00 4c       	br	r12		;

000006d6 <.L79>:
 6d6:	1a 07       	mova	@r7+,	r10	;
 6d8:	0e 07       	mova	@r7,	r14	;
 6da:	a2 06 a2 06 	adda	#394914,r2	;0x606a2
 6de:	a2 06 a2 06 	adda	#394914,r2	;0x606a2
 6e2:	a2 06 26 07 	adda	#395046,r2	;0x60726
 6e6:	a2 06 a2 06 	adda	#394914,r2	;0x606a2
 6ea:	78 07 a2 06 	mova	r7,	1698(r8); 0x006a2
 6ee:	82 07 a2 06 	mova	#460450,r2	;0x706a2
 6f2:	a2 06 a2 06 	adda	#394914,r2	;0x606a2
 6f6:	a2 06 04 07 	adda	#395012,r2	;0x60704
 6fa:	a2 06 5a 07 	adda	#395098,r2	;0x6075a
 6fe:	a2 06 a2 06 	adda	#394914,r2	;0x606a2
 702:	92 07   	cmpa	#477756,r2	;0x74a3c

00000704 <.L81>:
 704:	3c 4a       	mov	@r10+,	r12	;
 706:	b0 12 50 04 	call	#1104		;#0x0450

0000070a <.L87>:
 70a:	08 49       	mov	r9,	r8	;
 70c:	c6 3f       	jmp	$-114    	;abs 0x69a

0000070e <.L85>:
 70e:	1a 53       	inc	r10		;
 710:	1a c3       	bic	#1,	r10	;r3 As==01
 712:	3c 4a       	mov	@r10+,	r12	;

00000714 <.L95>:
 714:	b0 12 34 04 	call	#1076		;#0x0434
 718:	f8 3f       	jmp	$-14     	;abs 0x70a

0000071a <.L86>:
 71a:	1a 53       	inc	r10		;
 71c:	1a c3       	bic	#1,	r10	;r3 As==01
 71e:	3c 4a       	mov	@r10+,	r12	;
 720:	b0 12 a6 05 	call	#1446		;#0x05a6
 724:	f2 3f       	jmp	$-26     	;abs 0x70a

00000726 <.L84>:
 726:	1a 53       	inc	r10		;
 728:	1a c3       	bic	#1,	r10	;r3 As==01
 72a:	3c 4a       	mov	@r10+,	r12	;
 72c:	06 4c       	mov	r12,	r6	;
 72e:	36 b0 00 80 	bit	#-32768,r6	;#0x8000
 732:	07 77       	subc	r7,	r7	;
 734:	37 e3       	inv	r7		;

00000736 <.L98>:
 736:	07 93       	cmp	#0,	r7	;r3 As==00
 738:	0a 34       	jge	$+22     	;abs 0x74e
 73a:	4c 43       	clr.b	r12		;
 73c:	4d 43       	clr.b	r13		;
 73e:	0c 86       	sub	r6,	r12	;
 740:	0d 77       	subc	r7,	r13	;
 742:	06 4c       	mov	r12,	r6	;
 744:	07 4d       	mov	r13,	r7	;
 746:	7c 40 2d 00 	mov.b	#45,	r12	;#0x002d
 74a:	b0 12 34 04 	call	#1076		;#0x0434

0000074e <.L90>:
 74e:	0f 41       	mov	r1,	r15	;
 750:	1f 53       	inc	r15		;
 752:	4e 43       	clr.b	r14		;
 754:	0c 46       	mov	r6,	r12	;
 756:	0d 47       	mov	r7,	r13	;
 758:	08 3c       	jmp	$+18     	;abs 0x76a

0000075a <.L80>:
 75a:	1a 53       	inc	r10		;
 75c:	1a c3       	bic	#1,	r10	;r3 As==01
 75e:	0f 41       	mov	r1,	r15	;
 760:	1f 53       	inc	r15		;
 762:	4e 43       	clr.b	r14		;
 764:	38 4a       	mov	@r10+,	r8	;
 766:	0c 48       	mov	r8,	r12	;
 768:	0d 43       	clr	r13		;

0000076a <.L96>:
 76a:	b0 12 be 05 	call	#1470		;#0x05be
 76e:	0c 41       	mov	r1,	r12	;
 770:	1c 53       	inc	r12		;
 772:	b0 12 64 04 	call	#1124		;#0x0464
 776:	c9 3f       	jmp	$-108    	;abs 0x70a

00000778 <.L83>:
 778:	1a 53       	inc	r10		;
 77a:	1a c3       	bic	#1,	r10	;r3 As==01
 77c:	36 4a       	mov	@r10+,	r6	;
 77e:	37 4a       	mov	@r10+,	r7	;
 780:	da 3f       	jmp	$-74     	;abs 0x736

00000782 <.L82>:
 782:	1a 53       	inc	r10		;
 784:	1a c3       	bic	#1,	r10	;r3 As==01
 786:	0f 41       	mov	r1,	r15	;
 788:	1f 53       	inc	r15		;
 78a:	4e 43       	clr.b	r14		;
 78c:	3c 4a       	mov	@r10+,	r12	;
 78e:	3d 4a       	mov	@r10+,	r13	;
 790:	ec 3f       	jmp	$-38     	;abs 0x76a

00000792 <.L78>:
 792:	1a 53       	inc	r10		;
 794:	1a c3       	bic	#1,	r10	;r3 As==01
 796:	3c 4a       	mov	@r10+,	r12	;
 798:	b0 12 38 05 	call	#1336		;#0x0538
 79c:	b6 3f       	jmp	$-146    	;abs 0x70a

0000079e <.L76>:
 79e:	1a 53       	inc	r10		;
 7a0:	1a c3       	bic	#1,	r10	;r3 As==01
 7a2:	3c 4a       	mov	@r10+,	r12	;
 7a4:	3d 4a       	mov	@r10+,	r13	;
 7a6:	b0 12 50 05 	call	#1360		;#0x0550
 7aa:	af 3f       	jmp	$-160    	;abs 0x70a

000007ac <.L75>:
 7ac:	77 90 0a 00 	cmp.b	#10,	r7	;#0x000a
 7b0:	04 20       	jnz	$+10     	;abs 0x7ba
 7b2:	7c 40 0d 00 	mov.b	#13,	r12	;#0x000d
 7b6:	b0 12 34 04 	call	#1076		;#0x0434

000007ba <.L93>:
 7ba:	09 48       	mov	r8,	r9	;
 7bc:	19 53       	inc	r9		;
 7be:	4c 47       	mov.b	r7,	r12	;
 7c0:	a9 3f       	jmp	$-172    	;abs 0x714

000007c2 <neo430_hexstr_to_uint>:
 7c2:	0a 12       	push	r10		;
 7c4:	09 12       	push	r9		;
 7c6:	08 12       	push	r8		;
 7c8:	07 12       	push	r7		;
 7ca:	06 12       	push	r6		;
 7cc:	0a 4c       	mov	r12,	r10	;
 7ce:	47 4d       	mov.b	r13,	r7	;
 7d0:	48 43       	clr.b	r8		;
 7d2:	49 43       	clr.b	r9		;

000007d4 <.L100>:
 7d4:	4c 47       	mov.b	r7,	r12	;
 7d6:	7c 53       	add.b	#-1,	r12	;r3 As==11
 7d8:	47 4c       	mov.b	r12,	r7	;
 7da:	7c 93       	cmp.b	#-1,	r12	;r3 As==11
 7dc:	03 20       	jnz	$+8      	;abs 0x7e4
 7de:	0c 48       	mov	r8,	r12	;
 7e0:	0d 49       	mov	r9,	r13	;
 7e2:	84 3c       	jmp	$+266    	;abs 0x8ec

000007e4 <.L104>:
 7e4:	7d 4a       	mov.b	@r10+,	r13	;
 7e6:	4c 4d       	mov.b	r13,	r12	;
 7e8:	7c 50 d0 ff 	add.b	#-48,	r12	;#0xffd0
 7ec:	76 40 09 00 	mov.b	#9,	r6	;
 7f0:	46 9c       	cmp.b	r12,	r6	;
 7f2:	11 28       	jnc	$+36     	;abs 0x816
 7f4:	3d 50 d0 ff 	add	#-48,	r13	;#0xffd0

000007f8 <.L106>:
 7f8:	0e 4d       	mov	r13,	r14	;
 7fa:	3e b0 00 80 	bit	#-32768,r14	;#0x8000
 7fe:	0f 7f       	subc	r15,	r15	;
 800:	3f e3       	inv	r15		;

00000802 <.L102>:
 802:	0c 4e       	mov	r14,	r12	;
 804:	0d 4f       	mov	r15,	r13	;
 806:	0e 47       	mov	r7,	r14	;
 808:	0e 5e       	rla	r14		;
 80a:	0e 5e       	rla	r14		;
 80c:	b0 12 08 09 	call	#2312		;#0x0908
 810:	08 5c       	add	r12,	r8	;
 812:	09 6d       	addc	r13,	r9	;
 814:	df 3f       	jmp	$-64     	;abs 0x7d4

00000816 <.L101>:
 816:	4c 4d       	mov.b	r13,	r12	;
 818:	7c 50 9f ff 	add.b	#-97,	r12	;#0xff9f
 81c:	7e 40 05 00 	mov.b	#5,	r14	;
 820:	4e 9c       	cmp.b	r12,	r14	;
 822:	03 28       	jnc	$+8      	;abs 0x82a
 824:	3d 50 a9 ff 	add	#-87,	r13	;#0xffa9
 828:	e7 3f       	jmp	$-48     	;abs 0x7f8

0000082a <.L103>:
 82a:	4e 43       	clr.b	r14		;
 82c:	4f 43       	clr.b	r15		;
 82e:	4c 4d       	mov.b	r13,	r12	;
 830:	7c 50 bf ff 	add.b	#-65,	r12	;#0xffbf
 834:	76 40 05 00 	mov.b	#5,	r6	;
 838:	46 9c       	cmp.b	r12,	r6	;
 83a:	e3 2b       	jnc	$-56     	;abs 0x802
 83c:	3d 50 c9 ff 	add	#-55,	r13	;#0xffc9
 840:	db 3f       	jmp	$-72     	;abs 0x7f8

00000842 <neo430_soft_reset>:
 842:	00 43       	clr	r0		;
 844:	30 41       	ret			

00000846 <udivmodsi4>:
 846:	0a 12       	push	r10		;

00000848 <.LCFI0>:
 848:	09 12       	push	r9		;

0000084a <.LCFI1>:
 84a:	08 12       	push	r8		;

0000084c <.LCFI2>:
 84c:	07 12       	push	r7		;

0000084e <.LCFI3>:
 84e:	06 12       	push	r6		;

00000850 <.LCFI4>:
 850:	0a 4c       	mov	r12,	r10	;
 852:	0b 4d       	mov	r13,	r11	;

00000854 <.LVL1>:
 854:	7c 40 21 00 	mov.b	#33,	r12	;#0x0021

00000858 <.LVL2>:
 858:	58 43       	mov.b	#1,	r8	;r3 As==01
 85a:	49 43       	clr.b	r9		;

0000085c <.L2>:
 85c:	0f 9b       	cmp	r11,	r15	;
 85e:	04 28       	jnc	$+10     	;abs 0x868
 860:	0b 9f       	cmp	r15,	r11	;
 862:	07 20       	jnz	$+16     	;abs 0x872
 864:	0e 9a       	cmp	r10,	r14	;
 866:	05 2c       	jc	$+12     	;abs 0x872

00000868 <.L15>:
 868:	3c 53       	add	#-1,	r12	;r3 As==11

0000086a <.Loc.38.1>:
 86a:	0c 93       	cmp	#0,	r12	;r3 As==00
 86c:	2c 24       	jz	$+90     	;abs 0x8c6

0000086e <.Loc.38.1>:
 86e:	0f 93       	cmp	#0,	r15	;r3 As==00
 870:	0c 34       	jge	$+26     	;abs 0x88a

00000872 <.L13>:
 872:	4c 43       	clr.b	r12		;
 874:	4d 43       	clr.b	r13		;

00000876 <.L8>:
 876:	07 48       	mov	r8,	r7	;
 878:	07 d9       	bis	r9,	r7	;
 87a:	07 93       	cmp	#0,	r7	;r3 As==00
 87c:	13 20       	jnz	$+40     	;abs 0x8a4

0000087e <.L5>:
 87e:	81 93 0c 00 	cmp	#0,	12(r1)	;r3 As==00, 0x000c
 882:	02 24       	jz	$+6      	;abs 0x888
 884:	0c 4a       	mov	r10,	r12	;
 886:	0d 4b       	mov	r11,	r13	;

00000888 <.L1>:
 888:	31 3c       	jmp	$+100    	;abs 0x8ec

0000088a <.L6>:
 88a:	06 4e       	mov	r14,	r6	;
 88c:	07 4f       	mov	r15,	r7	;
 88e:	06 5e       	add	r14,	r6	;
 890:	07 6f       	addc	r15,	r7	;
 892:	0e 46       	mov	r6,	r14	;

00000894 <.LVL7>:
 894:	0f 47       	mov	r7,	r15	;

00000896 <.LVL8>:
 896:	06 48       	mov	r8,	r6	;
 898:	07 49       	mov	r9,	r7	;
 89a:	06 58       	add	r8,	r6	;
 89c:	07 69       	addc	r9,	r7	;
 89e:	08 46       	mov	r6,	r8	;

000008a0 <.LVL9>:
 8a0:	09 47       	mov	r7,	r9	;

000008a2 <.LVL10>:
 8a2:	dc 3f       	jmp	$-70     	;abs 0x85c

000008a4 <.L11>:
 8a4:	0b 9f       	cmp	r15,	r11	;
 8a6:	08 28       	jnc	$+18     	;abs 0x8b8
 8a8:	0f 9b       	cmp	r11,	r15	;
 8aa:	02 20       	jnz	$+6      	;abs 0x8b0
 8ac:	0a 9e       	cmp	r14,	r10	;
 8ae:	04 28       	jnc	$+10     	;abs 0x8b8

000008b0 <.L16>:
 8b0:	0a 8e       	sub	r14,	r10	;
 8b2:	0b 7f       	subc	r15,	r11	;

000008b4 <.Loc.48.1>:
 8b4:	0c d8       	bis	r8,	r12	;

000008b6 <.LVL13>:
 8b6:	0d d9       	bis	r9,	r13	;

000008b8 <.L9>:
 8b8:	12 c3       	clrc			
 8ba:	09 10       	rrc	r9		;
 8bc:	08 10       	rrc	r8		;

000008be <.Loc.51.1>:
 8be:	12 c3       	clrc			
 8c0:	0f 10       	rrc	r15		;
 8c2:	0e 10       	rrc	r14		;
 8c4:	d8 3f       	jmp	$-78     	;abs 0x876

000008c6 <.L14>:
 8c6:	4c 43       	clr.b	r12		;
 8c8:	4d 43       	clr.b	r13		;
 8ca:	d9 3f       	jmp	$-76     	;abs 0x87e

000008cc <__mspabi_divlu>:
 8cc:	21 83       	decd	r1		;

000008ce <.LCFI20>:
 8ce:	81 43 00 00 	mov	#0,	0(r1)	;r3 As==00
 8d2:	b0 12   	call	#2118		;#0x0846

000008d4 <L0^A>:
 8d4:	46 08       	rrcm.a	#3,	r6	;

000008d6 <.LVL41>:
 8d6:	21 53       	incd	r1		;

000008d8 <.LCFI21>:
 8d8:	30 41       	ret			

000008da <__mspabi_remul>:
 8da:	21 83       	decd	r1		;

000008dc <.LCFI22>:
 8dc:	91 43 00 00 	mov	#1,	0(r1)	;r3 As==01
 8e0:	b0 12 46 08 	call	#2118		;#0x0846

000008e4 <.LVL43>:
 8e4:	21 53       	incd	r1		;

000008e6 <.LCFI23>:
 8e6:	30 41       	ret			

000008e8 <__mspabi_func_epilog_7>:
 8e8:	34 41       	pop	r4		;

000008ea <__mspabi_func_epilog_6>:
 8ea:	35 41       	pop	r5		;

000008ec <__mspabi_func_epilog_5>:
 8ec:	36 41       	pop	r6		;

000008ee <__mspabi_func_epilog_4>:
 8ee:	37 41       	pop	r7		;

000008f0 <__mspabi_func_epilog_3>:
 8f0:	38 41       	pop	r8		;

000008f2 <__mspabi_func_epilog_2>:
 8f2:	39 41       	pop	r9		;

000008f4 <__mspabi_func_epilog_1>:
 8f4:	3a 41       	pop	r10		;
 8f6:	30 41       	ret			

000008f8 <.L1^B1>:
 8f8:	3d 53       	add	#-1,	r13	;r3 As==11
 8fa:	0c 5c       	rla	r12		;

000008fc <__mspabi_slli>:
 8fc:	0d 93       	cmp	#0,	r13	;r3 As==00
 8fe:	fc 23       	jnz	$-6      	;abs 0x8f8
 900:	30 41       	ret			

00000902 <.L1^B2>:
 902:	3e 53       	add	#-1,	r14	;r3 As==11
 904:	0c 5c       	rla	r12		;
 906:	0d 6d       	rlc	r13		;

00000908 <__mspabi_slll>:
 908:	0e 93       	cmp	#0,	r14	;r3 As==00
 90a:	fb 23       	jnz	$-8      	;abs 0x902
 90c:	30 41       	ret			

0000090e <.L1^B1>:
 90e:	3d 53       	add	#-1,	r13	;r3 As==11
 910:	12 c3       	clrc			
 912:	0c 10       	rrc	r12		;

00000914 <__mspabi_srli>:
 914:	0d 93       	cmp	#0,	r13	;r3 As==00
 916:	fb 23       	jnz	$-8      	;abs 0x90e
 918:	30 41       	ret			

0000091a <.L1^B2>:
 91a:	3e 53       	add	#-1,	r14	;r3 As==11
 91c:	12 c3       	clrc			
 91e:	0d 10       	rrc	r13		;
 920:	0c 10       	rrc	r12		;

00000922 <__mspabi_srll>:
 922:	0e 93       	cmp	#0,	r14	;r3 As==00
 924:	fa 23       	jnz	$-10     	;abs 0x91a
 926:	30 41       	ret			

00000928 <memcpy>:
 928:	0f 4c       	mov	r12,	r15	;
 92a:	0e 5d       	add	r13,	r14	;

0000092c <.L2>:
 92c:	0d 9e       	cmp	r14,	r13	;
 92e:	01 20       	jnz	$+4      	;abs 0x932

00000930 <.Loc.111.1>:
 930:	30 41       	ret			

00000932 <.L3>:
 932:	ff 4d 00 00 	mov.b	@r13+,	0(r15)	;

00000936 <.LVL4>:
 936:	1f 53       	inc	r15		;
 938:	f9 3f       	jmp	$-12     	;abs 0x92c

0000093a <strcmp>:
 93a:	7e 4c       	mov.b	@r12+,	r14	;

0000093c <L0^A>:
 93c:	7f 4d       	mov.b	@r13+,	r15	;

0000093e <.Loc.66.1>:
 93e:	0e 93       	cmp	#0,	r14	;r3 As==00
 940:	02 24       	jz	$+6      	;abs 0x946

00000942 <.Loc.66.1>:
 942:	0e 9f       	cmp	r15,	r14	;
 944:	fa 27       	jz	$-10     	;abs 0x93a

00000946 <.L2>:
 946:	0c 4e       	mov	r14,	r12	;
 948:	0c 8f       	sub	r15,	r12	;

0000094a <.LVL3>:
 94a:	30 41       	ret			

0000094c <strlen>:
 94c:	0d 4c       	mov	r12,	r13	;

0000094e <.L2>:
 94e:	0e 4d       	mov	r13,	r14	;

00000950 <.LVL3>:
 950:	1d 53       	inc	r13		;

00000952 <.LVL4>:
 952:	ce 93 00 00 	cmp.b	#0,	0(r14)	;r3 As==00
 956:	fb 23       	jnz	$-8      	;abs 0x94e

00000958 <.Loc.87.1>:
 958:	0e 8c       	sub	r12,	r14	;

0000095a <.LVL5>:
 95a:	0c 4e       	mov	r14,	r12	;

0000095c <.LVL6>:
 95c:	30 41       	ret			

Disassembly of section .rodata:

0000095e <_etext-0x4e2>:
 95e:	
Disassembly of section .bss:

0000c008 <bus_claimed>:
    c008:	00 00       	beq			

Disassembly of section .MP430.attributes:

00000000 <.MP430.attributes>:
   0:	41 16       	popm.a	#5,	r5	;20-bit words
   2:	00 00       	beq			
   4:	00 6d       	addc	r13,	r0	;
   6:	
Disassembly of section .comment:

00000000 <.comment>:
   0:	47 43       	clr.b	r7		;
   2:	43 3a       	jl	$-888    	;abs 0xfffffffffffffc8a
   4:	20 28       	jnc	$+66     	;abs 0x46
   6:	4d 69       	addc.b	r9,	r13	;
   8:	74 74       	subc.b	@r4+,	r4	;
   a:	6f 20       	jnz	$+224    	;abs 0xea
   c:	