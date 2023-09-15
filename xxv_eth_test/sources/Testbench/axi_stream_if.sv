`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/17/2020 02:02:12 AM
// Design Name: 
// Module Name: axi_stream_if
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// Note these are stream interfaces

interface axi_stream_if #(BITS = 8) (input wire aclk);

// Slave Interface Write Data Ports

logic  [BITS-1:0] tdata;
logic         tlast;
logic         tvalid;
logic         tready;

modport master
(
input tready,
output tdata, tvalid, tlast
);

modport slave
(
input tdata, tvalid, tlast,
output tready
);

task Clear();
  tdata = 0;
  tlast = 0;
  tvalid = 0;
endtask

task Write;                                 // Note that address and data write can both be done at the same time.
  input [BITS-1:0] data;
  input logic last;
  tdata <= data;
  tvalid <= 1;
  tlast <= last;
  @(posedge aclk);
  while (!tready) @(posedge aclk);
  tdata <= 0;
  tvalid <= 0;
  tlast <= 0;
endtask

endinterface
