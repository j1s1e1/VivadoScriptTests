`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2023 01:42:29 PM
// Design Name: 
// Module Name: ctl_if
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


interface ctl_if (input wire clk);
logic check_preamble;
logic check_sfd;
logic custom_preamble_enable;
logic data_pattern_select;
logic delete_fcs;
logic enable;
logic force_resync;
logic ignore_fcs;
logic [14:0] max_packet_len;
logic [7:0] min_packet_len;
logic process_lfi;
logic test_pattern;
logic test_pattern_enable;
// TX Only
logic fcs_ins_enable;
logic [3:0] ipg_value;
logic send_idle;
logic send_lfi;
logic send_rfi;
logic [57:0] test_pattern_seed_a;
logic [57:0] test_pattern_seed_b;
logic test_pattern_select;

task Clear();
check_preamble = 0;
check_sfd = 0;
custom_preamble_enable = 0;
data_pattern_select = 0;
delete_fcs = 0;
enable = 0;
force_resync = 0;
ignore_fcs = 0;
max_packet_len = 9600;
min_packet_len = 64;
process_lfi = 0;
test_pattern = 0;
test_pattern_enable = 0;
fcs_ins_enable = 0;
ipg_value = 0;
send_idle = 0;
send_lfi = 0;
send_rfi = 0;
test_pattern_seed_a = 0;
test_pattern_seed_b = 0;
test_pattern_select = 0;
endtask

task Enable();
  enable = 1;
endtask

task Disable();
  enable = 0;
endtask

endinterface
