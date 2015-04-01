import lc3b_types::*;

module mem
(
	input load_cc,
	input lc3b_word ex_mem_pc_out, //mem_npc
	input lc3b_word ex_mem_alu_out,
	input lc3b_reg mem_wb_dest_out,
	input lc3b_word wb_regfilemux_out,
	input lc3b_control_word ctrl,

	
	output lc3b_word sr_address_in,
	output lc3b_word sr_data_in,
	output lc3b_four sr_cs_in,
	output lc3b_word sr_npc_in,
	output lc3b_word sr_ir_in,
	output lc3b_nzp sr_drid_in,
	output lc3b_word sr_aluresult_in,
	output logic branch_enable
);

assign sr_cs_in = //[10:7]mem_cs_out;
assign sr_aluresult_in = ex_mem_alu_out;
assign sr_npc_in = ex_mem_pc_out;

lc3b_nzp gencc_out;
lc3b_reg cc_out;


mux2 marmux
(
	.sel(ctrl.marmux_sel),
	.a(ex_mem_alu_out),
	.b(ex_mem_pc_out),
	.f(marmux_out)
);

mux2 mdrmux
(
	.sel(ctrl.mdrmux_sel),
	.a(ex_mem_alu_out),
	.b(ex_mem_pc_out),
	.f(mdrmux_out)
);