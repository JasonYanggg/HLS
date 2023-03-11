// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module dct_dct_Pipeline_RD_Loop_Row (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        m_axi_gmem_AWVALID,
        m_axi_gmem_AWREADY,
        m_axi_gmem_AWADDR,
        m_axi_gmem_AWID,
        m_axi_gmem_AWLEN,
        m_axi_gmem_AWSIZE,
        m_axi_gmem_AWBURST,
        m_axi_gmem_AWLOCK,
        m_axi_gmem_AWCACHE,
        m_axi_gmem_AWPROT,
        m_axi_gmem_AWQOS,
        m_axi_gmem_AWREGION,
        m_axi_gmem_AWUSER,
        m_axi_gmem_WVALID,
        m_axi_gmem_WREADY,
        m_axi_gmem_WDATA,
        m_axi_gmem_WSTRB,
        m_axi_gmem_WLAST,
        m_axi_gmem_WID,
        m_axi_gmem_WUSER,
        m_axi_gmem_ARVALID,
        m_axi_gmem_ARREADY,
        m_axi_gmem_ARADDR,
        m_axi_gmem_ARID,
        m_axi_gmem_ARLEN,
        m_axi_gmem_ARSIZE,
        m_axi_gmem_ARBURST,
        m_axi_gmem_ARLOCK,
        m_axi_gmem_ARCACHE,
        m_axi_gmem_ARPROT,
        m_axi_gmem_ARQOS,
        m_axi_gmem_ARREGION,
        m_axi_gmem_ARUSER,
        m_axi_gmem_RVALID,
        m_axi_gmem_RREADY,
        m_axi_gmem_RDATA,
        m_axi_gmem_RLAST,
        m_axi_gmem_RID,
        m_axi_gmem_RFIFONUM,
        m_axi_gmem_RUSER,
        m_axi_gmem_RRESP,
        m_axi_gmem_BVALID,
        m_axi_gmem_BREADY,
        m_axi_gmem_BRESP,
        m_axi_gmem_BID,
        m_axi_gmem_BUSER,
        sext_ln74,
        buf_2d_in_0_address0,
        buf_2d_in_0_ce0,
        buf_2d_in_0_we0,
        buf_2d_in_0_d0,
        buf_2d_in_1_address0,
        buf_2d_in_1_ce0,
        buf_2d_in_1_we0,
        buf_2d_in_1_d0,
        buf_2d_in_2_address0,
        buf_2d_in_2_ce0,
        buf_2d_in_2_we0,
        buf_2d_in_2_d0,
        buf_2d_in_3_address0,
        buf_2d_in_3_ce0,
        buf_2d_in_3_we0,
        buf_2d_in_3_d0,
        buf_2d_in_4_address0,
        buf_2d_in_4_ce0,
        buf_2d_in_4_we0,
        buf_2d_in_4_d0,
        buf_2d_in_5_address0,
        buf_2d_in_5_ce0,
        buf_2d_in_5_we0,
        buf_2d_in_5_d0,
        buf_2d_in_6_address0,
        buf_2d_in_6_ce0,
        buf_2d_in_6_we0,
        buf_2d_in_6_d0,
        buf_2d_in_7_address0,
        buf_2d_in_7_ce0,
        buf_2d_in_7_we0,
        buf_2d_in_7_d0
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output   m_axi_gmem_AWVALID;
input   m_axi_gmem_AWREADY;
output  [63:0] m_axi_gmem_AWADDR;
output  [0:0] m_axi_gmem_AWID;
output  [31:0] m_axi_gmem_AWLEN;
output  [2:0] m_axi_gmem_AWSIZE;
output  [1:0] m_axi_gmem_AWBURST;
output  [1:0] m_axi_gmem_AWLOCK;
output  [3:0] m_axi_gmem_AWCACHE;
output  [2:0] m_axi_gmem_AWPROT;
output  [3:0] m_axi_gmem_AWQOS;
output  [3:0] m_axi_gmem_AWREGION;
output  [0:0] m_axi_gmem_AWUSER;
output   m_axi_gmem_WVALID;
input   m_axi_gmem_WREADY;
output  [511:0] m_axi_gmem_WDATA;
output  [63:0] m_axi_gmem_WSTRB;
output   m_axi_gmem_WLAST;
output  [0:0] m_axi_gmem_WID;
output  [0:0] m_axi_gmem_WUSER;
output   m_axi_gmem_ARVALID;
input   m_axi_gmem_ARREADY;
output  [63:0] m_axi_gmem_ARADDR;
output  [0:0] m_axi_gmem_ARID;
output  [31:0] m_axi_gmem_ARLEN;
output  [2:0] m_axi_gmem_ARSIZE;
output  [1:0] m_axi_gmem_ARBURST;
output  [1:0] m_axi_gmem_ARLOCK;
output  [3:0] m_axi_gmem_ARCACHE;
output  [2:0] m_axi_gmem_ARPROT;
output  [3:0] m_axi_gmem_ARQOS;
output  [3:0] m_axi_gmem_ARREGION;
output  [0:0] m_axi_gmem_ARUSER;
input   m_axi_gmem_RVALID;
output   m_axi_gmem_RREADY;
input  [511:0] m_axi_gmem_RDATA;
input   m_axi_gmem_RLAST;
input  [0:0] m_axi_gmem_RID;
input  [8:0] m_axi_gmem_RFIFONUM;
input  [0:0] m_axi_gmem_RUSER;
input  [1:0] m_axi_gmem_RRESP;
input   m_axi_gmem_BVALID;
output   m_axi_gmem_BREADY;
input  [1:0] m_axi_gmem_BRESP;
input  [0:0] m_axi_gmem_BID;
input  [0:0] m_axi_gmem_BUSER;
input  [57:0] sext_ln74;
output  [2:0] buf_2d_in_0_address0;
output   buf_2d_in_0_ce0;
output   buf_2d_in_0_we0;
output  [15:0] buf_2d_in_0_d0;
output  [2:0] buf_2d_in_1_address0;
output   buf_2d_in_1_ce0;
output   buf_2d_in_1_we0;
output  [15:0] buf_2d_in_1_d0;
output  [2:0] buf_2d_in_2_address0;
output   buf_2d_in_2_ce0;
output   buf_2d_in_2_we0;
output  [15:0] buf_2d_in_2_d0;
output  [2:0] buf_2d_in_3_address0;
output   buf_2d_in_3_ce0;
output   buf_2d_in_3_we0;
output  [15:0] buf_2d_in_3_d0;
output  [2:0] buf_2d_in_4_address0;
output   buf_2d_in_4_ce0;
output   buf_2d_in_4_we0;
output  [15:0] buf_2d_in_4_d0;
output  [2:0] buf_2d_in_5_address0;
output   buf_2d_in_5_ce0;
output   buf_2d_in_5_we0;
output  [15:0] buf_2d_in_5_d0;
output  [2:0] buf_2d_in_6_address0;
output   buf_2d_in_6_ce0;
output   buf_2d_in_6_we0;
output  [15:0] buf_2d_in_6_d0;
output  [2:0] buf_2d_in_7_address0;
output   buf_2d_in_7_ce0;
output   buf_2d_in_7_we0;
output  [15:0] buf_2d_in_7_d0;

