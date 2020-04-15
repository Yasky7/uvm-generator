//***** ***** ***** *****  *****  *****  *****  *****  *****  *****  ***** 
//Auto Generated by UVM-Generator
//Author: Jiacai Yuan
//E-mail: yuan861025184@163.com
//Contents:{{MODULE}}_harness
//***** ***** ***** *****  *****  *****  *****  *****  *****  *****  ***** 
module tb();

//parameter
{%for param in global_param_list-%}
	parameter {{param.key}}={{param.value}};
{%endfor%}
//port
{%-for port in global_clk_rst%} 
reg {{port.bit_info}} {{port.name}};
{%-endfor%}
{%for port in global_port_list%} 
wire {{port.bit_info}} {{port.name}};
{%-endfor%}
//instance interface
{%for agt in agt_list%}
{{MODULE}}_{{agt.name}}_inf #(
{%-for param in agt.param_list-%}
.{{param.key}}({{param.value}})
{%-if not loop.last-%},{%endif%}
{%-endfor%})  {{agt.name}}_inf(
{%-for port in agt.clk_rst-%}
	.{{port.name}}({{port.name}}){%-if not loop.last-%},{%endif%}
{%-endfor-%}
);
{%endfor%}

//instance dut
{{MODULE}} u_{{MODULE}}(
{%for port in global_clk_rst+global_port_list%}
	.{{port.name}}({{port.name}})
	{%-if not loop.last-%},{%endif%}
{%-endfor%}
);

//bind
{%for agt in agt_list%}
	{%-for port in agt.port_list-%}
{%if port.direction=="input"-%} assign {{port.name}}={{agt.name}}_inf.{{port.name}};
{%elif port.direction=="output"-%} assign {{agt.name}}_inf.{{port.name}}={{port.name}};
{%else-%} assign {{port.name}}={{agt.name}}_inf.{{port.name}};{%endif%}
	{%-endfor%}
{%endfor%}

//logic
initial
begin
{%-for port in global_clk_rst%} 
    {{port.name}}=0;
{%-endfor%}
// Add user logic here

// User logic ends
end

initial begin
{%for agt in agt_list%}
	uvm_config_db#(virtual {{MODULE}}_{{agt.name}}_inf)::set(null,"uvm_test_top.env.{{agt.name}}_agt","{{agt.name}}_inf",{{agt.name}}_inf);
{%-endfor%}
end

initial
begin
	`ifdef DUMP_FSDB
		$fsdbDumpfile("simv.fsdb");
		$fsdbDumpvars(0,tb);
	`endif
	`ifdef DUMP_VPD
		$vcdpluson();
	`endif
end

initial
begin
	$display("-------------------------------------------------------");
	$display("------------------------Start--------------------------");
	$display("-------------------------------------------------------");
	run_test();
end

// Add user logic here

// User logic ends
endmodule
