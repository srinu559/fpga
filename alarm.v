module example(input wire clk,output reg a,output reg tog,input fl,input start,input reset ,input B0,input B9,input B1,input B2,input B3,input B4,input B5,input B6,input B7,input B8,output leda,output ledb,output ledc,output ledd,output lede,output ledf,output ledg);
reg [9:0] number;
reg [28:0] delay1 ;
reg [5:0] tmp_hour, tmp_minute, tmp_second,counter; 
reg [5:0] f_hour, f_minute, f_second; 
reg [5:0] c_hour, c_minute, c_second; 
 reg [3:0] c_hour1,a_hour1; 
 reg [3:0] c_hour0,a_hour0;
 reg [3:0] c_min1,a_min1;
 reg [3:0] c_min0,a_min0;
 reg [3:0] c_sec1,a_sec1;
 reg [3:0] c_sec0,a_sec0;
reg [6:0] seg_data;

reg [3:0] cten,cunit;
reg  [5:0] tempdata;
integer take;
integer set;
integer count;
integer onetime;
integer datataken;
integer index;
integer finished;

initial begin
finished=0;
c_second=0;
timetemp=0;
timef=0;
set=0;
cunit=0;
cten=0;
take=0;
count=0;
onetime=0;
tempdata=0;
datataken=0;
tmp_hour=6'd0;
 tmp_minute=6'd0;
  tmp_second=6'd0;
  f_hour=6'd0;
 f_minute=6'd0;
  f_second=6'd0;
  counter=6'd0;
end

always@(posedge clk) begin
if(fl==1 && start==0)
begin
f_hour=5'd0;
 f_minute=5'd0;
  f_second=5'd0;
number[0]=B0;
number[1]=B1;
number[2]=B2;
number[3]=B3;
number[4]=B4;
number[5]=B5;
number[6]=B6;
number[7]=B7;
number[8]=B8;
number[9]=B9;
delay1=delay1+1;
if(delay1==27'b100000001011110000100000000)
begin
if(number==10'b0000000001)
begin
tempdata=5'd0;
  take=1;

end
if(number==10'b0000000010)
begin
tempdata=6'd1;
  take=1;

end
if(number==10'b0000000100)
begin
tempdata=6'd2;
  take=1;

end
if(number==10'b0000001000)
begin
tempdata=6'd3;
  take=1;

end
if(number==10'b0000010000)
begin
tempdata=6'd4;
  take=1;

end
if(number==10'b0000100000)
begin
tempdata=6'd5;
  take=1;

end
if(number==10'b0001000000)
begin
tempdata=6'd6;
  take=1;
  take=1;

end
if(number==10'b0010000000)
begin
tempdata=6'd7;
  take=1;

end
if(number==10'b0100000000)
begin
tempdata=6'd8;
  take=1;

end
if(number==10'b1000000000)
begin
tempdata=6'd9;
  take=1;
end
if(count==0 && take==1)
begin
a=!a;
  tmp_hour=tempdata;
   take=0;
count=1;
 tempdata=6'd0;
end
if(count==1 && take==1)
begin
a=!a;
  tmp_hour=tmp_hour*6'd10+tempdata;
 take=0;
 count=2;
  tempdata=6'd0;

end
if(count==2 && take==1)
begin
a=!a;
  tmp_minute=tempdata;
   take=0;
count=3;
 tempdata=6'd0;
end
if(count==3 && take==1)
begin
a=!a;

  tmp_minute=tmp_minute*6'd10+tempdata;
 take=0;
 count=4;
  tempdata=6'd0;

end
if(count==4 && take==1)
begin
a=!a;
  tmp_second=tempdata;
   take=0;
count=5;
 tempdata=6'd0;

end
if(count==5 && take==1)
begin
a=!a;
  tmp_second=tmp_second*6'd10+tempdata;
 take=0;
 count=6;
 tempdata=6'd0;
datataken=1;
end  

delay1=0;

end
end


if(start==1 && fl==0)
begin
delay1=delay1+1;
if(delay1==27'b101111101011110000100000000)
begin
c_second=tmp_second-f_second;
c_minute=tmp_minute-f_minute;
c_hour=tmp_hour-f_hour;
if(c_second==6'd0 && c_minute==6'd0 && c_hour==6'd0)
  begin
  a=!a;
  finished=1;
  end

f_second = f_second + 1;
 if(f_second >=59) begin 
 f_second = 0;
 f_minute=f_minute+1;
  if(f_minute>=59) 
 begin
 f_minute=0;
 f_hour=f_hour+1;
 end
 end
 delay1=0;
end
end
end

endmodule
