// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module dct_dct_Pipeline_Col_DCT_Loop_DCT_Outer_Loop (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        col_inbuf_address0,
        col_inbuf_ce0,
        col_inbuf_q0,
        col_inbuf_address1,
        col_inbuf_ce1,
        col_inbuf_q1,
        col_inbuf_address2,
        col_inbuf_ce2,
        col_inbuf_q2,
        col_inbuf_address3,
        col_inbuf_ce3,
        col_inbuf_q3,
        col_inbuf_address4,
        col_inbuf_ce4,
        col_inbuf_q4,
        col_inbuf_address5,
        col_inbuf_ce5,
        col_inbuf_q5,
        col_inbuf_address6,
        col_inbuf_ce6,
        col_inbuf_q6,
        col_inbuf_address7,
        col_inbuf_ce7,
        col_inbuf_q7,
        col_outbuf_address0,
        col_outbuf_ce0,
        col_outbuf_we0,
        col_outbuf_d0,
        dct_coeff_table_0_address0,
        dct_coeff_table_0_ce0,
        dct_coeff_table_0_q0,
        dct_coeff_table_1_address0,
        dct_coeff_table_1_ce0,
        dct_coeff_table_1_q0,
        dct_coeff_table_2_address0,
        dct_coeff_table_2_ce0,
        dct_coeff_table_2_q0,
        dct_coeff_table_3_address0,
        dct_coeff_table_3_ce0,
        dct_coeff_table_3_q0,
        dct_coeff_table_4_address0,
        dct_coeff_table_4_ce0,
        dct_coeff_table_4_q0,
        dct_coeff_table_5_address0,
        dct_coeff_table_5_ce0,
        dct_coeff_table_5_q0,
        dct_coeff_table_6_address0,
        dct_coeff_table_6_ce0,
        dct_coeff_table_6_q0,
        dct_coeff_table_7_address0,
        dct_coeff_table_7_ce0,
        dct_coeff_table_7_q0
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [5:0] col_inbuf_address0;
output   col_inbuf_ce0;
input  [15:0] col_inbuf_q0;
output  [5:0] col_inbuf_address1;
output   col_inbuf_ce1;
input  [15:0] col_inbuf_q1;
output  [5:0] col_inbuf_address2;
output   col_inbuf_ce2;
input  [15:0] col_inbuf_q2;
output  [5:0] col_inbuf_address3;
output   col_inbuf_ce3;
input  [15:0] col_inbuf_q3;
output  [5:0] col_inbuf_address4;
output   col_inbuf_ce4;
input  [15:0] col_inbuf_q4;
output  [5:0] col_inbuf_address5;
output   col_inbuf_ce5;
input  [15:0] col_inbuf_q5;
output  [5:0] col_inbuf_address6;
output   col_inbuf_ce6;
input  [15:0] col_inbuf_q6;
output  [5:0] col_inbuf_address7;
output   col_inbuf_ce7;
input  [15:0] col_inbuf_q7;
output  [5:0] col_outbuf_address0;
output   col_outbuf_ce0;
output   col_outbuf_we0;
output  [15:0] col_outbuf_d0;
output  [2:0] dct_coeff_table_0_address0;
output   dct_coeff_table_0_ce0;
input  [13:0] dct_coeff_table_0_q0;
output  [2:0] dct_coeff_table_1_address0;
output   dct_coeff_table_1_ce0;
input  [14:0] dct_coeff_table_1_q0;
output  [2:0] dct_coeff_table_2_address0;
output   dct_coeff_table_2_ce0;
input  [14:0] dct_coeff_table_2_q0;
output  [2:0] dct_coeff_table_3_address0;
output   dct_coeff_table_3_ce0;
input  [14:0] dct_coeff_table_3_q0;
output  [2:0] dct_coeff_table_4_address0;
output   dct_coeff_table_4_ce0;
input  [14:0] dct_coeff_table_4_q0;
output  [2:0] dct_coeff_table_5_address0;
output   dct_coeff_table_5_ce0;
input  [14:0] dct_coeff_table_5_q0;
output  [2:0] dct_coeff_table_6_address0;
output   dct_coeff_table_6_ce0;
input  [14:0] dct_coeff_table_6_q0;
output  [2:0] dct_coeff_table_7_address0;
output   dct_coeff_table_7_ce0;
input  [14:0] dct_coeff_table_7_q0;

