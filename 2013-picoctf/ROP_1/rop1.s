
rop1-fa6168f4d8eba0eb:     file format elf32-i386


Disassembly of section .init:

08048338 <_init>:
 8048338:	53                   	push   %ebx
 8048339:	83 ec 08             	sub    $0x8,%esp
 804833c:	e8 00 00 00 00       	call   8048341 <_init+0x9>
 8048341:	5b                   	pop    %ebx
 8048342:	81 c3 b3 1c 00 00    	add    $0x1cb3,%ebx
 8048348:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 804834e:	85 c0                	test   %eax,%eax
 8048350:	74 05                	je     8048357 <_init+0x1f>
 8048352:	e8 59 00 00 00       	call   80483b0 <__gmon_start__@plt>
 8048357:	e8 24 01 00 00       	call   8048480 <frame_dummy>
 804835c:	e8 5f 02 00 00       	call   80485c0 <__do_global_ctors_aux>
 8048361:	83 c4 08             	add    $0x8,%esp
 8048364:	5b                   	pop    %ebx
 8048365:	c3                   	ret    

Disassembly of section .plt:

08048370 <read@plt-0x10>:
 8048370:	ff 35 f8 9f 04 08    	pushl  0x8049ff8
 8048376:	ff 25 fc 9f 04 08    	jmp    *0x8049ffc
 804837c:	00 00                	add    %al,(%eax)
	...

08048380 <read@plt>:
 8048380:	ff 25 00 a0 04 08    	jmp    *0x804a000
 8048386:	68 00 00 00 00       	push   $0x0
 804838b:	e9 e0 ff ff ff       	jmp    8048370 <_init+0x38>

08048390 <getegid@plt>:
 8048390:	ff 25 04 a0 04 08    	jmp    *0x804a004
 8048396:	68 08 00 00 00       	push   $0x8
 804839b:	e9 d0 ff ff ff       	jmp    8048370 <_init+0x38>

080483a0 <system@plt>:
 80483a0:	ff 25 08 a0 04 08    	jmp    *0x804a008
 80483a6:	68 10 00 00 00       	push   $0x10
 80483ab:	e9 c0 ff ff ff       	jmp    8048370 <_init+0x38>

080483b0 <__gmon_start__@plt>:
 80483b0:	ff 25 0c a0 04 08    	jmp    *0x804a00c
 80483b6:	68 18 00 00 00       	push   $0x18
 80483bb:	e9 b0 ff ff ff       	jmp    8048370 <_init+0x38>

080483c0 <__libc_start_main@plt>:
 80483c0:	ff 25 10 a0 04 08    	jmp    *0x804a010
 80483c6:	68 20 00 00 00       	push   $0x20
 80483cb:	e9 a0 ff ff ff       	jmp    8048370 <_init+0x38>

080483d0 <write@plt>:
 80483d0:	ff 25 14 a0 04 08    	jmp    *0x804a014
 80483d6:	68 28 00 00 00       	push   $0x28
 80483db:	e9 90 ff ff ff       	jmp    8048370 <_init+0x38>

080483e0 <setresgid@plt>:
 80483e0:	ff 25 18 a0 04 08    	jmp    *0x804a018
 80483e6:	68 30 00 00 00       	push   $0x30
 80483eb:	e9 80 ff ff ff       	jmp    8048370 <_init+0x38>

Disassembly of section .text:

