`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2023 01:58:07 PM
// Design Name: 
// Module Name: ptp_2step_ctl_if
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


interface ptp_2step_ctl_if (input wire clk);
logic [0:0] ctl_ptp_transpclk_mode;
logic [79:0] ctl_rx_systemtimerin; 
logic [79:0] ctl_tx_systemtimerin;

task Clear();
ctl_ptp_transpclk_mode <= 0;
ctl_rx_systemtimerin <= 0;
ctl_tx_systemtimerin <= 0;
endtask

endinterface
