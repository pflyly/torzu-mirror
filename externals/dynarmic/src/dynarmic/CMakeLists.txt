include(TargetArchitectureSpecificSources)

add_library(dynarmic
    backend/block_range_information.cpp
    backend/block_range_information.h
    backend/exception_handler.h
    common/always_false.h
    common/cast_util.h
    common/crypto/aes.cpp
    common/crypto/aes.h
    common/crypto/crc32.cpp
    common/crypto/crc32.h
    common/crypto/sm4.cpp
    common/crypto/sm4.h
    common/fp/fpcr.h
    common/fp/fpsr.h
    common/fp/fused.cpp
    common/fp/fused.h
    common/fp/info.h
    common/fp/mantissa_util.h
    common/fp/op.h
    common/fp/op/FPCompare.cpp
    common/fp/op/FPCompare.h
    common/fp/op/FPConvert.cpp
    common/fp/op/FPConvert.h
    common/fp/op/FPMulAdd.cpp
    common/fp/op/FPMulAdd.h
    common/fp/op/FPNeg.h
    common/fp/op/FPRecipEstimate.cpp
    common/fp/op/FPRecipEstimate.h
    common/fp/op/FPRecipExponent.cpp
    common/fp/op/FPRecipExponent.h
    common/fp/op/FPRecipStepFused.cpp
    common/fp/op/FPRecipStepFused.h
    common/fp/op/FPRoundInt.cpp
    common/fp/op/FPRoundInt.h
    common/fp/op/FPRSqrtEstimate.cpp
    common/fp/op/FPRSqrtEstimate.h
    common/fp/op/FPRSqrtStepFused.cpp
    common/fp/op/FPRSqrtStepFused.h
    common/fp/op/FPToFixed.cpp
    common/fp/op/FPToFixed.h
    common/fp/process_exception.cpp
    common/fp/process_exception.h
    common/fp/process_nan.cpp
    common/fp/process_nan.h
    common/fp/rounding_mode.h
    common/fp/unpacked.cpp
    common/fp/unpacked.h
    common/fp/util.h
    common/llvm_disassemble.cpp
    common/llvm_disassemble.h
    common/lut_from_list.h
    common/math_util.cpp
    common/math_util.h
    common/memory_pool.cpp
    common/memory_pool.h
    common/safe_ops.h
    common/spin_lock.h
    common/string_util.h
    common/u128.cpp
    common/u128.h
    common/variant_util.h
    frontend/A32/a32_types.cpp
    frontend/A32/a32_types.h
    frontend/A64/a64_types.cpp
    frontend/A64/a64_types.h
    frontend/decoder/decoder_detail.h
    frontend/decoder/matcher.h
    frontend/imm.cpp
    frontend/imm.h
    interface/exclusive_monitor.h
    interface/optimization_flags.h
    ir/acc_type.h
    ir/basic_block.cpp
    ir/basic_block.h
    ir/cond.h
    ir/ir_emitter.cpp
    ir/ir_emitter.h
    ir/location_descriptor.cpp
    ir/location_descriptor.h
    ir/microinstruction.cpp
    ir/microinstruction.h
    ir/opcodes.cpp
    ir/opcodes.h
    ir/opcodes.inc
    ir/opt/constant_propagation_pass.cpp
    ir/opt/dead_code_elimination_pass.cpp
    ir/opt/identity_removal_pass.cpp
    ir/opt/ir_matcher.h
    ir/opt/naming_pass.cpp
    ir/opt/passes.h
    ir/opt/polyfill_pass.cpp
    ir/opt/verification_pass.cpp
    ir/terminal.h
    ir/type.cpp
    ir/type.h
    ir/value.cpp
    ir/value.h
)

