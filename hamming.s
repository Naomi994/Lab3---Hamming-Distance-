.section .bss
.global ram 
.lcomm ram, 512 # Reserve 512 butes of RAM (uninitialized memory)

.section .text 
.global hamming # Make function visible to C program 
hamming: 
  xorl %edx, %edx 
  xorl %esi, %esi 
compare:
  movb ram(%esi),%al # move the esi register into al 
  cmpb $0, %al # compares byte
  je finish
  movb ram+256(%esi), %ah 
  cmpb $0, %ah 
  je finish 
  xorb %ah, %al 
  movl $8, %ecx 
counter: 
  shl $1, %al 
  adc $0, %edx 
  loop counter
  incl %esi 
  jmp compare 

finish: 
  movl %edx, %eax 
  ret         # Return control back to C program 
.section .note.GNU-stack,"",@progbits

  
  
