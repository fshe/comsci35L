	.file	"thttpd.c"
	.bss
	.align 32
	.type	argv0, @object
	.size	argv0, 4
argv0:
	.zero	64
	.align 32
	.type	debug, @object
	.size	debug, 4
debug:
	.zero	64
	.align 32
	.type	port, @object
	.size	port, 2
port:
	.zero	64
	.align 32
	.type	dir, @object
	.size	dir, 4
dir:
	.zero	64
	.align 32
	.type	data_dir, @object
	.size	data_dir, 4
data_dir:
	.zero	64
	.align 32
	.type	do_chroot, @object
	.size	do_chroot, 4
do_chroot:
	.zero	64
	.align 32
	.type	no_log, @object
	.size	no_log, 4
no_log:
	.zero	64
	.align 32
	.type	no_symlink_check, @object
	.size	no_symlink_check, 4
no_symlink_check:
	.zero	64
	.align 32
	.type	do_vhost, @object
	.size	do_vhost, 4
do_vhost:
	.zero	64
	.align 32
	.type	do_global_passwd, @object
	.size	do_global_passwd, 4
do_global_passwd:
	.zero	64
	.align 32
	.type	cgi_pattern, @object
	.size	cgi_pattern, 4
cgi_pattern:
	.zero	64
	.align 32
	.type	cgi_limit, @object
	.size	cgi_limit, 4
cgi_limit:
	.zero	64
	.align 32
	.type	url_pattern, @object
	.size	url_pattern, 4
url_pattern:
	.zero	64
	.align 32
	.type	no_empty_referers, @object
	.size	no_empty_referers, 4
no_empty_referers:
	.zero	64
	.align 32
	.type	local_pattern, @object
	.size	local_pattern, 4
local_pattern:
	.zero	64
	.align 32
	.type	logfile, @object
	.size	logfile, 4
logfile:
	.zero	64
	.align 32
	.type	throttlefile, @object
	.size	throttlefile, 4
throttlefile:
	.zero	64
	.align 32
	.type	hostname, @object
	.size	hostname, 4
hostname:
	.zero	64
	.align 32
	.type	pidfile, @object
	.size	pidfile, 4
pidfile:
	.zero	64
	.align 32
	.type	user, @object
	.size	user, 4
user:
	.zero	64
	.align 32
	.type	charset, @object
	.size	charset, 4
charset:
	.zero	64
	.align 32
	.type	p3p, @object
	.size	p3p, 4
p3p:
	.zero	64
	.align 32
	.type	max_age, @object
	.size	max_age, 4
max_age:
	.zero	64
	.align 32
	.type	throttles, @object
	.size	throttles, 4
throttles:
	.zero	64
	.align 32
	.type	numthrottles, @object
	.size	numthrottles, 4
numthrottles:
	.zero	64
	.align 32
	.type	maxthrottles, @object
	.size	maxthrottles, 4
maxthrottles:
	.zero	64
	.align 32
	.type	connects, @object
	.size	connects, 4
connects:
	.zero	64
	.align 32
	.type	num_connects, @object
	.size	num_connects, 4
num_connects:
	.zero	64
	.align 32
	.type	max_connects, @object
	.size	max_connects, 4
max_connects:
	.zero	64
	.align 32
	.type	first_free_connect, @object
	.size	first_free_connect, 4
first_free_connect:
	.zero	64
	.align 32
	.type	httpd_conn_count, @object
	.size	httpd_conn_count, 4
httpd_conn_count:
	.zero	64
	.align 32
	.type	hs, @object
	.size	hs, 4
hs:
	.zero	64
	.globl	terminate
	.align 32
	.type	terminate, @object
	.size	terminate, 4
terminate:
	.zero	64
	.comm	start_time,4,4
	.comm	stats_time,4,4
	.comm	stats_connections,4,4
	.comm	stats_bytes,4,4
	.comm	stats_simultaneous,4,4
	.align 32
	.type	got_hup, @object
	.size	got_hup, 4
got_hup:
	.zero	64
	.align 32
	.type	got_usr1, @object
	.size	got_usr1, 4
got_usr1:
	.zero	64
	.align 32
	.type	watchdog_flag, @object
	.size	watchdog_flag, 4
watchdog_flag:
	.zero	64
	.section	.rodata
	.align 32
.LC0:
	.string	"exiting due to signal %d"
	.zero	39
	.text
	.type	handle_term, @function