if ("A32" IN_LIST DYNARMIC_FRONTENDS)
    target_sources(dynarmic PRIVATE
        frontend/A32/a32_ir_emitter.cpp
        frontend/A32/a32_ir_emitter.h
        frontend/A32/a32_location_descriptor.cpp
        frontend/A32/a32_location_descriptor.h
        frontend/A32/decoder/arm.h
        frontend/A32/decoder/arm.inc
        frontend/A32/decoder/asimd.h
        frontend/A32/decoder/asimd.inc
        frontend/A32/decoder/thumb16.h
        frontend/A32/decoder/thumb16.inc
        frontend/A32/decoder/thumb32.h
        frontend/A32/decoder/thumb32.inc
        frontend/A32/decoder/vfp.h
        frontend/A32/decoder/vfp.inc
        frontend/A32/disassembler/disassembler.h
        frontend/A32/disassembler/disassembler_arm.cpp
        frontend/A32/disassembler/disassembler_thumb.cpp
        frontend/A32/FPSCR.h
        frontend/A32/ITState.h
        frontend/A32/PSR.h
        frontend/A32/translate/a32_translate.cpp
        frontend/A32/translate/a32_translate.h
        frontend/A32/translate/conditional_state.cpp
        frontend/A32/translate/conditional_state.h
        frontend/A32/translate/impl/a32_branch.cpp
        frontend/A32/translate/impl/a32_crc32.cpp
        frontend/A32/translate/impl/a32_exception_generating.cpp
        frontend/A32/translate/impl/a32_translate_impl.cpp
        frontend/A32/translate/impl/a32_translate_impl.h
        frontend/A32/translate/impl/asimd_load_store_structures.cpp
        frontend/A32/translate/impl/asimd_misc.cpp
        frontend/A32/translate/impl/asimd_one_reg_modified_immediate.cpp
        frontend/A32/translate/impl/asimd_three_regs.cpp
        frontend/A32/translate/impl/asimd_two_regs_misc.cpp
        frontend/A32/translate/impl/asimd_two_regs_scalar.cpp
        frontend/A32/translate/impl/asimd_two_regs_shift.cpp
        frontend/A32/translate/impl/barrier.cpp
        frontend/A32/translate/impl/coprocessor.cpp
        frontend/A32/translate/impl/data_processing.cpp
        frontend/A32/translate/impl/divide.cpp
        frontend/A32/translate/impl/extension.cpp
        frontend/A32/translate/impl/hint.cpp
        frontend/A32/translate/impl/load_store.cpp
        frontend/A32/translate/impl/misc.cpp
        frontend/A32/translate/impl/multiply.cpp
        frontend/A32/translate/impl/packing.cpp
        frontend/A32/translate/impl/parallel.cpp
        frontend/A32/translate/impl/reversal.cpp
        frontend/A32/translate/impl/saturated.cpp
        frontend/A32/translate/impl/status_register_access.cpp
        frontend/A32/translate/impl/synchronization.cpp
        frontend/A32/translate/impl/thumb16.cpp
        frontend/A32/translate/impl/thumb32_branch.cpp
        frontend/A32/translate/impl/thumb32_control.cpp
        frontend/A32/translate/impl/thumb32_coprocessor.cpp
        frontend/A32/translate/impl/thumb32_data_processing_modified_immediate.cpp
        frontend/A32/translate/impl/thumb32_data_processing_plain_binary_immediate.cpp
        frontend/A32/translate/impl/thumb32_data_processing_register.cpp
        frontend/A32/translate/impl/thumb32_data_processing_shifted_register.cpp
        frontend/A32/translate/impl/thumb32_load_byte.cpp
        frontend/A32/translate/impl/thumb32_load_halfword.cpp
        frontend/A32/translate/impl/thumb32_load_store_dual.cpp
        frontend/A32/translate/impl/thumb32_load_store_multiple.cpp
        frontend/A32/translate/impl/thumb32_load_word.cpp
        frontend/A32/translate/impl/thumb32_long_multiply.cpp
        frontend/A32/translate/impl/thumb32_misc.cpp
        frontend/A32/translate/impl/thumb32_multiply.cpp
        frontend/A32/translate/impl/thumb32_parallel.cpp
        frontend/A32/translate/impl/thumb32_store_single_data_item.cpp
        frontend/A32/translate/impl/vfp.cpp
        frontend/A32/translate/translate_arm.cpp
        frontend/A32/translate/translate_thumb.cpp
        interface/A32/a32.h
        interface/A32/arch_version.h
        interface/A32/config.h
        interface/A32/coprocessor.h
        interface/A32/coprocessor_util.h
        interface/A32/disassembler.h
        ir/opt/a32_constant_memory_reads_pass.cpp
        ir/opt/a32_get_set_elimination_pass.cpp
    )
endif()

