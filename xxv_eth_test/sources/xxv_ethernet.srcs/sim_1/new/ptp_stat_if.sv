`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2023 02:10:41 PM
// Design Name: 
// Module Name: ptp_stat_if
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


interface ptp_stat_if (input wire clk);
logic stat_tx_ptp_fifo_read_error;
logic stat_tx_ptp_fifo_write_error;
endinterface
