`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2023 02:02:21 PM
// Design Name: 
// Module Name: ptp_2step_usr_if
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


interface ptp_2step_usr_if (input wire clk);
logic [79:0]rx_ptp_tstamp_out; 
logic rx_ptp_tstamp_valid_out; 
logic [1:0]tx_ptp_1588op_in;    
logic [15:0]tx_ptp_tag_field_in;
logic [79:0]tx_ptp_tstamp_out; 
logic [15:0]tx_ptp_tstamp_tag_out;
logic tx_ptp_tstamp_valid_out; 

task Clear();
tx_ptp_1588op_in <= 0;  
tx_ptp_tag_field_in <= 0;
endtask

endinterface
