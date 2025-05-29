module rvfi_wrapper (
	input         clock,
	input         reset,
	`RVFI_OUTPUTS
);
    // input
    (* keep *) wire        io_imem_mem_req_ready,
    (* keep *) wire        io_imem_mem_resp_valid,
    (* keep *) wire [3:0]  io_imem_mem_resp_bits_cmd,
    (* keep *) wire [63:0] io_imem_mem_resp_bits_rdata,
    (* keep *) wire        io_imem_coh_req_valid,
    (* keep *) wire [31:0] io_imem_coh_req_bits_addr,
    (* keep *) wire [2:0]  io_imem_coh_req_bits_size,
    (* keep *) wire [3:0]  io_imem_coh_req_bits_cmd,
    (* keep *) wire [3:0]  io_imem_coh_req_bits_wmask,
    (* keep *) wire [31:0] io_imem_coh_req_bits_wdata,
    (* keep *) wire        io_imem_coh_resp_ready,
    (* keep *) wire        io_dmem_mem_req_ready,
    (* keep *) wire        io_dmem_mem_resp_valid,
    (* keep *) wire [3:0]  io_dmem_mem_resp_bits_cmd,
    (* keep *) wire [63:0] io_dmem_mem_resp_bits_rdata,
    (* keep *) wire        io_dmem_coh_req_valid,
    (* keep *) wire [31:0] io_dmem_coh_req_bits_addr,
    (* keep *) wire [2:0]  io_dmem_coh_req_bits_size,
    (* keep *) wire [3:0]  io_dmem_coh_req_bits_cmd,
    (* keep *) wire [3:0]  io_dmem_coh_req_bits_wmask,
    (* keep *) wire [31:0] io_dmem_coh_req_bits_wdata,
    (* keep *) wire        io_dmem_coh_resp_ready,
    (* keep *) wire        io_mmio_req_ready,
    (* keep *) wire        io_mmio_resp_valid,
    (* keep *) wire [3:0]  io_mmio_resp_bits_cmd,
    (* keep *) wire [63:0] io_mmio_resp_bits_rdata,
    (* keep *) wire        io_frontend_req_valid,
    (* keep *) wire [31:0] io_frontend_req_bits_addr,
    (* keep *) wire [2:0]  io_frontend_req_bits_size,
    (* keep *) wire [3:0]  io_frontend_req_bits_cmd,
    (* keep *) wire [3:0]  io_frontend_req_bits_wmask,
    (* keep *) wire [31:0] io_frontend_req_bits_wdata,
    (* keep *) wire        io_frontend_resp_ready,

    // output
    (* keep *) wire         io_dmem_coh_req_ready,
    (* keep *) wire         io_imem_mem_req_valid,
    (* keep *) wire  [31:0] io_imem_mem_req_bits_addr,
    (* keep *) wire  [2:0]  io_imem_mem_req_bits_size,
    (* keep *) wire  [3:0]  io_imem_mem_req_bits_cmd,
    (* keep *) wire  [3:0]  io_imem_mem_req_bits_wmask,
    (* keep *) wire  [31:0] io_imem_mem_req_bits_wdata,
    (* keep *) wire         io_imem_mem_resp_ready,
    (* keep *) wire         io_imem_coh_req_ready,
    (* keep *) wire         io_imem_coh_resp_valid,
    (* keep *) wire  [3:0]  io_imem_coh_resp_bits_cmd,
    (* keep *) wire  [63:0] io_imem_coh_resp_bits_rdata,
    (* keep *) wire         io_dmem_mem_req_valid,
    (* keep *) wire  [31:0] io_dmem_mem_req_bits_addr,
    (* keep *) wire  [2:0]  io_dmem_mem_req_bits_size,
    (* keep *) wire  [3:0]  io_dmem_mem_req_bits_cmd,
    (* keep *) wire  [3:0]  io_dmem_mem_req_bits_wmask,
    (* keep *) wire  [31:0] io_dmem_mem_req_bits_wdata,
    (* keep *) wire         io_dmem_mem_resp_ready,
    (* keep *) wire         io_dmem_coh_resp_valid,
    (* keep *) wire  [3:0]  io_dmem_coh_resp_bits_cmd,
    (* keep *) wire  [63:0] io_dmem_coh_resp_bits_rdata,
    (* keep *) wire         io_mmio_req_valid,
    (* keep *) wire  [31:0] io_mmio_req_bits_addr,
    (* keep *) wire  [2:0]  io_mmio_req_bits_size,
    (* keep *) wire  [3:0]  io_mmio_req_bits_cmd,
    (* keep *) wire  [3:0]  io_mmio_req_bits_wmask,
    (* keep *) wire  [31:0] io_mmio_req_bits_wdata,
    (* keep *) wire         io_mmio_resp_ready,
    (* keep *) wire         io_frontend_req_ready,
    (* keep *) wire         io_frontend_resp_valid,
    (* keep *) wire  [3:0]  io_frontend_resp_bits_cmd,
    (* keep *) wire  [63:0] io_frontend_resp_bits_rdata,
	//  (* keep *) wire trap;
	//  (* keep *) `rvformal_rand_reg mem_ready;
	//  (* keep *) `rvformal_rand_reg [31:0] mem_rdata;

	//  (* keep *) wire        mem_valid;
	//  (* keep *) wire        mem_instr;
	//  (* keep *) wire [31:0] mem_addr;
	//  (* keep *) wire [31:0] mem_wdata;
	//  (* keep *) wire [3:0]  mem_wstrb;


	NutCore uut (
		.clock(clock),
		.reset(reset),
        .io_imem_mem_req_ready(io_imem_mem_req_ready),
        .io_imem_mem_resp_valid(io_imem_mem_resp_valid),
        .io_imem_mem_resp_bits_cmd(io_imem_mem_resp_bits_cmd),
        .io_imem_mem_resp_bits_rdata(io_imem_mem_resp_bits_rdata),
        .io_imem_coh_req_valid(io_imem_coh_req_valid),
        .io_imem_coh_req_bits_addr(io_imem_coh_req_bits_addr),
        .io_imem_coh_req_bits_size(io_imem_coh_req_bits_size),
        .io_imem_coh_req_bits_cmd(io_imem_coh_req_bits_cmd),
        .io_imem_coh_req_bits_wmask(io_imem_coh_req_bits_wmask),
        .io_imem_coh_req_bits_wdata(io_imem_coh_req_bits_wdata),
        .io_imem_coh_resp_ready(io_imem_coh_resp_ready),
        .io_dmem_mem_req_ready(io_dmem_mem_req_ready),
        .io_dmem_mem_resp_valid(io_dmem_mem_resp_valid),
        .io_dmem_mem_resp_bits_cmd(io_dmem_mem_resp_bits_cmd),
        .io_dmem_mem_resp_bits_rdata(io_dmem_mem_resp_bits_rdata),
        .io_dmem_coh_req_valid(io_dmem_coh_req_valid),
        .io_dmem_coh_req_bits_addr(io_dmem_coh_req_bits_addr),
        .io_dmem_coh_req_bits_size(io_dmem_coh_req_bits_size),
        .io_dmem_coh_req_bits_cmd(io_dmem_coh_req_bits_cmd),
        .io_dmem_coh_req_bits_wmask(io_dmem_coh_req_bits_wmask),
        .io_dmem_coh_req_bits_wdata(io_dmem_coh_req_bits_wdata),
        .io_dmem_coh_resp_ready(io_dmem_coh_resp_ready),
        .io_mmio_req_ready(io_mmio_req_ready),
        .io_mmio_resp_valid(io_mmio_resp_valid),
        .io_mmio_resp_bits_cmd(io_mmio_resp_bits_cmd),
        .io_mmio_resp_bits_rdata(io_mmio_resp_bits_rdata),
        .io_frontend_req_valid(io_frontend_req_valid),
        .io_frontend_req_bits_addr(io_frontend_req_bits_addr),
        .io_frontend_req_bits_size(io_frontend_req_bits_size),
        .io_frontend_req_bits_cmd(io_frontend_req_bits_cmd),
        .io_frontend_req_bits_wmask(io_frontend_req_bits_wmask),
        .io_frontend_req_bits_wdata(io_frontend_req_bits_wdata),
        .io_frontend_resp_ready(io_frontend_resp_ready),
        .io_dmem_coh_req_ready(io_dmem_coh_req_ready),
        .io_imem_mem_req_valid(io_imem_mem_req_valid),
        .io_imem_mem_req_bits_addr(io_imem_mem_req_bits_addr),
        .io_imem_mem_req_bits_size(io_imem_mem_req_bits_size),
        .io_imem_mem_req_bits_cmd(io_imem_mem_req_bits_cmd),
        .io_imem_mem_req_bits_wmask(io_imem_mem_req_bits_wmask),
        .io_imem_mem_req_bits_wdata(io_imem_mem_req_bits_wdata),
        .io_imem_mem_resp_ready(io_imem_mem_resp_ready),
        .io_imem_coh_req_ready(io_imem_coh_req_ready),
        .io_imem_coh_resp_valid(io_imem_coh_resp_valid),
        .io_imem_coh_resp_bits_cmd(io_imem_coh_resp_bits_cmd),
        .io_imem_coh_resp_bits_rdata(io_imem_coh_resp_bits_rdata),
        .io_dmem_mem_req_valid(io_dmem_mem_req_valid),
        .io_dmem_mem_req_bits_addr(io_dmem_mem_req_bits_addr),
        .io_dmem_mem_req_bits_size(io_dmem_mem_req_bits_size),
        .io_dmem_mem_req_bits_cmd(io_dmem_mem_req_bits_cmd),
        .io_dmem_mem_req_bits_wmask(io_dmem_mem_req_bits_wmask),
        .io_dmem_mem_req_bits_wdata(io_dmem_mem_req_bits_wdata),
        .io_dmem_mem_resp_ready(io_dmem_mem_resp_ready),
        .io_dmem_coh_resp_valid(io_dmem_coh_resp_valid),
        .io_dmem_coh_resp_bits_cmd(io_dmem_coh_resp_bits_cmd),
        .io_dmem_coh_resp_bits_rdata(io_dmem_coh_resp_bits_rdata),
        .io_mmio_req_valid(io_mmio_req_valid),
        .io_mmio_req_bits_addr(io_mmio_req_bits_addr),
        .io_mmio_req_bits_size(io_mmio_req_bits_size),
        .io_mmio_req_bits_cmd(io_mmio_req_bits_cmd),
        .io_mmio_req_bits_wmask(io_mmio_req_bits_wmask),
        .io_mmio_req_bits_wdata(io_mmio_req_bits_wdata),
        .io_mmio_resp_ready(io_mmio_resp_ready),
        .io_frontend_req_ready(io_frontend_req_ready),
        .io_frontend_resp_valid(io_frontend_resp_valid),
        .io_frontend_resp_bits_cmd(io_frontend_resp_bits_cmd),
        .io_frontend_resp_bits_rdata(io_frontend_resp_bits_rdata),
		`RVFI_CONN,
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