080483f0 <_start>:
 80483f0:	31 ed                	xor    %ebp,%ebp
 80483f2:	5e                   	pop    %esi
 80483f3:	89 e1                	mov    %esp,%ecx
 80483f5:	83 e4 f0             	and    $0xfffffff0,%esp
 80483f8:	50                   	push   %eax
 80483f9:	54                   	push   %esp
 80483fa:	52                   	push   %edx
 80483fb:	68 b0 85 04 08       	push   $0x80485b0
 8048400:	68 40 85 04 08       	push   $0x8048540
 8048405:	51                   	push   %ecx
 8048406:	56                   	push   %esi
 8048407:	68 0a 85 04 08       	push   $0x804850a
 804840c:	e8 af ff ff ff       	call   80483c0 <__libc_start_main@plt>
 8048411:	f4                   	hlt    
 8048412:	90                   	nop
 8048413:	90                   	nop
 8048414:	90                   	nop
 8048415:	90                   	nop
 8048416:	90                   	nop
 8048417:	90                   	nop
 8048418:	90                   	nop
 8048419:	90                   	nop
 804841a:	90                   	nop
 804841b:	90                   	nop
 804841c:	90                   	nop
 804841d:	90                   	nop
 804841e:	90                   	nop
 804841f:	90                   	nop

08048420 <__do_global_dtors_aux>:
 8048420:	55                   	push   %ebp
 8048421:	89 e5                	mov    %esp,%ebp
 8048423:	53                   	push   %ebx
 8048424:	83 ec 04             	sub    $0x4,%esp
 8048427:	80 3d 24 a0 04 08 00 	cmpb   $0x0,0x804a024
 804842e:	75 3f                	jne    804846f <__do_global_dtors_aux+0x4f>
 8048430:	a1 28 a0 04 08       	mov    0x804a028,%eax
 8048435:	bb 20 9f 04 08       	mov    $0x8049f20,%ebx
 804843a:	81 eb 1c 9f 04 08    	sub    $0x8049f1c,%ebx
 8048440:	c1 fb 02             	sar    $0x2,%ebx
 8048443:	83 eb 01             	sub    $0x1,%ebx
 8048446:	39 d8                	cmp    %ebx,%eax
 8048448:	73 1e                	jae    8048468 <__do_global_dtors_aux+0x48>
 804844a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048450:	83 c0 01             	add    $0x1,%eax
 8048453:	a3 28 a0 04 08       	mov    %eax,0x804a028
 8048458:	ff 14 85 1c 9f 04 08 	call   *0x8049f1c(,%eax,4)
 804845f:	a1 28 a0 04 08       	mov    0x804a028,%eax
 8048464:	39 d8                	cmp    %ebx,%eax
 8048466:	72 e8                	jb     8048450 <__do_global_dtors_aux+0x30>
 8048468:	c6 05 24 a0 04 08 01 	movb   $0x1,0x804a024
 804846f:	83 c4 04             	add    $0x4,%esp
 8048472:	5b                   	pop    %ebx
 8048473:	5d                   	pop    %ebp
 8048474:	c3                   	ret    
 8048475:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048480 <frame_dummy>:
 8048480:	55                   	push   %ebp
 8048481:	89 e5                	mov    %esp,%ebp
 8048483:	83 ec 18             	sub    $0x18,%esp
 8048486:	a1 24 9f 04 08       	mov    0x8049f24,%eax
 804848b:	85 c0                	test   %eax,%eax
 804848d:	74 12                	je     80484a1 <frame_dummy+0x21>
 804848f:	b8 00 00 00 00       	mov    $0x0,%eax
 8048494:	85 c0                	test   %eax,%eax
 8048496:	74 09                	je     80484a1 <frame_dummy+0x21>
 8048498:	c7 04 24 24 9f 04 08 	movl   $0x8049f24,(%esp)
 804849f:	ff d0                	call   *%eax
 80484a1:	c9                   	leave  
 80484a2:	c3                   	ret    
 80484a3:	90                   	nop

080484a4 <not_called>:
 80484a4:	55                   	push   %ebp
 80484a5:	89 e5                	mov    %esp,%ebp
 80484a7:	83 ec 18             	sub    $0x18,%esp
 80484aa:	c7 04 24 10 86 04 08 	movl   $0x8048610,(%esp)
 80484b1:	e8 ea fe ff ff       	call   80483a0 <system@plt>
 80484b6:	c9                   	leave  
 80484b7:	c3                   	ret    