reg ap_idle;
reg col_inbuf_ce0;
reg col_inbuf_ce1;
reg col_inbuf_ce2;
reg col_inbuf_ce3;
reg col_inbuf_ce4;
reg col_inbuf_ce5;
reg col_inbuf_ce6;
reg col_inbuf_ce7;
reg col_outbuf_ce0;
reg col_outbuf_we0;
reg dct_coeff_table_0_ce0;
reg dct_coeff_table_1_ce0;
reg dct_coeff_table_2_ce0;
reg dct_coeff_table_3_ce0;
reg dct_coeff_table_4_ce0;
reg dct_coeff_table_5_ce0;
reg dct_coeff_table_6_ce0;
reg dct_coeff_table_7_ce0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter4;
reg    ap_enable_reg_pp0_iter5;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    ap_block_state4_pp0_stage0_iter3;
wire    ap_block_state5_pp0_stage0_iter4;
wire    ap_block_state6_pp0_stage0_iter5;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln58_fu_339_p2;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
wire   [5:0] add_ln34_fu_568_p2;
reg   [5:0] add_ln34_reg_807;
reg   [5:0] add_ln34_reg_807_pp0_iter1_reg;
reg   [5:0] add_ln34_reg_807_pp0_iter2_reg;
reg   [5:0] add_ln34_reg_807_pp0_iter3_reg;
reg   [5:0] add_ln34_reg_807_pp0_iter4_reg;
reg  signed [15:0] col_inbuf_load_reg_852;
reg  signed [15:0] col_inbuf_load_3_reg_867;
reg  signed [15:0] col_inbuf_load_5_reg_877;
reg  signed [15:0] col_inbuf_load_6_reg_882;
reg   [13:0] dct_coeff_table_0_load_reg_892;
reg  signed [14:0] dct_coeff_table_3_load_reg_907;
reg  signed [14:0] dct_coeff_table_5_load_reg_917;
reg  signed [14:0] dct_coeff_table_6_load_reg_922;
wire  signed [28:0] grp_fu_680_p2;
wire  signed [28:0] grp_fu_686_p2;
wire  signed [28:0] grp_fu_692_p2;
wire   [28:0] grp_fu_698_p3;
wire   [63:0] zext_ln58_fu_414_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln32_fu_433_p1;
wire   [63:0] zext_ln32_1_fu_452_p1;
wire   [63:0] zext_ln32_2_fu_471_p1;
wire   [63:0] zext_ln32_3_fu_490_p1;
wire   [63:0] zext_ln32_4_fu_509_p1;
wire   [63:0] zext_ln32_5_fu_528_p1;
wire   [63:0] zext_ln32_6_fu_547_p1;
wire   [63:0] k_1_cast_fu_552_p1;
wire   [63:0] zext_ln34_2_fu_651_p1;
reg   [3:0] k_fu_80;
wire   [3:0] add_ln28_fu_574_p2;
wire    ap_loop_init;
reg   [3:0] ap_sig_allocacmp_k_load;
reg   [3:0] i_fu_84;
wire   [3:0] select_ln58_1_fu_386_p3;
reg   [3:0] ap_sig_allocacmp_i_1;
reg   [6:0] indvar_flatten29_fu_88;
wire   [6:0] add_ln58_1_fu_345_p2;
reg   [6:0] ap_sig_allocacmp_indvar_flatten29_load;
wire   [2:0] trunc_ln32_fu_327_p1;
wire   [3:0] add_ln58_fu_354_p2;
wire   [0:0] icmp_ln28_fu_364_p2;
wire   [2:0] trunc_ln43_fu_360_p1;
wire   [2:0] trunc_ln34_fu_394_p1;
wire   [5:0] tmp_11_cast_fu_378_p3;
wire   [5:0] tmp_3_cast_fu_331_p3;
wire   [5:0] select_ln58_2_fu_406_p3;
wire   [5:0] select_ln58_10_fu_419_p3;
wire   [5:0] or_ln58_fu_427_p2;
wire   [5:0] select_ln58_11_fu_438_p3;
wire   [5:0] or_ln58_1_fu_446_p2;
wire   [5:0] select_ln58_12_fu_457_p3;
wire   [5:0] or_ln58_2_fu_465_p2;
wire   [5:0] select_ln58_13_fu_476_p3;
wire   [5:0] or_ln58_3_fu_484_p2;
wire   [5:0] select_ln58_14_fu_495_p3;
wire   [5:0] or_ln58_4_fu_503_p2;
wire   [5:0] select_ln58_15_fu_514_p3;
wire   [5:0] or_ln58_5_fu_522_p2;
wire   [5:0] select_ln58_16_fu_533_p3;
wire   [5:0] or_ln58_6_fu_541_p2;
wire   [3:0] select_ln58_fu_370_p3;
wire   [5:0] tmp_s_fu_398_p3;
wire   [5:0] zext_ln34_fu_564_p1;
wire  signed [28:0] grp_fu_715_p3;
wire  signed [28:0] grp_fu_706_p3;
wire  signed [28:0] add_ln34_15_fu_659_p0;
wire   [28:0] grp_fu_733_p3;
wire  signed [28:0] grp_fu_724_p3;
(* use_dsp48 = "no" *) wire   [28:0] add_ln34_15_fu_659_p2;
(* use_dsp48 = "no" *) wire   [28:0] add_ln34_11_fu_655_p2;
wire   [28:0] add_ln34_1_fu_663_p2;
wire   [12:0] grp_fu_698_p2;
wire   [13:0] grp_fu_706_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg    ap_loop_exit_ready_pp0_iter1_reg;
reg    ap_loop_exit_ready_pp0_iter2_reg;
reg    ap_loop_exit_ready_pp0_iter3_reg;
reg    ap_loop_exit_ready_pp0_iter4_reg;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire   [28:0] grp_fu_706_p10;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 ap_done_reg = 1'b0;
end

