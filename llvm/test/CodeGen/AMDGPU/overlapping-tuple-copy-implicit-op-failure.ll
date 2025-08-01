; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -global-isel -O0 -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1031 < %s | FileCheck %s

; Testcase which happened to trigger a liveness verifier error
define amdgpu_kernel void @test_long_add4(<4 x i64> %arg) #0 {
; CHECK-LABEL: test_long_add4:
; CHECK:       ; %bb.0: ; %entry
; CHECK-NEXT:    s_mov_b64 s[4:5], 0
; CHECK-NEXT:    v_mov_b32_e32 v0, s4
; CHECK-NEXT:    v_mov_b32_e32 v1, s5
; CHECK-NEXT:    global_load_dwordx4 v[6:9], v[0:1], off
; CHECK-NEXT:    v_mov_b32_e32 v0, s4
; CHECK-NEXT:    v_mov_b32_e32 v1, s5
; CHECK-NEXT:    global_load_dwordx4 v[0:3], v[0:1], off offset:16
; CHECK-NEXT:    ; kill: def $vgpr6_vgpr7_vgpr8_vgpr9 killed $vgpr6_vgpr7_vgpr8_vgpr9 def $vgpr6_vgpr7_vgpr8_vgpr9_vgpr10_vgpr11_vgpr12_vgpr13 killed $exec
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mov_b32_e32 v13, v3
; CHECK-NEXT:    v_mov_b32_e32 v12, v2
; CHECK-NEXT:    v_mov_b32_e32 v11, v1
; CHECK-NEXT:    v_mov_b32_e32 v10, v0
; CHECK-NEXT:    v_mov_b32_e32 v0, s4
; CHECK-NEXT:    v_mov_b32_e32 v1, s5
; CHECK-NEXT:    global_load_dwordx4 v[18:21], v[0:1], off
; CHECK-NEXT:    v_mov_b32_e32 v0, s4
; CHECK-NEXT:    v_mov_b32_e32 v1, s5
; CHECK-NEXT:    global_load_dwordx4 v[0:3], v[0:1], off offset:16
; CHECK-NEXT:    ; kill: def $vgpr18_vgpr19_vgpr20_vgpr21 killed $vgpr18_vgpr19_vgpr20_vgpr21 def $vgpr18_vgpr19_vgpr20_vgpr21_vgpr22_vgpr23_vgpr24_vgpr25 killed $exec
; CHECK-NEXT:    s_waitcnt vmcnt(0)
; CHECK-NEXT:    v_mov_b32_e32 v25, v3
; CHECK-NEXT:    v_mov_b32_e32 v24, v2
; CHECK-NEXT:    v_mov_b32_e32 v23, v1
; CHECK-NEXT:    v_mov_b32_e32 v22, v0
; CHECK-NEXT:    v_mov_b32_e32 v4, v6
; CHECK-NEXT:    v_mov_b32_e32 v5, v7
; CHECK-NEXT:    v_mov_b32_e32 v2, v8
; CHECK-NEXT:    v_mov_b32_e32 v3, v9
; CHECK-NEXT:    v_mov_b32_e32 v0, v10
; CHECK-NEXT:    v_mov_b32_e32 v1, v11
; CHECK-NEXT:    v_mov_b32_e32 v8, v12
; CHECK-NEXT:    v_mov_b32_e32 v9, v13
; CHECK-NEXT:    v_mov_b32_e32 v16, v18
; CHECK-NEXT:    v_mov_b32_e32 v17, v19
; CHECK-NEXT:    v_mov_b32_e32 v14, v20
; CHECK-NEXT:    v_mov_b32_e32 v15, v21
; CHECK-NEXT:    v_mov_b32_e32 v12, v22
; CHECK-NEXT:    v_mov_b32_e32 v13, v23
; CHECK-NEXT:    v_mov_b32_e32 v10, v24
; CHECK-NEXT:    v_mov_b32_e32 v11, v25
; CHECK-NEXT:    v_mov_b32_e32 v6, v4
; CHECK-NEXT:    v_mov_b32_e32 v4, v5
; CHECK-NEXT:    v_mov_b32_e32 v7, v16
; CHECK-NEXT:    v_mov_b32_e32 v5, v17
; CHECK-NEXT:    v_add_co_u32 v6, s6, v6, v7
; CHECK-NEXT:    v_add_co_ci_u32_e64 v4, s6, v4, v5, s6
; CHECK-NEXT:    ; kill: def $vgpr6 killed $vgpr6 def $vgpr6_vgpr7 killed $exec
; CHECK-NEXT:    v_mov_b32_e32 v7, v4
; CHECK-NEXT:    v_mov_b32_e32 v4, v2
; CHECK-NEXT:    v_mov_b32_e32 v2, v3
; CHECK-NEXT:    v_mov_b32_e32 v5, v14
; CHECK-NEXT:    v_mov_b32_e32 v3, v15
; CHECK-NEXT:    v_add_co_u32 v4, s6, v4, v5
; CHECK-NEXT:    v_add_co_ci_u32_e64 v2, s6, v2, v3, s6
; CHECK-NEXT:    ; kill: def $vgpr4 killed $vgpr4 def $vgpr4_vgpr5 killed $exec
; CHECK-NEXT:    v_mov_b32_e32 v5, v2
; CHECK-NEXT:    v_mov_b32_e32 v2, v0
; CHECK-NEXT:    v_mov_b32_e32 v0, v1
; CHECK-NEXT:    v_mov_b32_e32 v3, v12
; CHECK-NEXT:    v_mov_b32_e32 v1, v13
; CHECK-NEXT:    v_add_co_u32 v2, s6, v2, v3
; CHECK-NEXT:    v_add_co_ci_u32_e64 v0, s6, v0, v1, s6
; CHECK-NEXT:    ; kill: def $vgpr2 killed $vgpr2 def $vgpr2_vgpr3 killed $exec
; CHECK-NEXT:    v_mov_b32_e32 v3, v0
; CHECK-NEXT:    v_mov_b32_e32 v0, v8
; CHECK-NEXT:    v_mov_b32_e32 v1, v9
; CHECK-NEXT:    v_mov_b32_e32 v9, v10
; CHECK-NEXT:    v_mov_b32_e32 v8, v11
; CHECK-NEXT:    v_add_co_u32 v0, s6, v0, v9
; CHECK-NEXT:    v_add_co_ci_u32_e64 v8, s6, v1, v8, s6
; CHECK-NEXT:    ; kill: def $vgpr0 killed $vgpr0 def $vgpr0_vgpr1 killed $exec
; CHECK-NEXT:    v_mov_b32_e32 v1, v8
; CHECK-NEXT:    ; kill: def $vgpr6_vgpr7 killed $vgpr6_vgpr7 def $vgpr6_vgpr7_vgpr8_vgpr9 killed $exec
; CHECK-NEXT:    v_mov_b32_e32 v9, v5
; CHECK-NEXT:    v_mov_b32_e32 v8, v4
; CHECK-NEXT:    ; kill: def $vgpr2_vgpr3 killed $vgpr2_vgpr3 def $vgpr2_vgpr3_vgpr4_vgpr5 killed $exec
; CHECK-NEXT:    v_mov_b32_e32 v5, v1
; CHECK-NEXT:    v_mov_b32_e32 v4, v0
; CHECK-NEXT:    v_mov_b32_e32 v0, s4
; CHECK-NEXT:    v_mov_b32_e32 v1, s5
; CHECK-NEXT:    global_store_dwordx4 v[0:1], v[6:9], off
; CHECK-NEXT:    s_mov_b64 s[4:5], 16
; CHECK-NEXT:    v_mov_b32_e32 v0, s4
; CHECK-NEXT:    v_mov_b32_e32 v1, s5
; CHECK-NEXT:    global_store_dwordx4 v[0:1], v[2:5], off
; CHECK-NEXT:    s_endpgm
entry:
  %load0 = load <4 x i64>, ptr addrspace(1) null, align 32
  %load1 = load <4 x i64>, ptr addrspace(1) null, align 32
  %add = add <4 x i64> %load0, %load1
  store <4 x i64> %add, ptr addrspace(1) null, align 32
  ret void
}

attributes #0 = { noinline optnone }
