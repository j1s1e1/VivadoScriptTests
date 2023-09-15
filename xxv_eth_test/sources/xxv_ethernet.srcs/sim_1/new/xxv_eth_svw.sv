`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2023 10:46:30 AM
// Design Name: 
// Module Name: xxv_eth_svw
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


module xxv_eth_svw
(
axi_stream_if axis_rx_0_0,
axi_stream_if axis_tx_0_0,
ctl_if ctl_rx_0_0_ctl_rx,
ctl_if ctl_tx_0_0_ctl_tx,
input [2:0]gt_loopback_in_0_0,
input gt_ref_clk_0_clk_n,
input gt_ref_clk_0_clk_p,
output gt_refclk_out_0,
input gt_rx_0_gt_port_0_n,
input gt_rx_0_gt_port_0_p,
output gt_tx_0_gt_port_0_n,
output gt_tx_0_gt_port_0_p,
output gtpowergood_out_0_0,
input gtwiz_reset_rx_datapath_0_0,
input gtwiz_reset_tx_datapath_0_0,
input dclk_0,
ptp_2step_ctl_if ptp_2step_ctl_if_0_0,
ptp_2step_usr_if ptp_2step_usrif_0_0,
ptp_stat_if ptp_stat_if_0_0,
input qpllreset_in_0_0,
output rx_clk_out_0_0,
input rx_core_clk_0_0,
output [63:0]rx_period_ns_0_0,
output [55:0]rx_preambleout_0_0,
input rx_reset_0_0,
input [2:0]rxoutclksel_in_0_0,
output rxrecclkout_0_0,
stat_if stat_rx_0_0_stat_rx,
output stat_rx_status_0_0,
stat_if stat_tx_0_0_stat_tx,

input sys_reset_0,
output tx_clk_out_0_0,
output [63:0]tx_period_ns_0_0,
input [55:0]tx_preamblein_0_0,
input tx_reset_0_0,
output tx_unfout_0_0,
input [2:0]txoutclksel_in_0_0,
output user_rx_reset_0_0,
output user_tx_reset_0_0
);

logic [63:0]axis_rx_0_0_tdata;
logic [7:0]axis_rx_0_0_tkeep;
logic axis_rx_0_0_tlast;
logic axis_rx_0_0_tuser;
logic axis_rx_0_0_tvalid;

assign axis_rx_0_0.tdata = axis_rx_0_0_tdata;
assign axis_rx_0_0.tlast = axis_rx_0_0_tlast;
assign axis_rx_0_0.tvalid = axis_rx_0_0_tvalid;

logic [63:0]axis_tx_0_0_tdata;
logic [7:0]axis_tx_0_0_tkeep;
logic axis_tx_0_0_tlast;
logic axis_tx_0_0_tready;
logic axis_tx_0_0_tuser;
logic axis_tx_0_0_tvalid;

assign axis_tx_0_0_tdata = axis_tx_0_0.tdata;
assign axis_tx_0_0_tkeep = 8'b11111111;
assign axis_tx_0_0_tlast = axis_tx_0_0.tlast;
assign axis_tx_0_0.tready = axis_tx_0_0_tready;
assign axis_tx_0_0_tuser = 1'b1;
assign axis_tx_0_0_tvalid = axis_tx_0_0.tvalid;

logic ctl_rx_0_0_ctl_rx_check_preamble;
logic ctl_rx_0_0_ctl_rx_check_sfd;
logic ctl_rx_0_0_ctl_rx_custom_preamble_enable;
logic ctl_rx_0_0_ctl_rx_data_pattern_select;
logic ctl_rx_0_0_ctl_rx_delete_fcs;
logic ctl_rx_0_0_ctl_rx_enable;
logic ctl_rx_0_0_ctl_rx_force_resync;
logic ctl_rx_0_0_ctl_rx_ignore_fcs;
logic [14:0]ctl_rx_0_0_ctl_rx_max_packet_len;
logic [7:0]ctl_rx_0_0_ctl_rx_min_packet_len;
logic ctl_rx_0_0_ctl_rx_process_lfi;
logic ctl_rx_0_0_ctl_rx_test_pattern;
logic ctl_rx_0_0_ctl_rx_test_pattern_enable;

assign ctl_rx_0_0_ctl_rx_check_preamble =           ctl_rx_0_0_ctl_rx.check_preamble;
assign ctl_rx_0_0_ctl_rx_check_sfd =                ctl_rx_0_0_ctl_rx.check_sfd;
assign ctl_rx_0_0_ctl_rx_custom_preamble_enable =   ctl_rx_0_0_ctl_rx.custom_preamble_enable;
assign ctl_rx_0_0_ctl_rx_data_pattern_select =      ctl_rx_0_0_ctl_rx.data_pattern_select;
assign ctl_rx_0_0_ctl_rx_delete_fcs =               ctl_rx_0_0_ctl_rx.delete_fcs;
assign ctl_rx_0_0_ctl_rx_enable =                   ctl_rx_0_0_ctl_rx.enable;
assign ctl_rx_0_0_ctl_rx_force_resync =             ctl_rx_0_0_ctl_rx.force_resync;
assign ctl_rx_0_0_ctl_rx_ignore_fcs =               ctl_rx_0_0_ctl_rx.ignore_fcs;
assign ctl_rx_0_0_ctl_rx_max_packet_len =           ctl_rx_0_0_ctl_rx.max_packet_len;
assign ctl_rx_0_0_ctl_rx_min_packet_len =           ctl_rx_0_0_ctl_rx.min_packet_len;
assign ctl_rx_0_0_ctl_rx_process_lfi =              ctl_rx_0_0_ctl_rx.process_lfi;
assign ctl_rx_0_0_ctl_rx_test_pattern =             ctl_rx_0_0_ctl_rx.test_pattern;
assign ctl_rx_0_0_ctl_rx_test_pattern_enable =      ctl_rx_0_0_ctl_rx.test_pattern_enable;

logic ctl_tx_0_0_ctl_tx_custom_preamble_enable;
logic ctl_tx_0_0_ctl_tx_data_pattern_select;
logic ctl_tx_0_0_ctl_tx_enable;
logic ctl_tx_0_0_ctl_tx_fcs_ins_enable;
logic ctl_tx_0_0_ctl_tx_ignore_fcs;
logic [3:0]ctl_tx_0_0_ctl_tx_ipg_value;
logic ctl_tx_0_0_ctl_tx_send_idle;
logic ctl_tx_0_0_ctl_tx_send_lfi;
logic ctl_tx_0_0_ctl_tx_send_rfi;
logic ctl_tx_0_0_ctl_tx_test_pattern;
logic ctl_tx_0_0_ctl_tx_test_pattern_enable;
logic [57:0]ctl_tx_0_0_ctl_tx_test_pattern_seed_a;
logic [57:0]ctl_tx_0_0_ctl_tx_test_pattern_seed_b;
logic ctl_tx_0_0_ctl_tx_test_pattern_select;

assign ctl_tx_0_0_ctl_tx_check_preamble =           ctl_tx_0_0_ctl_tx.check_preamble;
assign ctl_tx_0_0_ctl_tx_check_sfd =                ctl_tx_0_0_ctl_tx.check_sfd;
assign ctl_tx_0_0_ctl_tx_custom_preamble_enable =   ctl_tx_0_0_ctl_tx.custom_preamble_enable;
assign ctl_tx_0_0_ctl_tx_data_pattern_select =      ctl_tx_0_0_ctl_tx.data_pattern_select;
assign ctl_tx_0_0_ctl_tx_delete_fcs =               ctl_tx_0_0_ctl_tx.delete_fcs;
assign ctl_tx_0_0_ctl_tx_enable =                   ctl_tx_0_0_ctl_tx.enable;
assign ctl_tx_0_0_ctl_tx_fcs_ins_enable =           ctl_tx_0_0_ctl_tx.fcs_ins_enable;
assign ctl_tx_0_0_ctl_tx_force_resync =             ctl_tx_0_0_ctl_tx.force_resync;
assign ctl_tx_0_0_ctl_tx_ignore_fcs =               ctl_tx_0_0_ctl_tx.ignore_fcs;
assign ctl_tx_0_0_ctl_tx_ipg_value =                ctl_tx_0_0_ctl_tx.ipg_value;
assign ctl_tx_0_0_ctl_tx_send_idle =                ctl_tx_0_0_ctl_tx.send_idle;
assign ctl_tx_0_0_ctl_tx_send_lfi =                 ctl_tx_0_0_ctl_tx.send_lfi;
assign ctl_tx_0_0_ctl_tx_send_rfi =                 ctl_tx_0_0_ctl_tx.send_rfi;
assign ctl_tx_0_0_ctl_tx_max_packet_len =           ctl_tx_0_0_ctl_tx.max_packet_len;
assign ctl_tx_0_0_ctl_tx_min_packet_len =           ctl_tx_0_0_ctl_tx.min_packet_len;
assign ctl_tx_0_0_ctl_tx_process_lfi =              ctl_tx_0_0_ctl_tx.process_lfi;
assign ctl_tx_0_0_ctl_tx_test_pattern =             ctl_tx_0_0_ctl_tx.test_pattern;
assign ctl_tx_0_0_ctl_tx_test_pattern_enable =      ctl_tx_0_0_ctl_tx.test_pattern_enable;

assign ctl_tx_0_0_ctl_tx_test_pattern_seed_a =      ctl_tx_0_0_ctl_tx.test_pattern_seed_a; 
assign ctl_tx_0_0_ctl_tx_test_pattern_seed_b =      ctl_tx_0_0_ctl_tx.test_pattern_seed_b; 
assign ctl_tx_0_0_ctl_tx_test_pattern_select =      ctl_tx_0_0_ctl_tx.test_pattern_select;

logic [0:0]ptp_2step_ctl_if_0_0_ctl_ptp_transpclk_mode;
logic [79:0]ptp_2step_ctl_if_0_0_ctl_rx_systemtimerin;
logic [79:0]ptp_2step_ctl_if_0_0_ctl_tx_systemtimerin;

assign ptp_2step_ctl_if_0_0_ctl_ptp_transpclk_mode =    ptp_2step_ctl_if_0_0.ctl_ptp_transpclk_mode;
assign ptp_2step_ctl_if_0_0_ctl_rx_systemtimerin =      ptp_2step_ctl_if_0_0.ctl_rx_systemtimerin; 
assign ptp_2step_ctl_if_0_0_ctl_tx_systemtimerin =      ptp_2step_ctl_if_0_0.ctl_tx_systemtimerin; 

logic [79:0]ptp_2step_usrif_0_0_rx_ptp_tstamp_out;
logic ptp_2step_usrif_0_0_rx_ptp_tstamp_valid_out;
logic [1:0]ptp_2step_usrif_0_0_tx_ptp_1588op_in;
logic [15:0]ptp_2step_usrif_0_0_tx_ptp_tag_field_in;
logic [79:0]ptp_2step_usrif_0_0_tx_ptp_tstamp_out;
logic [15:0]ptp_2step_usrif_0_0_tx_ptp_tstamp_tag_out;
logic ptp_2step_usrif_0_0_tx_ptp_tstamp_valid_out;

assign ptp_2step_usrif_0_0.rx_ptp_tstamp_out =          ptp_2step_usrif_0_0_rx_ptp_tstamp_out;    
assign ptp_2step_usrif_0_0.rx_ptp_tstamp_valid_out =    ptp_2step_usrif_0_0_rx_ptp_tstamp_valid_out;    
assign ptp_2step_usrif_0_0_tx_ptp_1588op_in =           ptp_2step_usrif_0_0.tx_ptp_1588op_in;       
assign ptp_2step_usrif_0_0_tx_ptp_tag_field_in =        ptp_2step_usrif_0_0.tx_ptp_tag_field_in;   
assign ptp_2step_usrif_0_0.tx_ptp_tstamp_out =          ptp_2step_usrif_0_0_tx_ptp_tstamp_out;    
assign ptp_2step_usrif_0_0.tx_ptp_tstamp_tag_out =      ptp_2step_usrif_0_0_tx_ptp_tstamp_tag_out;
assign ptp_2step_usrif_0_0.tx_ptp_tstamp_valid_out =    ptp_2step_usrif_0_0_tx_ptp_tstamp_valid_out;    

logic ptp_stat_if_0_0_stat_tx_ptp_fifo_read_error;
logic ptp_stat_if_0_0_stat_tx_ptp_fifo_write_error;

assign ptp_stat_if_0_0.stat_tx_ptp_fifo_read_error =    ptp_stat_if_0_0_stat_tx_ptp_fifo_read_error;
assign ptp_stat_if_0_0.stat_tx_ptp_fifo_write_error =   ptp_stat_if_0_0_stat_tx_ptp_fifo_write_error;

logic stat_rx_0_0_stat_rx_bad_code;
logic [1:0]stat_rx_0_0_stat_rx_bad_fcs;
logic stat_rx_0_0_stat_rx_bad_preamble;
logic stat_rx_0_0_stat_rx_bad_sfd;
logic stat_rx_0_0_stat_rx_block_lock;
logic stat_rx_0_0_stat_rx_broadcast;
logic stat_rx_0_0_stat_rx_fragment;
logic stat_rx_0_0_stat_rx_framing_err;
logic stat_rx_0_0_stat_rx_framing_err_valid;
logic stat_rx_0_0_stat_rx_got_signal_os;
logic stat_rx_0_0_stat_rx_hi_ber;
logic stat_rx_0_0_stat_rx_inrangeerr;
logic stat_rx_0_0_stat_rx_internal_local_fault;
logic stat_rx_0_0_stat_rx_jabber;
logic stat_rx_0_0_stat_rx_local_fault;
logic stat_rx_0_0_stat_rx_multicast;
logic stat_rx_0_0_stat_rx_oversize;
logic stat_rx_0_0_stat_rx_packet_1024_1518_bytes;
logic stat_rx_0_0_stat_rx_packet_128_255_bytes;
logic stat_rx_0_0_stat_rx_packet_1519_1522_bytes;
logic stat_rx_0_0_stat_rx_packet_1523_1548_bytes;
logic stat_rx_0_0_stat_rx_packet_1549_2047_bytes;
logic stat_rx_0_0_stat_rx_packet_2048_4095_bytes;
logic stat_rx_0_0_stat_rx_packet_256_511_bytes;
logic stat_rx_0_0_stat_rx_packet_4096_8191_bytes;
logic stat_rx_0_0_stat_rx_packet_512_1023_bytes;
logic stat_rx_0_0_stat_rx_packet_64_bytes;
logic stat_rx_0_0_stat_rx_packet_65_127_bytes;
logic stat_rx_0_0_stat_rx_packet_8192_9215_bytes;
logic stat_rx_0_0_stat_rx_packet_bad_fcs;
logic stat_rx_0_0_stat_rx_packet_large;
logic stat_rx_0_0_stat_rx_packet_small;
logic stat_rx_0_0_stat_rx_received_local_fault;
logic stat_rx_0_0_stat_rx_remote_fault;
logic [1:0]stat_rx_0_0_stat_rx_stomped_fcs;
logic stat_rx_0_0_stat_rx_test_pattern_mismatch;
logic stat_rx_0_0_stat_rx_toolong;
logic [3:0]stat_rx_0_0_stat_rx_total_bytes;
logic [13:0]stat_rx_0_0_stat_rx_total_good_bytes;
logic stat_rx_0_0_stat_rx_total_good_packets;
logic [1:0]stat_rx_0_0_stat_rx_total_packets;
logic stat_rx_0_0_stat_rx_truncated;
logic stat_rx_0_0_stat_rx_undersize;
logic stat_rx_0_0_stat_rx_unicast;
logic stat_rx_0_0_stat_rx_valid_ctrl_code;
logic stat_rx_0_0_stat_rx_vlan;

assign stat_rx_0_0_stat_rx_bad_code =                   stat_rx_0_0_stat_rx.bad_code;
assign stat_rx_0_0_stat_rx_bad_fcs =                    stat_rx_0_0_stat_rx.bad_fcs;
assign stat_rx_0_0_stat_rx_bad_preamble =               stat_rx_0_0_stat_rx.bad_preamble;
assign stat_rx_0_0_stat_rx_bad_sfd =                    stat_rx_0_0_stat_rx.bad_sfd;
assign stat_rx_0_0_stat_rx_block_lock =                 stat_rx_0_0_stat_rx.block_lock;
assign stat_rx_0_0_stat_rx_broadcast =                  stat_rx_0_0_stat_rx.broadcast;
assign stat_rx_0_0_stat_rx_fragment =                   stat_rx_0_0_stat_rx.fragment;
assign stat_rx_0_0_stat_rx_framing_err =                stat_rx_0_0_stat_rx.framing_err;
assign stat_rx_0_0_stat_rx_framing_err_valid =          stat_rx_0_0_stat_rx.framing_err_valid;
assign stat_rx_0_0_stat_rx_got_signal_os =              stat_rx_0_0_stat_rx.got_signal_os;
assign stat_rx_0_0_stat_rx_hi_ber =                     stat_rx_0_0_stat_rx.hi_ber;
assign stat_rx_0_0_stat_rx_inrangeerr =                 stat_rx_0_0_stat_rx.inrangeerr;
assign stat_rx_0_0_stat_rx_internal_local_fault =       stat_rx_0_0_stat_rx.internal_local_fault;
assign stat_rx_0_0_stat_rx_jabber =                     stat_rx_0_0_stat_rx.jabber;
assign stat_rx_0_0_stat_rx_local_fault =                stat_rx_0_0_stat_rx.local_fault;
assign stat_rx_0_0_stat_rx_multicast =                  stat_rx_0_0_stat_rx.multicast;
assign stat_rx_0_0_stat_rx_oversize =                   stat_rx_0_0_stat_rx.oversize;
assign stat_rx_0_0_stat_rx_packet_1024_1518_bytes =     stat_rx_0_0_stat_rx.packet_1024_1518_bytes;
assign stat_rx_0_0_stat_rx_packet_128_255_bytes =       stat_rx_0_0_stat_rx.packet_128_255_bytes;
assign stat_rx_0_0_stat_rx_packet_1519_1522_bytes =     stat_rx_0_0_stat_rx.packet_1519_1522_bytes;
assign stat_rx_0_0_stat_rx_packet_1523_1548_bytes =     stat_rx_0_0_stat_rx.packet_1523_1548_bytes;
assign stat_rx_0_0_stat_rx_packet_1549_2047_bytes =     stat_rx_0_0_stat_rx.packet_1549_2047_bytes;
assign stat_rx_0_0_stat_rx_packet_2048_4095_bytes =     stat_rx_0_0_stat_rx.packet_2048_4095_bytes;
assign stat_rx_0_0_stat_rx_packet_256_511_bytes =       stat_rx_0_0_stat_rx.packet_256_511_bytes;
assign stat_rx_0_0_stat_rx_packet_4096_8191_bytes =     stat_rx_0_0_stat_rx.packet_4096_8191_bytes;
assign stat_rx_0_0_stat_rx_packet_512_1023_bytes =      stat_rx_0_0_stat_rx.packet_512_1023_bytes;
assign stat_rx_0_0_stat_rx_packet_64_bytes =            stat_rx_0_0_stat_rx.packet_64_bytes;
assign stat_rx_0_0_stat_rx_packet_65_127_bytes =        stat_rx_0_0_stat_rx.packet_65_127_bytes;
assign stat_rx_0_0_stat_rx_packet_8192_9215_bytes =     stat_rx_0_0_stat_rx.packet_8192_9215_bytes;
assign stat_rx_0_0_stat_rx_packet_bad_fcs =             stat_rx_0_0_stat_rx.packet_bad_fcs;
assign stat_rx_0_0_stat_rx_packet_large =               stat_rx_0_0_stat_rx.packet_large;
assign stat_rx_0_0_stat_rx_packet_small =               stat_rx_0_0_stat_rx.packet_small;
assign stat_rx_0_0_stat_rx_received_local_fault =       stat_rx_0_0_stat_rx.received_local_fault;
assign stat_rx_0_0_stat_rx_remote_fault =               stat_rx_0_0_stat_rx.remote_fault;
assign stat_rx_0_0_stat_rx_stomped_fcs =                stat_rx_0_0_stat_rx.stomped_fcs;
assign stat_rx_0_0_stat_rx_test_pattern_mismatch =      stat_rx_0_0_stat_rx.test_pattern_mismatch;
assign stat_rx_0_0_stat_rx_toolong =                    stat_rx_0_0_stat_rx.toolong;
assign stat_rx_0_0_stat_rx_total_bytes =                stat_rx_0_0_stat_rx.total_bytes;
assign stat_rx_0_0_stat_rx_total_good_bytes =           stat_rx_0_0_stat_rx.total_good_bytes;
assign stat_rx_0_0_stat_rx_total_good_packets =         stat_rx_0_0_stat_rx.total_good_packets;
assign stat_rx_0_0_stat_rx_total_packets =              stat_rx_0_0_stat_rx.total_packets;
assign stat_rx_0_0_stat_rx_truncated =                  stat_rx_0_0_stat_rx.truncated;
assign stat_rx_0_0_stat_rx_undersize =                  stat_rx_0_0_stat_rx.undersize;
assign stat_rx_0_0_stat_rx_unicast =                    stat_rx_0_0_stat_rx.unicast;
assign stat_rx_0_0_stat_rx_valid_ctrl_code =            stat_rx_0_0_stat_rx.valid_ctrl_code;
assign stat_rx_0_0_stat_rx_vlan =                       stat_rx_0_0_stat_rx.vlan;

logic stat_tx_0_0_stat_tx_bad_fcs;
logic stat_tx_0_0_stat_tx_broadcast;
logic stat_tx_0_0_stat_tx_frame_error;
logic stat_tx_0_0_stat_tx_local_fault;
logic stat_tx_0_0_stat_tx_multicast;
logic stat_tx_0_0_stat_tx_packet_1024_1518_bytes;
logic stat_tx_0_0_stat_tx_packet_128_255_bytes;
logic stat_tx_0_0_stat_tx_packet_1519_1522_bytes;
logic stat_tx_0_0_stat_tx_packet_1523_1548_bytes;
logic stat_tx_0_0_stat_tx_packet_1549_2047_bytes;
logic stat_tx_0_0_stat_tx_packet_2048_4095_bytes;
logic stat_tx_0_0_stat_tx_packet_256_511_bytes;
logic stat_tx_0_0_stat_tx_packet_4096_8191_bytes;
logic stat_tx_0_0_stat_tx_packet_512_1023_bytes;
logic stat_tx_0_0_stat_tx_packet_64_bytes;
logic stat_tx_0_0_stat_tx_packet_65_127_bytes;
logic stat_tx_0_0_stat_tx_packet_8192_9215_bytes;
logic stat_tx_0_0_stat_tx_packet_large;
logic stat_tx_0_0_stat_tx_packet_small;
logic [3:0]stat_tx_0_0_stat_tx_total_bytes;
logic [13:0]stat_tx_0_0_stat_tx_total_good_bytes;
logic stat_tx_0_0_stat_tx_total_good_packets;
logic stat_tx_0_0_stat_tx_total_packets;
logic stat_tx_0_0_stat_tx_unicast;
logic stat_tx_0_0_stat_tx_vlan;

assign stat_tx_0_0_stat_tx_bad_fcs =                    stat_tx_0_0_stat_tx.bad_fcs;
assign stat_tx_0_0_stat_tx_broadcast =                  stat_tx_0_0_stat_tx.broadcast;
assign stat_tx_0_0_stat_tx_frame_error =                stat_tx_0_0_stat_tx.frame_error;
assign stat_tx_0_0_stat_tx_local_fault =                stat_tx_0_0_stat_tx.local_fault;
assign stat_tx_0_0_stat_tx_multicast =                  stat_tx_0_0_stat_tx.multicast;
assign stat_tx_0_0_stat_tx_packet_1024_1518_bytes =     stat_tx_0_0_stat_tx.packet_1024_1518_bytes;
assign stat_tx_0_0_stat_tx_packet_128_255_bytes =       stat_tx_0_0_stat_tx.packet_128_255_bytes;
assign stat_tx_0_0_stat_tx_packet_1519_1522_bytes =     stat_tx_0_0_stat_tx.packet_1519_1522_bytes;
assign stat_tx_0_0_stat_tx_packet_1523_1548_bytes =     stat_tx_0_0_stat_tx.packet_1523_1548_bytes;
assign stat_tx_0_0_stat_tx_packet_1549_2047_bytes =     stat_tx_0_0_stat_tx.packet_1549_2047_bytes;
assign stat_tx_0_0_stat_tx_packet_2048_4095_bytes =     stat_tx_0_0_stat_tx.packet_2048_4095_bytes;
assign stat_tx_0_0_stat_tx_packet_256_511_bytes =       stat_tx_0_0_stat_tx.packet_256_511_bytes;
assign stat_tx_0_0_stat_tx_packet_4096_8191_bytes =     stat_tx_0_0_stat_tx.packet_4096_8191_bytes;
assign stat_tx_0_0_stat_tx_packet_512_1023_bytes =      stat_tx_0_0_stat_tx.packet_512_1023_bytes;
assign stat_tx_0_0_stat_tx_packet_64_bytes =            stat_tx_0_0_stat_tx.packet_64_bytes;
assign stat_tx_0_0_stat_tx_packet_65_127_bytes =        stat_tx_0_0_stat_tx.packet_65_127_bytes;
assign stat_tx_0_0_stat_tx_packet_8192_9215_bytes =     stat_tx_0_0_stat_tx.packet_8192_9215_bytes;
assign stat_tx_0_0_stat_tx_packet_large =               stat_tx_0_0_stat_tx.packet_large;
assign stat_tx_0_0_stat_tx_packet_small =               stat_tx_0_0_stat_tx.packet_small;
assign stat_tx_0_0_stat_tx_total_bytes =                stat_tx_0_0_stat_tx.total_bytes;
assign stat_tx_0_0_stat_tx_total_good_bytes =           stat_tx_0_0_stat_tx.total_good_bytes;
assign stat_tx_0_0_stat_tx_total_good_packes =          stat_tx_0_0_stat_tx.total_good_packets;
assign stat_tx_0_0_stat_tx_total_packets =              stat_tx_0_0_stat_tx.total_packets;
assign stat_tx_0_0_stat_tx_unicast =                    stat_tx_0_0_stat_tx.unicast;
assign stat_tx_0_0_stat_tx_vlan =                       stat_tx_0_0_stat_tx.vlan;


design_1_wrapper design_1_wrapper_1
(
.axis_rx_0_0_tdata,
.axis_rx_0_0_tkeep,
.axis_rx_0_0_tlast,
.axis_rx_0_0_tuser,
.axis_rx_0_0_tvalid,
.axis_tx_0_0_tdata,
.axis_tx_0_0_tkeep,
.axis_tx_0_0_tlast,
.axis_tx_0_0_tready,
.axis_tx_0_0_tuser,
.axis_tx_0_0_tvalid,
.ctl_rx_0_0_ctl_rx_check_preamble,
.ctl_rx_0_0_ctl_rx_check_sfd,
.ctl_rx_0_0_ctl_rx_custom_preamble_enable,
.ctl_rx_0_0_ctl_rx_data_pattern_select,
.ctl_rx_0_0_ctl_rx_delete_fcs,
.ctl_rx_0_0_ctl_rx_enable,
.ctl_rx_0_0_ctl_rx_force_resync,
.ctl_rx_0_0_ctl_rx_ignore_fcs,
.ctl_rx_0_0_ctl_rx_max_packet_len,
.ctl_rx_0_0_ctl_rx_min_packet_len,
.ctl_rx_0_0_ctl_rx_process_lfi,
.ctl_rx_0_0_ctl_rx_test_pattern,
.ctl_rx_0_0_ctl_rx_test_pattern_enable,
.ctl_tx_0_0_ctl_tx_custom_preamble_enable,
.ctl_tx_0_0_ctl_tx_data_pattern_select,
.ctl_tx_0_0_ctl_tx_enable,
.ctl_tx_0_0_ctl_tx_fcs_ins_enable,
.ctl_tx_0_0_ctl_tx_ignore_fcs,
.ctl_tx_0_0_ctl_tx_ipg_value,
.ctl_tx_0_0_ctl_tx_send_idle,
.ctl_tx_0_0_ctl_tx_send_lfi,
.ctl_tx_0_0_ctl_tx_send_rfi,
.ctl_tx_0_0_ctl_tx_test_pattern,
.ctl_tx_0_0_ctl_tx_test_pattern_enable,
.ctl_tx_0_0_ctl_tx_test_pattern_seed_a,
.ctl_tx_0_0_ctl_tx_test_pattern_seed_b,
.ctl_tx_0_0_ctl_tx_test_pattern_select,
.dclk_0,
.gt_loopback_in_0_0,
.gt_ref_clk_0_clk_n,
.gt_ref_clk_0_clk_p,
.gt_refclk_out_0,
.gt_rx_0_gt_port_0_n,
.gt_rx_0_gt_port_0_p,
.gt_tx_0_gt_port_0_n,
.gt_tx_0_gt_port_0_p,
.gtpowergood_out_0_0,
.gtwiz_reset_rx_datapath_0_0,
.gtwiz_reset_tx_datapath_0_0,
.ptp_2step_ctl_if_0_0_ctl_ptp_transpclk_mode,
.ptp_2step_ctl_if_0_0_ctl_rx_systemtimerin,
.ptp_2step_ctl_if_0_0_ctl_tx_systemtimerin,
.ptp_2step_usrif_0_0_rx_ptp_tstamp_out,
.ptp_2step_usrif_0_0_rx_ptp_tstamp_valid_out,
.ptp_2step_usrif_0_0_tx_ptp_1588op_in,
.ptp_2step_usrif_0_0_tx_ptp_tag_field_in,
.ptp_2step_usrif_0_0_tx_ptp_tstamp_out,
.ptp_2step_usrif_0_0_tx_ptp_tstamp_tag_out,
.ptp_2step_usrif_0_0_tx_ptp_tstamp_valid_out,
.ptp_stat_if_0_0_stat_tx_ptp_fifo_read_error,
.ptp_stat_if_0_0_stat_tx_ptp_fifo_write_error,
.qpllreset_in_0_0,
.rx_clk_out_0_0,
.rx_core_clk_0_0,
.rx_period_ns_0_0,
.rx_preambleout_0_0,
.rx_reset_0_0,
.rxoutclksel_in_0_0,
.rxrecclkout_0_0,
.stat_rx_0_0_stat_rx_bad_code,
.stat_rx_0_0_stat_rx_bad_fcs,
.stat_rx_0_0_stat_rx_bad_preamble,
.stat_rx_0_0_stat_rx_bad_sfd,
.stat_rx_0_0_stat_rx_block_lock,
.stat_rx_0_0_stat_rx_broadcast,
.stat_rx_0_0_stat_rx_fragment,
.stat_rx_0_0_stat_rx_framing_err,
.stat_rx_0_0_stat_rx_framing_err_valid,
.stat_rx_0_0_stat_rx_got_signal_os,
.stat_rx_0_0_stat_rx_hi_ber,
.stat_rx_0_0_stat_rx_inrangeerr,
.stat_rx_0_0_stat_rx_internal_local_fault,
.stat_rx_0_0_stat_rx_jabber,
.stat_rx_0_0_stat_rx_local_fault,
.stat_rx_0_0_stat_rx_multicast,
.stat_rx_0_0_stat_rx_oversize,
.stat_rx_0_0_stat_rx_packet_1024_1518_bytes,
.stat_rx_0_0_stat_rx_packet_128_255_bytes,
.stat_rx_0_0_stat_rx_packet_1519_1522_bytes,
.stat_rx_0_0_stat_rx_packet_1523_1548_bytes,
.stat_rx_0_0_stat_rx_packet_1549_2047_bytes,
.stat_rx_0_0_stat_rx_packet_2048_4095_bytes,
.stat_rx_0_0_stat_rx_packet_256_511_bytes,
.stat_rx_0_0_stat_rx_packet_4096_8191_bytes,
.stat_rx_0_0_stat_rx_packet_512_1023_bytes,
.stat_rx_0_0_stat_rx_packet_64_bytes,
.stat_rx_0_0_stat_rx_packet_65_127_bytes,
.stat_rx_0_0_stat_rx_packet_8192_9215_bytes,
.stat_rx_0_0_stat_rx_packet_bad_fcs,
.stat_rx_0_0_stat_rx_packet_large,
.stat_rx_0_0_stat_rx_packet_small,
.stat_rx_0_0_stat_rx_received_local_fault,
.stat_rx_0_0_stat_rx_remote_fault,
.stat_rx_0_0_stat_rx_stomped_fcs,
.stat_rx_0_0_stat_rx_test_pattern_mismatch,
.stat_rx_0_0_stat_rx_toolong,
.stat_rx_0_0_stat_rx_total_bytes,
.stat_rx_0_0_stat_rx_total_good_bytes,
.stat_rx_0_0_stat_rx_total_good_packets,
.stat_rx_0_0_stat_rx_total_packets,
.stat_rx_0_0_stat_rx_truncated,
.stat_rx_0_0_stat_rx_undersize,
.stat_rx_0_0_stat_rx_unicast,
.stat_rx_0_0_stat_rx_valid_ctrl_code,
.stat_rx_0_0_stat_rx_vlan,
.stat_rx_status_0_0,
.stat_tx_0_0_stat_tx_bad_fcs,
.stat_tx_0_0_stat_tx_broadcast,
.stat_tx_0_0_stat_tx_frame_error,
.stat_tx_0_0_stat_tx_local_fault,
.stat_tx_0_0_stat_tx_multicast,
.stat_tx_0_0_stat_tx_packet_1024_1518_bytes,
.stat_tx_0_0_stat_tx_packet_128_255_bytes,
.stat_tx_0_0_stat_tx_packet_1519_1522_bytes,
.stat_tx_0_0_stat_tx_packet_1523_1548_bytes,
.stat_tx_0_0_stat_tx_packet_1549_2047_bytes,
.stat_tx_0_0_stat_tx_packet_2048_4095_bytes,
.stat_tx_0_0_stat_tx_packet_256_511_bytes,
.stat_tx_0_0_stat_tx_packet_4096_8191_bytes,
.stat_tx_0_0_stat_tx_packet_512_1023_bytes,
.stat_tx_0_0_stat_tx_packet_64_bytes,
.stat_tx_0_0_stat_tx_packet_65_127_bytes,
.stat_tx_0_0_stat_tx_packet_8192_9215_bytes,
.stat_tx_0_0_stat_tx_packet_large,
.stat_tx_0_0_stat_tx_packet_small,
.stat_tx_0_0_stat_tx_total_bytes,
.stat_tx_0_0_stat_tx_total_good_bytes,
.stat_tx_0_0_stat_tx_total_good_packets,
.stat_tx_0_0_stat_tx_total_packets,
.stat_tx_0_0_stat_tx_unicast,
.stat_tx_0_0_stat_tx_vlan,
.sys_reset_0,
.tx_clk_out_0_0,
.tx_period_ns_0_0,
.tx_preamblein_0_0,
.tx_reset_0_0,
.tx_unfout_0_0,
.txoutclksel_in_0_0,
.user_rx_reset_0_0,
.user_tx_reset_0_0
);

endmodule