dct_mul_mul_16s_15s_29_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 15 ),
    .dout_WIDTH( 29 ))
mul_mul_16s_15s_29_4_1_U43(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(col_inbuf_q6),
    .din1(dct_coeff_table_1_q0),
    .ce(1'b1),
    .dout(grp_fu_680_p2)
);

dct_mul_mul_16s_15s_29_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 15 ),
    .dout_WIDTH( 29 ))
mul_mul_16s_15s_29_4_1_U44(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(col_inbuf_q5),
    .din1(dct_coeff_table_2_q0),
    .ce(1'b1),
    .dout(grp_fu_686_p2)
);

dct_mul_mul_16s_15s_29_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 15 ),
    .dout_WIDTH( 29 ))
mul_mul_16s_15s_29_4_1_U45(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(col_inbuf_q3),
    .din1(dct_coeff_table_4_q0),
    .ce(1'b1),
    .dout(grp_fu_692_p2)
);

dct_mac_muladd_16s_15s_13ns_29_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 15 ),
    .din2_WIDTH( 13 ),
    .dout_WIDTH( 29 ))
mac_muladd_16s_15s_13ns_29_4_1_U46(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(col_inbuf_q0),
    .din1(dct_coeff_table_7_q0),
    .din2(grp_fu_698_p2),
    .ce(1'b1),
    .dout(grp_fu_698_p3)
);

dct_mac_muladd_16s_14ns_29s_29_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 14 ),
    .din2_WIDTH( 29 ),
    .dout_WIDTH( 29 ))
mac_muladd_16s_14ns_29s_29_4_1_U47(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(col_inbuf_load_reg_852),
    .din1(grp_fu_706_p1),
    .din2(grp_fu_680_p2),
    .ce(1'b1),
    .dout(grp_fu_706_p3)
);

dct_mac_muladd_16s_15s_29s_29_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 15 ),
    .din2_WIDTH( 29 ),
    .dout_WIDTH( 29 ))
mac_muladd_16s_15s_29s_29_4_1_U48(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(col_inbuf_load_3_reg_867),
    .din1(dct_coeff_table_3_load_reg_907),
    .din2(grp_fu_686_p2),
    .ce(1'b1),
    .dout(grp_fu_715_p3)
);

dct_mac_muladd_16s_15s_29s_29_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 15 ),
    .din2_WIDTH( 29 ),
    .dout_WIDTH( 29 ))
