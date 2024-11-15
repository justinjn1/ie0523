/* Generated by Yosys 0.33 (git sha1 2584903a060) */

(* top =  1  *)
(* src = "gatemanager.v:1.1-80.10" *)
module gatemanager(clk, rst, s01, s02, pass, wrong_pin_alarm, gate, lock_alarm);
  (* src = "gatemanager.v:40.1-79.4" *)
  wire _000_;
  (* src = "gatemanager.v:40.1-79.4" *)
  wire [1:0] _001_;
  (* src = "gatemanager.v:40.1-79.4" *)
  wire [3:0] _002_;
  (* src = "gatemanager.v:40.1-79.4" *)
  wire _003_;
  (* src = "gatemanager.v:40.1-79.4" *)
  wire _004_;
  (* src = "gatemanager.v:40.1-79.4" *)
  wire [3:0] _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire [7:0] _037_;
  wire [3:0] _038_;
  wire [1:0] _039_;
  wire [1:0] _040_;
  wire [1:0] _041_;
  wire [1:0] _042_;
  wire [1:0] _043_;
  wire _044_;
  wire [1:0] _045_;
  wire _046_;
  wire [15:0] _047_;
  wire [1:0] _048_;
  wire [1:0] _049_;
  wire [1:0] _050_;
  wire [1:0] _051_;
  wire [1:0] _052_;
  wire [2:0] _053_;
  wire [2:0] _054_;
  wire _055_;
  (* src = "gatemanager.v:53.24-53.28" *)
  wire _056_;
  (* force_downto = 32'd1 *)
  (* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:571.28-571.29" *)
  wire [15:0] _057_;
  (* force_downto = 32'd1 *)
  (* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:583.28-583.35" *)
  wire [15:0] _058_;
  (* force_downto = 32'd1 *)
  (* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:573.22-573.23" *)
  wire [3:0] _059_;
  (* force_downto = 32'd1 *)
  (* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:578.19-578.22" *)
  wire [3:0] _060_;
  (* force_downto = 32'd1 *)
  (* src = "gatemanager.v:69.27-69.34|/usr/bin/../share/yosys/techmap.v:270.23-270.24" *)
  wire [31:0] _061_;
  (* force_downto = 32'd1 *)
  (* src = "gatemanager.v:69.27-69.34|/usr/bin/../share/yosys/techmap.v:270.26-270.27" *)
  (* unused_bits = "2" *)
  wire [31:0] _062_;
  (* force_downto = 32'd1 *)
  (* src = "gatemanager.v:70.21-70.28|/usr/bin/../share/yosys/techmap.v:270.23-270.24" *)
  wire [31:0] _063_;
  (* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:597.13-597.15" *)
  wire _064_;
  (* src = "gatemanager.v:12.12-12.15" *)
  input clk;
  wire clk;
  (* src = "gatemanager.v:26.11-26.14" *)
  wire [1:0] cnt;
  (* src = "gatemanager.v:15.29-15.33" *)
  output gate;
  wire gate;
  (* src = "gatemanager.v:15.35-15.45" *)
  output lock_alarm;
  wire lock_alarm;
  (* src = "gatemanager.v:24.18-24.27" *)
  wire [3:0] nextState;
  (* src = "gatemanager.v:13.19-13.23" *)
  input [15:0] pass;
  wire [15:0] pass;
  (* src = "gatemanager.v:12.17-12.20" *)
  input rst;
  wire rst;
  (* src = "gatemanager.v:12.22-12.25" *)
  input s01;
  wire s01;
  (* src = "gatemanager.v:12.27-12.30" *)
  input s02;
  wire s02;
  (* src = "gatemanager.v:24.11-24.16" *)
  wire [3:0] state;
  (* src = "gatemanager.v:15.12-15.27" *)
  output wrong_pin_alarm;
  wire wrong_pin_alarm;
  (* src = "gatemanager.v:28.1-38.4" *)
  DFF _065_ (
    .C(clk),
    .D(_026_),
    .Q(state[0])
  );
  (* src = "gatemanager.v:28.1-38.4" *)
  DFF _066_ (
    .C(clk),
    .D(_028_),
    .Q(state[1])
  );
  (* src = "gatemanager.v:28.1-38.4" *)
  DFF _067_ (
    .C(clk),
    .D(_030_),
    .Q(state[2])
  );
  (* src = "gatemanager.v:28.1-38.4" *)
  DFF _068_ (
    .C(clk),
    .D(_032_),
    .Q(state[3])
  );
  (* src = "gatemanager.v:28.1-38.4" *)
  DFF _069_ (
    .C(clk),
    .D(_034_),
    .Q(cnt[0])
  );
  (* src = "gatemanager.v:28.1-38.4" *)
  DFF _070_ (
    .C(clk),
    .D(_036_),
    .Q(cnt[1])
  );
  assign _025_ = _010_ ? nextState[0] : state[0];
  assign _027_ = _010_ ? nextState[1] : state[1];
  assign _029_ = _010_ ? nextState[2] : state[2];
  assign _031_ = _010_ ? nextState[3] : state[3];
  assign _033_ = _011_ ? _001_[0] : cnt[0];
  assign _035_ = _011_ ? _001_[1] : cnt[1];
  assign _026_ = rst ? 1'h1 : _025_;
  assign _028_ = rst ? 1'h0 : _027_;
  assign _030_ = rst ? 1'h0 : _029_;
  assign _032_ = rst ? 1'h0 : _031_;
  assign _034_ = rst ? 1'h0 : _033_;
  assign _036_ = rst ? 1'h0 : _035_;
  assign _063_[1] = ~cnt[1];
  assign _013_ = ~pass[3];
  assign _014_ = ~pass[5];
  assign _015_ = ~pass[6];
  assign _016_ = ~pass[10];
  assign _017_ = ~pass[13];
  assign _061_[0] = ~cnt[0];
  assign _018_ = ~state[2];
  assign _019_ = ~state[3];
  assign _020_ = ~state[1];
  assign _021_ = ~state[0];
  assign _012_ = _061_[0] |(* src = "gatemanager.v:60.17-60.29" *)  _063_[1];
  assign _037_[0] = pass[0] |(* src = "gatemanager.v:68.24-68.39" *)  pass[1];
  assign _037_[1] = pass[2] |(* src = "gatemanager.v:68.24-68.39" *)  _013_;
  assign _037_[2] = pass[4] |(* src = "gatemanager.v:68.24-68.39" *)  _014_;
  assign _037_[3] = _015_ |(* src = "gatemanager.v:68.24-68.39" *)  pass[7];
  assign _037_[4] = pass[8] |(* src = "gatemanager.v:68.24-68.39" *)  pass[9];
  assign _037_[5] = _016_ |(* src = "gatemanager.v:68.24-68.39" *)  pass[11];
  assign _037_[6] = pass[12] |(* src = "gatemanager.v:68.24-68.39" *)  _017_;
  assign _037_[7] = pass[14] |(* src = "gatemanager.v:68.24-68.39" *)  pass[15];
  assign _038_[0] = _037_[0] |(* src = "gatemanager.v:68.24-68.39" *)  _037_[1];
  assign _038_[1] = _037_[2] |(* src = "gatemanager.v:68.24-68.39" *)  _037_[3];
  assign _038_[2] = _037_[4] |(* src = "gatemanager.v:68.24-68.39" *)  _037_[5];
  assign _038_[3] = _037_[6] |(* src = "gatemanager.v:68.24-68.39" *)  _037_[7];
  assign _039_[0] = _038_[0] |(* src = "gatemanager.v:68.24-68.39" *)  _038_[1];
  assign _039_[1] = _038_[2] |(* src = "gatemanager.v:68.24-68.39" *)  _038_[3];
  assign _055_ = _039_[0] |(* src = "gatemanager.v:68.24-68.39" *)  _039_[1];
  assign _011_ = _059_[1] & _012_;
  assign _040_[0] = _021_ |(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12" *)  state[1];
  assign _023_ = _040_[0] |(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12" *)  _040_[1];
  assign _041_[0] = _009_ & _008_;
  assign _041_[1] = _007_ & _006_;
  assign _010_ = _041_[0] & _041_[1];
  assign _042_[1] = _018_ |(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12" *)  state[3];
  assign _009_ = _042_[0] |(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12" *)  _042_[1];
  assign _042_[0] = state[0] |(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12" *)  state[1];
  assign _043_[1] = state[2] |(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12" *)  _019_;
  assign _024_ = _042_[0] |(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12" *)  _043_[1];
  assign _044_ = _053_[0] | _053_[1];
  assign _008_ = _044_ | _022_;
  assign _045_[0] = state[0] |(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12" *)  _020_;
  assign _040_[1] = state[2] |(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12" *)  state[3];
  assign _022_ = _045_[0] |(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12" *)  _040_[1];
  assign _046_ = _054_[0] | _054_[1];
  assign _007_ = _046_ | _023_;
  assign _006_ = s02 | _024_;
  assign _047_[0] = _061_[0] &(* src = "gatemanager.v:70.21-70.28" *)  _063_[1];
  assign _048_[0] = _058_[3] |(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:593.20-593.31" *)  _058_[7];
  assign _060_[3] = _048_[0] |(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:593.20-593.31" *)  _058_[15];
  assign _049_[0] = _058_[3] |(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:593.20-593.31" *)  _058_[6];
  assign _060_[2] = _049_[0] |(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:593.20-593.31" *)  _058_[14];
  assign _050_[0] = _058_[3] |(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:593.20-593.31" *)  _058_[5];
  assign _060_[1] = _050_[0] |(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:593.20-593.31" *)  _058_[13];
  assign _051_[0] = _058_[0] |(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:593.20-593.31" *)  _058_[5];
  assign _060_[0] = _051_[0] |(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:593.20-593.31" *)  _058_[15];
  assign _052_[0] = gate |(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:597.13-597.15" *)  _059_[1];
  assign _052_[1] = lock_alarm |(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:597.13-597.15" *)  _059_[3];
  assign _064_ = _052_[0] |(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:597.13-597.15" *)  _052_[1];
  assign _053_[0] = ~(* src = "gatemanager.v:60.17-60.29" *) _012_;
  assign _053_[1] = ~(* src = "gatemanager.v:68.24-68.39" *) _055_;
  assign _059_[3] = ~(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12" *) _023_;
  assign _059_[1] = ~(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12" *) _022_;
  assign _054_[0] = s01 &(* src = "gatemanager.v:53.17-53.28" *)  _056_;
  assign _054_[1] = s01 &(* src = "gatemanager.v:54.22-54.32" *)  s02;
  assign _057_[0] = s02 ? (* src = "gatemanager.v:75.17-75.25|gatemanager.v:75.13-75.44" *) 1'h1 : 1'hx;
  assign _057_[3] = s02 ? (* src = "gatemanager.v:75.17-75.25|gatemanager.v:75.13-75.44" *) 1'h0 : 1'hx;
  assign _001_[0] = _055_ ? (* src = "gatemanager.v:64.22-64.37|gatemanager.v:64.18-71.16" *) _061_[0] : 1'h0;
  assign _001_[1] = _055_ ? (* src = "gatemanager.v:64.22-64.37|gatemanager.v:64.18-71.16" *) _062_[1] : 1'h0;
  assign _005_[2] = _055_ ? (* src = "gatemanager.v:64.22-64.37|gatemanager.v:64.18-71.16" *) 1'hx : 1'h0;
  assign _005_[3] = _055_ ? (* src = "gatemanager.v:64.22-64.37|gatemanager.v:64.18-71.16" *) 1'hx : 1'h1;
  assign _003_ = _055_ ? (* src = "gatemanager.v:64.22-64.37|gatemanager.v:64.18-71.16" *) _004_ : 1'h0;
  assign _057_[5] = _012_ ? (* src = "gatemanager.v:60.17-60.29|gatemanager.v:60.13-71.16" *) _005_[2] : 1'h0;
  assign _057_[6] = _012_ ? (* src = "gatemanager.v:60.17-60.29|gatemanager.v:60.13-71.16" *) _005_[2] : 1'h1;
  assign _057_[7] = _012_ ? (* src = "gatemanager.v:60.17-60.29|gatemanager.v:60.13-71.16" *) _005_[3] : 1'h0;
  assign _000_ = _012_ ? (* src = "gatemanager.v:60.17-60.29|gatemanager.v:60.13-71.16" *) _003_ : 1'h1;
  assign _002_[3] = _054_[1] ? (* src = "gatemanager.v:54.22-54.32|gatemanager.v:54.18-54.53" *) 1'h0 : 1'hx;
  assign _002_[2] = _054_[1] ? (* src = "gatemanager.v:54.22-54.32|gatemanager.v:54.18-54.53" *) 1'h1 : 1'hx;
  assign _057_[15] = _054_[0] ? (* src = "gatemanager.v:53.17-53.28|gatemanager.v:53.13-54.53" *) 1'h0 : _002_[3];
  assign _057_[13] = _054_[0] ? (* src = "gatemanager.v:53.17-53.28|gatemanager.v:53.13-54.53" *) 1'h1 : _002_[3];
  assign _057_[14] = _054_[0] ? (* src = "gatemanager.v:53.17-53.28|gatemanager.v:53.13-54.53" *) 1'h0 : _002_[2];
  assign lock_alarm = ~(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12" *) _009_;
  assign gate = ~(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12" *) _024_;
  assign wrong_pin_alarm = _022_ ? (* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12" *) 1'h0 : _000_;
  assign nextState[0] = _064_ ? (* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:597.13-597.25" *) _060_[0] : 1'h1;
  assign nextState[1] = _064_ ? (* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:597.13-597.25" *) _060_[1] : 1'h0;
  assign nextState[2] = _064_ ? (* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:597.13-597.25" *) _060_[2] : 1'h0;
  assign nextState[3] = _064_ ? (* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:597.13-597.25" *) _060_[3] : 1'h0;
  assign _056_ = ~(* src = "gatemanager.v:53.24-53.28" *) s02;
  assign _004_ = ~(* src = "gatemanager.v:70.21-70.28" *) _047_[0];
  assign _058_[13] = _057_[13] &(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:585.44-585.84" *)  _059_[3];
  assign _058_[14] = _057_[14] &(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:585.44-585.84" *)  _059_[3];
  assign _058_[15] = _057_[15] &(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:585.44-585.84" *)  _059_[3];
  assign _058_[5] = _057_[5] &(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:585.44-585.84" *)  _059_[1];
  assign _058_[6] = _057_[6] &(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:585.44-585.84" *)  _059_[1];
  assign _058_[7] = _057_[7] &(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:585.44-585.84" *)  _059_[1];
  assign _058_[0] = _057_[0] &(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:585.44-585.84" *)  gate;
  assign _058_[3] = _057_[3] &(* src = "gatemanager.v:0.0-0.0|gatemanager.v:51.5-78.12|/usr/bin/../share/yosys/techmap.v:585.44-585.84" *)  gate;
  assign _062_[1] = cnt[1] ^(* src = "gatemanager.v:69.27-69.34|/usr/bin/../share/yosys/techmap.v:289.13-289.25" *)  cnt[0];
  assign _002_[1:0] = { _002_[3], _002_[3] };
  assign _005_[1:0] = { _005_[2], _005_[2] };
  assign _043_[0] = _042_[0];
  assign _045_[1] = _040_[1];
  assign _047_[15:1] = 15'h7fff;
  assign _048_[1] = _058_[15];
  assign _049_[1] = _058_[14];
  assign _050_[1] = _058_[13];
  assign _051_[1] = _058_[15];
  assign _053_[2] = _022_;
  assign _054_[2] = _023_;
  assign { _057_[12:8], _057_[4], _057_[2:1] } = { _057_[15], 4'hx, _057_[5], _057_[3], _057_[3] };
  assign { _058_[12:8], _058_[4], _058_[2:1] } = { _058_[15], 4'h0, _058_[5], _058_[3], _058_[3] };
  assign { _059_[2], _059_[0] } = { lock_alarm, gate };
  assign _061_[31:1] = { 30'h00000000, cnt[1] };
  assign { _062_[31:3], _062_[0] } = { 29'h00000000, _061_[0] };
  assign { _063_[31:2], _063_[0] } = { 30'h3fffffff, _061_[0] };
endmodule
