//***** ***** ***** *****  *****  *****  *****  *****  *****  *****  ***** 
//Auto Generated by UVM-Generator
//Author: Jiacai Yuan
//E-mail: yuan861025184@163.com
//Contents:dut_bus_driver
//***** ***** ***** *****  *****  *****  *****  *****  *****  *****  ***** 
class dut_bus_driver extends uvm_driver#(bus_req,bus_rsp);
	`uvm_component_utils(dut_bus_driver)
	`uvm_register_cb(dut_bus_driver,dut_callback)

	//Config	//Interface
	bus_driver_config drv_cfg;
	virtual dut_bus_inf bus_inf;

	//TLM 
	//default seq_item_port

	//Transaction Sequence item
	bus_req  drv_req;
	bus_rsp  drv_rsp;
	
	//Constructor Function
	function new(string name="dut_bus_driver",uvm_component parent=null);
		super.new(name,parent);
	endfunction
	
	//Phase Methods
	extern virtual function void build_phase(uvm_phase phase);
	extern virtual function void connect_phase(uvm_phase phase);
	extern virtual task run_phase(uvm_phase phase);
	
	//Task Function Methods
	extern task drv_init();
	extern task drv_request();
	
	
	// Add user method here
	//e.g. task function
	// User method ends
endclass

function void dut_bus_driver::build_phase(uvm_phase phase);
	super.build_phase(phase);
	`uvm_info(get_name(),"Build Phase is Called",UVM_LOW)
//	if(!uvm_config_db#(bus_driver_config)::get(this,"","drv_cfg",drv_cfg))
//	begin
//		`uvm_fatal(get_name(),"Failed Get bus Driver Config")
//	end
	
	// Add user build here
	//e.g. TLM build
	// User build ends
endfunction

function void dut_bus_driver::connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	`uvm_info(get_name(),"Connect Phase is Called",UVM_LOW)
	
	// Add user connect here
	//e.g. TLM  interface connect
	// User connect ends
endfunction

task dut_bus_driver::run_phase(uvm_phase phase);
	super.run_phase(phase);
	`uvm_info(get_name(),"Run Phase is Called",UVM_LOW)
	drv_init();
	fork
		drv_request();
		
		// Add user logic here

		// User logic ends
	join
	
	// Add user logic here
	//e.g. task function `uvm_do_callbacks
	// User logic ends	
endtask

task dut_bus_driver::drv_init();
	
	// Add user logic here
	//e.g. initialize interface
	// User logic ends	
endtask

task dut_bus_driver::drv_request();
	forever
	begin
		// Add user logic here
		#1;
		// User logic ends
		seq_item_port.get_next_item(drv_req);
		
		// Add user logic here
		//e.g. drive interface
		// User logic ends
		drv_rsp=bus_rsp::type_id::create("drv_rsp",this);
		// Add user logic here
		//e.g. rsp processse
		// User logic ends
		drv_rsp.set_id_info(drv_req);
		seq_item_port.item_done(drv_rsp);
	end
endtask