080484b8 <vulnerable_function>:
 80484b8:	55                   	push   %ebp
 80484b9:	89 e5                	mov    %esp,%ebp
 80484bb:	81 ec 98 00 00 00    	sub    $0x98,%esp
 80484c1:	c7 44 24 08 00 01 00 	movl   $0x100,0x8(%esp)
 80484c8:	00 
 80484c9:	8d 85 78 ff ff ff    	lea    -0x88(%ebp),%eax
 80484cf:	89 44 24 04          	mov    %eax,0x4(%esp)
 80484d3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 80484da:	e8 a1 fe ff ff       	call   8048380 <read@plt>
 80484df:	c9                   	leave  
 80484e0:	c3                   	ret    

080484e1 <be_nice_to_people>:
 80484e1:	55                   	push   %ebp
 80484e2:	89 e5                	mov    %esp,%ebp
 80484e4:	83 ec 28             	sub    $0x28,%esp
 80484e7:	e8 a4 fe ff ff       	call   8048390 <getegid@plt>
 80484ec:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80484ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80484f2:	89 44 24 08          	mov    %eax,0x8(%esp)
 80484f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80484f9:	89 44 24 04          	mov    %eax,0x4(%esp)
 80484fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048500:	89 04 24             	mov    %eax,(%esp)
 8048503:	e8 d8 fe ff ff       	call   80483e0 <setresgid@plt>
 8048508:	c9                   	leave  
 8048509:	c3                   	ret    

0804850a <main>:
 804850a:	55                   	push   %ebp
 804850b:	89 e5                	mov    %esp,%ebp
 804850d:	83 e4 f0             	and    $0xfffffff0,%esp
 8048510:	83 ec 10             	sub    $0x10,%esp
 8048513:	e8 c9 ff ff ff       	call   80484e1 <be_nice_to_people>
 8048518:	e8 9b ff ff ff       	call   80484b8 <vulnerable_function>
 804851d:	c7 44 24 08 0d 00 00 	movl   $0xd,0x8(%esp)
 8048524:	00 
 8048525:	c7 44 24 04 1a 86 04 	movl   $0x804861a,0x4(%esp)
 804852c:	08 
 804852d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8048534:	e8 97 fe ff ff       	call   80483d0 <write@plt>
 8048539:	c9                   	leave  
 804853a:	c3                   	ret    
 804853b:	90                   	nop
 804853c:	90                   	nop
 804853d:	90                   	nop
 804853e:	90                   	nop
 804853f:	90                   	nop

08048540 <__libc_csu_init>:
 8048540:	55                   	push   %ebp
 8048541:	57                   	push   %edi
 8048542:	56                   	push   %esi
 8048543:	53                   	push   %ebx
 8048544:	e8 69 00 00 00       	call   80485b2 <__i686.get_pc_thunk.bx>
 8048549:	81 c3 ab 1a 00 00    	add    $0x1aab,%ebx
 804854f:	83 ec 1c             	sub    $0x1c,%esp
 8048552:	8b 6c 24 30          	mov    0x30(%esp),%ebp
 8048556:	8d bb 20 ff ff ff    	lea    -0xe0(%ebx),%edi
 804855c:	e8 d7 fd ff ff       	call   8048338 <_init>
 8048561:	8d 83 20 ff ff ff    	lea    -0xe0(%ebx),%eax
 8048567:	29 c7                	sub    %eax,%edi
 8048569:	c1 ff 02             	sar    $0x2,%edi
 804856c:	85 ff                	test   %edi,%edi
 804856e:	74 29                	je     8048599 <__libc_csu_init+0x59>
 8048570:	31 f6                	xor    %esi,%esi
 8048572:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048578:	8b 44 24 38          	mov    0x38(%esp),%eax
 804857c:	89 2c 24             	mov    %ebp,(%esp)
 804857f:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048583:	8b 44 24 34          	mov    0x34(%esp),%eax
 8048587:	89 44 24 04          	mov    %eax,0x4(%esp)
 804858b:	ff 94 b3 20 ff ff ff 	call   *-0xe0(%ebx,%esi,4)
 8048592:	83 c6 01             	add    $0x1,%esi
 8048595:	39 fe                	cmp    %edi,%esi
 8048597:	75 df                	jne    8048578 <__libc_csu_init+0x38>
 8048599:	83 c4 1c             	add    $0x1c,%esp
 804859c:	5b                   	pop    %ebx
 804859d:	5e                   	pop    %esi
 804859e:	5f                   	pop    %edi
 804859f:	5d                   	pop    %ebp
 80485a0:	c3                   	ret    
 80485a1:	eb 0d                	jmp    80485b0 <__libc_csu_fini>
 80485a3:	90                   	nop
 80485a4:	90                   	nop
 80485a5:	90                   	nop
 80485a6:	90                   	nop
 80485a7:	90                   	nop
 80485a8:	90                   	nop
 80485a9:	90                   	nop
 80485aa:	90                   	nop
 80485ab:	90                   	nop
 80485ac:	90                   	nop
 80485ad:	90                   	nop
 80485ae:	90                   	nop
 80485af:	90                   	nop

