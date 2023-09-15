`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/09/2023 03:22:39 PM
// Design Name: 
// Module Name: xxv_ethernet_tb
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


module xxv_ethernet_tb;

logic clk;

logic [2:0]gt_loopback_in_0_0;
logic gt_clk;
logic [7:0] gt_clk_count;
logic gt_ref_clk_0_clk_n;
logic gt_ref_clk_0_clk_p;
logic gt_refclk_out_0;
logic gt_rx_0_gt_port_0_n;
logic gt_rx_0_gt_port_0_p;
logic gt_tx_0_gt_port_0_n;
logic gt_tx_0_gt_port_0_p;
logic gtpowergood_out_0_0;
logic gtwiz_reset_rx_datapath_0_0;
logic gtwiz_reset_tx_datapath_0_0;
logic dclk_0;
logic qpllreset_in_0_0;
logic rx_clk_out_0_0;
logic rx_core_clk_0_0;
logic [63:0]rx_period_ns_0_0;
logic [55:0]rx_preambleout_0_0;
logic rx_reset_0_0;
logic [2:0]rxoutclksel_in_0_0;
logic rxrecclkout_0_0;
logic stat_rx_status_0_0;
logic sys_reset_0;
logic tx_clk_out_0_0;
logic [63:0]tx_period_ns_0_0;
logic [55:0]tx_preamblein_0_0;
logic tx_reset_0_0;
logic tx_unfout_0_0;
logic [2:0]txoutclksel_in_0_0;
logic user_rx_reset_0_0;
logic user_tx_reset_0_0;

axi_stream_if #(.BITS(64)) axis_rx_0_0(rx_core_clk_0_0);
axi_stream_if #(.BITS(64)) axis_tx_0_0(tx_clk_out_0_0);
ctl_if ctl_rx_0_0_ctl_rx(rx_clk_out_0_0);
ctl_if ctl_tx_0_0_ctl_tx(tx_clk_out_0_0);
ptp_2step_ctl_if ptp_2step_ctl_if_0_0(clk);
ptp_2step_usr_if ptp_2step_usrif_0_0(clk);
ptp_stat_if ptp_stat_if_0_0(clk);
stat_if stat_rx_0_0_stat_rx(rx_clk_out_0_0);
stat_if stat_tx_0_0_stat_tx(tx_clk_out_0_0);


task Reset();
  sys_reset_0 <= 1;
  gtwiz_reset_rx_datapath_0_0 <= 1;
  gtwiz_reset_tx_datapath_0_0 <= 1;
  tx_reset_0_0 <= 1;
  rx_reset_0_0 <= 1;
  repeat (100) @(posedge clk);
  sys_reset_0 <= 0;
  gtwiz_reset_rx_datapath_0_0 <= 0;
  gtwiz_reset_tx_datapath_0_0 <= 0;
  tx_reset_0_0 <= 0;
  rx_reset_0_0 <= 0;
endtask

task SendTxData(logic [63:0] data[]);
  for (int i = 0; i < data.size; i++)
    axis_tx_0_0.Write(data[i], i == (data.size-1));
endtask

task SendRxData(logic [63:0] data[]);
  logic [65:0] data66;
  while (gt_clk_count != 65)
    @(posedge gt_clk);
  for (int i = 0; i < data.size; i++)
    begin
      data66 = {2'b01,data[i]};
      for (int j = 0; j < 66; j++)
        begin
          @(posedge gt_clk);
          //gt_rx_0_gt_port_0_n = ~data66[j];
          //gt_rx_0_gt_port_0_p = data66[j];
        end
    end
endtask

assign gt_rx_0_gt_port_0_n = gt_tx_0_gt_port_0_n;
assign gt_rx_0_gt_port_0_p = gt_tx_0_gt_port_0_p;

assign rx_core_clk_0_0 = rx_clk_out_0_0;

initial
  begin
    axis_rx_0_0.tready = 0;
    axis_tx_0_0.Clear();
    ctl_rx_0_0_ctl_rx.Clear();
    ctl_tx_0_0_ctl_tx.Clear();
    gt_loopback_in_0_0 = 0;
    //gt_rx_0_gt_port_0_n = 1;
    //gt_rx_0_gt_port_0_p = 0;
    gtwiz_reset_rx_datapath_0_0 = 0;
    gtwiz_reset_tx_datapath_0_0 = 0;
    ptp_2step_ctl_if_0_0.Clear();
    ptp_2step_usrif_0_0.Clear();
    //ptp_stat_if ptp_stat_if_0_0,
    qpllreset_in_0_0 = 0;
    rx_reset_0_0 = 0;
    rxoutclksel_in_0_0 = 3'b101; // This port is to be driven with 3'b101 as per preset
    //stat_if stat_rx_0_0_stat_rx,
    //stat_if stat_tx_0_0_stat_tx,
    sys_reset_0 = 0;
    tx_preamblein_0_0 = 0;
    tx_reset_0_0 = 0;
    txoutclksel_in_0_0 = 3'b101; // This port is to be driven with 3'b101 as per preset
    repeat (10) @(posedge clk);
    Reset();
    repeat (100) @(posedge clk);
    ctl_rx_0_0_ctl_rx.Enable();
    ctl_tx_0_0_ctl_tx.Enable();
    repeat (1000) @(posedge clk);
    SendTxData('{1,2,3,4,5,6,7,8});
    repeat (1000) @(posedge clk);
    SendTxData('{9,10,11,12,13,14,15,16});
    repeat (1000) @(posedge clk);   
    SendRxData('{1,2,3,4,5,6,7,8,9,10});  // Changed to loopback mode to check out send data
    repeat (1000) @(posedge clk);   
    $stop;
  end
  
initial
  begin
    clk = 0;
    forever #10 clk = ~clk;
  end

// 100 MHz is okay for this
initial
  begin
    dclk_0 = 0;
    forever #5 dclk_0 = ~dclk_0;
  end

// 66 * 2 * 191.3125 MHz (2x = 390.625)
parameter GT_CLK_HALF_PERIOD = 1/191.312/2*1000/66/2; // in nS
// gt_clk
initial
  begin
    gt_clk = 0;
    forever
      begin
        #GT_CLK_HALF_PERIOD;
        gt_clk = ~gt_clk;
      end
  end 
  
initial
  begin
    gt_clk_count = 0;
    forever
      begin
        @(posedge gt_clk);
        if (gt_clk_count < 66)
          gt_clk_count = gt_clk_count + 1;
        else
          gt_clk_count = 0;
      end
  end

// 191.3125 MHz (2x = 390.625)
parameter REF_CLK_HALF_PERIOD = 1/191.312/2*1000; // in nS
initial
  begin
    gt_ref_clk_0_clk_n = 1;
    gt_ref_clk_0_clk_p = 0;
    forever
      begin
        #REF_CLK_HALF_PERIOD;
        gt_ref_clk_0_clk_n = ~gt_ref_clk_0_clk_n;
        gt_ref_clk_0_clk_p = ~gt_ref_clk_0_clk_p;
      end
  end 

xxv_eth_svw xxv_eth_svw_1
(
.axis_rx_0_0,
.axis_tx_0_0,
.ctl_rx_0_0_ctl_rx,
.ctl_tx_0_0_ctl_tx,
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
.dclk_0,
.ptp_2step_ctl_if_0_0,
.ptp_2step_usrif_0_0,
.ptp_stat_if_0_0,
.qpllreset_in_0_0,
.rx_clk_out_0_0,
.rx_core_clk_0_0,
.rx_period_ns_0_0,
.rx_preambleout_0_0,
.rx_reset_0_0,
.rxoutclksel_in_0_0,
.rxrecclkout_0_0,
.stat_rx_0_0_stat_rx,
.stat_rx_status_0_0,
.stat_tx_0_0_stat_tx,
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
