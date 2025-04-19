/*
 * startup routine for the `rp2350`
 *
 * this routine initialises the variables and sets the
 * essential configurations before jumping to `main`
 */

.syntax unified
.cpu    cortex-m33
.fpu    fpv5-sp-d16
.thumb


// export vector table & default handler
.global ISR_Vector
.global Default_Handler


// use variables defined in the linker script for the sections start/end
.word _sidata
.word _sdata
.word _edata
.word _sbss
.word _ebss


// reset handler - handles bring up after reset
.section .text.Reset_Handler
.weak    Reset_Handler
.type    Reset_Handler, %function
Reset_Handler:

Enable_FPU:
    CPACR   EQU  0xE000ED88
    LDR     R0,  =CPACR
    LDR     r1, [R0]
    ORR     R1, R1, #(0xF << 20)
    STR     R1, [R0]
    DSB
    ISB

// default handler for interrupt vector table entries
.section .text.Default_Handler
.type    Default_Handler, %function
Default_Handler:
Infinite_Loop:
    b Infinite_Loop


// definition of the `interrupt vector table`
.section .isr_vector_table,"a",%progbits
.type    ISR_Vector, %object
ISR_Vector:
    // processor level interrupts
    .word _estack
    .word Reset_Handler
    .word NMI_Handler
    .word HardFault_Handler
    .word MemManage_Handler
    .word BusFault_Handler
    .word UsageFault_Handler
    .word SecureFault_Handler
    .word 0
    .word 0
    .word 0
    .word SVCal_Handler
    .word DebugMonitor_Handler
    .word 0
    .word PendSV_Handler
    .word SysTick_Handler
    // system level interrupts
    .word TIMER0_IRQ_0_Handler
    .word TIMER0_IRQ_1_Handler
    .word TIMER0_IRQ_2_Handler
    .word TIMER0_IRQ_3_Handler
    .word TIMER1_IRQ_0_Handler
    .word TIMER1_IRQ_1_Handler
    .word TIMER1_IRQ_2_Handler
    .word TIMER1_IRQ_3_Handler
    .word PWM_IRQ_0_Handler
    .word PWM_IRQ_1_Handler
    .word DMA_IRQ_0_Handler
    .word DMA_IRQ_1_Handler
    .word DMA_IRQ_2_Handler
    .word DMA_IRQ_3_Handler
    .word USBCTRL_IRQ_Handler
    .word PIO0_IRQ_0_Handler
    .word PIO0_IRQ_1_Handler
    .word PIO1_IRQ_0_Handler
    .word PIO1_IRQ_1_Handler
    .word PIO2_IRQ_0_Handler
    .word PIO2_IRQ_1_Handler
    .word IO_IRQ_BANK0_Handler
    .word IO_IRQ_BANK0_NS_Handler
    .word IO_IRQ_QSPI_Handler
    .word IO_IRQ_QSPI_NS_Handler
    .word SIO_IRQ_FIFO_Handler
    .word SIO_IRQ_BELL_Handler
    .word SIO_IRQ_FIFO_NS_Handler
    .word SIO_IRQ_BELL_NS_Handler
    .word SIO_IRQ_MTIMECMP_Handler
    .word CLOCKS_IRQ_Handler
    .word SPI0_IRQ_Handler
    .word SPI1_IRQ_Handler
    .word I2C0_IRQ_Handler
    .word I2C1_IRQ_Handler
    .word OTP_IRQ_Handler
    .word TRNG_IRQ_Handler
    .word PROC0_IRQ_CTI_Handler
    .word PROC1_IRQ_CTI_Handler
    .word PLL_SYS_IRQ_Handler
    .word PLL_USB_IRQ_Handler
    .word SPARE_IRQ_1
    .word SPARE_IRQ_2
    .word SPARE_IRQ_3
    .word SPARE_IRQ_4
    .word SPARE_IRQ_5

.size ISR_Vector, .-ISR_Vector


// weak assignment of default handler to interrupt vector table entries
.weak NMI_Handler
.thumb_set NMI_Handler,Default_Handler

.weak HardFault_Handler
.thumb_set HardFault_Handler,Default_Handler

.weak MemManage_Handler
.thumb_set MemManage_Handler,Default_Handler

.weak BusFault_Handler
.thumb_set BusFault_Handler,Default_Handler

.weak UsageFault_Handler
.thumb_set UsageFault_Handler,Default_Handler

.weak SecureFault_Handler
.thumb_set SecureFault_Handler,Default_Handler

.weak SVCal_Handler
.thumb_set SVCal_Handler,Default_Handler

.weak DebugMonitor_Handler
.thumb_set DebugMonitor_Handler,Default_Handler

.weak PendSV_Handler
.thumb_set PendSV_Handler,Default_Handler

.weak SysTick_Handler
.thumb_set SysTick_Handler,Default_Handler

.weak TIMER0_IRQ_0_Handler
.thumb_set TIMER0_IRQ_0_Handler,Default_Handler

.weak TIMER0_IRQ_1_Handler
.thumb_set TIMER0_IRQ_1_Handler,Default_Handler

.weak TIMER0_IRQ_2_Handler
.thumb_set TIMER0_IRQ_2_Handler,Default_Handler

