cmake_minimum_required(VERSION 3.7.2)

declare_platform(shakti KernelPlatformShakti PLAT_SHAKTI KernelSel4ArchRiscV64)

if(KernelPlatformShakti)
    declare_seL4_arch(riscv64)
    config_set(KernelRiscVPlatform RISCV_PLAT "shakti")
    config_set(KernelPlatformFirstHartID FIRST_HART_ID 1)
    config_set(KernelOpenSBIPlatform OPENSBI_PLATFORM "generic")
    list(APPEND KernelDTSList "tools/dts/shakti_100t.dts")
    list(APPEND KernelDTSList "src/plat/shakti/overlay-shakti.dts")
    declare_default_headers(
        TIMER_FREQUENCY 10000000 PLIC_MAX_NUM_INT 32
        INTERRUPT_CONTROLLER drivers/irq/riscv_plic0.h
    )
else()
    unset(KernelPlatformFirstHartID CACHE)
endif()