reg ap_idle;
reg m_axi_gmem_RREADY;
reg buf_2d_in_0_ce0;
reg buf_2d_in_0_we0;
reg buf_2d_in_1_ce0;
reg buf_2d_in_1_we0;
reg buf_2d_in_2_ce0;
reg buf_2d_in_2_we0;
reg buf_2d_in_3_ce0;
reg buf_2d_in_3_we0;
reg buf_2d_in_4_ce0;
reg buf_2d_in_4_we0;
reg buf_2d_in_5_ce0;
reg buf_2d_in_5_we0;
reg buf_2d_in_6_ce0;
reg buf_2d_in_6_we0;
reg buf_2d_in_7_ce0;
reg buf_2d_in_7_we0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
reg   [0:0] icmp_ln74_reg_424;
reg   [0:0] icmp_ln76_reg_428;
reg    ap_predicate_op25_read_state2;
reg    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
reg    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln74_fu_251_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    gmem_blk_n_R;
wire    ap_block_pp0_stage0;
reg    ap_block_pp0_stage0_11001;
reg   [3:0] r_2_reg_419;
reg   [3:0] r_2_reg_419_pp0_iter1_reg;
reg   [0:0] icmp_ln74_reg_424_pp0_iter1_reg;
wire   [0:0] icmp_ln76_fu_267_p2;
reg   [0:0] icmp_ln76_reg_428_pp0_iter1_reg;
reg   [511:0] gmem_addr_read_reg_432;
reg    ap_condition_exit_pp0_iter1_stage0;
reg   [511:0] ap_phi_mux_empty_29_phi_fu_228_p4;
wire   [511:0] ap_phi_reg_pp0_iter2_empty_29_reg_225;
wire   [511:0] shiftreg72_cast_fu_287_p1;
wire   [63:0] r_cast19_fu_292_p1;
reg   [383:0] shiftreg72_fu_102;
wire    ap_loop_init;
reg   [3:0] r_fu_106;
wire   [3:0] add_ln74_fu_257_p2;
reg   [3:0] ap_sig_allocacmp_r_2;
wire   [1:0] empty_30_fu_263_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_done_reg = 1'b0;
end