.weak TIMER0_IRQ_3_Handler
.thumb_set TIMER0_IRQ_3_Handler,Default_Handler

.weak TIMER1_IRQ_0_Handler
.thumb_set TIMER1_IRQ_0_Handler,Default_Handler

.weak TIMER1_IRQ_1_Handler
.thumb_set TIMER1_IRQ_1_Handler,Default_Handler

.weak TIMER1_IRQ_2_Handler
.thumb_set TIMER1_IRQ_2_Handler,Default_Handler

.weak TIMER1_IRQ_3_Handler
.thumb_set TIMER1_IRQ_3_Handler,Default_Handler

.weak PWM_IRQ_0_Handler
.thumb_set PWM_IRQ_0_Handler,Default_Handler

.weak PWM_IRQ_1_Handler
.thumb_set PWM_IRQ_1_Handler,Default_Handler

.weak DMA_IRQ_0_Handler
.thumb_set DMA_IRQ_0_Handler,Default_Handler

.weak DMA_IRQ_1_Handler
.thumb_set DMA_IRQ_1_Handler,Default_Handler

.weak DMA_IRQ_2_Handler
.thumb_set DMA_IRQ_2_Handler,Default_Handler

.weak DMA_IRQ_3_Handler
.thumb_set DMA_IRQ_3_Handler,Default_Handler

.weak USBCTRL_IRQ_Handler
.thumb_set USBCTRL_IRQ_Handler,Default_Handler

.weak PIO0_IRQ_0_Handler
.thumb_set PIO0_IRQ_0_Handler,Default_Handler

.weak PIO0_IRQ_1_Handler
.thumb_set PIO0_IRQ_1_Handler,Default_Handler

.weak PIO1_IRQ_0_Handler
.thumb_set PIO1_IRQ_0_Handler,Default_Handler

.weak PIO1_IRQ_1_Handler
.thumb_set PIO1_IRQ_1_Handler,Default_Handler

.weak PIO2_IRQ_0_Handler
.thumb_set PIO2_IRQ_0_Handler,Default_Handler

.weak PIO2_IRQ_1_Handler
.thumb_set PIO2_IRQ_1_Handler,Default_Handler

.weak IO_IRQ_BANK0_Handler
.thumb_set IO_IRQ_BANK0_Handler,Default_Handler

.weak IO_IRQ_BANK0_NS_Handler
.thumb_set IO_IRQ_BANK0_NS_Handler,Default_Handler

.weak IO_IRQ_QSPI_Handler
.thumb_set IO_IRQ_QSPI_Handler,Default_Handler

.weak IO_IRQ_QSPI_NS_Handler
.thumb_set IO_IRQ_QSPI_NS_Handler,Default_Handler

.weak SIO_IRQ_FIFO_Handler
.thumb_set SIO_IRQ_FIFO_Handler,Default_Handler

.weak SIO_IRQ_BELL_Handler
.thumb_set SIO_IRQ_BELL_Handler,Default_Handler

.weak SIO_IRQ_FIFO_NS_Handler
.thumb_set SIO_IRQ_FIFO_NS_Handler,Default_Handler

.weak SIO_IRQ_BELL_NS_Handler
.thumb_set SIO_IRQ_BELL_NS_Handler,Default_Handler

.weak SIO_IRQ_MTIMECMP_Handler
.thumb_set SIO_IRQ_MTIMECMP_Handler,Default_Handler

.weak CLOCKS_IRQ_Handler
.thumb_set CLOCKS_IRQ_Handler,Default_Handler

.weak SPI0_IRQ_Handler
.thumb_set SPI0_IRQ_Handler,Default_Handler

.weak SPI1_IRQ_Handler
.thumb_set SPI1_IRQ_Handler,Default_Handler

.weak I2C0_IRQ_Handler
.thumb_set I2C0_IRQ_Handler,Default_Handler

.weak I2C1_IRQ_Handler
.thumb_set I2C1_IRQ_Handler,Default_Handler

.weak OTP_IRQ_Handler
.thumb_set OTP_IRQ_Handler,Default_Handler

.weak TRNG_IRQ_Handler
.thumb_set TRNG_IRQ_Handler,Default_Handler

.weak PROC0_IRQ_CTI_Handler
.thumb_set PROC0_IRQ_CTI_Handler,Default_Handler

.weak PROC1_IRQ_CTI_Handler
.thumb_set PROC1_IRQ_CTI_Handler,Default_Handler

.weak PLL_SYS_IRQ_Handler
.thumb_set PLL_SYS_IRQ_Handler,Default_Handler

.weak PLL_USB_IRQ_Handler
.thumb_set PLL_USB_IRQ_Handler,Default_Handler

.weak SPARE_IRQ_1
.thumb_set SPARE_IRQ_1,Default_Handler

.weak SPARE_IRQ_2
.thumb_set SPARE_IRQ_2,Default_Handler

.weak SPARE_IRQ_3
.thumb_set SPARE_IRQ_3,Default_Handler

.weak SPARE_IRQ_4
.thumb_set SPARE_IRQ_4,Default_Handler

.weak SPARE_IRQ_5
.thumb_set SPARE_IRQ_5,Default_Handler