if ("A64" IN_LIST DYNARMIC_FRONTENDS)
    target_sources(dynarmic PRIVATE
        frontend/A64/a64_ir_emitter.cpp
        frontend/A64/a64_ir_emitter.h
        frontend/A64/a64_location_descriptor.cpp
        frontend/A64/a64_location_descriptor.h
        frontend/A64/decoder/a64.h
        frontend/A64/decoder/a64.inc
        frontend/A64/translate/a64_translate.cpp
        frontend/A64/translate/a64_translate.h
        frontend/A64/translate/impl/a64_branch.cpp
        frontend/A64/translate/impl/a64_exception_generating.cpp
        frontend/A64/translate/impl/data_processing_addsub.cpp
        frontend/A64/translate/impl/data_processing_bitfield.cpp
        frontend/A64/translate/impl/data_processing_conditional_compare.cpp
        frontend/A64/translate/impl/data_processing_conditional_select.cpp
        frontend/A64/translate/impl/data_processing_crc32.cpp
        frontend/A64/translate/impl/data_processing_logical.cpp
        frontend/A64/translate/impl/data_processing_multiply.cpp
        frontend/A64/translate/impl/data_processing_pcrel.cpp
        frontend/A64/translate/impl/data_processing_register.cpp
        frontend/A64/translate/impl/data_processing_shift.cpp
        frontend/A64/translate/impl/floating_point_compare.cpp
        frontend/A64/translate/impl/floating_point_conditional_compare.cpp
        frontend/A64/translate/impl/floating_point_conditional_select.cpp
        frontend/A64/translate/impl/floating_point_conversion_fixed_point.cpp
        frontend/A64/translate/impl/floating_point_conversion_integer.cpp
        frontend/A64/translate/impl/floating_point_data_processing_one_register.cpp
        frontend/A64/translate/impl/floating_point_data_processing_three_register.cpp
        frontend/A64/translate/impl/floating_point_data_processing_two_register.cpp
        frontend/A64/translate/impl/impl.cpp
        frontend/A64/translate/impl/impl.h
        frontend/A64/translate/impl/load_store_exclusive.cpp
        frontend/A64/translate/impl/load_store_load_literal.cpp
        frontend/A64/translate/impl/load_store_multiple_structures.cpp
        frontend/A64/translate/impl/load_store_no_allocate_pair.cpp
        frontend/A64/translate/impl/load_store_register_immediate.cpp
        frontend/A64/translate/impl/load_store_register_pair.cpp
        frontend/A64/translate/impl/load_store_register_register_offset.cpp
        frontend/A64/translate/impl/load_store_register_unprivileged.cpp
        frontend/A64/translate/impl/load_store_single_structure.cpp
        frontend/A64/translate/impl/move_wide.cpp
        frontend/A64/translate/impl/simd_across_lanes.cpp
        frontend/A64/translate/impl/simd_aes.cpp
        frontend/A64/translate/impl/simd_copy.cpp
        frontend/A64/translate/impl/simd_crypto_four_register.cpp
        frontend/A64/translate/impl/simd_crypto_three_register.cpp
        frontend/A64/translate/impl/simd_extract.cpp
        frontend/A64/translate/impl/simd_modified_immediate.cpp
        frontend/A64/translate/impl/simd_permute.cpp
        frontend/A64/translate/impl/simd_scalar_pairwise.cpp
        frontend/A64/translate/impl/simd_scalar_shift_by_immediate.cpp
        frontend/A64/translate/impl/simd_scalar_three_same.cpp
        frontend/A64/translate/impl/simd_scalar_two_register_misc.cpp
        frontend/A64/translate/impl/simd_scalar_x_indexed_element.cpp
        frontend/A64/translate/impl/simd_sha.cpp
        frontend/A64/translate/impl/simd_sha512.cpp
        frontend/A64/translate/impl/simd_shift_by_immediate.cpp
        frontend/A64/translate/impl/simd_table_lookup.cpp
        frontend/A64/translate/impl/simd_three_different.cpp
        frontend/A64/translate/impl/simd_three_same.cpp
        frontend/A64/translate/impl/simd_three_same_extra.cpp
        frontend/A64/translate/impl/simd_two_register_misc.cpp
        frontend/A64/translate/impl/simd_vector_x_indexed_element.cpp
        frontend/A64/translate/impl/sys_dc.cpp
        frontend/A64/translate/impl/sys_ic.cpp
        frontend/A64/translate/impl/system.cpp
        frontend/A64/translate/impl/system_flag_format.cpp
        frontend/A64/translate/impl/system_flag_manipulation.cpp
        interface/A64/a64.h
        interface/A64/config.h
        ir/opt/a64_callback_config_pass.cpp
        ir/opt/a64_get_set_elimination_pass.cpp
        ir/opt/a64_merge_interpret_blocks.cpp
    )
endif()