handle_term:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	call	shut_down
	movl	8(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	$5, (%esp)
	call	syslog
	call	closelog
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
	.cfi_endproc
.LFE0:
	.size	handle_term, .-handle_term
	.section	.rodata
.LC1:
	.string	"handle_chld 1 32 4 6 status "
	.align 32
.LC2:
	.string	"child wait - %m"
	.zero	48
	.text
	.type	handle_chld, @function
handle_chld:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$140, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	leal	-120(%ebp), %eax
	movl	$1102416563, (%eax)
	movl	$.LC1, 4(%eax)
	shrl	$3, %eax
	addl	$536870912, %eax
	movl	%eax, -140(%ebp)
	movl	$-235802127, (%eax)
	movl	$-185273340, 4(%eax)
	movl	$-202116109, 8(%eax)
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L3
	movl	%eax, (%esp)
	call	__asan_report_load4
.L3:
	movl	(%edx), %eax
	movl	%eax, -128(%ebp)
.L17:
	movl	$1, 8(%esp)
	leal	-88(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$-1, (%esp)
	call	waitpid
	movl	%eax, -124(%ebp)
	cmpl	$0, -124(%ebp)
	jne	.L4
	jmp	.L5
.L4:
	cmpl	$0, -124(%ebp)
	jns	.L6
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L7
	movl	%eax, (%esp)
	call	__asan_report_load4
.L7:
	movl	(%edx), %eax
	cmpl	$4, %eax
	je	.L8
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L9
	movl	%eax, (%esp)
	call	__asan_report_load4
.L9:
	movl	(%edx), %eax
	cmpl	$11, %eax
	jne	.L10
.L8:
	jmp	.L11
.L10:
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L12
	movl	%eax, (%esp)
	call	__asan_report_load4
.L12:
	movl	(%edx), %eax
	cmpl	$10, %eax
	je	.L13
	movl	$.LC2, 4(%esp)
	movl	$3, (%esp)
	call	syslog
	jmp	.L5
.L13:
	jmp	.L5
.L6:
	movl	hs, %eax
	testl	%eax, %eax
	je	.L11
	movl	hs, %eax
	leal	20(%eax), %edx
	movl	%edx, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%edx, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L14
	movl	%edx, (%esp)
	call	__asan_report_load4
.L14:
	movl	20(%eax), %edx
	subl	$1, %edx
	movl	%edx, 20(%eax)
	movl	hs, %edx
	leal	20(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L15
	movl	%eax, (%esp)
	call	__asan_report_load4
.L15:
	movl	20(%edx), %eax
	testl	%eax, %eax
	jns	.L11
	movl	hs, %edx
	leal	20(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L16
	movl	%eax, (%esp)
	call	__asan_report_store4
.L16:
	movl	$0, 20(%edx)
	jmp	.L17
.L11:
	jmp	.L17
.L5:
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L18
	movl	%eax, (%esp)
	call	__asan_report_store4
.L18:
	movl	-128(%ebp), %eax
	movl	%eax, (%edx)
	movl	-140(%ebp), %eax
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	movl	$0, 8(%eax)
	addl	$140, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	handle_chld, .-handle_chld
	.type	handle_hup, @function
handle_hup:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$32, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L20
	movl	%eax, (%esp)
	call	__asan_report_load4
.L20:
	movl	(%edx), %eax
	movl	%eax, -12(%ebp)
	movl	$1, got_hup
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L21
	movl	%eax, (%esp)
	call	__asan_report_store4
.L21:
	movl	-12(%ebp), %eax
	movl	%eax, (%edx)
	addl	$32, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	handle_hup, .-handle_hup
	.section	.rodata
	.align 32
.LC3:
	.string	"exiting"
	.zero	56
	.text
	.type	handle_usr1, @function
handle_usr1:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	num_connects, %eax
	testl	%eax, %eax
	jne	.L23
	call	shut_down
	movl	$.LC3, 4(%esp)
	movl	$5, (%esp)
	call	syslog
	call	closelog
	call	__asan_handle_no_return
	movl	$0, (%esp)
	call	exit
.L23:
	movl	$1, got_usr1
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	handle_usr1, .-handle_usr1
	.type	handle_usr2, @function
handle_usr2:
.LFB4:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$32, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L25
	movl	%eax, (%esp)
	call	__asan_report_load4
.L25:
	movl	(%edx), %eax
	movl	%eax, -12(%ebp)
	movl	$0, (%esp)
	call	logstats
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L26
	movl	%eax, (%esp)
	call	__asan_report_store4
.L26:
	movl	-12(%ebp), %eax
	movl	%eax, (%edx)
	addl	$32, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	handle_usr2, .-handle_usr2
	.section	.rodata
	.align 32
.LC4:
	.string	"/tmp"
	.zero	59
	.text
	.type	handle_alrm, @function
handle_alrm:
.LFB5:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$32, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L28
	movl	%eax, (%esp)
	call	__asan_report_load4
.L28:
	movl	(%edx), %eax
	movl	%eax, -12(%ebp)
	movl	watchdog_flag, %eax
	testl	%eax, %eax
	jne	.L29
	movl	$.LC4, (%esp)
	call	chdir
	call	__asan_handle_no_return
	call	abort
.L29:
	movl	$0, watchdog_flag
	movl	$360, (%esp)
	call	alarm
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L30
	movl	%eax, (%esp)
	call	__asan_report_store4
.L30:
	movl	-12(%ebp), %eax
	movl	%eax, (%edx)
	addl	$32, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	handle_alrm, .-handle_alrm
	.section	.rodata
	.align 32
.LC5:
	.string	"-"
	.zero	62
	.align 32
.LC6:
	.string	"re-opening logfile"
	.zero	45
	.align 32
.LC7:
	.string	"a"
	.zero	62
	.align 32
.LC8:
	.string	"re-opening %.80s - %m"
	.zero	42
	.text
	.type	re_open_logfile, @function
re_open_logfile:
.LFB6:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	no_log, %eax
	testl	%eax, %eax
	jne	.L32
	movl	hs, %eax
	testl	%eax, %eax
	jne	.L33
.L32:
	jmp	.L31
.L33:
	movl	logfile, %eax
	testl	%eax, %eax
	je	.L31
	movl	logfile, %eax
	movl	$.LC5, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	je	.L31
	movl	$.LC6, 4(%esp)
	movl	$5, (%esp)
	call	syslog
	movl	logfile, %eax
	movl	$.LC7, 4(%esp)
	movl	%eax, (%esp)
	call	fopen
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	.L35
	movl	logfile, %eax
	movl	%eax, 8(%esp)
	movl	$.LC8, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	jmp	.L31
.L35:
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	fileno
	movl	$1, 8(%esp)
	movl	$2, 4(%esp)
	movl	%eax, (%esp)
	call	fcntl
	movl	hs, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	httpd_set_logfp
.L31:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	re_open_logfile, .-re_open_logfile
	.section	.rodata
	.align 4
.LC9:
	.string	"main 6 32 4 5 gotv4 96 4 5 gotv6 160 8 2 tv 224 128 3 sa4 384 128 3 sa6 544 4097 3 cwd "
	.align 32
.LC10:
	.string	"can't find any valid address"
	.zero	35
	.align 32
.LC11:
	.string	"%s: can't find any valid address\n"
	.zero	62
	.align 32
.LC12:
	.string	"unknown user - '%.80s'"
	.zero	41
	.align 32
.LC13:
	.string	"%s: unknown user - '%s'\n"
	.zero	39
	.align 32
.LC14:
	.string	"/dev/null"
	.zero	54
	.align 32
.LC15:
	.string	"%.80s - %m"
	.zero	53
	.align 32
.LC16:
	.string	"logfile is not an absolute path, you may not be able to re-open it"
	.zero	61
	.align 32
.LC17:
	.string	"%s: logfile is not an absolute path, you may not be able to re-open it\n"
	.zero	56
	.align 32
.LC18:
	.string	"fchown logfile - %m"
	.zero	44
	.align 32
.LC19:
	.string	"fchown logfile"
	.zero	49
	.align 32
.LC20:
	.string	"chdir - %m"
	.zero	53
	.align 32
.LC21:
	.string	"chdir"
	.zero	58
	.align 32
.LC22:
	.string	"/"
	.zero	62
	.align 32
.LC23:
	.string	"daemon - %m"
	.zero	52
	.align 32
.LC24:
	.string	"w"
	.zero	62
	.align 32
.LC25:
	.string	"%d\n"
	.zero	60
	.align 32
.LC26:
	.string	"fdwatch initialization failure"
	.zero	33
	.align 32
.LC27:
	.string	"chroot - %m"
	.zero	52
	.align 32
.LC28:
	.string	"chroot"
	.zero	57
	.align 32
.LC29:
	.string	"logfile is not within the chroot tree, you will not be able to re-open it"
	.zero	54
	.align 32
.LC30:
	.string	"%s: logfile is not within the chroot tree, you will not be able to re-open it\n"
	.zero	49
	.align 32
.LC31:
	.string	"chroot chdir - %m"
	.zero	46
	.align 32
.LC32:
	.string	"chroot chdir"
	.zero	51
	.align 32
.LC33:
	.string	"data_dir chdir - %m"
	.zero	44
	.align 32
.LC34:
	.string	"data_dir chdir"
	.zero	49
	.align 32
.LC35:
	.string	"tmr_create(occasional) failed"
	.zero	34
	.align 32
.LC36:
	.string	"tmr_create(idle) failed"
	.zero	40
	.align 32
.LC37:
	.string	"tmr_create(update_throttles) failed"
	.zero	60
	.align 32
.LC38:
	.string	"tmr_create(show_stats) failed"
	.zero	34
	.align 32
.LC39:
	.string	"setgroups - %m"
	.zero	49
	.align 32
.LC40:
	.string	"setgid - %m"
	.zero	52
	.align 32
.LC41:
	.string	"initgroups - %m"
	.zero	48
	.align 32
.LC42:
	.string	"setuid - %m"
	.zero	52
	.align 32
.LC43:
	.string	"started as root without requesting chroot(), warning only"
	.zero	38
	.align 32
.LC44:
	.string	"out of memory allocating a connecttab"
	.zero	58
	.align 32
.LC45:
	.string	"fdwatch - %m"
	.zero	51
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	andl	$-16, %esp
	subl	$4880, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	12(%ebp), %eax
	movl	%eax, 124(%esp)
	leal	176(%esp), %eax
	movl	$1102416563, (%eax)
	movl	$.LC9, 4(%eax)
	shrl	$3, %eax
	addl	$536870912, %eax
	movl	$-235802127, (%eax)
	movl	$-185273340, 4(%eax)
	movl	$-218959118, 8(%eax)
	movl	$-185273340, 12(%eax)
	movl	$-218959118, 16(%eax)
	movl	$-185273344, 20(%eax)
	movl	$-218959118, 24(%eax)
	movl	$-218959118, 44(%eax)
	movl	$-218959118, 64(%eax)
	movl	$-185273343, 580(%eax)
	movl	%gs:20, %eax
	movl	%eax, 4876(%esp)
	xorl	%eax, %eax
	movl	$32767, 140(%esp)
	movl	$32767, 144(%esp)
	movl	124(%esp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L43
	movl	%eax, (%esp)
	call	__asan_report_load4
.L43:
	movl	124(%esp), %eax
	movl	(%eax), %eax
	movl	%eax, argv0
	movl	argv0, %eax
	movl	$47, 4(%esp)
	movl	%eax, (%esp)
	call	strrchr
	movl	%eax, 136(%esp)
	cmpl	$0, 136(%esp)
	je	.L44
	addl	$1, 136(%esp)
	jmp	.L45
.L44:
	movl	argv0, %eax
	movl	%eax, 136(%esp)
.L45:
	movl	$24, 8(%esp)
	movl	$9, 4(%esp)
	movl	136(%esp), %eax
	movl	%eax, (%esp)
	call	openlog
	movl	124(%esp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	parse_args
	call	tzset
	leal	272(%esp), %eax
	movl	%eax, 20(%esp)
	movl	$128, 16(%esp)
	leal	560(%esp), %eax
	movl	%eax, 12(%esp)
	leal	208(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$128, 4(%esp)
	leal	400(%esp), %eax
	movl	%eax, (%esp)
	call	lookup_hostname
	movl	208(%esp), %eax
	testl	%eax, %eax
	jne	.L46
	movl	272(%esp), %eax
	testl	%eax, %eax
	jne	.L46
	movl	$.LC10, 4(%esp)
	movl	$3, (%esp)
	call	syslog
	movl	argv0, %edx
	movl	stderr, %eax
	movl	%edx, 8(%esp)
	movl	$.LC11, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L46:
	movl	$0, numthrottles
	movl	$0, maxthrottles
	movl	$0, throttles
	movl	throttlefile, %eax
	testl	%eax, %eax
	je	.L47
	movl	throttlefile, %eax
	movl	%eax, (%esp)
	call	read_throttlefile
.L47:
	call	getuid
	testl	%eax, %eax
	jne	.L48
	movl	user, %eax
	movl	%eax, (%esp)
	call	getpwnam
	movl	%eax, 156(%esp)
	cmpl	$0, 156(%esp)
	jne	.L49
	movl	user, %eax
	movl	%eax, 8(%esp)
	movl	$.LC12, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	user, %ecx
	movl	argv0, %edx
	movl	stderr, %eax
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	$.LC13, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L49:
	movl	156(%esp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L50
	movl	%eax, (%esp)
	call	__asan_report_load4
.L50:
	movl	156(%esp), %eax
	movl	8(%eax), %eax
	movl	%eax, 140(%esp)
	movl	156(%esp), %eax
	addl	$12, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L51
	movl	%eax, (%esp)
	call	__asan_report_load4
.L51:
	movl	156(%esp), %eax
	movl	12(%eax), %eax
	movl	%eax, 144(%esp)
.L48:
	movl	logfile, %eax
	testl	%eax, %eax
	je	.L52
	movl	logfile, %eax
	movl	$.LC14, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L53
	movl	$1, no_log
	movl	$0, 148(%esp)
	jmp	.L59
.L53:
	movl	logfile, %eax
	movl	$.LC5, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L55
	movl	stdout, %eax
	movl	%eax, 148(%esp)
	jmp	.L59
.L55:
	movl	logfile, %eax
	movl	$.LC7, 4(%esp)
	movl	%eax, (%esp)
	call	fopen
	movl	%eax, 148(%esp)
	cmpl	$0, 148(%esp)
	jne	.L56
	movl	logfile, %eax
	movl	%eax, 8(%esp)
	movl	$.LC15, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	logfile, %eax
	movl	%eax, (%esp)
	call	perror
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L56:
	movl	logfile, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L57
	movl	%eax, (%esp)
	call	__asan_report_load1
.L57:
	movzbl	(%edx), %eax
	cmpb	$47, %al
	je	.L58
	movl	$.LC16, 4(%esp)
	movl	$4, (%esp)
	call	syslog
	movl	argv0, %edx
	movl	stderr, %eax
	movl	%edx, 8(%esp)
	movl	$.LC17, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
.L58:
	movl	148(%esp), %eax
	movl	%eax, (%esp)
	call	fileno
	movl	$1, 8(%esp)
	movl	$2, 4(%esp)
	movl	%eax, (%esp)
	call	fcntl
	call	getuid
	testl	%eax, %eax
	jne	.L59
	movl	148(%esp), %eax
	movl	%eax, (%esp)
	call	fileno
	movl	144(%esp), %edx
	movl	%edx, 8(%esp)
	movl	140(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fchown
	testl	%eax, %eax
	jns	.L59
	movl	$.LC18, 4(%esp)
	movl	$4, (%esp)
	call	syslog
	movl	$.LC19, (%esp)
	call	perror
	jmp	.L59
.L52:
	movl	$0, 148(%esp)
.L59:
	movl	dir, %eax
	testl	%eax, %eax
	je	.L60
	movl	dir, %eax
	movl	%eax, (%esp)
	call	chdir
	testl	%eax, %eax
	jns	.L60
	movl	$.LC20, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$.LC21, (%esp)
	call	perror
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L60:
	movl	$4096, 4(%esp)
	leal	720(%esp), %eax
	movl	%eax, (%esp)
	call	getcwd
	leal	720(%esp), %ebx
	movl	%ebx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%ecx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L61
	movl	%eax, (%esp)
	call	__asan_report_load1
.L61:
	leal	720(%esp), %eax
	movl	%eax, (%esp)
	call	strlen
	movl	%eax, %edx
	leal	(%ebx,%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L62
	movl	%eax, (%esp)
	call	__asan_report_load1
.L62:
	leal	-1(%edx), %ecx
	leal	720(%esp), %eax
	addl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L63
	movl	%eax, (%esp)
	call	__asan_report_load1
.L63:
	movzbl	720(%esp,%ecx), %eax
	cmpb	$47, %al
	je	.L64
	leal	720(%esp), %ebx
	movl	%ebx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%ecx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L65
	movl	%eax, (%esp)
	call	__asan_report_load1
.L65:
	leal	720(%esp), %eax
	movl	$-1, %ecx
	movl	%eax, %edx
	movl	$0, %eax
	movl	%edx, %edi
	repnz; scasb
	movl	%ecx, %eax
	notl	%eax
	leal	-1(%eax), %ecx
	leal	(%ebx,%ecx), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L66
	movl	%eax, (%esp)
	call	__asan_report_load1
.L66:
	leal	720(%esp), %eax
	addl	%ecx, %eax
	movl	$.LC22, %edx
	movl	%edx, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%edx, %ebx
	andl	$7, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L67
	movl	%edx, (%esp)
	call	__asan_report_load1
.L67:
	movl	$.LC22, %edx
	addl	$1, %edx
	movl	%edx, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%edx, %ebx
	andl	$7, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L68
	movl	%edx, (%esp)
	call	__asan_report_load1
.L68:
	movl	%eax, %edx
	movl	%edx, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%edx, %ebx
	andl	$7, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L69
	movl	%edx, (%esp)
	call	__asan_report_store1
.L69:
	leal	1(%eax), %edx
	movl	%edx, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%edx, %ebx
	andl	$7, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L70
	movl	%edx, (%esp)
	call	__asan_report_store1
.L70:
	movw	$47, (%eax)
.L64:
	movl	debug, %eax
	testl	%eax, %eax
	jne	.L71
	movl	stdin, %eax
	movl	%eax, (%esp)
	call	fclose
	movl	stdout, %eax
	cmpl	%eax, 148(%esp)
	je	.L72
	movl	stdout, %eax
	movl	%eax, (%esp)
	call	fclose
.L72:
	movl	stderr, %eax
	movl	%eax, (%esp)
	call	fclose
	movl	$1, 4(%esp)
	movl	$1, (%esp)
	call	daemon
	testl	%eax, %eax
	jns	.L73
	movl	$.LC23, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L71:
	call	setsid
.L73:
	movl	pidfile, %eax
	testl	%eax, %eax
	je	.L74
	movl	pidfile, %eax
	movl	$.LC24, 4(%esp)
	movl	%eax, (%esp)
	call	fopen
	movl	%eax, 160(%esp)
	cmpl	$0, 160(%esp)
	jne	.L75
	movl	pidfile, %eax
	movl	%eax, 8(%esp)
	movl	$.LC15, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L75:
	call	getpid
	movl	%eax, 8(%esp)
	movl	$.LC25, 4(%esp)
	movl	160(%esp), %eax
	movl	%eax, (%esp)
	call	fprintf
	movl	160(%esp), %eax
	movl	%eax, (%esp)
	call	fclose
.L74:
	call	fdwatch_get_nfiles
	movl	%eax, max_connects
	movl	max_connects, %eax
	testl	%eax, %eax
	jns	.L76
	movl	$.LC26, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L76:
	movl	max_connects, %eax
	subl	$10, %eax
	movl	%eax, max_connects
	movl	do_chroot, %eax
	testl	%eax, %eax
	je	.L77
	leal	720(%esp), %eax
	movl	%eax, (%esp)
	call	chroot
	testl	%eax, %eax
	jns	.L78
	movl	$.LC27, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$.LC28, (%esp)
	call	perror
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L78:
	movl	logfile, %eax
	testl	%eax, %eax
	je	.L79
	movl	logfile, %eax
	movl	$.LC5, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	je	.L79
	leal	720(%esp), %ebx
	movl	%ebx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%ecx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L80
	movl	%eax, (%esp)
	call	__asan_report_load1
.L80:
	leal	720(%esp), %eax
	movl	%eax, (%esp)
	call	strlen
	movl	%eax, %edx
	leal	(%ebx,%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L81
	movl	%eax, (%esp)
	call	__asan_report_load1
.L81:
	movl	logfile, %eax
	movl	%edx, 8(%esp)
	leal	720(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	strncmp
	testl	%eax, %eax
	jne	.L82
	movl	logfile, %esi
	leal	720(%esp), %ebx
	movl	%ebx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%ecx, %edi
	movl	%eax, %ecx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L83
	movl	%eax, (%esp)
	call	__asan_report_load1
.L83:
	leal	720(%esp), %eax
	movl	%eax, (%esp)
	call	strlen
	movl	%eax, %edx
	leal	(%ebx,%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %ebx
	andl	$7, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L84
	movl	%eax, (%esp)
	call	__asan_report_load1
.L84:
	leal	-1(%edx), %eax
	leal	(%esi,%eax), %edx
	movl	logfile, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	strcpy
	jmp	.L79
.L82:
	movl	$.LC29, 4(%esp)
	movl	$4, (%esp)
	call	syslog
	movl	argv0, %edx
	movl	stderr, %eax
	movl	%edx, 8(%esp)
	movl	$.LC30, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
.L79:
	movl	$.LC22, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L85
	movl	%eax, (%esp)
	call	__asan_report_load1
.L85:
	movl	$.LC22, %eax
	addl	$1, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L86
	movl	%eax, (%esp)
	call	__asan_report_load1
.L86:
	leal	720(%esp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L87
	movl	%eax, (%esp)
	call	__asan_report_store1
.L87:
	leal	720(%esp), %eax
	addl	$1, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L88
	movl	%eax, (%esp)
	call	__asan_report_store1
.L88:
	leal	720(%esp), %eax
	movw	$47, (%eax)
	leal	720(%esp), %eax
	movl	%eax, (%esp)
	call	chdir
	testl	%eax, %eax
	jns	.L77
	movl	$.LC31, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$.LC32, (%esp)
	call	perror
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L77:
	movl	data_dir, %eax
	testl	%eax, %eax
	je	.L89
	movl	data_dir, %eax
	movl	%eax, (%esp)
	call	chdir
	testl	%eax, %eax
	jns	.L89
	movl	$.LC33, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	$.LC34, (%esp)
	call	perror
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L89:
	movl	$handle_term, 4(%esp)
	movl	$15, (%esp)
	call	sigset
	movl	$handle_term, 4(%esp)
	movl	$2, (%esp)
	call	sigset
	movl	$handle_chld, 4(%esp)
	movl	$17, (%esp)
	call	sigset
	movl	$1, 4(%esp)
	movl	$13, (%esp)
	call	sigset
	movl	$handle_hup, 4(%esp)
	movl	$1, (%esp)
	call	sigset
	movl	$handle_usr1, 4(%esp)
	movl	$10, (%esp)
	call	sigset
	movl	$handle_usr2, 4(%esp)
	movl	$12, (%esp)
	call	sigset
	movl	$handle_alrm, 4(%esp)
	movl	$14, (%esp)
	call	sigset
	movl	$0, got_hup
	movl	$0, got_usr1
	movl	$0, watchdog_flag
	movl	$360, (%esp)
	call	alarm
	call	tmr_init
	movl	no_empty_referers, %esi
	movl	local_pattern, %edi
	movl	url_pattern, %eax
	movl	%eax, 120(%esp)
	movl	do_global_passwd, %eax
	movl	%eax, 116(%esp)
	movl	do_vhost, %eax
	movl	%eax, 112(%esp)
	movl	no_symlink_check, %eax
	movl	%eax, 108(%esp)
	movl	no_log, %eax
	movl	%eax, 104(%esp)
	movl	max_age, %eax
	movl	%eax, 100(%esp)
	movl	p3p, %eax
	movl	%eax, 96(%esp)
	movl	charset, %eax
	movl	%eax, 92(%esp)
	movl	cgi_limit, %eax
	movl	%eax, 88(%esp)
	movl	cgi_pattern, %eax
	movl	%eax, 84(%esp)
	movzwl	port, %eax
	movzwl	%ax, %eax
	movl	%eax, 80(%esp)
	movl	272(%esp), %eax
	testl	%eax, %eax
	je	.L90
	leal	560(%esp), %ebx
	jmp	.L91
.L90:
	movl	$0, %ebx
.L91:
	movl	208(%esp), %eax
	testl	%eax, %eax
	je	.L92
	leal	400(%esp), %edx
	jmp	.L93
.L92:
	movl	$0, %edx
.L93:
	movl	hostname, %ecx
	movl	%esi, 68(%esp)
	movl	%edi, 64(%esp)
	movl	120(%esp), %eax
	movl	%eax, 60(%esp)
	movl	116(%esp), %eax
	movl	%eax, 56(%esp)
	movl	112(%esp), %eax
	movl	%eax, 52(%esp)
	movl	108(%esp), %eax
	movl	%eax, 48(%esp)
	movl	148(%esp), %eax
	movl	%eax, 44(%esp)
	movl	104(%esp), %eax
	movl	%eax, 40(%esp)
	leal	720(%esp), %eax
	movl	%eax, 36(%esp)
	movl	100(%esp), %eax
	movl	%eax, 32(%esp)
	movl	96(%esp), %eax
	movl	%eax, 28(%esp)
	movl	92(%esp), %eax
	movl	%eax, 24(%esp)
	movl	88(%esp), %eax
	movl	%eax, 20(%esp)
	movl	84(%esp), %eax
	movl	%eax, 16(%esp)
	movl	80(%esp), %eax
	movl	%eax, 12(%esp)
	movl	%ebx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, (%esp)
	call	httpd_initialize
	movl	%eax, hs
	movl	hs, %eax
	testl	%eax, %eax
	jne	.L94
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L94:
	movl	$1, 16(%esp)
	movl	$120000, 12(%esp)
	movl	JunkClientData, %eax
	movl	%eax, 8(%esp)
	movl	$occasional, 4(%esp)
	movl	$0, (%esp)
	call	tmr_create
	testl	%eax, %eax
	jne	.L95
	movl	$.LC35, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L95:
	movl	$1, 16(%esp)
	movl	$5000, 12(%esp)
	movl	JunkClientData, %eax
	movl	%eax, 8(%esp)
	movl	$idle, 4(%esp)
	movl	$0, (%esp)
	call	tmr_create
	testl	%eax, %eax
	jne	.L96
	movl	$.LC36, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L96:
	movl	numthrottles, %eax
	testl	%eax, %eax
	jle	.L97
	movl	$1, 16(%esp)
	movl	$2000, 12(%esp)
	movl	JunkClientData, %eax
	movl	%eax, 8(%esp)
	movl	$update_throttles, 4(%esp)
	movl	$0, (%esp)
	call	tmr_create
	testl	%eax, %eax
	jne	.L97
	movl	$.LC37, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L97:
	movl	$1, 16(%esp)
	movl	$3600000, 12(%esp)
	movl	JunkClientData, %eax
	movl	%eax, 8(%esp)
	movl	$show_stats, 4(%esp)
	movl	$0, (%esp)
	call	tmr_create
	testl	%eax, %eax
	jne	.L98
	movl	$.LC38, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L98:
	movl	$0, (%esp)
	call	time
	movl	%eax, stats_time
	movl	stats_time, %eax
	movl	%eax, start_time
	movl	$0, stats_connections
	movl	$0, stats_bytes
	movl	$0, stats_simultaneous
	call	getuid
	testl	%eax, %eax
	jne	.L99
	movl	$0, 4(%esp)
	movl	$0, (%esp)
	call	setgroups
	testl	%eax, %eax
	jns	.L100
	movl	$.LC39, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L100:
	movl	144(%esp), %eax
	movl	%eax, (%esp)
	call	setgid
	testl	%eax, %eax
	jns	.L101
	movl	$.LC40, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L101:
	movl	user, %eax
	movl	144(%esp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	initgroups
	testl	%eax, %eax
	jns	.L102
	movl	$.LC41, 4(%esp)
	movl	$4, (%esp)
	call	syslog
.L102:
	movl	140(%esp), %eax
	movl	%eax, (%esp)
	call	setuid
	testl	%eax, %eax
	jns	.L103
	movl	$.LC42, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L103:
	movl	do_chroot, %eax
	testl	%eax, %eax
	jne	.L99
	movl	$.LC43, 4(%esp)
	movl	$4, (%esp)
	call	syslog
.L99:
	movl	max_connects, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	movl	%eax, (%esp)
	call	malloc
	movl	%eax, connects
	movl	connects, %eax
	testl	%eax, %eax
	jne	.L104
	movl	$.LC44, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L104:
	movl	$0, 152(%esp)
	jmp	.L105
.L109:
	movl	connects, %ecx
	movl	152(%esp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	addl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L106
	movl	%eax, (%esp)
	call	__asan_report_store4
.L106:
	movl	$0, (%ecx)
	movl	connects, %ecx
	movl	152(%esp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %edx
	movl	152(%esp), %eax
	addl	$1, %eax
	movl	%eax, 120(%esp)
	leal	4(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L107
	movl	%eax, (%esp)
	call	__asan_report_store4
.L107:
	movl	120(%esp), %eax
	movl	%eax, 4(%edx)
	movl	connects, %ecx
	movl	152(%esp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %edx
	leal	8(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L108
	movl	%eax, (%esp)
	call	__asan_report_store4
.L108:
	movl	$0, 8(%edx)
	addl	$1, 152(%esp)
.L105:
	movl	max_connects, %eax
	cmpl	%eax, 152(%esp)
	jl	.L109
	movl	connects, %ecx
	movl	max_connects, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	subl	$96, %eax
	leal	(%ecx,%eax), %edx
	leal	4(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L110
	movl	%eax, (%esp)
	call	__asan_report_store4
.L110:
	movl	$-1, 4(%edx)
	movl	$0, first_free_connect
	movl	$0, num_connects
	movl	$0, httpd_conn_count
	movl	hs, %eax
	testl	%eax, %eax
	je	.L111
	movl	hs, %edx
	leal	40(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L112
	movl	%eax, (%esp)
	call	__asan_report_load4
.L112:
	movl	40(%edx), %eax
	cmpl	$-1, %eax
	je	.L113
	movl	hs, %edx
	leal	40(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L114
	movl	%eax, (%esp)
	call	__asan_report_load4
.L114:
	movl	40(%edx), %eax
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	fdwatch_add_fd
.L113:
	movl	hs, %edx
	leal	44(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L115
	movl	%eax, (%esp)
	call	__asan_report_load4
.L115:
	movl	44(%edx), %eax
	cmpl	$-1, %eax
	je	.L111
	movl	hs, %edx
	leal	44(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L116
	movl	%eax, (%esp)
	call	__asan_report_load4
.L116:
	movl	44(%edx), %eax
	movl	$0, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	fdwatch_add_fd
.L111:
	leal	336(%esp), %eax
	movl	%eax, (%esp)
	call	tmr_prepare_timeval
	jmp	.L117
.L149:
	movl	got_hup, %eax
	testl	%eax, %eax
	je	.L118
	call	re_open_logfile
	movl	$0, got_hup
.L118:
	leal	336(%esp), %eax
	movl	%eax, (%esp)
	call	tmr_mstimeout
	movl	%eax, (%esp)
	call	fdwatch
	movl	%eax, 164(%esp)
	cmpl	$0, 164(%esp)
	jns	.L119
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L120
	movl	%eax, (%esp)
	call	__asan_report_load4
.L120:
	movl	(%edx), %eax
	cmpl	$4, %eax
	je	.L121
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L122
	movl	%eax, (%esp)
	call	__asan_report_load4
.L122:
	movl	(%edx), %eax
	cmpl	$11, %eax
	jne	.L123
.L121:
	jmp	.L117
.L123:
	movl	$.LC45, 4(%esp)
	movl	$3, (%esp)
	call	syslog
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L119:
	leal	336(%esp), %eax
	movl	%eax, (%esp)
	call	tmr_prepare_timeval
	cmpl	$0, 164(%esp)
	jne	.L124
	leal	336(%esp), %eax
	movl	%eax, (%esp)
	call	tmr_run
	jmp	.L117
.L124:
	movl	hs, %eax
	testl	%eax, %eax
	je	.L125
	movl	hs, %edx
	leal	44(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L126
	movl	%eax, (%esp)
	call	__asan_report_load4
.L126:
	movl	44(%edx), %eax
	cmpl	$-1, %eax
	je	.L125
	movl	hs, %edx
	leal	44(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L127
	movl	%eax, (%esp)
	call	__asan_report_load4
.L127:
	movl	44(%edx), %eax
	movl	%eax, (%esp)
	call	fdwatch_check_fd
	testl	%eax, %eax
	je	.L125
	movl	hs, %edx
	leal	44(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L128
	movl	%eax, (%esp)
	call	__asan_report_load4
.L128:
	movl	44(%edx), %eax
	movl	%eax, 4(%esp)
	leal	336(%esp), %eax
	movl	%eax, (%esp)
	call	handle_newconnect
	testl	%eax, %eax
	je	.L125
	jmp	.L117
.L125:
	movl	hs, %eax
	testl	%eax, %eax
	je	.L129
	movl	hs, %edx
	leal	40(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L130
	movl	%eax, (%esp)
	call	__asan_report_load4
.L130:
	movl	40(%edx), %eax
	cmpl	$-1, %eax
	je	.L129
	movl	hs, %edx
	leal	40(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L131
	movl	%eax, (%esp)
	call	__asan_report_load4
.L131:
	movl	40(%edx), %eax
	movl	%eax, (%esp)
	call	fdwatch_check_fd
	testl	%eax, %eax
	je	.L129
	movl	hs, %edx
	leal	40(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L132
	movl	%eax, (%esp)
	call	__asan_report_load4
.L132:
	movl	40(%edx), %eax
	movl	%eax, 4(%esp)
	leal	336(%esp), %eax
	movl	%eax, (%esp)
	call	handle_newconnect
	testl	%eax, %eax
	je	.L129
	jmp	.L117
.L129:
	jmp	.L133
.L142:
	cmpl	$0, 168(%esp)
	jne	.L134
	jmp	.L133
.L134:
	movl	168(%esp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L135
	movl	%eax, (%esp)
	call	__asan_report_load4
.L135:
	movl	168(%esp), %eax
	movl	8(%eax), %eax
	movl	%eax, 172(%esp)
	movl	172(%esp), %eax
	addl	$448, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L136
	movl	%eax, (%esp)
	call	__asan_report_load4
.L136:
	movl	172(%esp), %eax
	movl	448(%eax), %eax
	movl	%eax, (%esp)
	call	fdwatch_check_fd
	testl	%eax, %eax
	jne	.L137
	leal	336(%esp), %eax
	movl	%eax, 4(%esp)
	movl	168(%esp), %eax
	movl	%eax, (%esp)
	call	clear_connection
	jmp	.L133
.L137:
	movl	168(%esp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L138
	movl	%eax, (%esp)
	call	__asan_report_load4
.L138:
	movl	168(%esp), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	je	.L139
	cmpl	$4, %eax
	je	.L140
	cmpl	$1, %eax
	jne	.L133
	leal	336(%esp), %eax
	movl	%eax, 4(%esp)
	movl	168(%esp), %eax
	movl	%eax, (%esp)
	call	handle_read
	jmp	.L133
.L139:
	leal	336(%esp), %eax
	movl	%eax, 4(%esp)
	movl	168(%esp), %eax
	movl	%eax, (%esp)
	call	handle_send
	jmp	.L133
.L140:
	leal	336(%esp), %eax
	movl	%eax, 4(%esp)
	movl	168(%esp), %eax
	movl	%eax, (%esp)
	call	handle_linger
	nop
.L133:
	call	fdwatch_get_next_client_data
	movl	%eax, 168(%esp)
	cmpl	$-1, 168(%esp)
	jne	.L142
	leal	336(%esp), %eax
	movl	%eax, (%esp)
	call	tmr_run
	movl	got_usr1, %eax
	testl	%eax, %eax
	je	.L117
	movl	terminate, %eax
	testl	%eax, %eax
	jne	.L117
	movl	$1, terminate
	movl	hs, %eax
	testl	%eax, %eax
	je	.L117
	movl	hs, %edx
	leal	40(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L143
	movl	%eax, (%esp)
	call	__asan_report_load4
.L143:
	movl	40(%edx), %eax
	cmpl	$-1, %eax
	je	.L144
	movl	hs, %edx
	leal	40(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L145
	movl	%eax, (%esp)
	call	__asan_report_load4
.L145:
	movl	40(%edx), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
.L144:
	movl	hs, %edx
	leal	44(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L146
	movl	%eax, (%esp)
	call	__asan_report_load4
.L146:
	movl	44(%edx), %eax
	cmpl	$-1, %eax
	je	.L147
	movl	hs, %edx
	leal	44(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L148
	movl	%eax, (%esp)
	call	__asan_report_load4
.L148:
	movl	44(%edx), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
.L147:
	movl	hs, %eax
	movl	%eax, (%esp)
	call	httpd_unlisten
.L117:
	movl	terminate, %eax
	testl	%eax, %eax
	je	.L149
	movl	num_connects, %eax
	testl	%eax, %eax
	jg	.L149
	call	shut_down
	movl	$.LC3, 4(%esp)
	movl	$5, (%esp)
	call	syslog
	call	closelog
	call	__asan_handle_no_return
	movl	$0, (%esp)
	call	exit
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.section	.rodata
	.align 32
.LC46:
	.string	"nobody"
	.zero	57
	.align 32
.LC47:
	.string	"iso-8859-1"
	.zero	53
	.align 32
.LC48:
	.string	""
	.zero	63
	.align 32
.LC49:
	.string	"-V"
	.zero	61
	.align 32
.LC50:
	.string	"thttpd/2.26.2 April 4, 2012"
	.zero	36
	.align 32
.LC51:
	.string	"-C"
	.zero	61
	.align 32
.LC52:
	.string	"-p"
	.zero	61
	.align 32
.LC53:
	.string	"-d"
	.zero	61
	.align 32
.LC54:
	.string	"-r"
	.zero	61
	.align 32
.LC55:
	.string	"-nor"
	.zero	59
	.align 32
.LC56:
	.string	"-dd"
	.zero	60
	.align 32
.LC57:
	.string	"-s"
	.zero	61
	.align 32
.LC58:
	.string	"-nos"
	.zero	59
	.align 32
.LC59:
	.string	"-u"
	.zero	61
	.align 32
.LC60:
	.string	"-c"
	.zero	61
	.align 32
.LC61:
	.string	"-t"
	.zero	61
	.align 32
.LC62:
	.string	"-h"
	.zero	61
	.align 32
.LC63:
	.string	"-l"
	.zero	61
	.align 32
.LC64:
	.string	"-v"
	.zero	61
	.align 32
.LC65:
	.string	"-nov"
	.zero	59
	.align 32
.LC66:
	.string	"-g"
	.zero	61
	.align 32
.LC67:
	.string	"-nog"
	.zero	59
	.align 32
.LC68:
	.string	"-i"
	.zero	61
	.align 32
.LC69:
	.string	"-T"
	.zero	61
	.align 32
.LC70:
	.string	"-P"
	.zero	61
	.align 32
.LC71:
	.string	"-M"
	.zero	61
	.align 32
.LC72:
	.string	"-D"
	.zero	61
	.text
	.type	parse_args, @function
parse_args:
.LFB8:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$32, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	movl	$0, debug
	movw	$80, port
	movl	$0, dir
	movl	$0, data_dir
	movl	$0, do_chroot
	movl	$0, no_log
	movl	do_chroot, %eax
	movl	%eax, no_symlink_check
	movl	$0, do_vhost
	movl	$0, do_global_passwd
	movl	$0, cgi_pattern
	movl	$0, cgi_limit
	movl	$0, url_pattern
	movl	$0, no_empty_referers
	movl	$0, local_pattern
	movl	$0, throttlefile
	movl	$0, hostname
	movl	$0, logfile
	movl	$0, pidfile
	movl	$.LC46, user
	movl	$.LC47, charset
	movl	$.LC48, p3p
	movl	$-1, max_age
	movl	$1, -12(%ebp)
	jmp	.L152
.L216:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L153
	movl	%eax, (%esp)
	call	__asan_report_load4
.L153:
	movl	(%ecx), %eax
	movl	$.LC49, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L154
	movl	$.LC50, (%esp)
	call	puts
	call	__asan_handle_no_return
	movl	$0, (%esp)
	call	exit
.L154:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L155
	movl	%eax, (%esp)
	call	__asan_report_load4
.L155:
	movl	(%ecx), %eax
	movl	$.LC51, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L156
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L156
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L157
	movl	%eax, (%esp)
	call	__asan_report_load4
.L157:
	movl	(%ecx), %eax
	movl	%eax, (%esp)
	call	read_config
	jmp	.L158
.L156:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L159
	movl	%eax, (%esp)
	call	__asan_report_load4
.L159:
	movl	(%ecx), %eax
	movl	$.LC52, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L160
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L160
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L161
	movl	%eax, (%esp)
	call	__asan_report_load4
.L161:
	movl	(%ecx), %eax
	movl	%eax, (%esp)
	call	atoi
	movw	%ax, port
	jmp	.L158
.L160:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L162
	movl	%eax, (%esp)
	call	__asan_report_load4
.L162:
	movl	(%ecx), %eax
	movl	$.LC53, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L163
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L163
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L164
	movl	%eax, (%esp)
	call	__asan_report_load4
.L164:
	movl	(%ecx), %eax
	movl	%eax, dir
	jmp	.L158
.L163:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L165
	movl	%eax, (%esp)
	call	__asan_report_load4
.L165:
	movl	(%ecx), %eax
	movl	$.LC54, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L166
	movl	$1, do_chroot
	movl	$1, no_symlink_check
	jmp	.L158
.L166:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L167
	movl	%eax, (%esp)
	call	__asan_report_load4
.L167:
	movl	(%ecx), %eax
	movl	$.LC55, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L168
	movl	$0, do_chroot
	movl	$0, no_symlink_check
	jmp	.L158
.L168:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L169
	movl	%eax, (%esp)
	call	__asan_report_load4
.L169:
	movl	(%ecx), %eax
	movl	$.LC56, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L170
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L170
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L171
	movl	%eax, (%esp)
	call	__asan_report_load4
.L171:
	movl	(%ecx), %eax
	movl	%eax, data_dir
	jmp	.L158
.L170:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L172
	movl	%eax, (%esp)
	call	__asan_report_load4
.L172:
	movl	(%ecx), %eax
	movl	$.LC57, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L173
	movl	$0, no_symlink_check
	jmp	.L158
.L173:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L174
	movl	%eax, (%esp)
	call	__asan_report_load4
.L174:
	movl	(%ecx), %eax
	movl	$.LC58, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L175
	movl	$1, no_symlink_check
	jmp	.L158
.L175:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L176
	movl	%eax, (%esp)
	call	__asan_report_load4
.L176:
	movl	(%ecx), %eax
	movl	$.LC59, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L177
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L177
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L178
	movl	%eax, (%esp)
	call	__asan_report_load4
.L178:
	movl	(%ecx), %eax
	movl	%eax, user
	jmp	.L158
.L177:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L179
	movl	%eax, (%esp)
	call	__asan_report_load4
.L179:
	movl	(%ecx), %eax
	movl	$.LC60, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L180
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L180
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L181
	movl	%eax, (%esp)
	call	__asan_report_load4
.L181:
	movl	(%ecx), %eax
	movl	%eax, cgi_pattern
	jmp	.L158
.L180:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L182
	movl	%eax, (%esp)
	call	__asan_report_load4
.L182:
	movl	(%ecx), %eax
	movl	$.LC61, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L183
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L183
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L184
	movl	%eax, (%esp)
	call	__asan_report_load4
.L184:
	movl	(%ecx), %eax
	movl	%eax, throttlefile
	jmp	.L158
.L183:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L185
	movl	%eax, (%esp)
	call	__asan_report_load4
.L185:
	movl	(%ecx), %eax
	movl	$.LC62, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L186
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L186
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L187
	movl	%eax, (%esp)
	call	__asan_report_load4
.L187:
	movl	(%ecx), %eax
	movl	%eax, hostname
	jmp	.L158
.L186:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L188
	movl	%eax, (%esp)
	call	__asan_report_load4
.L188:
	movl	(%ecx), %eax
	movl	$.LC63, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L189
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L189
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L190
	movl	%eax, (%esp)
	call	__asan_report_load4
.L190:
	movl	(%ecx), %eax
	movl	%eax, logfile
	jmp	.L158
.L189:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L191
	movl	%eax, (%esp)
	call	__asan_report_load4
.L191:
	movl	(%ecx), %eax
	movl	$.LC64, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L192
	movl	$1, do_vhost
	jmp	.L158
.L192:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L193
	movl	%eax, (%esp)
	call	__asan_report_load4
.L193:
	movl	(%ecx), %eax
	movl	$.LC65, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L194
	movl	$0, do_vhost
	jmp	.L158
.L194:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L195
	movl	%eax, (%esp)
	call	__asan_report_load4
.L195:
	movl	(%ecx), %eax
	movl	$.LC66, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L196
	movl	$1, do_global_passwd
	jmp	.L158
.L196:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L197
	movl	%eax, (%esp)
	call	__asan_report_load4
.L197:
	movl	(%ecx), %eax
	movl	$.LC67, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L198
	movl	$0, do_global_passwd
	jmp	.L158
.L198:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L199
	movl	%eax, (%esp)
	call	__asan_report_load4
.L199:
	movl	(%ecx), %eax
	movl	$.LC68, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L200
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L200
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L201
	movl	%eax, (%esp)
	call	__asan_report_load4
.L201:
	movl	(%ecx), %eax
	movl	%eax, pidfile
	jmp	.L158
.L200:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L202
	movl	%eax, (%esp)
	call	__asan_report_load4
.L202:
	movl	(%ecx), %eax
	movl	$.LC69, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L203
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L203
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L204
	movl	%eax, (%esp)
	call	__asan_report_load4
.L204:
	movl	(%ecx), %eax
	movl	%eax, charset
	jmp	.L158
.L203:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L205
	movl	%eax, (%esp)
	call	__asan_report_load4
.L205:
	movl	(%ecx), %eax
	movl	$.LC70, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L206
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L206
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L207
	movl	%eax, (%esp)
	call	__asan_report_load4
.L207:
	movl	(%ecx), %eax
	movl	%eax, p3p
	jmp	.L158
.L206:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L208
	movl	%eax, (%esp)
	call	__asan_report_load4
.L208:
	movl	(%ecx), %eax
	movl	$.LC71, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L209
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	8(%ebp), %eax
	jge	.L209
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L210
	movl	%eax, (%esp)
	call	__asan_report_load4
.L210:
	movl	(%ecx), %eax
	movl	%eax, (%esp)
	call	atoi
	movl	%eax, max_age
	jmp	.L158
.L209:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L211
	movl	%eax, (%esp)
	call	__asan_report_load4
.L211:
	movl	(%ecx), %eax
	movl	$.LC72, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L212
	movl	$1, debug
	jmp	.L158
.L212:
	call	usage
.L158:
	addl	$1, -12(%ebp)
.L152:
	movl	-12(%ebp), %eax
	cmpl	8(%ebp), %eax
	jge	.L213
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	leal	(%edx,%eax), %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L214
	movl	%eax, (%esp)
	call	__asan_report_load4
.L214:
	movl	(%ecx), %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L215
	movl	%eax, (%esp)
	call	__asan_report_load1
.L215:
	movzbl	(%edx), %eax
	cmpb	$45, %al
	je	.L216
.L213:
	movl	-12(%ebp), %eax
	cmpl	8(%ebp), %eax
	je	.L151
	call	usage
.L151:
	addl	$32, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE8:
	.size	parse_args, .-parse_args
	.section	.rodata
	.align 32
.LC73:
	.string	"usage:  %s [-C configfile] [-p port] [-d dir] [-r|-nor] [-dd data_dir] [-s|-nos] [-v|-nov] [-g|-nog] [-u user] [-c cgipat] [-t throttles] [-h host] [-l logfile] [-i pidfile] [-T charset] [-P P3P] [-M maxage] [-V] [-D]\n"
	.zero	37
	.text
	.type	usage, @function
usage:
.LFB9:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	argv0, %edx
	movl	stderr, %eax
	movl	%edx, 8(%esp)
	movl	$.LC73, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
	.cfi_endproc
.LFE9:
	.size	usage, .-usage
	.section	.rodata
	.align 4
.LC74:
	.string	"read_config 1 32 10000 4 line "
	.align 32
.LC75:
	.string	"r"
	.zero	62
	.align 32
.LC76:
	.string	" \t\n\r"
	.zero	59
	.align 32
.LC77:
	.string	"debug"
	.zero	58
	.align 32
.LC78:
	.string	"port"
	.zero	59
	.align 32
.LC79:
	.string	"dir"
	.zero	60
	.align 32
.LC80:
	.string	"nochroot"
	.zero	55
	.align 32
.LC81:
	.string	"data_dir"
	.zero	55
	.align 32
.LC82:
	.string	"symlink"
	.zero	56
	.align 32
.LC83:
	.string	"nosymlink"
	.zero	54
	.align 32
.LC84:
	.string	"symlinks"
	.zero	55
	.align 32
.LC85:
	.string	"nosymlinks"
	.zero	53
	.align 32
.LC86:
	.string	"user"
	.zero	59
	.align 32
.LC87:
	.string	"cgipat"
	.zero	57
	.align 32
.LC88:
	.string	"cgilimit"
	.zero	55
	.align 32
.LC89:
	.string	"urlpat"
	.zero	57
	.align 32
.LC90:
	.string	"noemptyreferers"
	.zero	48
	.align 32
.LC91:
	.string	"localpat"
	.zero	55
	.align 32
.LC92:
	.string	"throttles"
	.zero	54
	.align 32
.LC93:
	.string	"host"
	.zero	59
	.align 32
.LC94:
	.string	"logfile"
	.zero	56
	.align 32
.LC95:
	.string	"vhost"
	.zero	58
	.align 32
.LC96:
	.string	"novhost"
	.zero	56
	.align 32
.LC97:
	.string	"globalpasswd"
	.zero	51
	.align 32
.LC98:
	.string	"noglobalpasswd"
	.zero	49
	.align 32
.LC99:
	.string	"pidfile"
	.zero	56
	.align 32
.LC100:
	.string	"charset"
	.zero	56
	.align 32
.LC101:
	.string	"p3p"
	.zero	60
	.align 32
.LC102:
	.string	"max_age"
	.zero	56
	.align 32
.LC103:
	.string	"%s: unknown config option '%s'\n"
	.zero	32
	.text
	.type	read_config, @function
read_config:
.LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$10156, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	8(%ebp), %eax
	movl	%eax, -10140(%ebp)
	leal	-10104(%ebp), %eax
	movl	$1102416563, (%eax)
	movl	$.LC74, 4(%eax)
	shrl	$3, %eax
	addl	$536870912, %eax
	movl	%eax, -10144(%ebp)
	movl	$-235802127, (%eax)
	movl	$-185335808, 1252(%eax)
	movl	%gs:20, %eax
	movl	%eax, -28(%ebp)
	xorl	%eax, %eax
	movl	$.LC75, 4(%esp)
	movl	-10140(%ebp), %eax
	movl	%eax, (%esp)
	call	fopen
	movl	%eax, -10112(%ebp)
	cmpl	$0, -10112(%ebp)
	jne	.L220
	movl	-10140(%ebp), %eax
	movl	%eax, (%esp)
	call	perror
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L220:
	jmp	.L221
.L261:
	movl	$35, 4(%esp)
	leal	-10072(%ebp), %eax
	movl	%eax, (%esp)
	call	strchr
	movl	%eax, -10124(%ebp)
	cmpl	$0, -10124(%ebp)
	je	.L222
	movl	-10124(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%ecx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L223
	movl	%eax, (%esp)
	call	__asan_report_store1
.L223:
	movl	-10124(%ebp), %eax
	movb	$0, (%eax)
.L222:
	leal	-10072(%ebp), %eax
	movl	%eax, -10124(%ebp)
	movl	$.LC76, 4(%esp)
	movl	-10124(%ebp), %eax
	movl	%eax, (%esp)
	call	strspn
	addl	%eax, -10124(%ebp)
	jmp	.L224
.L260:
	movl	$.LC76, 4(%esp)
	movl	-10124(%ebp), %eax
	movl	%eax, (%esp)
	call	strcspn
	movl	-10124(%ebp), %edx
	addl	%edx, %eax
	movl	%eax, -10120(%ebp)
	jmp	.L225
.L228:
	movl	-10120(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -10120(%ebp)
	movl	%eax, %edx
	movl	%edx, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%edx, %esi
	andl	$7, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L226
	movl	%edx, (%esp)
	call	__asan_report_store1
.L226:
	movb	$0, (%eax)
.L225:
	movl	-10120(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L227
	movl	%eax, (%esp)
	call	__asan_report_load1
.L227:
	movl	-10120(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$32, %al
	je	.L228
	movl	-10120(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$9, %al
	je	.L228
	movl	-10120(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$10, %al
	je	.L228
	movl	-10120(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$13, %al
	je	.L228
	movl	-10124(%ebp), %eax
	movl	%eax, -10108(%ebp)
	movl	$61, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strchr
	movl	%eax, -10116(%ebp)
	cmpl	$0, -10116(%ebp)
	je	.L229
	movl	-10116(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -10116(%ebp)
	movl	%eax, %edx
	movl	%edx, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%edx, %esi
	andl	$7, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L230
	movl	%edx, (%esp)
	call	__asan_report_store1
.L230:
	movb	$0, (%eax)
.L229:
	movl	$.LC77, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L231
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$1, debug
	jmp	.L232
.L231:
	movl	$.LC78, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L233
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10116(%ebp), %eax
	movl	%eax, (%esp)
	call	atoi
	movw	%ax, port
	jmp	.L232
.L233:
	movl	$.LC79, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L234
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10116(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, dir
	jmp	.L232
.L234:
	movl	$.LC28, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L235
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$1, do_chroot
	movl	$1, no_symlink_check
	jmp	.L232
.L235:
	movl	$.LC80, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L236
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$0, do_chroot
	movl	$0, no_symlink_check
	jmp	.L232
.L236:
	movl	$.LC81, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L237
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10116(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, data_dir
	jmp	.L232
.L237:
	movl	$.LC82, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L238
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$0, no_symlink_check
	jmp	.L232
.L238:
	movl	$.LC83, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L239
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$1, no_symlink_check
	jmp	.L232
.L239:
	movl	$.LC84, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L240
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$0, no_symlink_check
	jmp	.L232
.L240:
	movl	$.LC85, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L241
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$1, no_symlink_check
	jmp	.L232
.L241:
	movl	$.LC86, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L242
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10116(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, user
	jmp	.L232
.L242:
	movl	$.LC87, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L243
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10116(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, cgi_pattern
	jmp	.L232
.L243:
	movl	$.LC88, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L244
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10116(%ebp), %eax
	movl	%eax, (%esp)
	call	atoi
	movl	%eax, cgi_limit
	jmp	.L232
.L244:
	movl	$.LC89, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L245
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10116(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, url_pattern
	jmp	.L232
.L245:
	movl	$.LC90, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L246
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$1, no_empty_referers
	jmp	.L232
.L246:
	movl	$.LC91, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L247
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10116(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, local_pattern
	jmp	.L232
.L247:
	movl	$.LC92, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L248
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10116(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, throttlefile
	jmp	.L232
.L248:
	movl	$.LC93, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L249
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10116(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, hostname
	jmp	.L232
.L249:
	movl	$.LC94, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L250
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10116(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, logfile
	jmp	.L232
.L250:
	movl	$.LC95, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L251
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$1, do_vhost
	jmp	.L232
.L251:
	movl	$.LC96, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L252
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$0, do_vhost
	jmp	.L232
.L252:
	movl	$.LC97, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L253
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$1, do_global_passwd
	jmp	.L232
.L253:
	movl	$.LC98, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L254
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	no_value_required
	movl	$0, do_global_passwd
	jmp	.L232
.L254:
	movl	$.LC99, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L255
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10116(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, pidfile
	jmp	.L232
.L255:
	movl	$.LC100, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L256
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10116(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, charset
	jmp	.L232
.L256:
	movl	$.LC101, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L257
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10116(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, p3p
	jmp	.L232
.L257:
	movl	$.LC102, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	strcasecmp
	testl	%eax, %eax
	jne	.L258
	movl	-10116(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-10108(%ebp), %eax
	movl	%eax, (%esp)
	call	value_required
	movl	-10116(%ebp), %eax
	movl	%eax, (%esp)
	call	atoi
	movl	%eax, max_age
	jmp	.L232
.L258:
	movl	argv0, %edx
	movl	stderr, %eax
	movl	-10108(%ebp), %ecx
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	$.LC103, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L232:
	movl	-10120(%ebp), %eax
	movl	%eax, -10124(%ebp)
	movl	$.LC76, 4(%esp)
	movl	-10124(%ebp), %eax
	movl	%eax, (%esp)
	call	strspn
	addl	%eax, -10124(%ebp)
.L224:
	movl	-10124(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L259
	movl	%eax, (%esp)
	call	__asan_report_load1
.L259:
	movl	-10124(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L260
.L221:
	movl	-10112(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$10000, 4(%esp)
	leal	-10072(%ebp), %eax
	movl	%eax, (%esp)
	call	fgets
	testl	%eax, %eax
	jne	.L261
	movl	-10112(%ebp), %eax
	movl	%eax, (%esp)
	call	fclose
	movl	-10144(%ebp), %eax
	movl	$0, (%eax)
	movl	$0, 1252(%eax)
	movl	-28(%ebp), %eax
	xorl	%gs:20, %eax
	je	.L262
	call	__stack_chk_fail
.L262:
	addl	$10156, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE10:
	.size	read_config, .-read_config
	.section	.rodata
	.align 32
.LC104:
	.string	"%s: value required for %s option\n"
	.zero	62
	.text
	.type	value_required, @function
value_required:
.LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	cmpl	$0, 12(%ebp)
	jne	.L263
	movl	argv0, %edx
	movl	stderr, %eax
	movl	8(%ebp), %ecx
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	$.LC104, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L263:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE11:
	.size	value_required, .-value_required
	.section	.rodata
	.align 32
.LC105:
	.string	"%s: no value required for %s option\n"
	.zero	59
	.text
	.type	no_value_required, @function
no_value_required:
.LFB12:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	cmpl	$0, 12(%ebp)
	je	.L265
	movl	argv0, %edx
	movl	stderr, %eax
	movl	8(%ebp), %ecx
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	$.LC105, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L265:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE12:
	.size	no_value_required, .-no_value_required
	.section	.rodata
	.align 32
.LC106:
	.string	"out of memory copying a string"
	.zero	33
	.align 32
.LC107:
	.string	"%s: out of memory copying a string\n"
	.zero	60
	.text
	.type	e_strdup, @function
e_strdup:
.LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	strdup
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	.L268
	movl	$.LC106, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	argv0, %edx
	movl	stderr, %eax
	movl	%edx, 8(%esp)
	movl	$.LC107, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L268:
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE13:
	.size	e_strdup, .-e_strdup
	.section	.rodata
	.align 4
.LC108:
	.string	"lookup_hostname 3 32 4 2 ai 96 32 5 hints 160 10 7 portstr "
	.align 32
.LC109:
	.string	"%d"
	.zero	61
	.align 32
.LC110:
	.string	"getaddrinfo %.80s - %.80s"
	.zero	38
	.align 32
.LC111:
	.string	"%s: getaddrinfo %s - %s\n"
	.zero	39
	.align 32
.LC112:
	.string	"%.80s - sockaddr too small (%lu < %lu)"
	.zero	57
	.text
	.type	lookup_hostname, @function
lookup_hostname:
.LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$300, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	8(%ebp), %eax
	movl	%eax, -268(%ebp)
	movl	16(%ebp), %eax
	movl	%eax, -272(%ebp)
	movl	20(%ebp), %eax
	movl	%eax, -276(%ebp)
	movl	28(%ebp), %eax
	movl	%eax, -280(%ebp)
	leal	-248(%ebp), %eax
	movl	$1102416563, (%eax)
	movl	$.LC108, 4(%eax)
	shrl	$3, %eax
	addl	$536870912, %eax
	movl	%eax, -292(%ebp)
	movl	$-235802127, (%eax)
	movl	$-185273340, 4(%eax)
	movl	$-218959118, 8(%eax)
	movl	$-218959118, 16(%eax)
	movl	$-185335296, 20(%eax)
	movl	%gs:20, %eax
	movl	%eax, -28(%ebp)
	xorl	%eax, %eax
	leal	-152(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L271
	movl	%eax, (%esp)
	call	__asan_report_store1
.L271:
	leal	-152(%ebp), %eax
	addl	$31, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L272
	movl	%eax, (%esp)
	call	__asan_report_store1
.L272:
	movl	$32, 8(%esp)
	movl	$0, 4(%esp)
	leal	-152(%ebp), %eax
	movl	%eax, (%esp)
	call	memset
	leal	-152(%ebp), %eax
	addl	$4, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L273
	movl	%eax, (%esp)
	call	__asan_report_store4
.L273:
	movl	$0, -148(%ebp)
	leal	-152(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L274
	movl	%eax, (%esp)
	call	__asan_report_store4
.L274:
	movl	$1, -152(%ebp)
	leal	-152(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L275
	movl	%eax, (%esp)
	call	__asan_report_store4
.L275:
	movl	$1, -144(%ebp)
	movzwl	port, %eax
	movzwl	%ax, %eax
	movl	%eax, 12(%esp)
	movl	$.LC109, 8(%esp)
	movl	$10, 4(%esp)
	leal	-88(%ebp), %eax
	movl	%eax, (%esp)
	call	snprintf
	movl	hostname, %eax
	leal	-216(%ebp), %edx
	movl	%edx, 12(%esp)
	leal	-152(%ebp), %edx
	movl	%edx, 8(%esp)
	leal	-88(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	getaddrinfo
	movl	%eax, -252(%ebp)
	cmpl	$0, -252(%ebp)
	je	.L276
	movl	-252(%ebp), %eax
	movl	%eax, (%esp)
	call	gai_strerror
	movl	hostname, %edx
	movl	%eax, 12(%esp)
	movl	%edx, 8(%esp)
	movl	$.LC110, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	-252(%ebp), %eax
	movl	%eax, (%esp)
	call	gai_strerror
	movl	hostname, %ebx
	movl	argv0, %ecx
	movl	stderr, %edx
	movl	%eax, 16(%esp)
	movl	%ebx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	$.LC111, 4(%esp)
	movl	%edx, (%esp)
	call	fprintf
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L276:
	movl	$0, -260(%ebp)
	movl	$0, -256(%ebp)
	movl	-216(%ebp), %eax
	movl	%eax, -264(%ebp)
	jmp	.L277
.L285:
	movl	-264(%ebp), %eax
	addl	$4, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L278
	movl	%eax, (%esp)
	call	__asan_report_load4
.L278:
	movl	-264(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	$2, %eax
	je	.L280
	cmpl	$10, %eax
	jne	.L279
	cmpl	$0, -260(%ebp)
	jne	.L282
	movl	-264(%ebp), %eax
	movl	%eax, -260(%ebp)
	jmp	.L279
.L282:
	jmp	.L279
.L280:
	cmpl	$0, -256(%ebp)
	jne	.L283
	movl	-264(%ebp), %eax
	movl	%eax, -256(%ebp)
	jmp	.L315
.L283:
.L315:
	nop
.L279:
	movl	-264(%ebp), %eax
	addl	$28, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L284
	movl	%eax, (%esp)
	call	__asan_report_load4
.L284:
	movl	-264(%ebp), %eax
	movl	28(%eax), %eax
	movl	%eax, -264(%ebp)
.L277:
	cmpl	$0, -264(%ebp)
	jne	.L285
	cmpl	$0, -260(%ebp)
	jne	.L286
	movl	-280(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L287
	movl	%eax, (%esp)
	call	__asan_report_store4
.L287:
	movl	-280(%ebp), %eax
	movl	$0, (%eax)
	jmp	.L288
.L286:
	movl	-260(%ebp), %eax
	addl	$16, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L289
	movl	%eax, (%esp)
	call	__asan_report_load4
.L289:
	movl	-260(%ebp), %eax
	movl	16(%eax), %eax
	cmpl	24(%ebp), %eax
	jbe	.L290
	movl	-260(%ebp), %eax
	movl	16(%eax), %edx
	movl	hostname, %eax
	movl	%edx, 16(%esp)
	movl	24(%ebp), %edx
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$.LC112, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L290:
	cmpl	$0, 24(%ebp)
	je	.L291
	movl	-276(%ebp), %ebx
	movl	%ebx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	setne	%cl
	movl	%ebx, %edx
	andl	$7, %edx
	cmpb	%al, %dl
	setge	%al
	movl	%ecx, %esi
	andl	%eax, %esi
	movl	24(%ebp), %eax
	leal	-1(%eax), %edx
	movl	-276(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %edi
	movl	%edx, %eax
	andl	$7, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%edi, %eax
	testb	%al, %al
	je	.L292
	movl	%edx, (%esp)
	call	__asan_report_store1
.L292:
	movl	%esi, %eax
	testb	%al, %al
	je	.L291
	movl	%ebx, (%esp)
	call	__asan_report_store1
.L291:
	movl	24(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	-276(%ebp), %eax
	movl	%eax, (%esp)
	call	memset
	movl	-260(%ebp), %eax
	addl	$16, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L293
	movl	%eax, (%esp)
	call	__asan_report_load4
.L293:
	movl	-260(%ebp), %eax
	movl	16(%eax), %esi
	movl	-260(%ebp), %eax
	addl	$20, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L294
	movl	%eax, (%esp)
	call	__asan_report_load4
.L294:
	movl	-260(%ebp), %eax
	movl	20(%eax), %eax
	movl	%eax, %edi
	movl	%edi, -284(%ebp)
	testl	%esi, %esi
	je	.L295
	movl	%edi, %ebx
	movl	%ebx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%ebx, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%eax, %ecx
	movb	%cl, -285(%ebp)
	leal	-1(%esi), %eax
	addl	%edi, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %edi
	movl	%ecx, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%edi, %eax
	testb	%al, %al
	je	.L296
	movl	%ecx, (%esp)
	call	__asan_report_load1
.L296:
	cmpb	$0, -285(%ebp)
	je	.L295
	movl	%ebx, (%esp)
	call	__asan_report_load1
.L295:
	testl	%esi, %esi
	je	.L297
	movl	-276(%ebp), %ebx
	movl	%ebx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%ebx, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%eax, %ecx
	movb	%cl, -285(%ebp)
	leal	-1(%esi), %eax
	movl	-276(%ebp), %edx
	addl	%edx, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %edi
	movl	%ecx, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%edi, %eax
	testb	%al, %al
	je	.L298
	movl	%ecx, (%esp)
	call	__asan_report_store1
.L298:
	cmpb	$0, -285(%ebp)
	je	.L297
	movl	%ebx, (%esp)
	call	__asan_report_store1
.L297:
	movl	%esi, 8(%esp)
	movl	-284(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-276(%ebp), %eax
	movl	%eax, (%esp)
	call	memmove
	movl	-280(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L299
	movl	%eax, (%esp)
	call	__asan_report_store4
.L299:
	movl	-280(%ebp), %eax
	movl	$1, (%eax)
.L288:
	cmpl	$0, -256(%ebp)
	jne	.L300
	movl	-272(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L301
	movl	%eax, (%esp)
	call	__asan_report_store4
.L301:
	movl	-272(%ebp), %eax
	movl	$0, (%eax)
	jmp	.L302
.L300:
	movl	-256(%ebp), %eax
	addl	$16, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L303
	movl	%eax, (%esp)
	call	__asan_report_load4
.L303:
	movl	-256(%ebp), %eax
	movl	16(%eax), %eax
	cmpl	12(%ebp), %eax
	jbe	.L304
	movl	-256(%ebp), %eax
	movl	16(%eax), %edx
	movl	hostname, %eax
	movl	%edx, 16(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$.LC112, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L304:
	cmpl	$0, 12(%ebp)
	je	.L305
	movl	-268(%ebp), %ebx
	movl	%ebx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	setne	%cl
	movl	%ebx, %edx
	andl	$7, %edx
	cmpb	%al, %dl
	setge	%al
	movl	%ecx, %esi
	andl	%eax, %esi
	movl	12(%ebp), %eax
	leal	-1(%eax), %edx
	movl	-268(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %edi
	movl	%edx, %eax
	andl	$7, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%edi, %eax
	testb	%al, %al
	je	.L306
	movl	%edx, (%esp)
	call	__asan_report_store1
.L306:
	movl	%esi, %eax
	testb	%al, %al
	je	.L305
	movl	%ebx, (%esp)
	call	__asan_report_store1
.L305:
	movl	12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	-268(%ebp), %eax
	movl	%eax, (%esp)
	call	memset
	movl	-256(%ebp), %eax
	addl	$16, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L307
	movl	%eax, (%esp)
	call	__asan_report_load4
.L307:
	movl	-256(%ebp), %eax
	movl	16(%eax), %esi
	movl	-256(%ebp), %eax
	addl	$20, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L308
	movl	%eax, (%esp)
	call	__asan_report_load4
.L308:
	movl	-256(%ebp), %eax
	movl	20(%eax), %eax
	movl	%eax, %edi
	movl	%edi, -284(%ebp)
	testl	%esi, %esi
	je	.L309
	movl	%edi, %ebx
	movl	%ebx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%ebx, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%eax, %ecx
	movb	%cl, -285(%ebp)
	leal	-1(%esi), %eax
	addl	%edi, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %edi
	movl	%ecx, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%edi, %eax
	testb	%al, %al
	je	.L310
	movl	%ecx, (%esp)
	call	__asan_report_load1
.L310:
	cmpb	$0, -285(%ebp)
	je	.L309
	movl	%ebx, (%esp)
	call	__asan_report_load1
.L309:
	testl	%esi, %esi
	je	.L311
	movl	-268(%ebp), %ebx
	movl	%ebx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%ebx, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%eax, %ecx
	movb	%cl, -285(%ebp)
	leal	-1(%esi), %eax
	movl	-268(%ebp), %edx
	addl	%edx, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%al
	movl	%eax, %edi
	movl	%ecx, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%edi, %eax
	testb	%al, %al
	je	.L312
	movl	%ecx, (%esp)
	call	__asan_report_store1
.L312:
	cmpb	$0, -285(%ebp)
	je	.L311
	movl	%ebx, (%esp)
	call	__asan_report_store1
.L311:
	movl	%esi, 8(%esp)
	movl	-284(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-268(%ebp), %eax
	movl	%eax, (%esp)
	call	memmove
	movl	-272(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L313
	movl	%eax, (%esp)
	call	__asan_report_store4
.L313:
	movl	-272(%ebp), %eax
	movl	$1, (%eax)
.L302:
	movl	-216(%ebp), %eax
	movl	%eax, (%esp)
	call	freeaddrinfo
	movl	-292(%ebp), %eax
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	movl	$0, 8(%eax)
	movl	$0, 16(%eax)
	movl	$0, 20(%eax)
	movl	-28(%ebp), %eax
	xorl	%gs:20, %eax
	je	.L314
	call	__stack_chk_fail
.L314:
	addl	$300, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE14:
	.size	lookup_hostname, .-lookup_hostname
	.section	.rodata
	.align 4
.LC113:
	.string	"read_throttlefile 5 32 4 9 max_limit 96 4 9 min_limit 160 8 2 tv 224 5000 3 buf 5280 5000 7 pattern "
	.align 32
.LC114:
	.string	" %4900[^ \t] %ld-%ld"
	.zero	44
	.align 32
.LC115:
	.string	" %4900[^ \t] %ld"
	.zero	48
	.align 32
.LC116:
	.string	"unparsable line in %.80s - %.80s"
	.zero	63
	.align 32
.LC117:
	.string	"%s: unparsable line in %.80s - %.80s\n"
	.zero	58
	.align 32
.LC118:
	.string	"|/"
	.zero	61
	.align 32
.LC119:
	.string	"out of memory allocating a throttletab"
	.zero	57
	.align 32
.LC120:
	.string	"%s: out of memory allocating a throttletab\n"
	.zero	52
	.text
	.type	read_throttlefile, @function
read_throttlefile:
.LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$10396, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	8(%ebp), %eax
	movl	%eax, -10380(%ebp)
	leal	-10360(%ebp), %eax
	movl	$1102416563, (%eax)
	movl	$.LC113, 4(%eax)
	shrl	$3, %eax
	leal	536870912(%eax), %esi
	movl	$-235802127, (%esi)
	movl	$-185273340, 4(%esi)
	movl	$-218959118, 8(%esi)
	movl	$-185273340, 12(%esi)
	movl	$-218959118, 16(%esi)
	movl	$-185273344, 20(%esi)
	movl	$-218959118, 24(%esi)
	movl	$-185273344, 652(%esi)
	movl	$-218959118, 656(%esi)
	movl	$-185273344, 1284(%esi)
	movl	%gs:20, %eax
	movl	%eax, -28(%ebp)
	xorl	%eax, %eax
	movl	$.LC75, 4(%esp)
	movl	-10380(%ebp), %eax
	movl	%eax, (%esp)
	call	fopen
	movl	%eax, -10368(%ebp)
	cmpl	$0, -10368(%ebp)
	jne	.L323
	movl	-10380(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC15, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	-10380(%ebp), %eax
	movl	%eax, (%esp)
	call	perror
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L323:
	movl	$0, 4(%esp)
	leal	-10200(%ebp), %eax
	movl	%eax, (%esp)
	call	gettimeofday
	jmp	.L324
.L353:
	movl	$35, 4(%esp)
	leal	-10136(%ebp), %eax
	movl	%eax, (%esp)
	call	strchr
	movl	%eax, -10364(%ebp)
	cmpl	$0, -10364(%ebp)
	je	.L325
	movl	-10364(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L326
	movl	%eax, (%esp)
	call	__asan_report_store1
.L326:
	movl	-10364(%ebp), %eax
	movb	$0, (%eax)
.L325:
	leal	-10136(%ebp), %ebx
	movl	%ebx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%ecx, %edi
	movl	%eax, %ecx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L327
	movl	%eax, (%esp)
	call	__asan_report_load1
.L327:
	leal	-10136(%ebp), %eax
	movl	%eax, (%esp)
	call	strlen
	movl	%eax, %edx
	leal	(%ebx,%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %ebx
	andl	$7, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L328
	movl	%eax, (%esp)
	call	__asan_report_load1
.L328:
	movl	%edx, -10372(%ebp)
	jmp	.L329
.L333:
	subl	$1, -10372(%ebp)
	leal	-10136(%ebp), %edx
	movl	-10372(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L330
	movl	%eax, (%esp)
	call	__asan_report_store1
.L330:
	leal	-10136(%ebp), %edx
	movl	-10372(%ebp), %eax
	addl	%edx, %eax
	movb	$0, (%eax)
.L329:
	cmpl	$0, -10372(%ebp)
	jle	.L331
	movl	-10372(%ebp), %eax
	leal	-1(%eax), %ecx
	leal	-10136(%ebp), %eax
	addl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %ebx
	andl	$7, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L332
	movl	%eax, (%esp)
	call	__asan_report_load1
.L332:
	movzbl	-10136(%ebp,%ecx), %eax
	cmpb	$32, %al
	je	.L333
	movl	-10372(%ebp), %eax
	leal	-1(%eax), %ecx
	leal	-10136(%ebp), %eax
	addl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %ebx
	andl	$7, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L334
	movl	%eax, (%esp)
	call	__asan_report_load1
.L334:
	movzbl	-10136(%ebp,%ecx), %eax
	cmpb	$9, %al
	je	.L333
	movl	-10372(%ebp), %eax
	leal	-1(%eax), %ecx
	leal	-10136(%ebp), %eax
	addl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %ebx
	andl	$7, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L335
	movl	%eax, (%esp)
	call	__asan_report_load1
.L335:
	movzbl	-10136(%ebp,%ecx), %eax
	cmpb	$10, %al
	je	.L333
	movl	-10372(%ebp), %eax
	leal	-1(%eax), %ecx
	leal	-10136(%ebp), %eax
	addl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %ebx
	andl	$7, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L336
	movl	%eax, (%esp)
	call	__asan_report_load1
.L336:
	movzbl	-10136(%ebp,%ecx), %eax
	cmpb	$13, %al
	je	.L333
.L331:
	cmpl	$0, -10372(%ebp)
	jne	.L337
	jmp	.L324
.L337:
	leal	-10328(%ebp), %eax
	movl	%eax, 16(%esp)
	leal	-10264(%ebp), %eax
	movl	%eax, 12(%esp)
	leal	-5080(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC114, 4(%esp)
	leal	-10136(%ebp), %eax
	movl	%eax, (%esp)
	call	__isoc99_sscanf
	cmpl	$3, %eax
	je	.L338
	leal	-10328(%ebp), %eax
	movl	%eax, 12(%esp)
	leal	-5080(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC115, 4(%esp)
	leal	-10136(%ebp), %eax
	movl	%eax, (%esp)
	call	__isoc99_sscanf
	cmpl	$2, %eax
	jne	.L339
	movl	$0, -10264(%ebp)
	jmp	.L338
.L339:
	leal	-10136(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-10380(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC116, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	argv0, %edx
	movl	stderr, %eax
	leal	-10136(%ebp), %ecx
	movl	%ecx, 16(%esp)
	movl	-10380(%ebp), %ecx
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	$.LC117, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	jmp	.L324
.L338:
	leal	-5080(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L340
	movl	%eax, (%esp)
	call	__asan_report_load1
.L340:
	movzbl	-5080(%ebp), %eax
	cmpb	$47, %al
	jne	.L341
	leal	-5080(%ebp), %eax
	addl	$1, %eax
	movl	%eax, 4(%esp)
	leal	-5080(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
	jmp	.L342
.L341:
	jmp	.L342
.L343:
	movl	-10364(%ebp), %eax
	leal	2(%eax), %edx
	movl	-10364(%ebp), %eax
	addl	$1, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	strcpy
.L342:
	movl	$.LC118, 4(%esp)
	leal	-5080(%ebp), %eax
	movl	%eax, (%esp)
	call	strstr
	movl	%eax, -10364(%ebp)
	cmpl	$0, -10364(%ebp)
	jne	.L343
	movl	numthrottles, %edx
	movl	maxthrottles, %eax
	cmpl	%eax, %edx
	jl	.L344
	movl	maxthrottles, %eax
	testl	%eax, %eax
	jne	.L345
	movl	$100, maxthrottles
	movl	maxthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	movl	%eax, (%esp)
	call	malloc
	movl	%eax, throttles
	jmp	.L346
.L345:
	movl	maxthrottles, %eax
	addl	%eax, %eax
	movl	%eax, maxthrottles
	movl	maxthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	movl	%eax, %edx
	movl	throttles, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	realloc
	movl	%eax, throttles
.L346:
	movl	throttles, %eax
	testl	%eax, %eax
	jne	.L344
	movl	$.LC119, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	movl	argv0, %edx
	movl	stderr, %eax
	movl	%edx, 8(%esp)
	movl	$.LC120, 4(%esp)
	movl	%eax, (%esp)
	call	fprintf
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L344:
	movl	throttles, %ecx
	movl	numthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	leal	-5080(%ebp), %eax
	movl	%eax, (%esp)
	call	e_strdup
	movl	%eax, %edi
	movl	%ebx, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	-10381(%ebp)
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andb	-10381(%ebp), %al
	testb	%al, %al
	je	.L347
	movl	%edx, (%esp)
	call	__asan_report_store4
.L347:
	movl	%edi, (%ebx)
	movl	throttles, %ecx
	movl	numthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%eax, %ecx
	movl	-10328(%ebp), %edi
	leal	4(%ecx), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ebx
	testb	%bl, %bl
	setne	-10381(%ebp)
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%bl, %al
	setge	%al
	andb	-10381(%ebp), %al
	testb	%al, %al
	je	.L348
	movl	%edx, (%esp)
	call	__asan_report_store4
.L348:
	movl	%edi, 4(%ecx)
	movl	throttles, %ecx
	movl	numthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%eax, %ecx
	movl	-10264(%ebp), %edi
	leal	8(%ecx), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ebx
	testb	%bl, %bl
	setne	-10381(%ebp)
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%bl, %al
	setge	%al
	andb	-10381(%ebp), %al
	testb	%al, %al
	je	.L349
	movl	%edx, (%esp)
	call	__asan_report_store4
.L349:
	movl	%edi, 8(%ecx)
	movl	throttles, %ecx
	movl	numthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	12(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L350
	movl	%eax, (%esp)
	call	__asan_report_store4
.L350:
	movl	$0, 12(%edx)
	movl	throttles, %ecx
	movl	numthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	16(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L351
	movl	%eax, (%esp)
	call	__asan_report_store4
.L351:
	movl	$0, 16(%edx)
	movl	throttles, %ecx
	movl	numthrottles, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	20(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L352
	movl	%eax, (%esp)
	call	__asan_report_store4
.L352:
	movl	$0, 20(%edx)
	movl	numthrottles, %eax
	addl	$1, %eax
	movl	%eax, numthrottles
.L324:
	movl	-10368(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$5000, 4(%esp)
	leal	-10136(%ebp), %eax
	movl	%eax, (%esp)
	call	fgets
	testl	%eax, %eax
	jne	.L353
	movl	-10368(%ebp), %eax
	movl	%eax, (%esp)
	call	fclose
	movl	%esi, %eax
	movl	$28, %edx
	movl	$0, %ecx
	movl	%eax, %ebx
	andl	$1, %ebx
	testl	%ebx, %ebx
	je	.L316
	movb	%cl, (%eax)
	addl	$1, %eax
	subl	$1, %edx
.L316:
	movl	%eax, %ebx
	andl	$2, %ebx
	testl	%ebx, %ebx
	je	.L317
	movw	%cx, (%eax)
	addl	$2, %eax
	subl	$2, %edx
.L317:
	movl	%edx, %edi
	andl	$-4, %edi
	movl	$0, %ebx
.L318:
	movl	%ecx, (%eax,%ebx)
	addl	$4, %ebx
	cmpl	%edi, %ebx
	jb	.L318
	addl	%ebx, %eax
	movl	%edx, %ebx
	andl	$2, %ebx
	testl	%ebx, %ebx
	je	.L320
	movw	%cx, (%eax)
	addl	$2, %eax
.L320:
	andl	$1, %edx
	testl	%edx, %edx
	je	.L321
	movb	%cl, (%eax)
	addl	$1, %eax
.L321:
	movl	$0, 652(%esi)
	movl	$0, 656(%esi)
	movl	$0, 1284(%esi)
	movl	-28(%ebp), %eax
	xorl	%gs:20, %eax
	je	.L354
	call	__stack_chk_fail
.L354:
	addl	$10396, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE15:
	.size	read_throttlefile, .-read_throttlefile
	.section	.rodata
.LC121:
	.string	"shut_down 1 32 8 2 tv "
	.text
	.type	shut_down, @function
shut_down:
.LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$140, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	leal	-120(%ebp), %eax
	movl	$1102416563, (%eax)
	movl	$.LC121, 4(%eax)
	shrl	$3, %eax
	addl	$536870912, %eax
	movl	%eax, -140(%ebp)
	movl	$-235802127, (%eax)
	movl	$-185273344, 4(%eax)
	movl	$-202116109, 8(%eax)
	movl	$0, 4(%esp)
	leal	-88(%ebp), %eax
	movl	%eax, (%esp)
	call	gettimeofday
	leal	-88(%ebp), %eax
	movl	%eax, (%esp)
	call	logstats
	movl	$0, -128(%ebp)
	jmp	.L356
.L365:
	movl	connects, %ecx
	movl	-128(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	addl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L357
	movl	%eax, (%esp)
	call	__asan_report_load4
.L357:
	movl	(%ecx), %eax
	testl	%eax, %eax
	je	.L358
	movl	connects, %ecx
	movl	-128(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %edx
	leal	8(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L359
	movl	%eax, (%esp)
	call	__asan_report_load4
.L359:
	movl	8(%edx), %eax
	leal	-88(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	httpd_close_conn
.L358:
	movl	connects, %ecx
	movl	-128(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %edx
	leal	8(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L360
	movl	%eax, (%esp)
	call	__asan_report_load4
.L360:
	movl	8(%edx), %eax
	testl	%eax, %eax
	je	.L361
	movl	connects, %ecx
	movl	-128(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %edx
	leal	8(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L362
	movl	%eax, (%esp)
	call	__asan_report_load4
.L362:
	movl	8(%edx), %eax
	movl	%eax, (%esp)
	call	httpd_destroy_conn
	movl	connects, %ecx
	movl	-128(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %edx
	leal	8(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L363
	movl	%eax, (%esp)
	call	__asan_report_load4
.L363:
	movl	8(%edx), %eax
	movl	%eax, (%esp)
	call	free
	movl	httpd_conn_count, %eax
	subl	$1, %eax
	movl	%eax, httpd_conn_count
	movl	connects, %ecx
	movl	-128(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	leal	(%ecx,%eax), %edx
	leal	8(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L364
	movl	%eax, (%esp)
	call	__asan_report_store4
.L364:
	movl	$0, 8(%edx)
.L361:
	addl	$1, -128(%ebp)
.L356:
	movl	max_connects, %eax
	cmpl	%eax, -128(%ebp)
	jl	.L365
	movl	hs, %eax
	testl	%eax, %eax
	je	.L366
	movl	hs, %eax
	movl	%eax, -124(%ebp)
	movl	$0, hs
	movl	-124(%ebp), %eax
	addl	$40, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L367
	movl	%eax, (%esp)
	call	__asan_report_load4
.L367:
	movl	-124(%ebp), %eax
	movl	40(%eax), %eax
	cmpl	$-1, %eax
	je	.L368
	movl	-124(%ebp), %eax
	movl	40(%eax), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
.L368:
	movl	-124(%ebp), %eax
	addl	$44, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L369
	movl	%eax, (%esp)
	call	__asan_report_load4
.L369:
	movl	-124(%ebp), %eax
	movl	44(%eax), %eax
	cmpl	$-1, %eax
	je	.L370
	movl	-124(%ebp), %eax
	movl	44(%eax), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
.L370:
	movl	-124(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_terminate
.L366:
	call	mmc_destroy
	call	tmr_destroy
	movl	connects, %eax
	movl	%eax, (%esp)
	call	free
	movl	throttles, %eax
	testl	%eax, %eax
	je	.L355
	movl	throttles, %eax
	movl	%eax, (%esp)
	call	free
.L355:
	movl	-140(%ebp), %eax
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	movl	$0, 8(%eax)
	addl	$140, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE16:
	.size	shut_down, .-shut_down
	.section	.rodata
	.align 4
.LC122:
	.string	"handle_newconnect 1 32 4 11 client_data "
	.align 32
.LC123:
	.string	"too many connections!"
	.zero	42
	.align 32
.LC124:
	.string	"the connects free list is messed up"
	.zero	60
	.align 32
.LC125:
	.string	"out of memory allocating an httpd_conn"
	.zero	57
	.text
	.type	handle_newconnect, @function
handle_newconnect:
.LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$140, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	leal	-120(%ebp), %eax
	movl	$1102416563, (%eax)
	movl	$.LC122, 4(%eax)
	shrl	$3, %eax
	addl	$536870912, %eax
	movl	%eax, -140(%ebp)
	movl	$-235802127, (%eax)
	movl	$-185273340, 4(%eax)
	movl	$-202116109, 8(%eax)
.L401:
	movl	num_connects, %edx
	movl	max_connects, %eax
	cmpl	%eax, %edx
	jl	.L373
	movl	$.LC123, 4(%esp)
	movl	$4, (%esp)
	call	syslog
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	tmr_run
	movl	$0, %eax
	jmp	.L402
.L373:
	movl	first_free_connect, %eax
	cmpl	$-1, %eax
	je	.L375
	movl	connects, %ecx
	movl	first_free_connect, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	addl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L376
	movl	%eax, (%esp)
	call	__asan_report_load4
.L376:
	movl	(%ecx), %eax
	testl	%eax, %eax
	je	.L377
.L375:
	movl	$.LC124, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L377:
	movl	connects, %ecx
	movl	first_free_connect, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	addl	%ecx, %eax
	movl	%eax, -124(%ebp)
	movl	-124(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L378
	movl	%eax, (%esp)
	call	__asan_report_load4
.L378:
	movl	-124(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jne	.L379
	movl	$456, (%esp)
	call	malloc
	movl	%eax, %edx
	movl	-124(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	-124(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jne	.L380
	movl	$.LC125, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L380:
	movl	-124(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L381
	movl	%eax, (%esp)
	call	__asan_report_load4
.L381:
	movl	-124(%ebp), %eax
	movl	8(%eax), %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L382
	movl	%eax, (%esp)
	call	__asan_report_store4
.L382:
	movl	$0, (%edx)
	movl	httpd_conn_count, %eax
	addl	$1, %eax
	movl	%eax, httpd_conn_count
.L379:
	movl	-124(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L383
	movl	%eax, (%esp)
	call	__asan_report_load4
.L383:
	movl	-124(%ebp), %eax
	movl	8(%eax), %edx
	movl	hs, %eax
	movl	%edx, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	httpd_get_conn
	testl	%eax, %eax
	je	.L385
	cmpl	$2, %eax
	je	.L386
	jmp	.L403
.L385:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	tmr_run
	movl	$0, %eax
	jmp	.L402
.L386:
	movl	$1, %eax
	jmp	.L402
.L403:
	movl	-124(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L387
	movl	%eax, (%esp)
	call	__asan_report_store4
.L387:
	movl	-124(%ebp), %eax
	movl	$1, (%eax)
	movl	-124(%ebp), %eax
	addl	$4, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L388
	movl	%eax, (%esp)
	call	__asan_report_load4
.L388:
	movl	-124(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, first_free_connect
	movl	-124(%ebp), %eax
	movl	$-1, 4(%eax)
	movl	num_connects, %eax
	addl	$1, %eax
	movl	%eax, num_connects
	leal	-88(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L389
	movl	%eax, (%esp)
	call	__asan_report_store4
.L389:
	movl	-124(%ebp), %eax
	movl	%eax, -88(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L390
	movl	%eax, (%esp)
	call	__asan_report_load4
.L390:
	movl	8(%ebp), %eax
	movl	(%eax), %ecx
	movl	-124(%ebp), %eax
	addl	$68, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L391
	movl	%eax, (%esp)
	call	__asan_report_store4
.L391:
	movl	-124(%ebp), %eax
	movl	%ecx, 68(%eax)
	movl	-124(%ebp), %eax
	addl	$72, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L392
	movl	%eax, (%esp)
	call	__asan_report_store4
.L392:
	movl	-124(%ebp), %eax
	movl	$0, 72(%eax)
	movl	-124(%ebp), %eax
	addl	$76, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L393
	movl	%eax, (%esp)
	call	__asan_report_store4
.L393:
	movl	-124(%ebp), %eax
	movl	$0, 76(%eax)
	movl	-124(%ebp), %eax
	addl	$92, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L394
	movl	%eax, (%esp)
	call	__asan_report_store4
.L394:
	movl	-124(%ebp), %eax
	movl	$0, 92(%eax)
	movl	-124(%ebp), %eax
	addl	$52, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L395
	movl	%eax, (%esp)
	call	__asan_report_store4
.L395:
	movl	-124(%ebp), %eax
	movl	$0, 52(%eax)
	movl	-124(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L396
	movl	%eax, (%esp)
	call	__asan_report_load4
.L396:
	movl	-124(%ebp), %eax
	movl	8(%eax), %edx
	leal	448(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L397
	movl	%eax, (%esp)
	call	__asan_report_load4
.L397:
	movl	448(%edx), %eax
	movl	%eax, (%esp)
	call	httpd_set_ndelay
	movl	-124(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L398
	movl	%eax, (%esp)
	call	__asan_report_load4
.L398:
	movl	-124(%ebp), %eax
	movl	8(%eax), %edx
	leal	448(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L399
	movl	%eax, (%esp)
	call	__asan_report_load4
.L399:
	movl	448(%edx), %eax
	movl	$0, 8(%esp)
	movl	-124(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fdwatch_add_fd
	movl	stats_connections, %eax
	addl	$1, %eax
	movl	%eax, stats_connections
	movl	num_connects, %edx
	movl	stats_simultaneous, %eax
	cmpl	%eax, %edx
	jle	.L400
	movl	num_connects, %eax
	movl	%eax, stats_simultaneous
	jmp	.L401
.L400:
	jmp	.L401
.L402:
	movl	-140(%ebp), %edi
	movl	$0, (%edi)
	movl	$0, 4(%edi)
	movl	$0, 8(%edi)
	addl	$140, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE17:
	.size	handle_newconnect, .-handle_newconnect
	.section	.rodata
	.align 4
.LC126:
	.string	"handle_read 1 32 4 11 client_data "
	.text
	.type	handle_read, @function
handle_read:
.LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$156, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	leal	-120(%ebp), %eax
	movl	$1102416563, (%eax)
	movl	$.LC126, 4(%eax)
	shrl	$3, %eax
	leal	536870912(%eax), %edi
	movl	$-235802127, (%edi)
	movl	$-185273340, 4(%edi)
	movl	$-202116109, 8(%edi)
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L405
	movl	%eax, (%esp)
	call	__asan_report_load4
.L405:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -128(%ebp)
	movl	-128(%ebp), %eax
	addl	$144, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L406
	movl	%eax, (%esp)
	call	__asan_report_load4
.L406:
	movl	-128(%ebp), %eax
	movl	144(%eax), %ecx
	movl	-128(%ebp), %eax
	addl	$140, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L407
	movl	%eax, (%esp)
	call	__asan_report_load4
.L407:
	movl	-128(%ebp), %eax
	movl	140(%eax), %eax
	cmpl	%eax, %ecx
	jb	.L408
	movl	-128(%ebp), %eax
	movl	140(%eax), %eax
	cmpl	$5000, %eax
	jbe	.L409
	movl	httpd_err400form, %edx
	movl	httpd_err400title, %eax
	movl	$.LC48, 20(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC48, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$400, 4(%esp)
	movl	-128(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_send_err
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L404
.L409:
	movl	-128(%ebp), %eax
	addl	$140, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L411
	movl	%eax, (%esp)
	call	__asan_report_load4
.L411:
	movl	-128(%ebp), %eax
	movl	140(%eax), %eax
	leal	1000(%eax), %ecx
	movl	-128(%ebp), %eax
	leal	140(%eax), %edx
	movl	-128(%ebp), %eax
	addl	$136, %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	httpd_realloc_str
.L408:
	movl	-128(%ebp), %eax
	addl	$140, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L412
	movl	%eax, (%esp)
	call	__asan_report_load4
.L412:
	movl	-128(%ebp), %eax
	movl	140(%eax), %eax
	movl	%eax, -140(%ebp)
	movl	-128(%ebp), %eax
	addl	$136, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L413
	movl	%eax, (%esp)
	call	__asan_report_load4
.L413:
	movl	-128(%ebp), %eax
	movl	136(%eax), %ebx
	movl	-128(%ebp), %eax
	addl	$144, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L414
	movl	%edx, (%esp)
	call	__asan_report_load4
.L414:
	movl	-128(%ebp), %eax
	movl	144(%eax), %eax
	addl	%eax, %ebx
	movl	-128(%ebp), %eax
	addl	$448, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L415
	movl	%edx, (%esp)
	call	__asan_report_load4
.L415:
	movl	-128(%ebp), %eax
	movl	448(%eax), %eax
	movl	-140(%ebp), %esi
	movl	%esi, 8(%esp)
	movl	%ebx, 4(%esp)
	movl	%eax, (%esp)
	call	read
	movl	%eax, -124(%ebp)
	cmpl	$0, -124(%ebp)
	jne	.L416
	movl	httpd_err400form, %edx
	movl	httpd_err400title, %eax
	movl	$.LC48, 20(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC48, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$400, 4(%esp)
	movl	-128(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_send_err
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L404
.L416:
	cmpl	$0, -124(%ebp)
	jns	.L417
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L418
	movl	%eax, (%esp)
	call	__asan_report_load4
.L418:
	movl	(%edx), %eax
	cmpl	$4, %eax
	je	.L419
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L420
	movl	%eax, (%esp)
	call	__asan_report_load4
.L420:
	movl	(%edx), %eax
	cmpl	$11, %eax
	je	.L419
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L421
	movl	%eax, (%esp)
	call	__asan_report_load4
.L421:
	movl	(%edx), %eax
	cmpl	$11, %eax
	jne	.L422
.L419:
	jmp	.L404
.L422:
	movl	httpd_err400form, %edx
	movl	httpd_err400title, %eax
	movl	$.LC48, 20(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC48, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$400, 4(%esp)
	movl	-128(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_send_err
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L404
.L417:
	movl	-128(%ebp), %eax
	addl	$144, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L423
	movl	%eax, (%esp)
	call	__asan_report_load4
.L423:
	movl	-128(%ebp), %eax
	movl	144(%eax), %edx
	movl	-124(%ebp), %eax
	addl	%eax, %edx
	movl	-128(%ebp), %eax
	movl	%edx, 144(%eax)
	movl	12(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L424
	movl	%eax, (%esp)
	call	__asan_report_load4
.L424:
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	8(%ebp), %eax
	addl	$68, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L425
	movl	%eax, (%esp)
	call	__asan_report_store4
.L425:
	movl	8(%ebp), %eax
	movl	%ecx, 68(%eax)
	movl	-128(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_got_request
	testl	%eax, %eax
	je	.L468
	cmpl	$2, %eax
	jne	.L467
	movl	httpd_err400form, %edx
	movl	httpd_err400title, %eax
	movl	$.LC48, 20(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC48, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$400, 4(%esp)
	movl	-128(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_send_err
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L404
.L467:
	movl	-128(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_parse_request
	testl	%eax, %eax
	jns	.L429
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L404
.L429:
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	check_throttles
	testl	%eax, %eax
	jne	.L430
	movl	-128(%ebp), %eax
	addl	$172, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L431
	movl	%eax, (%esp)
	call	__asan_report_load4
.L431:
	movl	-128(%ebp), %eax
	movl	172(%eax), %ecx
	movl	httpd_err503form, %edx
	movl	httpd_err503title, %eax
	movl	%ecx, 20(%esp)
	movl	%edx, 16(%esp)
	movl	$.LC48, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$503, 4(%esp)
	movl	-128(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_send_err
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L404
.L430:
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-128(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_start_request
	testl	%eax, %eax
	jns	.L432
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L404
.L432:
	movl	-128(%ebp), %eax
	addl	$336, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L433
	movl	%eax, (%esp)
	call	__asan_report_load4
.L433:
	movl	-128(%ebp), %eax
	movl	336(%eax), %eax
	testl	%eax, %eax
	je	.L434
	movl	-128(%ebp), %eax
	addl	$344, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L435
	movl	%eax, (%esp)
	call	__asan_report_load4
.L435:
	movl	-128(%ebp), %eax
	movl	344(%eax), %ecx
	movl	8(%ebp), %eax
	addl	$92, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L436
	movl	%eax, (%esp)
	call	__asan_report_store4
.L436:
	movl	8(%ebp), %eax
	movl	%ecx, 92(%eax)
	movl	-128(%ebp), %eax
	addl	$348, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L437
	movl	%eax, (%esp)
	call	__asan_report_load4
.L437:
	movl	-128(%ebp), %eax
	movl	348(%eax), %eax
	leal	1(%eax), %ecx
	movl	8(%ebp), %eax
	addl	$88, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L438
	movl	%eax, (%esp)
	call	__asan_report_store4
.L438:
	movl	8(%ebp), %eax
	movl	%ecx, 88(%eax)
	jmp	.L439
.L434:
	movl	-128(%ebp), %eax
	addl	$164, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L440
	movl	%eax, (%esp)
	call	__asan_report_load4
.L440:
	movl	-128(%ebp), %eax
	movl	164(%eax), %eax
	testl	%eax, %eax
	jns	.L441
	movl	8(%ebp), %eax
	addl	$88, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L442
	movl	%eax, (%esp)
	call	__asan_report_store4
.L442:
	movl	8(%ebp), %eax
	movl	$0, 88(%eax)
	jmp	.L439
.L441:
	movl	-128(%ebp), %eax
	addl	$164, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L443
	movl	%eax, (%esp)
	call	__asan_report_load4
.L443:
	movl	-128(%ebp), %eax
	movl	164(%eax), %ecx
	movl	8(%ebp), %eax
	addl	$88, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L444
	movl	%eax, (%esp)
	call	__asan_report_store4
.L444:
	movl	8(%ebp), %eax
	movl	%ecx, 88(%eax)
.L439:
	movl	-128(%ebp), %eax
	addl	$452, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L445
	movl	%eax, (%esp)
	call	__asan_report_load4
.L445:
	movl	-128(%ebp), %eax
	movl	452(%eax), %eax
	testl	%eax, %eax
	jne	.L446
	movl	$0, -132(%ebp)
	jmp	.L447
.L453:
	movl	throttles, %ecx
	movl	-132(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	addl	$12, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L448
	movl	%eax, (%esp)
	call	__asan_report_load4
.L448:
	movl	8(%ebp), %eax
	movl	-132(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	movl	%eax, -140(%ebp)
	movl	throttles, %ecx
	movl	8(%ebp), %eax
	movl	-132(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%eax, %ecx
	leal	16(%ecx), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ebx
	testb	%bl, %bl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%bl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L449
	movl	%edx, (%esp)
	call	__asan_report_load4
.L449:
	movl	16(%ecx), %ebx
	movl	-128(%ebp), %eax
	addl	$168, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L450
	movl	%edx, (%esp)
	call	__asan_report_load4
.L450:
	movl	-128(%ebp), %eax
	movl	168(%eax), %eax
	addl	%eax, %ebx
	movl	-140(%ebp), %eax
	addl	$16, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L451
	movl	%edx, (%esp)
	call	__asan_report_store4
.L451:
	movl	-140(%ebp), %eax
	movl	%ebx, 16(%eax)
	addl	$1, -132(%ebp)
.L447:
	movl	8(%ebp), %eax
	addl	$52, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L452
	movl	%eax, (%esp)
	call	__asan_report_load4
.L452:
	movl	8(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	-132(%ebp), %eax
	jg	.L453
	movl	-128(%ebp), %eax
	addl	$168, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L454
	movl	%eax, (%esp)
	call	__asan_report_load4
.L454:
	movl	-128(%ebp), %eax
	movl	168(%eax), %ecx
	movl	8(%ebp), %eax
	addl	$92, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L455
	movl	%eax, (%esp)
	call	__asan_report_store4
.L455:
	movl	8(%ebp), %eax
	movl	%ecx, 92(%eax)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L404
.L446:
	movl	8(%ebp), %eax
	addl	$92, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L456
	movl	%eax, (%esp)
	call	__asan_report_load4
.L456:
	movl	8(%ebp), %eax
	movl	92(%eax), %ecx
	movl	8(%ebp), %eax
	addl	$88, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L457
	movl	%eax, (%esp)
	call	__asan_report_load4
.L457:
	movl	8(%ebp), %eax
	movl	88(%eax), %eax
	cmpl	%eax, %ecx
	jl	.L458
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L404
.L458:
	movl	8(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L459
	movl	%eax, (%esp)
	call	__asan_report_store4
.L459:
	movl	8(%ebp), %eax
	movl	$2, (%eax)
	movl	12(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L460
	movl	%eax, (%esp)
	call	__asan_report_load4
.L460:
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	8(%ebp), %eax
	addl	$64, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L461
	movl	%eax, (%esp)
	call	__asan_report_store4
.L461:
	movl	8(%ebp), %eax
	movl	%ecx, 64(%eax)
	movl	8(%ebp), %eax
	addl	$80, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L462
	movl	%eax, (%esp)
	call	__asan_report_store4
.L462:
	movl	8(%ebp), %eax
	movl	$0, 80(%eax)
	leal	-88(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L463
	movl	%eax, (%esp)
	call	__asan_report_store4
.L463:
	movl	8(%ebp), %eax
	movl	%eax, -88(%ebp)
	movl	-128(%ebp), %eax
	addl	$448, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L464
	movl	%eax, (%esp)
	call	__asan_report_load4
.L464:
	movl	-128(%ebp), %eax
	movl	448(%eax), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
	movl	-128(%ebp), %eax
	addl	$448, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L465
	movl	%eax, (%esp)
	call	__asan_report_load4
.L465:
	movl	-128(%ebp), %eax
	movl	448(%eax), %eax
	movl	$1, 8(%esp)
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fdwatch_add_fd
	jmp	.L404
.L468:
	nop
.L404:
	movl	$0, (%edi)
	movl	$0, 4(%edi)
	movl	$0, 8(%edi)
	addl	$156, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE18:
	.size	handle_read, .-handle_read
	.section	.rodata
	.align 4
.LC127:
	.string	"handle_send 2 32 4 11 client_data 96 16 2 iv "
	.align 32
.LC128:
	.string	"replacing non-null wakeup_timer!"
	.zero	63
	.align 32
.LC129:
	.string	"tmr_create(wakeup_connection) failed"
	.zero	59
	.align 32
.LC130:
	.string	"write - %m sending %.80s"
	.zero	39
	.text
	.type	handle_send, @function
handle_send:
.LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$252, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	leal	-184(%ebp), %eax
	movl	$1102416563, (%eax)
	movl	$.LC127, 4(%eax)
	shrl	$3, %eax
	addl	$536870912, %eax
	movl	%eax, -232(%ebp)
	movl	$-235802127, (%eax)
	movl	$-185273340, 4(%eax)
	movl	$-218959118, 8(%eax)
	movl	$-185335808, 12(%eax)
	movl	$-202116109, 16(%eax)
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L470
	movl	%eax, (%esp)
	call	__asan_report_load4
.L470:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -196(%ebp)
	movl	8(%ebp), %eax
	addl	$56, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L471
	movl	%eax, (%esp)
	call	__asan_report_load4
.L471:
	movl	8(%ebp), %eax
	movl	56(%eax), %eax
	cmpl	$-1, %eax
	jne	.L472
	movl	$1000000000, -212(%ebp)
	jmp	.L473
.L472:
	movl	8(%ebp), %eax
	addl	$56, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L474
	movl	%eax, (%esp)
	call	__asan_report_load4
.L474:
	movl	8(%ebp), %eax
	movl	56(%eax), %eax
	leal	3(%eax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$2, %eax
	movl	%eax, -212(%ebp)
.L473:
	movl	-196(%ebp), %eax
	addl	$304, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L475
	movl	%eax, (%esp)
	call	__asan_report_load4
.L475:
	movl	-196(%ebp), %eax
	movl	304(%eax), %eax
	testl	%eax, %eax
	jne	.L476
	movl	8(%ebp), %eax
	addl	$88, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L477
	movl	%eax, (%esp)
	call	__asan_report_load4
.L477:
	movl	8(%ebp), %eax
	movl	88(%eax), %ecx
	movl	8(%ebp), %eax
	addl	$92, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L478
	movl	%eax, (%esp)
	call	__asan_report_load4
.L478:
	movl	8(%ebp), %eax
	movl	92(%eax), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	movl	-212(%ebp), %eax
	cmpl	%eax, %edx
	cmovbe	%edx, %eax
	movl	%eax, %esi
	movl	-196(%ebp), %eax
	addl	$452, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L479
	movl	%eax, (%esp)
	call	__asan_report_load4
.L479:
	movl	-196(%ebp), %eax
	movl	452(%eax), %edx
	movl	8(%ebp), %eax
	movl	92(%eax), %eax
	leal	(%edx,%eax), %ebx
	movl	-196(%ebp), %eax
	addl	$448, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %edi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%edi, %eax
	testb	%al, %al
	je	.L480
	movl	%edx, (%esp)
	call	__asan_report_load4
.L480:
	movl	-196(%ebp), %eax
	movl	448(%eax), %eax
	movl	%esi, 8(%esp)
	movl	%ebx, 4(%esp)
	movl	%eax, (%esp)
	call	write
	movl	%eax, -208(%ebp)
	jmp	.L481
.L476:
	movl	-196(%ebp), %eax
	addl	$252, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L482
	movl	%eax, (%esp)
	call	__asan_report_load4
.L482:
	movl	-196(%ebp), %eax
	movl	252(%eax), %ecx
	leal	-88(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L483
	movl	%eax, (%esp)
	call	__asan_report_store4
.L483:
	movl	%ecx, -88(%ebp)
	movl	-196(%ebp), %eax
	addl	$304, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L484
	movl	%eax, (%esp)
	call	__asan_report_load4
.L484:
	movl	-196(%ebp), %eax
	movl	304(%eax), %ecx
	leal	-88(%ebp), %eax
	addl	$4, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L485
	movl	%eax, (%esp)
	call	__asan_report_store4
.L485:
	movl	%ecx, -84(%ebp)
	movl	-196(%ebp), %eax
	addl	$452, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L486
	movl	%eax, (%esp)
	call	__asan_report_load4
.L486:
	movl	-196(%ebp), %eax
	movl	452(%eax), %ecx
	movl	8(%ebp), %eax
	addl	$92, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L487
	movl	%eax, (%esp)
	call	__asan_report_load4
.L487:
	movl	8(%ebp), %eax
	movl	92(%eax), %eax
	addl	%eax, %ecx
	leal	-88(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L488
	movl	%eax, (%esp)
	call	__asan_report_store4
.L488:
	movl	%ecx, -80(%ebp)
	movl	8(%ebp), %eax
	addl	$88, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L489
	movl	%eax, (%esp)
	call	__asan_report_load4
.L489:
	movl	8(%ebp), %eax
	movl	88(%eax), %edx
	movl	8(%ebp), %eax
	movl	92(%eax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	movl	-212(%ebp), %eax
	cmpl	%eax, %edx
	cmovbe	%edx, %eax
	movl	%eax, %ecx
	leal	-88(%ebp), %eax
	addl	$12, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L490
	movl	%eax, (%esp)
	call	__asan_report_store4
.L490:
	movl	%ecx, -76(%ebp)
	movl	-196(%ebp), %eax
	addl	$448, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L491
	movl	%eax, (%esp)
	call	__asan_report_load4
.L491:
	movl	-196(%ebp), %eax
	movl	448(%eax), %eax
	movl	$2, 8(%esp)
	leal	-88(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	writev
	movl	%eax, -208(%ebp)
.L481:
	cmpl	$0, -208(%ebp)
	jns	.L492
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L493
	movl	%eax, (%esp)
	call	__asan_report_load4
.L493:
	movl	(%edx), %eax
	cmpl	$4, %eax
	jne	.L492
	jmp	.L469
.L492:
	cmpl	$0, -208(%ebp)
	je	.L495
	cmpl	$0, -208(%ebp)
	jns	.L496
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L497
	movl	%eax, (%esp)
	call	__asan_report_load4
.L497:
	movl	(%edx), %eax
	cmpl	$11, %eax
	je	.L495
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L498
	movl	%eax, (%esp)
	call	__asan_report_load4
.L498:
	movl	(%edx), %eax
	cmpl	$11, %eax
	jne	.L496
.L495:
	movl	8(%ebp), %eax
	addl	$80, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L499
	movl	%eax, (%esp)
	call	__asan_report_load4
.L499:
	movl	8(%ebp), %eax
	movl	80(%eax), %eax
	leal	100(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 80(%eax)
	movl	8(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L500
	movl	%eax, (%esp)
	call	__asan_report_store4
.L500:
	movl	8(%ebp), %eax
	movl	$3, (%eax)
	movl	-196(%ebp), %eax
	addl	$448, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L501
	movl	%eax, (%esp)
	call	__asan_report_load4
.L501:
	movl	-196(%ebp), %eax
	movl	448(%eax), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
	leal	-152(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L502
	movl	%eax, (%esp)
	call	__asan_report_store4
.L502:
	movl	8(%ebp), %eax
	movl	%eax, -152(%ebp)
	movl	8(%ebp), %eax
	addl	$72, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L503
	movl	%eax, (%esp)
	call	__asan_report_load4
.L503:
	movl	8(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	je	.L504
	movl	$.LC128, 4(%esp)
	movl	$3, (%esp)
	call	syslog
.L504:
	movl	8(%ebp), %eax
	addl	$80, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L505
	movl	%eax, (%esp)
	call	__asan_report_load4
.L505:
	movl	8(%ebp), %eax
	movl	80(%eax), %eax
	movl	$0, 16(%esp)
	movl	%eax, 12(%esp)
	movl	-152(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$wakeup_connection, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	tmr_create
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	addl	$72, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L506
	movl	%eax, (%esp)
	call	__asan_report_store4
.L506:
	movl	8(%ebp), %eax
	movl	%ecx, 72(%eax)
	movl	8(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	jne	.L507
	movl	$.LC129, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L507:
	jmp	.L469
.L496:
	cmpl	$0, -208(%ebp)
	jns	.L508
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L509
	movl	%eax, (%esp)
	call	__asan_report_load4
.L509:
	movl	(%edx), %eax
	cmpl	$32, %eax
	je	.L510
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L511
	movl	%eax, (%esp)
	call	__asan_report_load4
.L511:
	movl	(%edx), %eax
	cmpl	$22, %eax
	je	.L510
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L512
	movl	%eax, (%esp)
	call	__asan_report_load4
.L512:
	movl	(%edx), %eax
	cmpl	$104, %eax
	je	.L510
	movl	-196(%ebp), %eax
	addl	$172, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L513
	movl	%eax, (%esp)
	call	__asan_report_load4
.L513:
	movl	-196(%ebp), %eax
	movl	172(%eax), %eax
	movl	%eax, 8(%esp)
	movl	$.LC130, 4(%esp)
	movl	$3, (%esp)
	call	syslog
.L510:
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	clear_connection
	jmp	.L469
.L508:
	movl	12(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L514
	movl	%eax, (%esp)
	call	__asan_report_load4
.L514:
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	8(%ebp), %eax
	addl	$68, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L515
	movl	%eax, (%esp)
	call	__asan_report_store4
.L515:
	movl	8(%ebp), %eax
	movl	%ecx, 68(%eax)
	movl	-196(%ebp), %eax
	addl	$304, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L516
	movl	%eax, (%esp)
	call	__asan_report_load4
.L516:
	movl	-196(%ebp), %eax
	movl	304(%eax), %eax
	testl	%eax, %eax
	je	.L517
	movl	-208(%ebp), %edx
	movl	-196(%ebp), %eax
	movl	304(%eax), %eax
	cmpl	%eax, %edx
	jae	.L518
	movl	-196(%ebp), %eax
	movl	304(%eax), %edx
	movl	-208(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -192(%ebp)
	movl	-192(%ebp), %edi
	movl	-196(%ebp), %eax
	addl	$252, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L519
	movl	%eax, (%esp)
	call	__asan_report_load4
.L519:
	movl	-196(%ebp), %eax
	movl	252(%eax), %edx
	movl	-208(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, %ebx
	movl	%ebx, -224(%ebp)
	movl	-196(%ebp), %eax
	movl	252(%eax), %eax
	movl	%eax, -220(%ebp)
	testl	%edi, %edi
	je	.L520
	movl	%ebx, %esi
	movl	%esi, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%esi, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%eax, %ecx
	movb	%cl, -225(%ebp)
	leal	-1(%edi), %eax
	addl	%ebx, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L521
	movl	%ecx, (%esp)
	call	__asan_report_load1
.L521:
	cmpb	$0, -225(%ebp)
	je	.L520
	movl	%esi, (%esp)
	call	__asan_report_load1
.L520:
	testl	%edi, %edi
	je	.L522
	movl	-220(%ebp), %ebx
	movl	%ebx, %esi
	movl	%esi, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%esi, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%eax, %ecx
	movb	%cl, -225(%ebp)
	leal	-1(%edi), %eax
	addl	%ebx, %eax
	movl	%eax, %ecx
	movl	%ecx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ecx, %eax
	andl	$7, %eax
	cmpb	%dl, %al
	setge	%al
	andl	%ebx, %eax
	testb	%al, %al
	je	.L523
	movl	%ecx, (%esp)
	call	__asan_report_store1
.L523:
	cmpb	$0, -225(%ebp)
	je	.L522
	movl	%esi, (%esp)
	call	__asan_report_store1
.L522:
	movl	%edi, 8(%esp)
	movl	-224(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-220(%ebp), %eax
	movl	%eax, (%esp)
	call	memmove
	movl	-192(%ebp), %edx
	movl	-196(%ebp), %eax
	movl	%edx, 304(%eax)
	movl	$0, -208(%ebp)
	jmp	.L517
.L518:
	movl	-208(%ebp), %ecx
	movl	-196(%ebp), %eax
	addl	$304, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L524
	movl	%eax, (%esp)
	call	__asan_report_load4
.L524:
	movl	-196(%ebp), %eax
	movl	304(%eax), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -208(%ebp)
	movl	-196(%ebp), %eax
	movl	$0, 304(%eax)
.L517:
	movl	8(%ebp), %eax
	addl	$92, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L525
	movl	%eax, (%esp)
	call	__asan_report_load4
.L525:
	movl	8(%ebp), %eax
	movl	92(%eax), %edx
	movl	-208(%ebp), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 92(%eax)
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L526
	movl	%eax, (%esp)
	call	__asan_report_load4
.L526:
	movl	8(%ebp), %eax
	movl	8(%eax), %esi
	movl	8(%ebp), %eax
	movl	8(%eax), %ecx
	leal	168(%ecx), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ebx
	testb	%bl, %bl
	setne	%al
	movl	%eax, %edi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%bl, %al
	setge	%al
	andl	%edi, %eax
	testb	%al, %al
	je	.L527
	movl	%edx, (%esp)
	call	__asan_report_load4
.L527:
	movl	168(%ecx), %edx
	movl	-208(%ebp), %eax
	leal	(%edx,%eax), %ebx
	leal	168(%esi), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %edi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%edi, %eax
	testb	%al, %al
	je	.L528
	movl	%edx, (%esp)
	call	__asan_report_store4
.L528:
	movl	%ebx, 168(%esi)
	movl	$0, -200(%ebp)
	jmp	.L529
.L534:
	movl	throttles, %ecx
	movl	-200(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	addl	$12, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L530
	movl	%eax, (%esp)
	call	__asan_report_load4
.L530:
	movl	8(%ebp), %eax
	movl	-200(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edi
	movl	throttles, %ecx
	movl	8(%ebp), %eax
	movl	-200(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%eax, %ecx
	leal	16(%ecx), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ebx
	testb	%bl, %bl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%bl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L531
	movl	%edx, (%esp)
	call	__asan_report_load4
.L531:
	movl	16(%ecx), %edx
	movl	-208(%ebp), %eax
	leal	(%edx,%eax), %ebx
	leal	16(%edi), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L532
	movl	%edx, (%esp)
	call	__asan_report_store4
.L532:
	movl	%ebx, 16(%edi)
	addl	$1, -200(%ebp)
.L529:
	movl	8(%ebp), %eax
	addl	$52, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L533
	movl	%eax, (%esp)
	call	__asan_report_load4
.L533:
	movl	8(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	-200(%ebp), %eax
	jg	.L534
	movl	8(%ebp), %eax
	addl	$92, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L535
	movl	%eax, (%esp)
	call	__asan_report_load4
.L535:
	movl	8(%ebp), %eax
	movl	92(%eax), %ecx
	movl	8(%ebp), %eax
	addl	$88, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L536
	movl	%eax, (%esp)
	call	__asan_report_load4
.L536:
	movl	8(%ebp), %eax
	movl	88(%eax), %eax
	cmpl	%eax, %ecx
	jl	.L537
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L469
.L537:
	movl	8(%ebp), %eax
	addl	$80, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L538
	movl	%eax, (%esp)
	call	__asan_report_load4
.L538:
	movl	8(%ebp), %eax
	movl	80(%eax), %eax
	cmpl	$100, %eax
	jle	.L539
	movl	8(%ebp), %eax
	movl	80(%eax), %eax
	leal	-100(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 80(%eax)
.L539:
	movl	8(%ebp), %eax
	addl	$56, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L540
	movl	%eax, (%esp)
	call	__asan_report_load4
.L540:
	movl	8(%ebp), %eax
	movl	56(%eax), %eax
	cmpl	$-1, %eax
	je	.L469
	movl	12(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L542
	movl	%eax, (%esp)
	call	__asan_report_load4
.L542:
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	8(%ebp), %eax
	addl	$64, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L543
	movl	%eax, (%esp)
	call	__asan_report_load4
.L543:
	movl	8(%ebp), %eax
	movl	64(%eax), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -204(%ebp)
	cmpl	$0, -204(%ebp)
	jne	.L544
	movl	$1, -204(%ebp)
.L544:
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L545
	movl	%eax, (%esp)
	call	__asan_report_load4
.L545:
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	leal	168(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L546
	movl	%eax, (%esp)
	call	__asan_report_load4
.L546:
	movl	168(%edx), %eax
	cltd
	idivl	-204(%ebp)
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	addl	$56, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L547
	movl	%eax, (%esp)
	call	__asan_report_load4
.L547:
	movl	8(%ebp), %eax
	movl	56(%eax), %eax
	cmpl	%eax, %ecx
	jle	.L469
	movl	8(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L548
	movl	%eax, (%esp)
	call	__asan_report_store4
.L548:
	movl	8(%ebp), %eax
	movl	$3, (%eax)
	movl	-196(%ebp), %eax
	addl	$448, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L549
	movl	%eax, (%esp)
	call	__asan_report_load4
.L549:
	movl	-196(%ebp), %eax
	movl	448(%eax), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L550
	movl	%eax, (%esp)
	call	__asan_report_load4
.L550:
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	leal	168(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L551
	movl	%eax, (%esp)
	call	__asan_report_load4
.L551:
	movl	168(%edx), %ecx
	movl	8(%ebp), %eax
	addl	$56, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L552
	movl	%eax, (%esp)
	call	__asan_report_load4
.L552:
	movl	8(%ebp), %eax
	movl	56(%eax), %edi
	movl	%ecx, %eax
	cltd
	idivl	%edi
	subl	-204(%ebp), %eax
	movl	%eax, -188(%ebp)
	leal	-152(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L553
	movl	%eax, (%esp)
	call	__asan_report_store4
.L553:
	movl	8(%ebp), %eax
	movl	%eax, -152(%ebp)
	movl	8(%ebp), %eax
	addl	$72, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L554
	movl	%eax, (%esp)
	call	__asan_report_load4
.L554:
	movl	8(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	je	.L555
	movl	$.LC128, 4(%esp)
	movl	$3, (%esp)
	call	syslog
.L555:
	cmpl	$0, -188(%ebp)
	jle	.L556
	movl	-188(%ebp), %eax
	imull	$1000, %eax, %eax
	jmp	.L557
.L556:
	movl	$500, %eax
.L557:
	movl	$0, 16(%esp)
	movl	%eax, 12(%esp)
	movl	-152(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$wakeup_connection, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	tmr_create
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	addl	$72, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L558
	movl	%eax, (%esp)
	call	__asan_report_store4
.L558:
	movl	8(%ebp), %eax
	movl	%ecx, 72(%eax)
	movl	8(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	jne	.L469
	movl	$.LC129, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L469:
	movl	-232(%ebp), %eax
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	movl	$0, 8(%eax)
	movl	$0, 12(%eax)
	movl	$0, 16(%eax)
	addl	$252, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE19:
	.size	handle_send, .-handle_send
	.section	.rodata
	.align 4
.LC131:
	.string	"handle_linger 1 32 4096 3 buf "
	.text
	.type	handle_linger, @function
handle_linger:
.LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$4252, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	8(%ebp), %eax
	movl	%eax, -4236(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, -4240(%ebp)
	leal	-4216(%ebp), %eax
	movl	$1102416563, (%eax)
	movl	$.LC131, 4(%eax)
	shrl	$3, %eax
	addl	$536870912, %eax
	movl	%eax, -4244(%ebp)
	movl	$-235802127, (%eax)
	movl	$-202116109, 516(%eax)
	movl	%gs:20, %eax
	movl	%eax, -28(%ebp)
	xorl	%eax, %eax
	movl	-4236(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%ecx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L561
	movl	%eax, (%esp)
	call	__asan_report_load4
.L561:
	movl	-4236(%ebp), %eax
	movl	8(%eax), %edx
	leal	448(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L562
	movl	%eax, (%esp)
	call	__asan_report_load4
.L562:
	movl	448(%edx), %eax
	movl	$4096, 8(%esp)
	leal	-4184(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	read
	movl	%eax, -4220(%ebp)
	cmpl	$0, -4220(%ebp)
	jns	.L563
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L564
	movl	%eax, (%esp)
	call	__asan_report_load4
.L564:
	movl	(%edx), %eax
	cmpl	$4, %eax
	je	.L560
	call	__errno_location
	movl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L566
	movl	%eax, (%esp)
	call	__asan_report_load4
.L566:
	movl	(%edx), %eax
	cmpl	$11, %eax
	je	.L560
.L563:
	cmpl	$0, -4220(%ebp)
	jg	.L560
	movl	-4240(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-4236(%ebp), %eax
	movl	%eax, (%esp)
	call	really_clear_connection
.L560:
	movl	-4244(%ebp), %eax
	movl	$0, (%eax)
	movl	$0, 516(%eax)
	movl	-28(%ebp), %eax
	xorl	%gs:20, %eax
	je	.L569
	call	__stack_chk_fail
.L569:
	addl	$4252, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE20:
	.size	handle_linger, .-handle_linger
	.section	.rodata
	.align 32
.LC132:
	.string	"throttle sending count was negative - shouldn't happen!"
	.zero	40
	.text
	.type	check_throttles, @function
check_throttles:
.LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$44, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	8(%ebp), %eax
	addl	$52, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L571
	movl	%eax, (%esp)
	call	__asan_report_store4
.L571:
	movl	8(%ebp), %eax
	movl	$0, 52(%eax)
	movl	8(%ebp), %eax
	addl	$60, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L572
	movl	%eax, (%esp)
	call	__asan_report_store4
.L572:
	movl	8(%ebp), %eax
	movl	$-1, 60(%eax)
	movl	8(%ebp), %eax
	movl	60(%eax), %ecx
	movl	8(%ebp), %eax
	addl	$56, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L573
	movl	%eax, (%esp)
	call	__asan_report_store4
.L573:
	movl	8(%ebp), %eax
	movl	%ecx, 56(%eax)
	movl	$0, -32(%ebp)
	jmp	.L574
.L604:
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L575
	movl	%eax, (%esp)
	call	__asan_report_load4
.L575:
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	leal	188(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L576
	movl	%eax, (%esp)
	call	__asan_report_load4
.L576:
	movl	188(%edx), %eax
	movl	%eax, -44(%ebp)
	movl	throttles, %ecx
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L577
	movl	%eax, (%esp)
	call	__asan_report_load4
.L577:
	movl	(%ecx), %eax
	movl	-44(%ebp), %edi
	movl	%edi, 4(%esp)
	movl	%eax, (%esp)
	call	match
	testl	%eax, %eax
	je	.L578
	movl	throttles, %ecx
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	12(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L579
	movl	%eax, (%esp)
	call	__asan_report_load4
.L579:
	movl	12(%edx), %eax
	movl	%eax, -44(%ebp)
	movl	throttles, %ecx
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	4(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L580
	movl	%eax, (%esp)
	call	__asan_report_load4
.L580:
	movl	4(%edx), %eax
	addl	%eax, %eax
	cmpl	%eax, -44(%ebp)
	jle	.L581
	movl	$0, %eax
	jmp	.L582
.L581:
	movl	throttles, %ecx
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	12(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L583
	movl	%eax, (%esp)
	call	__asan_report_load4
.L583:
	movl	12(%edx), %eax
	movl	%eax, -44(%ebp)
	movl	throttles, %ecx
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	8(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L584
	movl	%eax, (%esp)
	call	__asan_report_load4
.L584:
	movl	8(%edx), %eax
	cmpl	%eax, -44(%ebp)
	jge	.L585
	movl	$0, %eax
	jmp	.L582
.L585:
	movl	throttles, %ecx
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	20(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L586
	movl	%eax, (%esp)
	call	__asan_report_load4
.L586:
	movl	20(%edx), %eax
	testl	%eax, %eax
	jns	.L587
	movl	$.LC132, 4(%esp)
	movl	$3, (%esp)
	call	syslog
	movl	throttles, %ecx
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	20(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L588
	movl	%eax, (%esp)
	call	__asan_report_store4
.L588:
	movl	$0, 20(%edx)
.L587:
	movl	8(%ebp), %eax
	addl	$52, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L589
	movl	%eax, (%esp)
	call	__asan_report_load4
.L589:
	movl	8(%ebp), %eax
	movl	52(%eax), %eax
	leal	1(%eax), %ecx
	movl	8(%ebp), %edx
	movl	%ecx, 52(%edx)
	leal	0(,%eax,4), %ecx
	movl	8(%ebp), %edx
	addl	%ecx, %edx
	addl	$12, %edx
	movl	%edx, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%edx, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L590
	movl	%edx, (%esp)
	call	__asan_report_store4
.L590:
	movl	8(%ebp), %edx
	movl	-32(%ebp), %ecx
	movl	%ecx, 12(%edx,%eax,4)
	movl	throttles, %ecx
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	leal	20(%eax), %edx
	movl	%edx, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%edx, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L591
	movl	%edx, (%esp)
	call	__asan_report_load4
.L591:
	movl	20(%eax), %edx
	addl	$1, %edx
	movl	%edx, 20(%eax)
	movl	throttles, %ecx
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	4(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L592
	movl	%eax, (%esp)
	call	__asan_report_load4
.L592:
	movl	4(%edx), %eax
	movl	%eax, -44(%ebp)
	movl	throttles, %ecx
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	20(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L593
	movl	%eax, (%esp)
	call	__asan_report_load4
.L593:
	movl	20(%edx), %edi
	movl	-44(%ebp), %eax
	cltd
	idivl	%edi
	movl	%eax, -28(%ebp)
	movl	8(%ebp), %eax
	addl	$56, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L594
	movl	%eax, (%esp)
	call	__asan_report_load4
.L594:
	movl	8(%ebp), %eax
	movl	56(%eax), %eax
	cmpl	$-1, %eax
	jne	.L595
	movl	8(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	%edx, 56(%eax)
	jmp	.L596
.L595:
	movl	8(%ebp), %eax
	addl	$56, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L597
	movl	%eax, (%esp)
	call	__asan_report_load4
.L597:
	movl	8(%ebp), %eax
	movl	56(%eax), %edx
	movl	-28(%ebp), %eax
	cmpl	%eax, %edx
	cmovg	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 56(%eax)
.L596:
	movl	throttles, %ecx
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	8(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L598
	movl	%eax, (%esp)
	call	__asan_report_load4
.L598:
	movl	8(%edx), %eax
	movl	%eax, -28(%ebp)
	movl	8(%ebp), %eax
	addl	$60, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L599
	movl	%eax, (%esp)
	call	__asan_report_load4
.L599:
	movl	8(%ebp), %eax
	movl	60(%eax), %eax
	cmpl	$-1, %eax
	jne	.L600
	movl	8(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	%edx, 60(%eax)
	jmp	.L578
.L600:
	movl	8(%ebp), %eax
	addl	$60, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L601
	movl	%eax, (%esp)
	call	__asan_report_load4
.L601:
	movl	8(%ebp), %eax
	movl	60(%eax), %edx
	movl	-28(%ebp), %eax
	cmpl	%eax, %edx
	cmovl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 60(%eax)
.L578:
	addl	$1, -32(%ebp)
.L574:
	movl	numthrottles, %eax
	cmpl	%eax, -32(%ebp)
	jge	.L602
	movl	8(%ebp), %eax
	addl	$52, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L603
	movl	%eax, (%esp)
	call	__asan_report_load4
.L603:
	movl	8(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	$9, %eax
	jle	.L604
.L602:
	movl	$1, %eax
.L582:
	addl	$44, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE21:
	.size	check_throttles, .-check_throttles
	.type	clear_throttles, @function
clear_throttles:
.LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$32, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	movl	$0, -12(%ebp)
	jmp	.L606
.L610:
	movl	throttles, %ecx
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	addl	$12, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L607
	movl	%eax, (%esp)
	call	__asan_report_load4
.L607:
	movl	8(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%ecx, %eax
	leal	20(%eax), %edx
	movl	%edx, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%edx, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L608
	movl	%edx, (%esp)
	call	__asan_report_load4
.L608:
	movl	20(%eax), %edx
	subl	$1, %edx
	movl	%edx, 20(%eax)
	addl	$1, -12(%ebp)
.L606:
	movl	8(%ebp), %eax
	addl	$52, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L609
	movl	%eax, (%esp)
	call	__asan_report_load4
.L609:
	movl	8(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	-12(%ebp), %eax
	jg	.L610
	addl	$32, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE22:
	.size	clear_throttles, .-clear_throttles
	.section	.rodata
	.align 32
.LC133:
	.string	"throttle #%d '%.80s' rate %ld greatly exceeding limit %ld; %d sending"
	.zero	58
	.align 32
.LC134:
	.string	"throttle #%d '%.80s' rate %ld exceeding limit %ld; %d sending"
	.zero	34
	.align 32
.LC135:
	.string	"throttle #%d '%.80s' rate %ld lower than minimum %ld; %d sending"
	.zero	63
	.text
	.type	update_throttles, @function
update_throttles:
.LFB23:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$92, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	$0, -44(%ebp)
	jmp	.L612
.L640:
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edi
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	12(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L613
	movl	%eax, (%esp)
	call	__asan_report_load4
.L613:
	movl	12(%edx), %eax
	leal	(%eax,%eax), %esi
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%eax, %ecx
	leal	16(%ecx), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ebx
	testb	%bl, %bl
	setne	-60(%ebp)
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%bl, %al
	setge	%al
	andb	-60(%ebp), %al
	testb	%al, %al
	je	.L614
	movl	%edx, (%esp)
	call	__asan_report_load4
.L614:
	movl	16(%ecx), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	leal	(%esi,%eax), %ecx
	movl	$1431655766, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %ecx
	leal	12(%edi), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L615
	movl	%eax, (%esp)
	call	__asan_report_store4
.L615:
	movl	%ecx, 12(%edi)
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	16(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L616
	movl	%eax, (%esp)
	call	__asan_report_store4
.L616:
	movl	$0, 16(%edx)
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	12(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L617
	movl	%eax, (%esp)
	call	__asan_report_load4
.L617:
	movl	12(%edx), %eax
	movl	%eax, -60(%ebp)
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	4(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L618
	movl	%eax, (%esp)
	call	__asan_report_load4
.L618:
	movl	4(%edx), %eax
	cmpl	%eax, -60(%ebp)
	jle	.L619
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	20(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L620
	movl	%eax, (%esp)
	call	__asan_report_load4
.L620:
	movl	20(%edx), %eax
	testl	%eax, %eax
	je	.L619
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	12(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L621
	movl	%eax, (%esp)
	call	__asan_report_load4
.L621:
	movl	12(%edx), %eax
	movl	%eax, -60(%ebp)
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	4(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L622
	movl	%eax, (%esp)
	call	__asan_report_load4
.L622:
	movl	4(%edx), %eax
	addl	%eax, %eax
	cmpl	%eax, -60(%ebp)
	jle	.L623
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	20(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L624
	movl	%eax, (%esp)
	call	__asan_report_load4
.L624:
	movl	20(%edx), %eax
	movl	%eax, -60(%ebp)
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	4(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L625
	movl	%eax, (%esp)
	call	__asan_report_load4
.L625:
	movl	4(%edx), %eax
	movl	%eax, -64(%ebp)
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%eax, %ecx
	leal	12(%ecx), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ebx
	testb	%bl, %bl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%bl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L626
	movl	%edx, (%esp)
	call	__asan_report_load4
.L626:
	movl	12(%ecx), %esi
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %edi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%edi, %eax
	testb	%al, %al
	je	.L627
	movl	%edx, (%esp)
	call	__asan_report_load4
.L627:
	movl	(%ebx), %eax
	movl	-60(%ebp), %edi
	movl	%edi, 24(%esp)
	movl	-64(%ebp), %edi
	movl	%edi, 20(%esp)
	movl	%esi, 16(%esp)
	movl	%eax, 12(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC133, 4(%esp)
	movl	$5, (%esp)
	call	syslog
	jmp	.L619
.L623:
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	20(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L628
	movl	%eax, (%esp)
	call	__asan_report_load4
.L628:
	movl	20(%edx), %eax
	movl	%eax, -60(%ebp)
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	4(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L629
	movl	%eax, (%esp)
	call	__asan_report_load4
.L629:
	movl	4(%edx), %eax
	movl	%eax, -64(%ebp)
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%eax, %ecx
	leal	12(%ecx), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ebx
	testb	%bl, %bl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%bl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L630
	movl	%edx, (%esp)
	call	__asan_report_load4
.L630:
	movl	12(%ecx), %esi
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %edi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%edi, %eax
	testb	%al, %al
	je	.L631
	movl	%edx, (%esp)
	call	__asan_report_load4
.L631:
	movl	(%ebx), %eax
	movl	-60(%ebp), %edi
	movl	%edi, 24(%esp)
	movl	-64(%ebp), %edi
	movl	%edi, 20(%esp)
	movl	%esi, 16(%esp)
	movl	%eax, 12(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC134, 4(%esp)
	movl	$6, (%esp)
	call	syslog
.L619:
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	12(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L632
	movl	%eax, (%esp)
	call	__asan_report_load4
.L632:
	movl	12(%edx), %eax
	movl	%eax, -60(%ebp)
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	8(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L633
	movl	%eax, (%esp)
	call	__asan_report_load4
.L633:
	movl	8(%edx), %eax
	cmpl	%eax, -60(%ebp)
	jge	.L634
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	20(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L635
	movl	%eax, (%esp)
	call	__asan_report_load4
.L635:
	movl	20(%edx), %eax
	testl	%eax, %eax
	je	.L634
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	20(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L636
	movl	%eax, (%esp)
	call	__asan_report_load4
.L636:
	movl	20(%edx), %eax
	movl	%eax, -60(%ebp)
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	8(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L637
	movl	%eax, (%esp)
	call	__asan_report_load4
.L637:
	movl	8(%edx), %eax
	movl	%eax, -64(%ebp)
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	%eax, %ecx
	leal	12(%ecx), %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ebx
	testb	%bl, %bl
	setne	%al
	movl	%eax, %esi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%bl, %al
	setge	%al
	andl	%esi, %eax
	testb	%al, %al
	je	.L638
	movl	%edx, (%esp)
	call	__asan_report_load4
.L638:
	movl	12(%ecx), %esi
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %ebx
	movl	%ebx, %eax
	movl	%eax, %edx
	movl	%edx, %eax
	shrl	$3, %eax
	addl	$536870912, %eax
	movzbl	(%eax), %ecx
	testb	%cl, %cl
	setne	%al
	movl	%eax, %edi
	movl	%edx, %eax
	andl	$7, %eax
	addl	$3, %eax
	cmpb	%cl, %al
	setge	%al
	andl	%edi, %eax
	testb	%al, %al
	je	.L639
	movl	%edx, (%esp)
	call	__asan_report_load4
.L639:
	movl	(%ebx), %eax
	movl	-60(%ebp), %edi
	movl	%edi, 24(%esp)
	movl	-64(%ebp), %edi
	movl	%edi, 20(%esp)
	movl	%esi, 16(%esp)
	movl	%eax, 12(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC135, 4(%esp)
	movl	$5, (%esp)
	call	syslog
.L634:
	addl	$1, -44(%ebp)
.L612:
	movl	numthrottles, %eax
	cmpl	%eax, -44(%ebp)
	jl	.L640
	movl	$0, -36(%ebp)
	jmp	.L641
.L656:
	movl	connects, %ecx
	movl	-36(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	addl	%ecx, %eax
	movl	%eax, -32(%ebp)
	movl	-32(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L642
	movl	%eax, (%esp)
	call	__asan_report_load4
.L642:
	movl	-32(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	je	.L643
	movl	-32(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	jne	.L644
.L643:
	movl	-32(%ebp), %eax
	addl	$56, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L645
	movl	%eax, (%esp)
	call	__asan_report_store4
.L645:
	movl	-32(%ebp), %eax
	movl	$-1, 56(%eax)
	movl	$0, -40(%ebp)
	jmp	.L646
.L655:
	movl	-40(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	-32(%ebp), %eax
	addl	%edx, %eax
	addl	$12, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L647
	movl	%eax, (%esp)
	call	__asan_report_load4
.L647:
	movl	-32(%ebp), %eax
	movl	-40(%ebp), %edx
	movl	12(%eax,%edx,4), %eax
	movl	%eax, -44(%ebp)
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	4(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L648
	movl	%eax, (%esp)
	call	__asan_report_load4
.L648:
	movl	4(%edx), %eax
	movl	%eax, -60(%ebp)
	movl	throttles, %ecx
	movl	-44(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$3, %eax
	leal	(%ecx,%eax), %edx
	leal	20(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L649
	movl	%eax, (%esp)
	call	__asan_report_load4
.L649:
	movl	20(%edx), %edi
	movl	-60(%ebp), %eax
	cltd
	idivl	%edi
	movl	%eax, -28(%ebp)
	movl	-32(%ebp), %eax
	addl	$56, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L650
	movl	%eax, (%esp)
	call	__asan_report_load4
.L650:
	movl	-32(%ebp), %eax
	movl	56(%eax), %eax
	cmpl	$-1, %eax
	jne	.L651
	movl	-32(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	%edx, 56(%eax)
	jmp	.L652
.L651:
	movl	-32(%ebp), %eax
	addl	$56, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L653
	movl	%eax, (%esp)
	call	__asan_report_load4
.L653:
	movl	-32(%ebp), %eax
	movl	56(%eax), %edx
	movl	-28(%ebp), %eax
	cmpl	%eax, %edx
	cmovg	%eax, %edx
	movl	-32(%ebp), %eax
	movl	%edx, 56(%eax)
.L652:
	addl	$1, -40(%ebp)
.L646:
	movl	-32(%ebp), %eax
	addl	$52, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L654
	movl	%eax, (%esp)
	call	__asan_report_load4
.L654:
	movl	-32(%ebp), %eax
	movl	52(%eax), %eax
	cmpl	-40(%ebp), %eax
	jg	.L655
.L644:
	addl	$1, -36(%ebp)
.L641:
	movl	max_connects, %eax
	cmpl	%eax, -36(%ebp)
	jl	.L656
	addl	$92, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE23:
	.size	update_throttles, .-update_throttles
	.type	finish_connection, @function
finish_connection:
.LFB24:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L658
	movl	%eax, (%esp)
	call	__asan_report_load4
.L658:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	httpd_write_response
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	clear_connection
	addl	$20, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE24:
	.size	finish_connection, .-finish_connection
	.section	.rodata
	.align 4
.LC136:
	.string	"clear_connection 1 32 4 11 client_data "
	.align 32
.LC137:
	.string	"replacing non-null linger_timer!"
	.zero	63
	.align 32
.LC138:
	.string	"tmr_create(linger_clear_connection) failed"
	.zero	53
	.text
	.type	clear_connection, @function
clear_connection:
.LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$140, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	leal	-120(%ebp), %eax
	movl	$1102416563, (%eax)
	movl	$.LC136, 4(%eax)
	shrl	$3, %eax
	addl	$536870912, %eax
	movl	%eax, -124(%ebp)
	movl	$-235802127, (%eax)
	movl	$-185273340, 4(%eax)
	movl	$-202116109, 8(%eax)
	movl	8(%ebp), %eax
	addl	$72, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%ecx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L660
	movl	%eax, (%esp)
	call	__asan_report_load4
.L660:
	movl	8(%ebp), %eax
	movl	72(%eax), %eax
	testl	%eax, %eax
	je	.L661
	movl	8(%ebp), %eax
	movl	72(%eax), %eax
	movl	%eax, (%esp)
	call	tmr_cancel
	movl	8(%ebp), %eax
	addl	$72, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%ecx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L662
	movl	%eax, (%esp)
	call	__asan_report_store4
.L662:
	movl	8(%ebp), %eax
	movl	$0, 72(%eax)
.L661:
	movl	8(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%ecx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L663
	movl	%eax, (%esp)
	call	__asan_report_load4
.L663:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$4, %eax
	jne	.L664
	movl	8(%ebp), %eax
	addl	$76, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%ecx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L665
	movl	%eax, (%esp)
	call	__asan_report_load4
.L665:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	%eax, (%esp)
	call	tmr_cancel
	movl	8(%ebp), %eax
	addl	$76, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%ecx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L666
	movl	%eax, (%esp)
	call	__asan_report_store4
.L666:
	movl	8(%ebp), %eax
	movl	$0, 76(%eax)
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%ecx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L667
	movl	%eax, (%esp)
	call	__asan_report_load4
.L667:
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	leal	356(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L668
	movl	%eax, (%esp)
	call	__asan_report_store4
.L668:
	movl	$0, 356(%edx)
.L664:
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L669
	movl	%eax, (%esp)
	call	__asan_report_load4
.L669:
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	leal	356(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L670
	movl	%eax, (%esp)
	call	__asan_report_load4
.L670:
	movl	356(%edx), %eax
	testl	%eax, %eax
	je	.L671
	movl	8(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L672
	movl	%eax, (%esp)
	call	__asan_report_load4
.L672:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	je	.L673
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	leal	448(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L674
	movl	%eax, (%esp)
	call	__asan_report_load4
.L674:
	movl	448(%edx), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
.L673:
	movl	8(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L675
	movl	%eax, (%esp)
	call	__asan_report_store4
.L675:
	movl	8(%ebp), %eax
	movl	$4, (%eax)
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L676
	movl	%eax, (%esp)
	call	__asan_report_load4
.L676:
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	leal	448(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L677
	movl	%eax, (%esp)
	call	__asan_report_load4
.L677:
	movl	448(%edx), %eax
	movl	$1, 4(%esp)
	movl	%eax, (%esp)
	call	shutdown
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L678
	movl	%eax, (%esp)
	call	__asan_report_load4
.L678:
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	leal	448(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%edi, %ecx
	testb	%cl, %cl
	je	.L679
	movl	%eax, (%esp)
	call	__asan_report_load4
.L679:
	movl	448(%edx), %eax
	movl	$0, 8(%esp)
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fdwatch_add_fd
	leal	-88(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L680
	movl	%eax, (%esp)
	call	__asan_report_store4
.L680:
	movl	8(%ebp), %eax
	movl	%eax, -88(%ebp)
	movl	8(%ebp), %eax
	addl	$76, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L681
	movl	%eax, (%esp)
	call	__asan_report_load4
.L681:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	testl	%eax, %eax
	je	.L682
	movl	$.LC137, 4(%esp)
	movl	$3, (%esp)
	call	syslog
.L682:
	movl	$0, 16(%esp)
	movl	$500, 12(%esp)
	movl	-88(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$linger_clear_connection, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	tmr_create
	movl	%eax, %ecx
	movl	8(%ebp), %eax
	addl	$76, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L683
	movl	%eax, (%esp)
	call	__asan_report_store4
.L683:
	movl	8(%ebp), %eax
	movl	%ecx, 76(%eax)
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	testl	%eax, %eax
	jne	.L659
	movl	$.LC138, 4(%esp)
	movl	$2, (%esp)
	call	syslog
	call	__asan_handle_no_return
	movl	$1, (%esp)
	call	exit
.L671:
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	really_clear_connection
.L659:
	movl	-124(%ebp), %eax
	movl	$0, (%eax)
	movl	$0, 4(%eax)
	movl	$0, 8(%eax)
	addl	$140, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE25:
	.size	clear_connection, .-clear_connection
	.type	really_clear_connection, @function
really_clear_connection:
.LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L686
	movl	%eax, (%esp)
	call	__asan_report_load4
.L686:
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	leal	168(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L687
	movl	%eax, (%esp)
	call	__asan_report_load4
.L687:
	movl	168(%edx), %edx
	movl	stats_bytes, %eax
	addl	%edx, %eax
	movl	%eax, stats_bytes
	movl	8(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L688
	movl	%eax, (%esp)
	call	__asan_report_load4
.L688:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	je	.L689
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	leal	448(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L690
	movl	%eax, (%esp)
	call	__asan_report_load4
.L690:
	movl	448(%edx), %eax
	movl	%eax, (%esp)
	call	fdwatch_del_fd
.L689:
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L691
	movl	%eax, (%esp)
	call	__asan_report_load4
.L691:
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	httpd_close_conn
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	clear_throttles
	movl	8(%ebp), %eax
	addl	$76, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L692
	movl	%eax, (%esp)
	call	__asan_report_load4
.L692:
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	testl	%eax, %eax
	je	.L693
	movl	8(%ebp), %eax
	movl	76(%eax), %eax
	movl	%eax, (%esp)
	call	tmr_cancel
	movl	8(%ebp), %eax
	addl	$76, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L694
	movl	%eax, (%esp)
	call	__asan_report_store4
.L694:
	movl	8(%ebp), %eax
	movl	$0, 76(%eax)
.L693:
	movl	8(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L695
	movl	%eax, (%esp)
	call	__asan_report_store4
.L695:
	movl	8(%ebp), %eax
	movl	$0, (%eax)
	movl	first_free_connect, %ecx
	movl	8(%ebp), %eax
	addl	$4, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L696
	movl	%eax, (%esp)
	call	__asan_report_store4
.L696:
	movl	8(%ebp), %eax
	movl	%ecx, 4(%eax)
	movl	8(%ebp), %edx
	movl	connects, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sarl	$5, %eax
	imull	$-1431655765, %eax, %eax
	movl	%eax, first_free_connect
	movl	num_connects, %eax
	subl	$1, %eax
	movl	%eax, num_connects
	addl	$16, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE26:
	.size	really_clear_connection, .-really_clear_connection
	.section	.rodata
	.align 32
.LC139:
	.string	"%.80s connection timed out reading"
	.zero	61
	.align 32
.LC140:
	.string	"%.80s connection timed out sending"
	.zero	61
	.text
	.type	idle, @function
idle:
.LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	movl	$0, -32(%ebp)
	jmp	.L698
.L712:
	movl	connects, %ecx
	movl	-32(%ebp), %edx
	movl	%edx, %eax
	addl	%eax, %eax
	addl	%edx, %eax
	sall	$5, %eax
	addl	%ecx, %eax
	movl	%eax, -28(%ebp)
	movl	-28(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L699
	movl	%eax, (%esp)
	call	__asan_report_load4
.L699:
	movl	-28(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	je	.L701
	cmpl	$1, %eax
	jl	.L700
	cmpl	$3, %eax
	jg	.L700
	jmp	.L713
.L701:
	movl	12(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L703
	movl	%eax, (%esp)
	call	__asan_report_load4
.L703:
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-28(%ebp), %eax
	addl	$68, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L704
	movl	%eax, (%esp)
	call	__asan_report_load4
.L704:
	movl	-28(%ebp), %eax
	movl	68(%eax), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	cmpl	$59, %eax
	jle	.L705
	movl	-28(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L706
	movl	%eax, (%esp)
	call	__asan_report_load4
.L706:
	movl	-28(%ebp), %eax
	movl	8(%eax), %eax
	addl	$8, %eax
	movl	%eax, (%esp)
	call	httpd_ntoa
	movl	%eax, 8(%esp)
	movl	$.LC139, 4(%esp)
	movl	$6, (%esp)
	call	syslog
	movl	httpd_err408form, %ebx
	movl	httpd_err408title, %eax
	movl	%eax, -44(%ebp)
	movl	-28(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%ecx, %edi
	movl	%eax, %esi
	andl	$7, %esi
	addl	$3, %esi
	movl	%esi, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%edi, %edx
	testb	%dl, %dl
	je	.L707
	movl	%eax, (%esp)
	call	__asan_report_load4
.L707:
	movl	-28(%ebp), %eax
	movl	8(%eax), %eax
	movl	$.LC48, 20(%esp)
	movl	%ebx, 16(%esp)
	movl	$.LC48, 12(%esp)
	movl	-44(%ebp), %edi
	movl	%edi, 8(%esp)
	movl	$408, 4(%esp)
	movl	%eax, (%esp)
	call	httpd_send_err
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	finish_connection
	jmp	.L700
.L705:
	jmp	.L700
.L713:
	movl	12(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L708
	movl	%eax, (%esp)
	call	__asan_report_load4
.L708:
	movl	12(%ebp), %eax
	movl	(%eax), %ecx
	movl	-28(%ebp), %eax
	addl	$68, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%dl, %bl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L709
	movl	%eax, (%esp)
	call	__asan_report_load4
.L709:
	movl	-28(%ebp), %eax
	movl	68(%eax), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	cmpl	$299, %eax
	jle	.L710
	movl	-28(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L711
	movl	%eax, (%esp)
	call	__asan_report_load4
.L711:
	movl	-28(%ebp), %eax
	movl	8(%eax), %eax
	addl	$8, %eax
	movl	%eax, (%esp)
	call	httpd_ntoa
	movl	%eax, 8(%esp)
	movl	$.LC140, 4(%esp)
	movl	$6, (%esp)
	call	syslog
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	clear_connection
	jmp	.L714
.L710:
.L714:
	nop
.L700:
	addl	$1, -32(%ebp)
.L698:
	movl	max_connects, %eax
	cmpl	%eax, -32(%ebp)
	jl	.L712
	addl	$60, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE27:
	.size	idle, .-idle
	.type	wakeup_connection, @function
wakeup_connection:
.LFB28:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$32, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	leal	8(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L716
	movl	%eax, (%esp)
	call	__asan_report_load4
.L716:
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	addl	$72, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L717
	movl	%eax, (%esp)
	call	__asan_report_store4
.L717:
	movl	-12(%ebp), %eax
	movl	$0, 72(%eax)
	movl	-12(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L718
	movl	%eax, (%esp)
	call	__asan_report_load4
.L718:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	jne	.L715
	movl	-12(%ebp), %eax
	movl	$2, (%eax)
	movl	-12(%ebp), %eax
	addl	$8, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L720
	movl	%eax, (%esp)
	call	__asan_report_load4
.L720:
	movl	-12(%ebp), %eax
	movl	8(%eax), %edx
	leal	448(%edx), %eax
	movl	%eax, %ecx
	shrl	$3, %ecx
	addl	$536870912, %ecx
	movzbl	(%ecx), %ecx
	testb	%cl, %cl
	setne	%bl
	movl	%ebx, %esi
	movl	%eax, %ebx
	andl	$7, %ebx
	addl	$3, %ebx
	cmpb	%cl, %bl
	setge	%cl
	andl	%esi, %ecx
	testb	%cl, %cl
	je	.L721
	movl	%eax, (%esp)
	call	__asan_report_load4
.L721:
	movl	448(%edx), %eax
	movl	$1, 8(%esp)
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fdwatch_add_fd
.L715:
	addl	$32, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE28:
	.size	wakeup_connection, .-wakeup_connection
	.type	linger_clear_connection, @function
linger_clear_connection:
.LFB29:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	leal	8(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L723
	movl	%eax, (%esp)
	call	__asan_report_load4
.L723:
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	addl	$76, %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%bl
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%ebx, %edx
	testb	%dl, %dl
	je	.L724
	movl	%eax, (%esp)
	call	__asan_report_store4
.L724:
	movl	-12(%ebp), %eax
	movl	$0, 76(%eax)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	really_clear_connection
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE29:
	.size	linger_clear_connection, .-linger_clear_connection
	.type	occasional, @function
occasional:
.LFB30:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	mmc_cleanup
	call	tmr_cleanup
	movl	$1, watchdog_flag
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE30:
	.size	occasional, .-occasional
	.type	show_stats, @function
show_stats:
.LFB31:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	logstats
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE31:
	.size	show_stats, .-show_stats
	.section	.rodata
.LC141:
	.string	"logstats 1 32 8 2 tv "
	.align 32
.LC142:
	.string	"up %ld seconds, stats for %ld seconds:"
	.zero	57
	.text
	.type	logstats, @function
logstats:
.LFB32:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	addl	$-128, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	leal	-104(%ebp), %eax
	movl	$1102416563, (%eax)
	movl	$.LC141, 4(%eax)
	shrl	$3, %eax
	leal	536870912(%eax), %ebx
	movl	$-235802127, (%ebx)
	movl	$-185273344, 4(%ebx)
	movl	$-202116109, 8(%ebx)
	cmpl	$0, 8(%ebp)
	jne	.L728
	movl	$0, 4(%esp)
	leal	-72(%ebp), %eax
	movl	%eax, (%esp)
	call	gettimeofday
	leal	-72(%ebp), %eax
	movl	%eax, 8(%ebp)
.L728:
	movl	8(%ebp), %eax
	movl	%eax, %edx
	shrl	$3, %edx
	addl	$536870912, %edx
	movzbl	(%edx), %edx
	testb	%dl, %dl
	setne	%cl
	movl	%ecx, %esi
	movl	%eax, %ecx
	andl	$7, %ecx
	addl	$3, %ecx
	cmpb	%dl, %cl
	setge	%dl
	andl	%esi, %edx
	testb	%dl, %dl
	je	.L729
	movl	%eax, (%esp)
	call	__asan_report_load4
.L729:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -112(%ebp)
	movl	start_time, %eax
	movl	-112(%ebp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -108(%ebp)
	movl	stats_time, %eax
	movl	-112(%ebp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -116(%ebp)
	cmpl	$0, -116(%ebp)
	jne	.L730
	movl	$1, -116(%ebp)
.L730:
	movl	-112(%ebp), %eax
	movl	%eax, stats_time
	movl	-116(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-108(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC142, 4(%esp)
	movl	$6, (%esp)
	call	syslog
	movl	-116(%ebp), %eax
	movl	%eax, (%esp)
	call	thttpd_logstats
	movl	-116(%ebp), %eax
	movl	%eax, (%esp)
	call	httpd_logstats
	movl	-116(%ebp), %eax
	movl	%eax, (%esp)
	call	mmc_logstats
	movl	-116(%ebp), %eax
	movl	%eax, (%esp)
	call	fdwatch_logstats
	movl	-116(%ebp), %eax
	movl	%eax, (%esp)
	call	tmr_logstats
	movl	$0, (%ebx)
	movl	$0, 4(%ebx)
	movl	$0, 8(%ebx)
	subl	$-128, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE32:
	.size	logstats, .-logstats
	.section	.rodata
	.align 32
.LC143:
	.string	"  thttpd - %ld connections (%g/sec), %d max simultaneous, %lld bytes (%g/sec), %d httpd_conns allocated"
	.zero	56
	.text
	.type	thttpd_logstats, @function
thttpd_logstats:
.LFB33:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$48, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	cmpl	$0, 8(%ebp)
	jle	.L732
	movl	httpd_conn_count, %esi
	movl	stats_bytes, %eax
	movl	%eax, -12(%ebp)
	fildl	-12(%ebp)
	fildl	8(%ebp)
	fdivrp	%st, %st(1)
	movl	stats_bytes, %eax
	cltd
	movl	stats_simultaneous, %ebx
	movl	stats_connections, %ecx
	movl	%ecx, -12(%ebp)
	fildl	-12(%ebp)
	fildl	8(%ebp)
	fdivrp	%st, %st(1)
	fxch	%st(1)
	movl	stats_connections, %ecx
	movl	%esi, 40(%esp)
	fstpl	32(%esp)
	movl	%eax, 24(%esp)
	movl	%edx, 28(%esp)
	movl	%ebx, 20(%esp)
	fstpl	12(%esp)
	movl	%ecx, 8(%esp)
	movl	$.LC143, 4(%esp)
	movl	$6, (%esp)
	call	syslog
.L732:
	movl	$0, stats_connections
	movl	$0, stats_bytes
	movl	$0, stats_simultaneous
	addl	$48, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE33:
	.size	thttpd_logstats, .-thttpd_logstats
	.section	.rodata
.LC145:
	.string	"watchdog_flag (thttpd.c)"
.LC146:
	.string	"got_usr1 (thttpd.c)"
.LC147:
	.string	"got_hup (thttpd.c)"
.LC148:
	.string	"terminate (thttpd.c)"
.LC149:
	.string	"hs (thttpd.c)"
.LC150:
	.string	"httpd_conn_count (thttpd.c)"
.LC151:
	.string	"first_free_connect (thttpd.c)"
.LC152:
	.string	"max_connects (thttpd.c)"
.LC153:
	.string	"num_connects (thttpd.c)"
.LC154:
	.string	"connects (thttpd.c)"
.LC155:
	.string	"maxthrottles (thttpd.c)"
.LC156:
	.string	"numthrottles (thttpd.c)"
.LC157:
	.string	"throttles (thttpd.c)"
.LC158:
	.string	"max_age (thttpd.c)"
.LC159:
	.string	"p3p (thttpd.c)"
.LC160:
	.string	"charset (thttpd.c)"
.LC161:
	.string	"user (thttpd.c)"
.LC162:
	.string	"pidfile (thttpd.c)"
.LC163:
	.string	"hostname (thttpd.c)"
.LC164:
	.string	"throttlefile (thttpd.c)"
.LC165:
	.string	"logfile (thttpd.c)"
.LC166:
	.string	"local_pattern (thttpd.c)"
.LC167:
	.string	"no_empty_referers (thttpd.c)"
.LC168:
	.string	"url_pattern (thttpd.c)"
.LC169:
	.string	"cgi_limit (thttpd.c)"
.LC170:
	.string	"cgi_pattern (thttpd.c)"
.LC171:
	.string	"do_global_passwd (thttpd.c)"
.LC172:
	.string	"do_vhost (thttpd.c)"
.LC173:
	.string	"no_symlink_check (thttpd.c)"
.LC174:
	.string	"no_log (thttpd.c)"
.LC175:
	.string	"do_chroot (thttpd.c)"
.LC176:
	.string	"data_dir (thttpd.c)"
.LC177:
	.string	"dir (thttpd.c)"
.LC178:
	.string	"port (thttpd.c)"
.LC179:
	.string	"debug (thttpd.c)"
.LC180:
	.string	"argv0 (thttpd.c)"
.LC181:
	.string	"*.LC140 (thttpd.c)"
.LC182:
	.string	"*.LC20 (thttpd.c)"
.LC183:
	.string	"*.LC97 (thttpd.c)"
.LC184:
	.string	"*.LC6 (thttpd.c)"
.LC185:
	.string	"*.LC41 (thttpd.c)"
.LC186:
	.string	"*.LC118 (thttpd.c)"
.LC187:
	.string	"*.LC119 (thttpd.c)"
.LC188:
	.string	"*.LC107 (thttpd.c)"
.LC189:
	.string	"*.LC133 (thttpd.c)"
.LC190:
	.string	"*.LC33 (thttpd.c)"
.LC191:
	.string	"*.LC36 (thttpd.c)"
.LC192:
	.string	"*.LC69 (thttpd.c)"
.LC193:
	.string	"*.LC93 (thttpd.c)"
.LC194:
	.string	"*.LC60 (thttpd.c)"
.LC195:
	.string	"*.LC115 (thttpd.c)"
.LC196:
	.string	"*.LC10 (thttpd.c)"
.LC197:
	.string	"*.LC5 (thttpd.c)"
.LC198:
	.string	"*.LC54 (thttpd.c)"
.LC199:
	.string	"*.LC27 (thttpd.c)"
.LC200:
	.string	"*.LC34 (thttpd.c)"
.LC201:
	.string	"*.LC94 (thttpd.c)"
.LC202:
	.string	"*.LC28 (thttpd.c)"
.LC203:
	.string	"*.LC90 (thttpd.c)"
.LC204:
	.string	"*.LC40 (thttpd.c)"
.LC205:
	.string	"*.LC55 (thttpd.c)"
.LC206:
	.string	"*.LC103 (thttpd.c)"
.LC207:
	.string	"*.LC110 (thttpd.c)"
.LC208:
	.string	"*.LC87 (thttpd.c)"
.LC209:
	.string	"*.LC73 (thttpd.c)"
.LC210:
	.string	"*.LC135 (thttpd.c)"
.LC211:
	.string	"*.LC62 (thttpd.c)"
.LC212:
	.string	"*.LC112 (thttpd.c)"
.LC213:
	.string	"*.LC114 (thttpd.c)"
.LC214:
	.string	"*.LC116 (thttpd.c)"
.LC215:
	.string	"*.LC19 (thttpd.c)"
.LC216:
	.string	"*.LC89 (thttpd.c)"
.LC217:
	.string	"*.LC98 (thttpd.c)"
.LC218:
	.string	"*.LC49 (thttpd.c)"
.LC219:
	.string	"*.LC56 (thttpd.c)"
.LC220:
	.string	"*.LC99 (thttpd.c)"
.LC221:
	.string	"*.LC22 (thttpd.c)"
.LC222:
	.string	"*.LC61 (thttpd.c)"
.LC223:
	.string	"*.LC88 (thttpd.c)"
.LC224:
	.string	"*.LC21 (thttpd.c)"
.LC225:
	.string	"*.LC7 (thttpd.c)"
.LC226:
	.string	"*.LC42 (thttpd.c)"
.LC227:
	.string	"*.LC25 (thttpd.c)"
.LC228:
	.string	"*.LC2 (thttpd.c)"
.LC229:
	.string	"*.LC39 (thttpd.c)"
.LC230:
	.string	"*.LC47 (thttpd.c)"
.LC231:
	.string	"*.LC109 (thttpd.c)"
.LC232:
	.string	"*.LC32 (thttpd.c)"
.LC233:
	.string	"*.LC101 (thttpd.c)"
.LC234:
	.string	"*.LC129 (thttpd.c)"
.LC235:
	.string	"*.LC13 (thttpd.c)"
.LC236:
	.string	"*.LC83 (thttpd.c)"
.LC237:
	.string	"*.LC50 (thttpd.c)"
.LC238:
	.string	"*.LC31 (thttpd.c)"
.LC239:
	.string	"*.LC12 (thttpd.c)"
.LC240:
	.string	"*.LC45 (thttpd.c)"
.LC241:
	.string	"*.LC79 (thttpd.c)"
.LC242:
	.string	"*.LC72 (thttpd.c)"
.LC243:
	.string	"*.LC125 (thttpd.c)"
.LC244:
	.string	"*.LC66 (thttpd.c)"
.LC245:
	.string	"*.LC63 (thttpd.c)"
.LC246:
	.string	"*.LC64 (thttpd.c)"
.LC247:
	.string	"*.LC17 (thttpd.c)"
.LC248:
	.string	"*.LC75 (thttpd.c)"
.LC249:
	.string	"*.LC24 (thttpd.c)"
.LC250:
	.string	"*.LC23 (thttpd.c)"
.LC251:
	.string	"*.LC143 (thttpd.c)"
.LC252:
	.string	"*.LC117 (thttpd.c)"
.LC253:
	.string	"*.LC26 (thttpd.c)"
.LC254:
	.string	"*.LC105 (thttpd.c)"
.LC255:
	.string	"*.LC29 (thttpd.c)"
.LC256:
	.string	"*.LC76 (thttpd.c)"
.LC257:
	.string	"*.LC67 (thttpd.c)"
.LC258:
	.string	"*.LC80 (thttpd.c)"
.LC259:
	.string	"*.LC100 (thttpd.c)"
.LC260:
	.string	"*.LC65 (thttpd.c)"
.LC261:
	.string	"*.LC84 (thttpd.c)"
.LC262:
	.string	"*.LC8 (thttpd.c)"
.LC263:
	.string	"*.LC91 (thttpd.c)"
.LC264:
	.string	"*.LC48 (thttpd.c)"
.LC265:
	.string	"*.LC30 (thttpd.c)"
.LC266:
	.string	"*.LC111 (thttpd.c)"
.LC267:
	.string	"*.LC130 (thttpd.c)"
.LC268:
	.string	"*.LC43 (thttpd.c)"
.LC269:
	.string	"*.LC139 (thttpd.c)"
.LC270:
	.string	"*.LC15 (thttpd.c)"
.LC271:
	.string	"*.LC142 (thttpd.c)"
.LC272:
	.string	"*.LC78 (thttpd.c)"
.LC273:
	.string	"*.LC70 (thttpd.c)"
.LC274:
	.string	"*.LC120 (thttpd.c)"
.LC275:
	.string	"*.LC53 (thttpd.c)"
.LC276:
	.string	"*.LC68 (thttpd.c)"
.LC277:
	.string	"*.LC57 (thttpd.c)"
.LC278:
	.string	"*.LC138 (thttpd.c)"
.LC279:
	.string	"*.LC132 (thttpd.c)"
.LC280:
	.string	"*.LC44 (thttpd.c)"
.LC281:
	.string	"*.LC134 (thttpd.c)"
.LC282:
	.string	"*.LC137 (thttpd.c)"
.LC283:
	.string	"*.LC104 (thttpd.c)"
.LC284:
	.string	"*.LC38 (thttpd.c)"
.LC285:
	.string	"*.LC37 (thttpd.c)"
.LC286:
	.string	"*.LC128 (thttpd.c)"
.LC287:
	.string	"*.LC3 (thttpd.c)"
.LC288:
	.string	"*.LC81 (thttpd.c)"
.LC289:
	.string	"*.LC58 (thttpd.c)"
.LC290:
	.string	"*.LC4 (thttpd.c)"
.LC291:
	.string	"*.LC18 (thttpd.c)"
.LC292:
	.string	"*.LC14 (thttpd.c)"
.LC293:
	.string	"*.LC123 (thttpd.c)"
.LC294:
	.string	"*.LC92 (thttpd.c)"
.LC295:
	.string	"*.LC35 (thttpd.c)"
.LC296:
	.string	"*.LC102 (thttpd.c)"
.LC297:
	.string	"*.LC85 (thttpd.c)"
.LC298:
	.string	"*.LC124 (thttpd.c)"
.LC299:
	.string	"*.LC0 (thttpd.c)"
.LC300:
	.string	"*.LC51 (thttpd.c)"
.LC301:
	.string	"*.LC71 (thttpd.c)"
.LC302:
	.string	"*.LC96 (thttpd.c)"
.LC303:
	.string	"*.LC52 (thttpd.c)"
.LC304:
	.string	"*.LC59 (thttpd.c)"
.LC305:
	.string	"*.LC95 (thttpd.c)"
.LC306:
	.string	"*.LC86 (thttpd.c)"
.LC307:
	.string	"*.LC106 (thttpd.c)"
.LC308:
	.string	"*.LC46 (thttpd.c)"
.LC309:
	.string	"*.LC11 (thttpd.c)"
.LC310:
	.string	"*.LC82 (thttpd.c)"
.LC311:
	.string	"*.LC16 (thttpd.c)"
.LC312:
	.string	"*.LC77 (thttpd.c)"
	.data
	.align 32
	.type	.LASAN0, @object
	.size	.LASAN0, 3360
.LASAN0:
	.long	watchdog_flag
	.long	4
	.long	64
	.long	.LC145
	.long	0
	.long	got_usr1
	.long	4
	.long	64
	.long	.LC146
	.long	0
	.long	got_hup
	.long	4
	.long	64
	.long	.LC147
	.long	0
	.long	terminate
	.long	4
	.long	64
	.long	.LC148
	.long	0
	.long	hs
	.long	4
	.long	64
	.long	.LC149
	.long	0
	.long	httpd_conn_count
	.long	4
	.long	64
	.long	.LC150
	.long	0
	.long	first_free_connect
	.long	4
	.long	64
	.long	.LC151
	.long	0
	.long	max_connects
	.long	4
	.long	64
	.long	.LC152
	.long	0
	.long	num_connects
	.long	4
	.long	64
	.long	.LC153
	.long	0
	.long	connects
	.long	4
	.long	64
	.long	.LC154
	.long	0
	.long	maxthrottles
	.long	4
	.long	64
	.long	.LC155
	.long	0
	.long	numthrottles
	.long	4
	.long	64
	.long	.LC156
	.long	0
	.long	throttles
	.long	4
	.long	64
	.long	.LC157
	.long	0
	.long	max_age
	.long	4
	.long	64
	.long	.LC158
	.long	0
	.long	p3p
	.long	4
	.long	64
	.long	.LC159
	.long	0
	.long	charset
	.long	4
	.long	64
	.long	.LC160
	.long	0
	.long	user
	.long	4
	.long	64
	.long	.LC161
	.long	0
	.long	pidfile
	.long	4
	.long	64
	.long	.LC162
	.long	0
	.long	hostname
	.long	4
	.long	64
	.long	.LC163
	.long	0
	.long	throttlefile
	.long	4
	.long	64
	.long	.LC164
	.long	0
	.long	logfile
	.long	4
	.long	64
	.long	.LC165
	.long	0
	.long	local_pattern
	.long	4
	.long	64
	.long	.LC166
	.long	0
	.long	no_empty_referers
	.long	4
	.long	64
	.long	.LC167
	.long	0
	.long	url_pattern
	.long	4
	.long	64
	.long	.LC168
	.long	0
	.long	cgi_limit
	.long	4
	.long	64
	.long	.LC169
	.long	0
	.long	cgi_pattern
	.long	4
	.long	64
	.long	.LC170
	.long	0
	.long	do_global_passwd
	.long	4
	.long	64
	.long	.LC171
	.long	0
	.long	do_vhost
	.long	4
	.long	64
	.long	.LC172
	.long	0
	.long	no_symlink_check
	.long	4
	.long	64
	.long	.LC173
	.long	0
	.long	no_log
	.long	4
	.long	64
	.long	.LC174
	.long	0
	.long	do_chroot
	.long	4
	.long	64
	.long	.LC175
	.long	0
	.long	data_dir
	.long	4
	.long	64
	.long	.LC176
	.long	0
	.long	dir
	.long	4
	.long	64
	.long	.LC177
	.long	0
	.long	port
	.long	2
	.long	64
	.long	.LC178
	.long	0
	.long	debug
	.long	4
	.long	64
	.long	.LC179
	.long	0
	.long	argv0
	.long	4
	.long	64
	.long	.LC180
	.long	0
	.long	.LC140
	.long	35
	.long	96
	.long	.LC181
	.long	0
	.long	.LC20
	.long	11
	.long	64
	.long	.LC182
	.long	0
	.long	.LC97
	.long	13
	.long	64
	.long	.LC183
	.long	0
	.long	.LC6
	.long	19
	.long	64
	.long	.LC184
	.long	0
	.long	.LC41
	.long	16
	.long	64
	.long	.LC185
	.long	0
	.long	.LC118
	.long	3
	.long	64
	.long	.LC186
	.long	0
	.long	.LC119
	.long	39
	.long	96
	.long	.LC187
	.long	0
	.long	.LC107
	.long	36
	.long	96
	.long	.LC188
	.long	0
	.long	.LC133
	.long	70
	.long	128
	.long	.LC189
	.long	0
	.long	.LC33
	.long	20
	.long	64
	.long	.LC190
	.long	0
	.long	.LC36
	.long	24
	.long	64
	.long	.LC191
	.long	0
	.long	.LC69
	.long	3
	.long	64
	.long	.LC192
	.long	0
	.long	.LC93
	.long	5
	.long	64
	.long	.LC193
	.long	0
	.long	.LC60
	.long	3
	.long	64
	.long	.LC194
	.long	0
	.long	.LC115
	.long	16
	.long	64
	.long	.LC195
	.long	0
	.long	.LC10
	.long	29
	.long	64
	.long	.LC196
	.long	0
	.long	.LC5
	.long	2
	.long	64
	.long	.LC197
	.long	0
	.long	.LC54
	.long	3
	.long	64
	.long	.LC198
	.long	0
	.long	.LC27
	.long	12
	.long	64
	.long	.LC199
	.long	0
	.long	.LC34
	.long	15
	.long	64
	.long	.LC200
	.long	0
	.long	.LC94
	.long	8
	.long	64
	.long	.LC201
	.long	0
	.long	.LC28
	.long	7
	.long	64
	.long	.LC202
	.long	0
	.long	.LC90
	.long	16
	.long	64
	.long	.LC203
	.long	0
	.long	.LC40
	.long	12
	.long	64
	.long	.LC204
	.long	0
	.long	.LC55
	.long	5
	.long	64
	.long	.LC205
	.long	0
	.long	.LC103
	.long	32
	.long	64
	.long	.LC206
	.long	0
	.long	.LC110
	.long	26
	.long	64
	.long	.LC207
	.long	0
	.long	.LC87
	.long	7
	.long	64
	.long	.LC208
	.long	0
	.long	.LC73
	.long	219
	.long	256
	.long	.LC209
	.long	0
	.long	.LC135
	.long	65
	.long	128
	.long	.LC210
	.long	0
	.long	.LC62
	.long	3
	.long	64
	.long	.LC211
	.long	0
	.long	.LC112
	.long	39
	.long	96
	.long	.LC212
	.long	0
	.long	.LC114
	.long	20
	.long	64
	.long	.LC213
	.long	0
	.long	.LC116
	.long	33
	.long	96
	.long	.LC214
	.long	0
	.long	.LC19
	.long	15
	.long	64
	.long	.LC215
	.long	0
	.long	.LC89
	.long	7
	.long	64
	.long	.LC216
	.long	0
	.long	.LC98
	.long	15
	.long	64
	.long	.LC217
	.long	0
	.long	.LC49
	.long	3
	.long	64
	.long	.LC218
	.long	0
	.long	.LC56
	.long	4
	.long	64
	.long	.LC219
	.long	0
	.long	.LC99
	.long	8
	.long	64
	.long	.LC220
	.long	0
	.long	.LC22
	.long	2
	.long	64
	.long	.LC221
	.long	0
	.long	.LC61
	.long	3
	.long	64
	.long	.LC222
	.long	0
	.long	.LC88
	.long	9
	.long	64
	.long	.LC223
	.long	0
	.long	.LC21
	.long	6
	.long	64
	.long	.LC224
	.long	0
	.long	.LC7
	.long	2
	.long	64
	.long	.LC225
	.long	0
	.long	.LC42
	.long	12
	.long	64
	.long	.LC226
	.long	0
	.long	.LC25
	.long	4
	.long	64
	.long	.LC227
	.long	0
	.long	.LC2
	.long	16
	.long	64
	.long	.LC228
	.long	0
	.long	.LC39
	.long	15
	.long	64
	.long	.LC229
	.long	0
	.long	.LC47
	.long	11
	.long	64
	.long	.LC230
	.long	0
	.long	.LC109
	.long	3
	.long	64
	.long	.LC231
	.long	0
	.long	.LC32
	.long	13
	.long	64
	.long	.LC232
	.long	0
	.long	.LC101
	.long	4
	.long	64
	.long	.LC233
	.long	0
	.long	.LC129
	.long	37
	.long	96
	.long	.LC234
	.long	0
	.long	.LC13
	.long	25
	.long	64
	.long	.LC235
	.long	0
	.long	.LC83
	.long	10
	.long	64
	.long	.LC236
	.long	0
	.long	.LC50
	.long	28
	.long	64
	.long	.LC237
	.long	0
	.long	.LC31
	.long	18
	.long	64
	.long	.LC238
	.long	0
	.long	.LC12
	.long	23
	.long	64
	.long	.LC239
	.long	0
	.long	.LC45
	.long	13
	.long	64
	.long	.LC240
	.long	0
	.long	.LC79
	.long	4
	.long	64
	.long	.LC241
	.long	0
	.long	.LC72
	.long	3
	.long	64
	.long	.LC242
	.long	0
	.long	.LC125
	.long	39
	.long	96
	.long	.LC243
	.long	0
	.long	.LC66
	.long	3
	.long	64
	.long	.LC244
	.long	0
	.long	.LC63
	.long	3
	.long	64
	.long	.LC245
	.long	0
	.long	.LC64
	.long	3
	.long	64
	.long	.LC246
	.long	0
	.long	.LC17
	.long	72
	.long	128
	.long	.LC247
	.long	0
	.long	.LC75
	.long	2
	.long	64
	.long	.LC248
	.long	0
	.long	.LC24
	.long	2
	.long	64
	.long	.LC249
	.long	0
	.long	.LC23
	.long	12
	.long	64
	.long	.LC250
	.long	0
	.long	.LC143
	.long	104
	.long	160
	.long	.LC251
	.long	0
	.long	.LC117
	.long	38
	.long	96
	.long	.LC252
	.long	0
	.long	.LC26
	.long	31
	.long	64
	.long	.LC253
	.long	0
	.long	.LC105
	.long	37
	.long	96
	.long	.LC254
	.long	0
	.long	.LC29
	.long	74
	.long	128
	.long	.LC255
	.long	0
	.long	.LC76
	.long	5
	.long	64
	.long	.LC256
	.long	0
	.long	.LC67
	.long	5
	.long	64
	.long	.LC257
	.long	0
	.long	.LC80
	.long	9
	.long	64
	.long	.LC258
	.long	0
	.long	.LC100
	.long	8
	.long	64
	.long	.LC259
	.long	0
	.long	.LC65
	.long	5
	.long	64
	.long	.LC260
	.long	0
	.long	.LC84
	.long	9
	.long	64
	.long	.LC261
	.long	0
	.long	.LC8
	.long	22
	.long	64
	.long	.LC262
	.long	0
	.long	.LC91
	.long	9
	.long	64
	.long	.LC263
	.long	0
	.long	.LC48
	.long	1
	.long	64
	.long	.LC264
	.long	0
	.long	.LC30
	.long	79
	.long	128
	.long	.LC265
	.long	0
	.long	.LC111
	.long	25
	.long	64
	.long	.LC266
	.long	0
	.long	.LC130
	.long	25
	.long	64
	.long	.LC267
	.long	0
	.long	.LC43
	.long	58
	.long	96
	.long	.LC268
	.long	0
	.long	.LC139
	.long	35
	.long	96
	.long	.LC269
	.long	0
	.long	.LC15
	.long	11
	.long	64
	.long	.LC270
	.long	0
	.long	.LC142
	.long	39
	.long	96
	.long	.LC271
	.long	0
	.long	.LC78
	.long	5
	.long	64
	.long	.LC272
	.long	0
	.long	.LC70
	.long	3
	.long	64
	.long	.LC273
	.long	0
	.long	.LC120
	.long	44
	.long	96
	.long	.LC274
	.long	0
	.long	.LC53
	.long	3
	.long	64
	.long	.LC275
	.long	0
	.long	.LC68
	.long	3
	.long	64
	.long	.LC276
	.long	0
	.long	.LC57
	.long	3
	.long	64
	.long	.LC277
	.long	0
	.long	.LC138
	.long	43
	.long	96
	.long	.LC278
	.long	0
	.long	.LC132
	.long	56
	.long	96
	.long	.LC279
	.long	0
	.long	.LC44
	.long	38
	.long	96
	.long	.LC280
	.long	0
	.long	.LC134
	.long	62
	.long	96
	.long	.LC281
	.long	0
	.long	.LC137
	.long	33
	.long	96
	.long	.LC282
	.long	0
	.long	.LC104
	.long	34
	.long	96
	.long	.LC283
	.long	0
	.long	.LC38
	.long	30
	.long	64
	.long	.LC284
	.long	0
	.long	.LC37
	.long	36
	.long	96
	.long	.LC285
	.long	0
	.long	.LC128
	.long	33
	.long	96
	.long	.LC286
	.long	0
	.long	.LC3
	.long	8
	.long	64
	.long	.LC287
	.long	0
	.long	.LC81
	.long	9
	.long	64
	.long	.LC288
	.long	0
	.long	.LC58
	.long	5
	.long	64
	.long	.LC289
	.long	0
	.long	.LC4
	.long	5
	.long	64
	.long	.LC290
	.long	0
	.long	.LC18
	.long	20
	.long	64
	.long	.LC291
	.long	0
	.long	.LC14
	.long	10
	.long	64
	.long	.LC292
	.long	0
	.long	.LC123
	.long	22
	.long	64
	.long	.LC293
	.long	0
	.long	.LC92
	.long	10
	.long	64
	.long	.LC294
	.long	0
	.long	.LC35
	.long	30
	.long	64
	.long	.LC295
	.long	0
	.long	.LC102
	.long	8
	.long	64
	.long	.LC296
	.long	0
	.long	.LC85
	.long	11
	.long	64
	.long	.LC297
	.long	0
	.long	.LC124
	.long	36
	.long	96
	.long	.LC298
	.long	0
	.long	.LC0
	.long	25
	.long	64
	.long	.LC299
	.long	0
	.long	.LC51
	.long	3
	.long	64
	.long	.LC300
	.long	0
	.long	.LC71
	.long	3
	.long	64
	.long	.LC301
	.long	0
	.long	.LC96
	.long	8
	.long	64
	.long	.LC302
	.long	0
	.long	.LC52
	.long	3
	.long	64
	.long	.LC303
	.long	0
	.long	.LC59
	.long	3
	.long	64
	.long	.LC304
	.long	0
	.long	.LC95
	.long	6
	.long	64
	.long	.LC305
	.long	0
	.long	.LC86
	.long	5
	.long	64
	.long	.LC306
	.long	0
	.long	.LC106
	.long	31
	.long	64
	.long	.LC307
	.long	0
	.long	.LC46
	.long	7
	.long	64
	.long	.LC308
	.long	0
	.long	.LC11
	.long	34
	.long	96
	.long	.LC309
	.long	0
	.long	.LC82
	.long	8
	.long	64
	.long	.LC310
	.long	0
	.long	.LC16
	.long	67
	.long	128
	.long	.LC311
	.long	0
	.long	.LC77
	.long	6
	.long	64
	.long	.LC312
	.long	0
	.text
	.type	_GLOBAL__sub_D_00099_0_terminate, @function
_GLOBAL__sub_D_00099_0_terminate:
.LFB34:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$168, 4(%esp)
	movl	$.LASAN0, (%esp)
	call	__asan_unregister_globals
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE34:
	.size	_GLOBAL__sub_D_00099_0_terminate, .-_GLOBAL__sub_D_00099_0_terminate
	.section	.dtors.65436,"aw",@progbits
	.align 4
	.long	_GLOBAL__sub_D_00099_0_terminate
	.text
	.type	_GLOBAL__sub_I_00099_1_terminate, @function
_GLOBAL__sub_I_00099_1_terminate:
.LFB35:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	call	__asan_init_v1
	movl	$168, 4(%esp)
	movl	$.LASAN0, (%esp)
	call	__asan_register_globals
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE35:
	.size	_GLOBAL__sub_I_00099_1_terminate, .-_GLOBAL__sub_I_00099_1_terminate
	.section	.ctors.65436,"aw",@progbits
	.align 4
	.long	_GLOBAL__sub_I_00099_1_terminate
	.ident	"GCC: (GNU) 4.8.0"
	.section	.note.GNU-stack,"",@progbits
