.data
    arr_size: .space 0x4
    arr1_p: .space 0x8
    arr2_p: .space 0x8
	arr3_p: .space 0x8

.text
	.globl f
	.type f, @function
	
	f:
		pushq %rsi
		pushq %rax
		pushq %rcx
		pushq %rdi
		pushq %rdx
		pushq %rbx
		
		
		# rdi - указ на первый масс, rsi - указатель на второй массив, rdx - размер 3, rcx - указ третий массив
		
		movq %rdi, arr1_p
		movq %rsi, arr2_p
		movl %edx, arr_size
		movq %rcx, arr3_p
		
		# Загружаем размер третьего массива в счётчик цикла
		movl arr_size, %ecx
		
		cycle:
			
			movq arr1_p, %rbx
			movl (%rbx), %eax	# теперь в eax значение из 1 массива
			
			movq arr3_p, %rbx
			movl %eax, (%rbx)
			
			addq $0x4, arr3_p	# Наращиваем указатель третьего массива для перехода к следующему элемнету
			
			movq arr2_p, %rbx
			movl (%rbx), %eax	# теперь в eax значение из 2 массива
			
			movq arr3_p, %rbx
			movl %eax, (%rbx)
			
			# Наращиваем указатели всех массивов для перехода к следующим элемнетам
			addq $0x4, arr1_p
			addq $0x4, arr2_p
			addq $0x4, arr3_p
			
			loop cycle
			
			
		popq %rbx
		popq %rdx
		popq %rdi
		popq %rcx
		popq %rax
		popq %rsi
	ret	