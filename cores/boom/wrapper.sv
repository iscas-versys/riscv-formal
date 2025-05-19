module rvfi_wrapper (
	input         clock,
	input         reset,
	`RVFI_OUTPUTS
);
	// input
	(* keep *) wire 	   auto_buffer_out_a_ready;
	(* keep *) wire        auto_buffer_out_a_ready;
	(* keep *) wire        auto_buffer_out_b_valid;
	(* keep *) wire [1:0]  auto_buffer_out_b_bits_param;
	(* keep *) wire [2:0]  auto_buffer_out_b_bits_size;
	(* keep *) wire [2:0]  auto_buffer_out_b_bits_source;
	(* keep *) wire [31:0] auto_buffer_out_b_bits_address;
	(* keep *) wire        auto_buffer_out_c_ready;
	(* keep *) wire        auto_buffer_out_d_valid;
	(* keep *) wire [2:0]  auto_buffer_out_d_bits_opcode;
	(* keep *) wire [1:0]  auto_buffer_out_d_bits_param;
	(* keep *) wire [2:0]  auto_buffer_out_d_bits_size;
	(* keep *) wire [2:0]  auto_buffer_out_d_bits_source;
	(* keep *) wire [1:0]  auto_buffer_out_d_bits_sink;
	(* keep *) wire [63:0] auto_buffer_out_d_bits_data;
	(* keep *) wire        auto_buffer_out_e_ready;
	(* keep *) wire        auto_int_local_in_3_0;
	(* keep *) wire        auto_int_local_in_2_0;
	(* keep *) wire        auto_int_local_in_1_0;
	(* keep *) wire        auto_int_local_in_1_1;
	(* keep *) wire        auto_int_local_in_0_0;
	(* keep *) wire        auto_hartid_in;
	
	// output
	(* keep *) wire        auto_buffer_out_a_valid;
	(* keep *) wire [2:0]  auto_buffer_out_a_bits_opcode;
	(* keep *) wire [2:0]  auto_buffer_out_a_bits_param;
	(* keep *) wire [2:0]  auto_buffer_out_a_bits_size;
	(* keep *) wire [2:0]  auto_buffer_out_a_bits_source;
	(* keep *) wire [31:0] auto_buffer_out_a_bits_address;
	(* keep *) wire [7:0]  auto_buffer_out_a_bits_mask;
	(* keep *) wire [63:0] auto_buffer_out_a_bits_data;
	(* keep *) wire        auto_buffer_out_b_ready;
	(* keep *) wire        auto_buffer_out_c_valid;
	(* keep *) wire [2:0]  auto_buffer_out_c_bits_opcode;
	(* keep *) wire [2:0]  auto_buffer_out_c_bits_param;
	(* keep *) wire [2:0]  auto_buffer_out_c_bits_size;
	(* keep *) wire [2:0]  auto_buffer_out_c_bits_source;
	(* keep *) wire [31:0] auto_buffer_out_c_bits_address;
	(* keep *) wire [63:0] auto_buffer_out_c_bits_data;
	(* keep *) wire        auto_buffer_out_d_ready;
	(* keep *) wire        auto_buffer_out_e_valid;
	(* keep *) wire [1:0]  auto_buffer_out_e_bits_sink;

	(* keep *) wire		   flying_select_0 = 1'b0;
	
	// (* keep *) wire trap;
	// (* keep *) `rvformal_rand_reg mem_ready;
	// (* keep *) `rvformal_rand_reg [31:0] mem_rdata;

	// (* keep *) wire        mem_valid;
	// (* keep *) wire        mem_instr;
	// (* keep *) wire [31:0] mem_addr;
	// (* keep *) wire [31:0] mem_wdata;
	// (* keep *) wire [3:0]  mem_wstrb;

    reg [1:0] counter = 0; 
    reg core_reset = 1'b1;

    always @(posedge clk) begin
        if (counter == 2'd0) begin  
            counter <= counter + 1'b1;
        end else begin
            core_reset <= 1'b0; 
        end
    end

	BoomTile uut (
		.clock     (clock),
		.reset     (core_reset),
		.auto_buffer_out_a_ready(auto_buffer_out_a_ready),
		.auto_buffer_out_a_ready(auto_buffer_out_a_ready),
		.auto_buffer_out_b_valid(auto_buffer_out_b_valid),
		.auto_buffer_out_b_bits_param(auto_buffer_out_b_bits_param),
		.auto_buffer_out_b_bits_size(auto_buffer_out_b_bits_size),
		.auto_buffer_out_b_bits_source(auto_buffer_out_b_bits_source),
		.auto_buffer_out_b_bits_address(auto_buffer_out_b_bits_address),
		.auto_buffer_out_c_ready(auto_buffer_out_c_ready),
		.auto_buffer_out_d_valid(auto_buffer_out_d_valid),
		.auto_buffer_out_d_bits_opcode(auto_buffer_out_d_bits_opcode),
		.auto_buffer_out_d_bits_param(auto_buffer_out_d_bits_param),
		.auto_buffer_out_d_bits_size(auto_buffer_out_d_bits_size),
		.auto_buffer_out_d_bits_source(auto_buffer_out_d_bits_source),
		.auto_buffer_out_d_bits_sink(auto_buffer_out_d_bits_sink),
		.auto_buffer_out_d_bits_data(auto_buffer_out_d_bits_data),
		.auto_buffer_out_e_ready(auto_buffer_out_e_ready),
		.auto_int_local_in_3_0(auto_int_local_in_3_0),
		.auto_int_local_in_2_0(auto_int_local_in_2_0),
		.auto_int_local_in_1_0(auto_int_local_in_1_0),
		.auto_int_local_in_1_1(auto_int_local_in_1_1),
		.auto_int_local_in_0_0(auto_int_local_in_0_0),
		.auto_hartid_in(auto_hartid_in),
		.auto_buffer_out_a_valid(auto_buffer_out_a_valid),
		.auto_buffer_out_a_bits_opcode(auto_buffer_out_a_bits_opcode),
		.auto_buffer_out_a_bits_param(auto_buffer_out_a_bits_param),
		.auto_buffer_out_a_bits_size(auto_buffer_out_a_bits_size),
		.auto_buffer_out_a_bits_source(auto_buffer_out_a_bits_source),
		.auto_buffer_out_a_bits_address(auto_buffer_out_a_bits_address),
		.auto_buffer_out_a_bits_mask(auto_buffer_out_a_bits_mask),
		.auto_buffer_out_a_bits_data(auto_buffer_out_a_bits_data),
		.auto_buffer_out_b_ready(auto_buffer_out_b_ready),
		.auto_buffer_out_c_valid(auto_buffer_out_c_valid),
		.auto_buffer_out_c_bits_opcode(auto_buffer_out_c_bits_opcode),
		.auto_buffer_out_c_bits_param(auto_buffer_out_c_bits_param),
		.auto_buffer_out_c_bits_size(auto_buffer_out_c_bits_size),
		.auto_buffer_out_c_bits_source(auto_buffer_out_c_bits_source),
		.auto_buffer_out_c_bits_address(auto_buffer_out_c_bits_address),
		.auto_buffer_out_c_bits_data(auto_buffer_out_c_bits_data),
		.auto_buffer_out_d_ready(auto_buffer_out_d_ready),
		.auto_buffer_out_e_valid(auto_buffer_out_e_valid),
		.auto_buffer_out_e_bits_sink(auto_buffer_out_e_bits_sink),
		`RVFI_CONN,
		.flying_select_0(flying_select_0)
		// .rvfi_valid     (rvfi_valid    ), \
		// .rvfi_order     (rvfi_order    ), \
		// .rvfi_insn      (rvfi_insn     ), \
		// .rvfi_trap      (rvfi_trap     ), \
		// .rvfi_halt      (rvfi_halt     ), \
		// .rvfi_intr      (rvfi_intr     ), \
		// .rvfi_mode      (rvfi_mode     ), \
		// .rvfi_ixl       (rvfi_ixl      ), \
		// .rvfi_rs1_addr  (rvfi_rs1_addr ), \
		// .rvfi_rs2_addr  (rvfi_rs2_addr ), \
		// .rvfi_rs1_rdata (rvfi_rs1_rdata), \
		// .rvfi_rs2_rdata (rvfi_rs2_rdata), \
		// .rvfi_rd_addr   (rvfi_rd_addr  ), \
		// .rvfi_rd_wdata  (rvfi_rd_wdata ), \
		// .rvfi_pc_rdata  (rvfi_pc_rdata ), \
		// .rvfi_pc_wdata  (rvfi_pc_wdata ), \
		// .rvfi_mem_addr  (rvfi_mem_addr ), \
		// .rvfi_mem_rmask (rvfi_mem_rmask), \
		// .rvfi_mem_wmask (rvfi_mem_wmask), \
		// .rvfi_mem_rdata (rvfi_mem_rdata), \
		// .rvfi_mem_wdata (rvfi_mem_wdata) \
	);



endmodule