if ("x86_64" IN_LIST ARCHITECTURE)
    target_link_libraries(dynarmic
        PRIVATE
            xbyak::xbyak
            Zydis::Zydis
    )

    target_architecture_specific_sources(dynarmic "x86_64"
        backend/x64/abi.cpp
        backend/x64/abi.h
        backend/x64/block_of_code.cpp
        backend/x64/block_of_code.h
        backend/x64/callback.cpp
        backend/x64/callback.h
        backend/x64/constant_pool.cpp
        backend/x64/constant_pool.h
        backend/x64/constants.h
        backend/x64/devirtualize.h
        backend/x64/emit_x64.cpp
        backend/x64/emit_x64.h
        backend/x64/emit_x64_aes.cpp
        backend/x64/emit_x64_crc32.cpp
        backend/x64/emit_x64_data_processing.cpp
        backend/x64/emit_x64_floating_point.cpp
        backend/x64/emit_x64_memory.cpp.inc
        backend/x64/emit_x64_memory.h
        backend/x64/emit_x64_packed.cpp
        backend/x64/emit_x64_saturation.cpp
        backend/x64/emit_x64_sha.cpp
        backend/x64/emit_x64_sm4.cpp
        backend/x64/emit_x64_vector.cpp
        backend/x64/emit_x64_vector_floating_point.cpp
        backend/x64/emit_x64_vector_saturation.cpp
        backend/x64/exclusive_monitor.cpp
        backend/x64/exclusive_monitor_friend.h
        backend/x64/host_feature.h
        backend/x64/hostloc.cpp
        backend/x64/hostloc.h
        backend/x64/jitstate_info.h
        backend/x64/oparg.h
        backend/x64/perf_map.cpp
        backend/x64/perf_map.h
        backend/x64/reg_alloc.cpp
        backend/x64/reg_alloc.h
        backend/x64/stack_layout.h
        backend/x64/verbose_debugging_output.cpp
        backend/x64/verbose_debugging_output.h
        common/spin_lock_x64.cpp
        common/spin_lock_x64.h
        common/x64_disassemble.cpp
        common/x64_disassemble.h
    )

    if ("A32" IN_LIST DYNARMIC_FRONTENDS)
        target_architecture_specific_sources(dynarmic "x86_64"
            backend/x64/a32_emit_x64.cpp
            backend/x64/a32_emit_x64.h
            backend/x64/a32_emit_x64_memory.cpp
            backend/x64/a32_interface.cpp
            backend/x64/a32_jitstate.cpp
            backend/x64/a32_jitstate.h
        )
    endif()

    if ("A64" IN_LIST DYNARMIC_FRONTENDS)
        target_architecture_specific_sources(dynarmic "x86_64"
            backend/x64/a64_emit_x64.cpp
            backend/x64/a64_emit_x64.h
            backend/x64/a64_emit_x64_memory.cpp
            backend/x64/a64_interface.cpp
            backend/x64/a64_jitstate.cpp
            backend/x64/a64_jitstate.h
        )
    endif()
endif()

if ("arm64" IN_LIST ARCHITECTURE)
    target_link_libraries(dynarmic PRIVATE merry::oaknut)

    target_architecture_specific_sources(dynarmic "arm64"
        backend/arm64/a32_jitstate.cpp
        backend/arm64/a32_jitstate.h
        backend/arm64/a64_jitstate.h
        backend/arm64/abi.cpp
        backend/arm64/abi.h
        backend/arm64/address_space.cpp
        backend/arm64/address_space.h
        backend/arm64/devirtualize.h
        backend/arm64/emit_arm64.cpp
        backend/arm64/emit_arm64.h
        backend/arm64/emit_arm64_a32.cpp
        backend/arm64/emit_arm64_a32_coprocessor.cpp
        backend/arm64/emit_arm64_a32_memory.cpp
        backend/arm64/emit_arm64_a64.cpp
        backend/arm64/emit_arm64_a64_memory.cpp
        backend/arm64/emit_arm64_cryptography.cpp
        backend/arm64/emit_arm64_data_processing.cpp
        backend/arm64/emit_arm64_floating_point.cpp
        backend/arm64/emit_arm64_memory.cpp
        backend/arm64/emit_arm64_memory.h
        backend/arm64/emit_arm64_packed.cpp
        backend/arm64/emit_arm64_saturation.cpp
        backend/arm64/emit_arm64_vector.cpp
        backend/arm64/emit_arm64_vector_floating_point.cpp
        backend/arm64/emit_arm64_vector_saturation.cpp
        backend/arm64/emit_context.h
        backend/arm64/exclusive_monitor.cpp
        backend/arm64/fastmem.h
        backend/arm64/fpsr_manager.cpp
        backend/arm64/fpsr_manager.h
        backend/arm64/reg_alloc.cpp
        backend/arm64/reg_alloc.h
        backend/arm64/stack_layout.h
        backend/arm64/verbose_debugging_output.cpp
        backend/arm64/verbose_debugging_output.h
        common/spin_lock_arm64.cpp
        common/spin_lock_arm64.h
    )

    if ("A32" IN_LIST DYNARMIC_FRONTENDS)
        target_architecture_specific_sources(dynarmic "arm64"
            backend/arm64/a32_address_space.cpp
            backend/arm64/a32_address_space.h
            backend/arm64/a32_core.h
            backend/arm64/a32_interface.cpp
        )
    endif()

    if ("A64" IN_LIST DYNARMIC_FRONTENDS)
        target_architecture_specific_sources(dynarmic "arm64"
            backend/arm64/a64_address_space.cpp
            backend/arm64/a64_address_space.h
            backend/arm64/a64_core.h
            backend/arm64/a64_interface.cpp
        )
    endif()
