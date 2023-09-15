`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2023 02:22:05 PM
// Design Name: 
// Module Name: stat_if
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


interface stat_if (input wire clk);
logic bad_code;
logic [1:0] bad_fcs;
logic bad_preamble;
logic bad_sfd;
logic block_lock;
logic broadcast;
logic fragment;
logic framing_err;
logic framing_err_valid;
logic got_signal_os;
logic hi_ber;
logic inrangeerr;
logic internal_local_fault;
logic jabber;
logic local_fault;
logic multicast;
logic oversize;
logic packet_1024_1518_bytes;
logic packet_128_255_bytes;
logic packet_1519_1522_bytes;
logic packet_1523_1548_bytes;
logic packet_1549_2047_bytes;
logic packet_2048_4095_bytes;
logic packet_256_511_bytes;
logic packet_4096_8191_bytes;
logic packet_512_1023_bytes;
logic packet_64_bytes;
logic packet_65_127_bytes;
logic packet_8192_9215_bytes;
logic packet_bad_fcs;
logic packet_large;
logic packet_small;
logic received_local_fault;
logic remote_fault;
logic [1:0] stomped_fcs;
logic test_pattern_mismatch;
logic toolong;
logic [3:0] total_bytes;
logic [13:0] total_good_bytes;
logic total_good_packets;
logic [1:0] total_packets;
logic truncated;
logic undersize;
logic unicast;
logic valid_ctrl_code;
logic vlan;
// TX Only
logic frame_error;

endinterface
