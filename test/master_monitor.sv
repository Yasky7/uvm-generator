//***** ***** ***** *****  *****  *****  *****  *****  *****  *****  ***** 
//Auto Generated by UVM-Generator
//Author: Jiacai Yuan
//E-mail: yuan861025184@163.com
//Contents:dut_master_monitor
//***** ***** ***** *****  *****  *****  *****  *****  *****  *****  ***** 
class dut_master_monitor extends uvm_monitor ;

	`uvm_component_utils(dut_master_monitor)
	`uvm_register_cb(dut_master_monitor,dut_callback)

	//Config	//Interface
	master_monitor_config moi_cfg;
	virtual dut_master_inf master_inf;
	
	//TLM 
	uvm_analysis_port#(master_req) moi_port;
	
	//Transaction Sequence item
	master_req  moi_req;
	
	//Constructor Function
	function new(string name="dut_master_monitor",uvm_component parent=null);
		super.new(name,parent);
	endfunction
	
	//Phase Methods
	extern virtual function void build_phase(uvm_phase phase);
	extern virtual function void connect_phase(uvm_phase phase);
	extern virtual task run_phase(uvm_phase phase);
	
	//Task Function Methods
	extern task moi_request();
	
	
	// Add user method here
	//e.g. task function
	// User method ends
endclass

function void dut_master_monitor::build_phase(uvm_phase phase);
	super.build_phase(phase);
	`uvm_info(get_name(),"Build Phase is Called",UVM_LOW)
//	if(!uvm_config_db#(master_monitor_config)::get(this,"","moi_cfg",moi_cfg))
//	begin
//		`uvm_fatal(get_name(),"Failed Get master Monitor Config")
//	end
	moi_port=new("moi_port",this);
	
	// Add user build here
	//e.g. TLM build
	// User build ends
endfunction

function void dut_master_monitor::connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	`uvm_info(get_name(),"Connect Phase is Called",UVM_LOW)
	
	// Add user connect here
	//e.g. TLM  interface connect
	// User connect ends
endfunction

task dut_master_monitor::run_phase(uvm_phase phase);
	super.run_phase(phase);
	`uvm_info(get_name(),"Run Phase is Called",UVM_LOW)
	fork
		moi_request();
	// Add user logic here

	// User logic ends
	
	join
	// Add user logic here
	//e.g. task function `uvm_do_callbacks
	// User logic ends	
	
endtask

task dut_master_monitor::moi_request();
	forever
	begin
		moi_req=master_req::type_id::create("moi_req",this);
		// Add user logic here
		#1;
		// User logic ends
		moi_port.write(moi_req);
	end
endtask