080485b0 <__libc_csu_fini>:
 80485b0:	f3 c3                	repz ret 

080485b2 <__i686.get_pc_thunk.bx>:
 80485b2:	8b 1c 24             	mov    (%esp),%ebx
 80485b5:	c3                   	ret    
 80485b6:	90                   	nop
 80485b7:	90                   	nop
 80485b8:	90                   	nop
 80485b9:	90                   	nop
 80485ba:	90                   	nop
 80485bb:	90                   	nop
 80485bc:	90                   	nop
 80485bd:	90                   	nop
 80485be:	90                   	nop
 80485bf:	90                   	nop

080485c0 <__do_global_ctors_aux>:
 80485c0:	55                   	push   %ebp
 80485c1:	89 e5                	mov    %esp,%ebp
 80485c3:	53                   	push   %ebx
 80485c4:	83 ec 04             	sub    $0x4,%esp
 80485c7:	a1 14 9f 04 08       	mov    0x8049f14,%eax
 80485cc:	83 f8 ff             	cmp    $0xffffffff,%eax
 80485cf:	74 13                	je     80485e4 <__do_global_ctors_aux+0x24>
 80485d1:	bb 14 9f 04 08       	mov    $0x8049f14,%ebx
 80485d6:	66 90                	xchg   %ax,%ax
 80485d8:	83 eb 04             	sub    $0x4,%ebx
 80485db:	ff d0                	call   *%eax
 80485dd:	8b 03                	mov    (%ebx),%eax
 80485df:	83 f8 ff             	cmp    $0xffffffff,%eax
 80485e2:	75 f4                	jne    80485d8 <__do_global_ctors_aux+0x18>
 80485e4:	83 c4 04             	add    $0x4,%esp
 80485e7:	5b                   	pop    %ebx
 80485e8:	5d                   	pop    %ebp
 80485e9:	c3                   	ret    
 80485ea:	90                   	nop
 80485eb:	90                   	nop

Disassembly of section .fini:

080485ec <_fini>:
 80485ec:	53                   	push   %ebx
 80485ed:	83 ec 08             	sub    $0x8,%esp
 80485f0:	e8 00 00 00 00       	call   80485f5 <_fini+0x9>
 80485f5:	5b                   	pop    %ebx
 80485f6:	81 c3 ff 19 00 00    	add    $0x19ff,%ebx
 80485fc:	e8 1f fe ff ff       	call   8048420 <__do_global_dtors_aux>
 8048601:	83 c4 08             	add    $0x8,%esp
 8048604:	5b                   	pop    %ebx
 8048605:	c3                   	ret    
