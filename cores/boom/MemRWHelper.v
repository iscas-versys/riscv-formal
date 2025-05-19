
`ifdef SYNTHESIS
  `define DISABLE_DIFFTEST_RAM_DPIC
`endif

`ifndef DISABLE_DIFFTEST_RAM_DPIC
import "DPI-C" function longint difftest_ram_read(input longint rIdx);
`endif // DISABLE_DIFFTEST_RAM_DPIC


`ifndef DISABLE_DIFFTEST_RAM_DPIC
import "DPI-C" function void difftest_ram_write
(
  input  longint index,
  input  longint data,
  input  longint mask
);
`endif // DISABLE_DIFFTEST_RAM_DPIC

module MemRWHelper(
  
input             r_enable,
input      [63:0] r_index,
output reg [63:0] r_data,

  
input         w_enable,
input  [63:0] w_index,
input  [63:0] w_data,
input  [63:0] w_mask,

  input clock
);
  
`ifdef DISABLE_DIFFTEST_RAM_DPIC
`ifdef PALLADIUM
  initial $ixc_ctrl("tb_import", "$display");
`endif // PALLADIUM

// 1536MB memory
`define RAM_SIZE (1536 * 1024 * 1024)
reg [63:0] memory [0 : `RAM_SIZE / 8 - 1];



`endif // DISABLE_DIFFTEST_RAM_DPIC

  always @(posedge clock) begin
    

  end
endmodule
     