mac_muladd_16s_15s_29s_29_4_1_U49(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(col_inbuf_load_5_reg_877),
    .din1(dct_coeff_table_5_load_reg_917),
    .din2(grp_fu_692_p2),
    .ce(1'b1),
    .dout(grp_fu_724_p3)
);

dct_mac_muladd_16s_15s_29ns_29_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 16 ),
    .din1_WIDTH( 15 ),
    .din2_WIDTH( 29 ),
    .dout_WIDTH( 29 ))
mac_muladd_16s_15s_29ns_29_4_1_U50(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(col_inbuf_load_6_reg_882),
    .din1(dct_coeff_table_6_load_reg_922),
    .din2(grp_fu_698_p3),
    .ce(1'b1),
    .dout(grp_fu_733_p3)
);

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
        end else if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter5 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln58_fu_339_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            i_fu_84 <= select_ln58_1_fu_386_p3;
        end else if ((ap_loop_init == 1'b1)) begin
            i_fu_84 <= 4'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln58_fu_339_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            indvar_flatten29_fu_88 <= add_ln58_1_fu_345_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            indvar_flatten29_fu_88 <= 7'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if (((icmp_ln58_fu_339_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
            k_fu_80 <= add_ln28_fu_574_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            k_fu_80 <= 4'd0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln58_fu_339_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln34_reg_807 <= add_ln34_fu_568_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln34_reg_807_pp0_iter1_reg <= add_ln34_reg_807;
        ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        dct_coeff_table_0_load_reg_892 <= dct_coeff_table_0_q0;
        dct_coeff_table_3_load_reg_907 <= dct_coeff_table_3_q0;
        dct_coeff_table_5_load_reg_917 <= dct_coeff_table_5_q0;
        dct_coeff_table_6_load_reg_922 <= dct_coeff_table_6_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        add_ln34_reg_807_pp0_iter2_reg <= add_ln34_reg_807_pp0_iter1_reg;
        add_ln34_reg_807_pp0_iter3_reg <= add_ln34_reg_807_pp0_iter2_reg;
        add_ln34_reg_807_pp0_iter4_reg <= add_ln34_reg_807_pp0_iter3_reg;
        ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        col_inbuf_load_3_reg_867 <= col_inbuf_q4;
        col_inbuf_load_5_reg_877 <= col_inbuf_q2;
        col_inbuf_load_6_reg_882 <= col_inbuf_q1;
        col_inbuf_load_reg_852 <= col_inbuf_q7;
    end
end

always @ (*) begin
    if (((icmp_ln58_fu_339_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready_pp0_iter4_reg == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
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
    if (((ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_i_1 = 4'd0;
    end else begin
        ap_sig_allocacmp_i_1 = i_fu_84;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_indvar_flatten29_load = 7'd0;
    end else begin
        ap_sig_allocacmp_indvar_flatten29_load = indvar_flatten29_fu_88;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_sig_allocacmp_k_load = 4'd0;
    end else begin
        ap_sig_allocacmp_k_load = k_fu_80;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        col_inbuf_ce0 = 1'b1;
    end else begin
        col_inbuf_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        col_inbuf_ce1 = 1'b1;
    end else begin
        col_inbuf_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        col_inbuf_ce2 = 1'b1;
    end else begin
        col_inbuf_ce2 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        col_inbuf_ce3 = 1'b1;
    end else begin
        col_inbuf_ce3 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        col_inbuf_ce4 = 1'b1;
    end else begin
        col_inbuf_ce4 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        col_inbuf_ce5 = 1'b1;
    end else begin
        col_inbuf_ce5 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        col_inbuf_ce6 = 1'b1;
    end else begin
        col_inbuf_ce6 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        col_inbuf_ce7 = 1'b1;
    end else begin
        col_inbuf_ce7 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
        col_outbuf_ce0 = 1'b1;
    end else begin
        col_outbuf_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
        col_outbuf_we0 = 1'b1;
    end else begin
        col_outbuf_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dct_coeff_table_0_ce0 = 1'b1;
    end else begin
        dct_coeff_table_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dct_coeff_table_1_ce0 = 1'b1;
    end else begin
        dct_coeff_table_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dct_coeff_table_2_ce0 = 1'b1;
    end else begin
        dct_coeff_table_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dct_coeff_table_3_ce0 = 1'b1;
    end else begin
        dct_coeff_table_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dct_coeff_table_4_ce0 = 1'b1;
    end else begin
        dct_coeff_table_4_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dct_coeff_table_5_ce0 = 1'b1;
    end else begin
        dct_coeff_table_5_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dct_coeff_table_6_ce0 = 1'b1;
    end else begin
        dct_coeff_table_6_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        dct_coeff_table_7_ce0 = 1'b1;
    end else begin
        dct_coeff_table_7_ce0 = 1'b0;
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

assign add_ln28_fu_574_p2 = (select_ln58_fu_370_p3 + 4'd1);

assign add_ln34_11_fu_655_p2 = ($signed(grp_fu_715_p3) + $signed(grp_fu_706_p3));

assign add_ln34_15_fu_659_p0 = grp_fu_733_p3;

assign add_ln34_15_fu_659_p2 = ($signed(add_ln34_15_fu_659_p0) + $signed(grp_fu_724_p3));

assign add_ln34_1_fu_663_p2 = (add_ln34_15_fu_659_p2 + add_ln34_11_fu_655_p2);

assign add_ln34_fu_568_p2 = (tmp_s_fu_398_p3 + zext_ln34_fu_564_p1);

assign add_ln58_1_fu_345_p2 = (ap_sig_allocacmp_indvar_flatten29_load + 7'd1);

assign add_ln58_fu_354_p2 = (ap_sig_allocacmp_i_1 + 4'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign col_inbuf_address0 = zext_ln32_6_fu_547_p1;

assign col_inbuf_address1 = zext_ln32_5_fu_528_p1;

assign col_inbuf_address2 = zext_ln32_4_fu_509_p1;

assign col_inbuf_address3 = zext_ln32_3_fu_490_p1;

assign col_inbuf_address4 = zext_ln32_2_fu_471_p1;

assign col_inbuf_address5 = zext_ln32_1_fu_452_p1;

assign col_inbuf_address6 = zext_ln32_fu_433_p1;

assign col_inbuf_address7 = zext_ln58_fu_414_p1;

assign col_outbuf_address0 = zext_ln34_2_fu_651_p1;

assign col_outbuf_d0 = {{add_ln34_1_fu_663_p2[28:13]}};

assign dct_coeff_table_0_address0 = k_1_cast_fu_552_p1;

assign dct_coeff_table_1_address0 = k_1_cast_fu_552_p1;

assign dct_coeff_table_2_address0 = k_1_cast_fu_552_p1;

assign dct_coeff_table_3_address0 = k_1_cast_fu_552_p1;

assign dct_coeff_table_4_address0 = k_1_cast_fu_552_p1;

assign dct_coeff_table_5_address0 = k_1_cast_fu_552_p1;

assign dct_coeff_table_6_address0 = k_1_cast_fu_552_p1;

assign dct_coeff_table_7_address0 = k_1_cast_fu_552_p1;

assign grp_fu_698_p2 = 29'd4096;

assign grp_fu_706_p1 = grp_fu_706_p10;

assign grp_fu_706_p10 = dct_coeff_table_0_load_reg_892;

assign icmp_ln28_fu_364_p2 = ((ap_sig_allocacmp_k_load == 4'd8) ? 1'b1 : 1'b0);

assign icmp_ln58_fu_339_p2 = ((ap_sig_allocacmp_indvar_flatten29_load == 7'd64) ? 1'b1 : 1'b0);

assign k_1_cast_fu_552_p1 = select_ln58_fu_370_p3;

assign or_ln58_1_fu_446_p2 = (select_ln58_11_fu_438_p3 | 6'd2);

assign or_ln58_2_fu_465_p2 = (select_ln58_12_fu_457_p3 | 6'd3);

assign or_ln58_3_fu_484_p2 = (select_ln58_13_fu_476_p3 | 6'd4);

assign or_ln58_4_fu_503_p2 = (select_ln58_14_fu_495_p3 | 6'd5);

assign or_ln58_5_fu_522_p2 = (select_ln58_15_fu_514_p3 | 6'd6);

assign or_ln58_6_fu_541_p2 = (select_ln58_16_fu_533_p3 | 6'd7);

assign or_ln58_fu_427_p2 = (select_ln58_10_fu_419_p3 | 6'd1);

assign select_ln58_10_fu_419_p3 = ((icmp_ln28_fu_364_p2[0:0] == 1'b1) ? tmp_11_cast_fu_378_p3 : tmp_3_cast_fu_331_p3);

assign select_ln58_11_fu_438_p3 = ((icmp_ln28_fu_364_p2[0:0] == 1'b1) ? tmp_11_cast_fu_378_p3 : tmp_3_cast_fu_331_p3);

assign select_ln58_12_fu_457_p3 = ((icmp_ln28_fu_364_p2[0:0] == 1'b1) ? tmp_11_cast_fu_378_p3 : tmp_3_cast_fu_331_p3);

assign select_ln58_13_fu_476_p3 = ((icmp_ln28_fu_364_p2[0:0] == 1'b1) ? tmp_11_cast_fu_378_p3 : tmp_3_cast_fu_331_p3);

assign select_ln58_14_fu_495_p3 = ((icmp_ln28_fu_364_p2[0:0] == 1'b1) ? tmp_11_cast_fu_378_p3 : tmp_3_cast_fu_331_p3);

assign select_ln58_15_fu_514_p3 = ((icmp_ln28_fu_364_p2[0:0] == 1'b1) ? tmp_11_cast_fu_378_p3 : tmp_3_cast_fu_331_p3);

assign select_ln58_16_fu_533_p3 = ((icmp_ln28_fu_364_p2[0:0] == 1'b1) ? tmp_11_cast_fu_378_p3 : tmp_3_cast_fu_331_p3);

assign select_ln58_1_fu_386_p3 = ((icmp_ln28_fu_364_p2[0:0] == 1'b1) ? add_ln58_fu_354_p2 : ap_sig_allocacmp_i_1);

assign select_ln58_2_fu_406_p3 = ((icmp_ln28_fu_364_p2[0:0] == 1'b1) ? tmp_11_cast_fu_378_p3 : tmp_3_cast_fu_331_p3);

assign select_ln58_fu_370_p3 = ((icmp_ln28_fu_364_p2[0:0] == 1'b1) ? 4'd0 : ap_sig_allocacmp_k_load);

assign tmp_11_cast_fu_378_p3 = {{trunc_ln43_fu_360_p1}, {3'd0}};

assign tmp_3_cast_fu_331_p3 = {{trunc_ln32_fu_327_p1}, {3'd0}};

assign tmp_s_fu_398_p3 = {{trunc_ln34_fu_394_p1}, {3'd0}};

assign trunc_ln32_fu_327_p1 = ap_sig_allocacmp_i_1[2:0];

assign trunc_ln34_fu_394_p1 = select_ln58_1_fu_386_p3[2:0];

assign trunc_ln43_fu_360_p1 = add_ln58_fu_354_p2[2:0];

assign zext_ln32_1_fu_452_p1 = or_ln58_1_fu_446_p2;

assign zext_ln32_2_fu_471_p1 = or_ln58_2_fu_465_p2;

assign zext_ln32_3_fu_490_p1 = or_ln58_3_fu_484_p2;

assign zext_ln32_4_fu_509_p1 = or_ln58_4_fu_503_p2;

assign zext_ln32_5_fu_528_p1 = or_ln58_5_fu_522_p2;

assign zext_ln32_6_fu_547_p1 = or_ln58_6_fu_541_p2;

assign zext_ln32_fu_433_p1 = or_ln58_fu_427_p2;

assign zext_ln34_2_fu_651_p1 = add_ln34_reg_807_pp0_iter4_reg;

assign zext_ln34_fu_564_p1 = select_ln58_fu_370_p3;

assign zext_ln58_fu_414_p1 = select_ln58_2_fu_406_p3;

endmodule //dct_dct_Pipeline_Col_DCT_Loop_DCT_Outer_Loop