dct_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln74_fu_251_p2 == 1'd0))) begin
            r_fu_106 <= add_ln74_fu_257_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            r_fu_106 <= 4'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            shiftreg72_fu_102 <= 384'd0;
        end else if ((ap_enable_reg_pp0_iter2 == 1'b1)) begin
            shiftreg72_fu_102 <= {{ap_phi_mux_empty_29_phi_fu_228_p4[511:128]}};
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        icmp_ln74_reg_424 <= icmp_ln74_fu_251_p2;
        icmp_ln74_reg_424_pp0_iter1_reg <= icmp_ln74_reg_424;
        icmp_ln76_reg_428_pp0_iter1_reg <= icmp_ln76_reg_428;
        r_2_reg_419 <= ap_sig_allocacmp_r_2;
        r_2_reg_419_pp0_iter1_reg <= r_2_reg_419;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_predicate_op25_read_state2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        gmem_addr_read_reg_432 <= m_axi_gmem_RDATA;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln74_fu_251_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln76_reg_428 <= icmp_ln76_fu_267_p2;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln74_fu_251_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln74_reg_424 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter1_reg == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((icmp_ln74_reg_424_pp0_iter1_reg == 1'd0)) begin
        if ((icmp_ln76_reg_428_pp0_iter1_reg == 1'd0)) begin
            ap_phi_mux_empty_29_phi_fu_228_p4 = shiftreg72_cast_fu_287_p1;
        end else if ((icmp_ln76_reg_428_pp0_iter1_reg == 1'd1)) begin
            ap_phi_mux_empty_29_phi_fu_228_p4 = gmem_addr_read_reg_432;
        end else begin
            ap_phi_mux_empty_29_phi_fu_228_p4 = ap_phi_reg_pp0_iter2_empty_29_reg_225;
        end
    end else begin
        ap_phi_mux_empty_29_phi_fu_228_p4 = ap_phi_reg_pp0_iter2_empty_29_reg_225;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_sig_allocacmp_r_2 = 4'd0;
    end else begin
        ap_sig_allocacmp_r_2 = r_fu_106;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        buf_2d_in_0_ce0 = 1'b1;
    end else begin
        buf_2d_in_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        buf_2d_in_0_we0 = 1'b1;
    end else begin
        buf_2d_in_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        buf_2d_in_1_ce0 = 1'b1;
    end else begin
        buf_2d_in_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        buf_2d_in_1_we0 = 1'b1;
    end else begin
        buf_2d_in_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        buf_2d_in_2_ce0 = 1'b1;
    end else begin
        buf_2d_in_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        buf_2d_in_2_we0 = 1'b1;
    end else begin
        buf_2d_in_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        buf_2d_in_3_ce0 = 1'b1;
    end else begin
        buf_2d_in_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        buf_2d_in_3_we0 = 1'b1;
    end else begin
        buf_2d_in_3_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        buf_2d_in_4_ce0 = 1'b1;
    end else begin
        buf_2d_in_4_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        buf_2d_in_4_we0 = 1'b1;
    end else begin
        buf_2d_in_4_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        buf_2d_in_5_ce0 = 1'b1;
    end else begin
        buf_2d_in_5_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        buf_2d_in_5_we0 = 1'b1;
    end else begin
        buf_2d_in_5_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        buf_2d_in_6_ce0 = 1'b1;
    end else begin
        buf_2d_in_6_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        buf_2d_in_6_we0 = 1'b1;
    end else begin
        buf_2d_in_6_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        buf_2d_in_7_ce0 = 1'b1;
    end else begin
        buf_2d_in_7_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        buf_2d_in_7_we0 = 1'b1;
    end else begin
        buf_2d_in_7_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_predicate_op25_read_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        gmem_blk_n_R = m_axi_gmem_RVALID;
    end else begin
        gmem_blk_n_R = 1'b1;
    end
end

always @ (*) begin
    if (((ap_predicate_op25_read_state2 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        m_axi_gmem_RREADY = 1'b1;
    end else begin
        m_axi_gmem_RREADY = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln74_fu_257_p2 = (ap_sig_allocacmp_r_2 + 4'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_predicate_op25_read_state2 == 1'b1) & (m_axi_gmem_RVALID == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_predicate_op25_read_state2 == 1'b1) & (m_axi_gmem_RVALID == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state2_pp0_stage0_iter1 = ((ap_predicate_op25_read_state2 == 1'b1) & (m_axi_gmem_RVALID == 1'b0));
end

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign ap_phi_reg_pp0_iter2_empty_29_reg_225 = 'bx;

always @ (*) begin
    ap_predicate_op25_read_state2 = ((icmp_ln76_reg_428 == 1'd1) & (icmp_ln74_reg_424 == 1'd0));
end

assign buf_2d_in_0_address0 = r_cast19_fu_292_p1;

assign buf_2d_in_0_d0 = ap_phi_mux_empty_29_phi_fu_228_p4[15:0];

assign buf_2d_in_1_address0 = r_cast19_fu_292_p1;

assign buf_2d_in_1_d0 = {{ap_phi_mux_empty_29_phi_fu_228_p4[31:16]}};

assign buf_2d_in_2_address0 = r_cast19_fu_292_p1;

assign buf_2d_in_2_d0 = {{ap_phi_mux_empty_29_phi_fu_228_p4[47:32]}};

assign buf_2d_in_3_address0 = r_cast19_fu_292_p1;

assign buf_2d_in_3_d0 = {{ap_phi_mux_empty_29_phi_fu_228_p4[63:48]}};

assign buf_2d_in_4_address0 = r_cast19_fu_292_p1;

assign buf_2d_in_4_d0 = {{ap_phi_mux_empty_29_phi_fu_228_p4[79:64]}};

assign buf_2d_in_5_address0 = r_cast19_fu_292_p1;

assign buf_2d_in_5_d0 = {{ap_phi_mux_empty_29_phi_fu_228_p4[95:80]}};

assign buf_2d_in_6_address0 = r_cast19_fu_292_p1;

assign buf_2d_in_6_d0 = {{ap_phi_mux_empty_29_phi_fu_228_p4[111:96]}};

assign buf_2d_in_7_address0 = r_cast19_fu_292_p1;

assign buf_2d_in_7_d0 = {{ap_phi_mux_empty_29_phi_fu_228_p4[127:112]}};

assign empty_30_fu_263_p1 = ap_sig_allocacmp_r_2[1:0];

assign icmp_ln74_fu_251_p2 = ((ap_sig_allocacmp_r_2 == 4'd8) ? 1'b1 : 1'b0);

assign icmp_ln76_fu_267_p2 = ((empty_30_fu_263_p1 == 2'd0) ? 1'b1 : 1'b0);

assign m_axi_gmem_ARADDR = 64'd0;

assign m_axi_gmem_ARBURST = 2'd0;

assign m_axi_gmem_ARCACHE = 4'd0;

assign m_axi_gmem_ARID = 1'd0;

assign m_axi_gmem_ARLEN = 32'd0;

assign m_axi_gmem_ARLOCK = 2'd0;

assign m_axi_gmem_ARPROT = 3'd0;

assign m_axi_gmem_ARQOS = 4'd0;

assign m_axi_gmem_ARREGION = 4'd0;

assign m_axi_gmem_ARSIZE = 3'd0;

assign m_axi_gmem_ARUSER = 1'd0;

assign m_axi_gmem_ARVALID = 1'b0;

assign m_axi_gmem_AWADDR = 64'd0;

assign m_axi_gmem_AWBURST = 2'd0;

assign m_axi_gmem_AWCACHE = 4'd0;

assign m_axi_gmem_AWID = 1'd0;

assign m_axi_gmem_AWLEN = 32'd0;

assign m_axi_gmem_AWLOCK = 2'd0;

assign m_axi_gmem_AWPROT = 3'd0;

assign m_axi_gmem_AWQOS = 4'd0;

assign m_axi_gmem_AWREGION = 4'd0;

assign m_axi_gmem_AWSIZE = 3'd0;

assign m_axi_gmem_AWUSER = 1'd0;

assign m_axi_gmem_AWVALID = 1'b0;

assign m_axi_gmem_BREADY = 1'b0;

assign m_axi_gmem_WDATA = 512'd0;

assign m_axi_gmem_WID = 1'd0;

assign m_axi_gmem_WLAST = 1'b0;

assign m_axi_gmem_WSTRB = 64'd0;

assign m_axi_gmem_WUSER = 1'd0;

assign m_axi_gmem_WVALID = 1'b0;

assign r_cast19_fu_292_p1 = r_2_reg_419_pp0_iter1_reg;

assign shiftreg72_cast_fu_287_p1 = shiftreg72_fu_102;

endmodule //dct_dct_Pipeline_RD_Loop_Row