endif()

if ("riscv" IN_LIST ARCHITECTURE)
    target_link_libraries(dynarmic PRIVATE biscuit::biscuit)

    target_sources(dynarmic PRIVATE
        backend/riscv64/abi.h
        backend/riscv64/a32_jitstate.cpp
        backend/riscv64/a32_jitstate.h
        backend/riscv64/emit_context.h
        backend/riscv64/emit_riscv64_a32.cpp
        backend/riscv64/emit_riscv64_a32_coprocessor.cpp
        backend/riscv64/emit_riscv64_a32_memory.cpp
        backend/riscv64/emit_riscv64_a64.cpp
        backend/riscv64/emit_riscv64_a64_memory.cpp
        backend/riscv64/emit_riscv64_cryptography.cpp
        backend/riscv64/emit_riscv64_data_processing.cpp
        backend/riscv64/emit_riscv64_floating_point.cpp
        backend/riscv64/emit_riscv64_packed.cpp
        backend/riscv64/emit_riscv64_saturation.cpp
        backend/riscv64/emit_riscv64_vector_floating_point.cpp
        backend/riscv64/emit_riscv64_vector_saturation.cpp
        backend/riscv64/emit_riscv64_vector.cpp
        backend/riscv64/emit_riscv64.cpp
        backend/riscv64/emit_riscv64.h
        backend/riscv64/reg_alloc.cpp
        backend/riscv64/reg_alloc.h
        backend/riscv64/stack_layout.h
    )

    if ("A32" IN_LIST DYNARMIC_FRONTENDS)
        target_sources(dynarmic PRIVATE
            backend/riscv64/a32_address_space.cpp
            backend/riscv64/a32_address_space.h
            backend/riscv64/a32_core.h
            backend/riscv64/a32_interface.cpp
            backend/riscv64/code_block.h
        )
    endif()

    if ("A64" IN_LIST DYNARMIC_FRONTENDS)
        message(FATAL_ERROR "TODO: Unimplemented frontend for this host architecture")
    endif()
endif()

if (WIN32)
    target_sources(dynarmic PRIVATE backend/exception_handler_windows.cpp)
elseif (APPLE)
    find_path(MACH_EXC_DEFS_DIR "mach/mach_exc.defs")
    if (NOT MACH_EXC_DEFS_DIR)
        message(WARNING "macOS fastmem disabled: unable to find mach/mach_exc.defs")
        target_sources(dynarmic PRIVATE backend/exception_handler_generic.cpp)
    else()
        message(STATUS "mach/mach_exc.defs location: ${MACH_EXC_DEFS_DIR}")
        execute_process(
            COMMAND
                mkdir -p "${CMAKE_CURRENT_SOURCE_DIR}/backend/x64/mig"
            COMMAND
                mig
                -arch x86_64
                -user "${CMAKE_CURRENT_SOURCE_DIR}/backend/x64/mig/mach_exc_user.c"
                -header "${CMAKE_CURRENT_SOURCE_DIR}/backend/x64/mig/mach_exc_user.h"
                -server "${CMAKE_CURRENT_SOURCE_DIR}/backend/x64/mig/mach_exc_server.c"
                -sheader "${CMAKE_CURRENT_SOURCE_DIR}/backend/x64/mig/mach_exc_server.h"
                "${MACH_EXC_DEFS_DIR}/mach/mach_exc.defs"
        )
        execute_process(
            COMMAND
                mkdir -p "${CMAKE_CURRENT_SOURCE_DIR}/backend/arm64/mig"
            COMMAND
                mig
                -arch arm64
                -user "${CMAKE_CURRENT_SOURCE_DIR}/backend/arm64/mig/mach_exc_user.c"
                -header "${CMAKE_CURRENT_SOURCE_DIR}/backend/arm64/mig/mach_exc_user.h"
                -server "${CMAKE_CURRENT_SOURCE_DIR}/backend/arm64/mig/mach_exc_server.c"
                -sheader "${CMAKE_CURRENT_SOURCE_DIR}/backend/arm64/mig/mach_exc_server.h"
                "${MACH_EXC_DEFS_DIR}/mach/mach_exc.defs"
        )
        target_sources(dynarmic PRIVATE
            backend/exception_handler_macos.cpp
            backend/exception_handler_macos_mig.c
        )
    endif()
elseif (UNIX)
    if (CMAKE_SYSTEM_NAME STREQUAL "Linux")
        target_link_libraries(dynarmic PRIVATE rt)
    endif()
    target_sources(dynarmic PRIVATE backend/exception_handler_posix.cpp)
else()
    target_sources(dynarmic PRIVATE backend/exception_handler_generic.cpp)
endif()

include(CreateDirectoryGroups)
create_target_directory_groups(dynarmic)

target_include_directories(dynarmic PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/..>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
)
set_target_properties(dynarmic PROPERTIES
    VERSION ${dynarmic_VERSION}
    SOVERSION ${dynarmic_VERSION_MAJOR}.${dynarmic_VERSION_MINOR}
)
target_compile_options(dynarmic PRIVATE ${DYNARMIC_CXX_FLAGS})
target_link_libraries(dynarmic
    PRIVATE
        fmt::fmt
        merry::mcl
        tsl::robin_map
)
if (TARGET boost_headers)
    target_link_libraries(dynarmic
        PRIVATE
            boost_headers boost_variant boost_icl
    )
else()
    target_link_libraries(dynarmic
        PRIVATE
            Boost::boost
    )
endif()

if (DYNARMIC_USE_LLVM)
    target_include_directories(dynarmic PRIVATE ${LLVM_INCLUDE_DIRS})
    target_compile_definitions(dynarmic PRIVATE DYNARMIC_USE_LLVM=1 ${LLVM_DEFINITIONS})
    llvm_config(dynarmic USE_SHARED armdesc armdisassembler aarch64desc aarch64disassembler x86desc x86disassembler)
endif()
if (DYNARMIC_ENABLE_CPU_FEATURE_DETECTION)
    target_compile_definitions(dynarmic PRIVATE DYNARMIC_ENABLE_CPU_FEATURE_DETECTION=1)
endif()
if (DYNARMIC_ENABLE_NO_EXECUTE_SUPPORT)
    target_compile_definitions(dynarmic PRIVATE DYNARMIC_ENABLE_NO_EXECUTE_SUPPORT=1)
endif()
if (DYNARMIC_IGNORE_ASSERTS)
    target_compile_definitions(dynarmic PRIVATE MCL_IGNORE_ASSERTS=1)
endif()
if (CMAKE_SYSTEM_NAME STREQUAL "Windows")
    target_compile_definitions(dynarmic PRIVATE FMT_USE_WINDOWS_H=0)
endif()
target_compile_definitions(dynarmic PRIVATE FMT_USE_USER_DEFINED_LITERALS=1)

if (DYNARMIC_USE_PRECOMPILED_HEADERS)
    set(PRECOMPILED_HEADERS "$<$<COMPILE_LANGUAGE:CXX>:${CMAKE_CURRENT_SOURCE_DIR}/ir/ir_emitter.h>")
    if ("x86_64" IN_LIST ARCHITECTURE)
        list(PREPEND PRECOMPILED_HEADERS "$<$<COMPILE_LANGUAGE:CXX>:<xbyak/xbyak.h$<ANGLE-R>>")
    endif()
    if ("arm64" IN_LIST ARCHITECTURE)
        list(PREPEND PRECOMPILED_HEADERS "$<$<COMPILE_LANGUAGE:CXX>:<oaknut/oaknut.hpp$<ANGLE-R>>")
    endif()
    target_precompile_headers(dynarmic PRIVATE ${PRECOMPILED_HEADERS})
    set(CMAKE_PCH_INSTANTIATE_TEMPLATES ON)
endif()
