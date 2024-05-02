#include "systemc.h"
#include "../ALU_proxy.h"
#include "../Monitor.h"
#include "../Pattern.h"
#include "../clockreset.h"
#include "../decoder.h"
#include "../register_file.h"
#include "cassert"
#include "cwr_dynamic_loader.h"
#include "cwr_sc_dynamic_stubs.h"
#include "cwr_sc_hierarch_module.h"
#include "cwr_sc_object_creator.h"
#include "scmlinc/scml_abstraction_level_switch.h"
#include "scmlinc/scml_property_registry.h"

using namespace conf;
using namespace std;


class ALU0Creator : public ScObjectCreatorBase
{
public:
  static unsigned int creationVerboseMode() {
    const char * const env_var_val = ::getenv("SNPS_SLS_DYNAMIC_CREATION_VERBOSE");
    return env_var_val ? (::atoi(env_var_val)) : 3;
  }
  sc_object* create ( const string& name ) {
    string hierach_name = getHierarchicalName(name);
    string hdlSrcPath = scml_property_registry::inst().getStringProperty(
	      scml_property_registry::CONSTRUCTOR, hierach_name, "hdlSrcPath");

    if (scml_property_registry::inst().hasProperty(scml_property_registry::MODULE, scml_property_registry::BOOL, hierach_name, "runtime_disabled") && 
        scml_property_registry::inst().getBoolProperty(scml_property_registry::MODULE, hierach_name, "runtime_disabled")) {
      sc_module_name n(name.c_str());
      if (creationVerboseMode() >= 6) { std::cout << "ALU/ALU: STUB for " << hierach_name << " created." << std::endl; }
      conf::stub *result = new conf::stub(n);
       conf::stub_port_registrator<>::register_stub_port(&ALU::opcode, "opcode" , string(static_cast<sc_object*>(result)->name()) + ".opcode" );
       conf::stub_port_registrator<>::register_stub_port(&ALU::rs_data, "rs_data" , string(static_cast<sc_object*>(result)->name()) + ".rs_data" );
       conf::stub_port_registrator<>::register_stub_port(&ALU::rt_data, "rt_data" , string(static_cast<sc_object*>(result)->name()) + ".rt_data" );
       conf::stub_port_registrator<>::register_stub_port(&ALU::immediate, "immediate" , string(static_cast<sc_object*>(result)->name()) + ".immediate" );
       conf::stub_port_registrator<>::register_stub_port(&ALU::ALU_out, "ALU_out" , string(static_cast<sc_object*>(result)->name()) + ".ALU_out" );
      return result;
    } else {
      if (creationVerboseMode() >= 6) { std::cout << "ALU/ALU: " << hierach_name << " created." << std::endl; }
      ALU* result = new ALU(name.c_str(), hdlSrcPath.c_str());
       cwr_sc_object_registry::inst().addPort(&result->opcode, string(static_cast<sc_object*>(result)->name()) + ".opcode" );
       cwr_sc_object_registry::inst().addPort(&result->rs_data, string(static_cast<sc_object*>(result)->name()) + ".rs_data" );
       cwr_sc_object_registry::inst().addPort(&result->rt_data, string(static_cast<sc_object*>(result)->name()) + ".rt_data" );
       cwr_sc_object_registry::inst().addPort(&result->immediate, string(static_cast<sc_object*>(result)->name()) + ".immediate" );
       cwr_sc_object_registry::inst().addPort(&result->ALU_out, string(static_cast<sc_object*>(result)->name()) + ".ALU_out" );
      return result;
    }
  }
};


class Clock0Creator : public ScObjectCreatorBase
{
public:
  static unsigned int creationVerboseMode() {
    const char * const env_var_val = ::getenv("SNPS_SLS_DYNAMIC_CREATION_VERBOSE");
    return env_var_val ? (::atoi(env_var_val)) : 3;
  }
  sc_object* create ( const string& name ) {
    string hierach_name = getHierarchicalName(name);
    int division = scml_property_registry::inst().getIntProperty(
	      scml_property_registry::CONSTRUCTOR, hierach_name, "division");

    int cycle = scml_property_registry::inst().getIntProperty(
	      scml_property_registry::CONSTRUCTOR, hierach_name, "cycle");

    if (scml_property_registry::inst().hasProperty(scml_property_registry::MODULE, scml_property_registry::BOOL, hierach_name, "runtime_disabled") && 
        scml_property_registry::inst().getBoolProperty(scml_property_registry::MODULE, hierach_name, "runtime_disabled")) {
      sc_module_name n(name.c_str());
      if (creationVerboseMode() >= 6) { std::cout << "Clock/Clock: STUB for " << hierach_name << " created." << std::endl; }
      conf::stub *result = new conf::stub(n);
       conf::stub_port_registrator<>::register_stub_port(&Clock::clk, "clk" , string(static_cast<sc_object*>(result)->name()) + ".clk" );
      return result;
    } else {
      if (creationVerboseMode() >= 6) { std::cout << "Clock/Clock: " << hierach_name << " created." << std::endl; }
      Clock* result = new Clock(name.c_str(), division, cycle);
       cwr_sc_object_registry::inst().addPort(&result->clk, string(static_cast<sc_object*>(result)->name()) + ".clk" );
      return result;
    }
  }
};

template <class BC>
class BusCreator : public ScObjectCreatorBase
{
  sc_object* create (const string& name) {
    ScGeneratedBaseBlockCreatorHelper helper(getHierarchicalName(name));
    if (helper.is_runtime_disabled()) {
      return new conf::StubBusCreator(name.c_str(), helper);
    } else {
      return new BC(name.c_str(), helper);
    }
  }
};

template <class GBC>
class GeneratedBlockCreator : public ScObjectCreatorBase
{
  sc_object* create (const string& name) {
    ScGeneratedBaseBlockCreatorHelper helper(getHierarchicalName(name));
    if (helper.is_runtime_disabled()) {
      return new conf::StubBusCreator(name.c_str(), helper);
    } else {
      return new GBC(name.c_str(), helper);
    }
  }
};



class Monitor0Creator : public ScObjectCreatorBase
{
public:
  static unsigned int creationVerboseMode() {
    const char * const env_var_val = ::getenv("SNPS_SLS_DYNAMIC_CREATION_VERBOSE");
    return env_var_val ? (::atoi(env_var_val)) : 3;
  }
  sc_object* create ( const string& name ) {
    string hierach_name = getHierarchicalName(name);
    if (scml_property_registry::inst().hasProperty(scml_property_registry::MODULE, scml_property_registry::BOOL, hierach_name, "runtime_disabled") && 
        scml_property_registry::inst().getBoolProperty(scml_property_registry::MODULE, hierach_name, "runtime_disabled")) {
      sc_module_name n(name.c_str());
      if (creationVerboseMode() >= 6) { std::cout << "Monitor/Monitor: STUB for " << hierach_name << " created." << std::endl; }
      conf::stub *result = new conf::stub(n);
       conf::stub_port_registrator<>::register_stub_port(&Monitor::clock, "clock" , string(static_cast<sc_object*>(result)->name()) + ".clock" );
       conf::stub_port_registrator<>::register_stub_port(&Monitor::ALU_out, "ALU_out" , string(static_cast<sc_object*>(result)->name()) + ".ALU_out" );
       conf::stub_port_registrator<>::register_stub_port(&Monitor::golden_ALU_out, "golden_ALU_out" , string(static_cast<sc_object*>(result)->name()) + ".golden_ALU_out" );
       conf::stub_port_registrator<>::register_stub_port(&Monitor::immediate, "immediate" , string(static_cast<sc_object*>(result)->name()) + ".immediate" );
       conf::stub_port_registrator<>::register_stub_port(&Monitor::golden_immediate, "golden_immediate" , string(static_cast<sc_object*>(result)->name()) + ".golden_immediate" );
      return result;
    } else {
      if (creationVerboseMode() >= 6) { std::cout << "Monitor/Monitor: " << hierach_name << " created." << std::endl; }
      Monitor* result = new Monitor(name.c_str());
       cwr_sc_object_registry::inst().addPort(&result->clock, string(static_cast<sc_object*>(result)->name()) + ".clock" );
       cwr_sc_object_registry::inst().addPort(&result->ALU_out, string(static_cast<sc_object*>(result)->name()) + ".ALU_out" );
       cwr_sc_object_registry::inst().addPort(&result->golden_ALU_out, string(static_cast<sc_object*>(result)->name()) + ".golden_ALU_out" );
       cwr_sc_object_registry::inst().addPort(&result->immediate, string(static_cast<sc_object*>(result)->name()) + ".immediate" );
       cwr_sc_object_registry::inst().addPort(&result->golden_immediate, string(static_cast<sc_object*>(result)->name()) + ".golden_immediate" );
      return result;
    }
  }
};


class Pattern0Creator : public ScObjectCreatorBase
{
public:
  static unsigned int creationVerboseMode() {
    const char * const env_var_val = ::getenv("SNPS_SLS_DYNAMIC_CREATION_VERBOSE");
    return env_var_val ? (::atoi(env_var_val)) : 3;
  }
  sc_object* create ( const string& name ) {
    string hierach_name = getHierarchicalName(name);
    if (scml_property_registry::inst().hasProperty(scml_property_registry::MODULE, scml_property_registry::BOOL, hierach_name, "runtime_disabled") && 
        scml_property_registry::inst().getBoolProperty(scml_property_registry::MODULE, hierach_name, "runtime_disabled")) {
      sc_module_name n(name.c_str());
      if (creationVerboseMode() >= 6) { std::cout << "Pattern/Pattern: STUB for " << hierach_name << " created." << std::endl; }
      conf::stub *result = new conf::stub(n);
       conf::stub_port_registrator<>::register_stub_port(&Pattern::clock, "clock" , string(static_cast<sc_object*>(result)->name()) + ".clock" );
       conf::stub_port_registrator<>::register_stub_port(&Pattern::reset, "reset" , string(static_cast<sc_object*>(result)->name()) + ".reset" );
       conf::stub_port_registrator<>::register_stub_port(&Pattern::instruction, "instruction" , string(static_cast<sc_object*>(result)->name()) + ".instruction" );
       conf::stub_port_registrator<>::register_stub_port(&Pattern::golden_ALU_out, "golden_ALU_out" , string(static_cast<sc_object*>(result)->name()) + ".golden_ALU_out" );
       conf::stub_port_registrator<>::register_stub_port(&Pattern::golden_immediate, "golden_immediate" , string(static_cast<sc_object*>(result)->name()) + ".golden_immediate" );
      return result;
    } else {
      if (creationVerboseMode() >= 6) { std::cout << "Pattern/Pattern: " << hierach_name << " created." << std::endl; }
      Pattern* result = new Pattern(name.c_str());
       cwr_sc_object_registry::inst().addPort(&result->clock, string(static_cast<sc_object*>(result)->name()) + ".clock" );
       cwr_sc_object_registry::inst().addPort(&result->reset, string(static_cast<sc_object*>(result)->name()) + ".reset" );
       cwr_sc_object_registry::inst().addPort(&result->instruction, string(static_cast<sc_object*>(result)->name()) + ".instruction" );
       cwr_sc_object_registry::inst().addPort(&result->golden_ALU_out, string(static_cast<sc_object*>(result)->name()) + ".golden_ALU_out" );
       cwr_sc_object_registry::inst().addPort(&result->golden_immediate, string(static_cast<sc_object*>(result)->name()) + ".golden_immediate" );
      return result;
    }
  }
};


class Reset0Creator : public ScObjectCreatorBase
{
public:
  static unsigned int creationVerboseMode() {
    const char * const env_var_val = ::getenv("SNPS_SLS_DYNAMIC_CREATION_VERBOSE");
    return env_var_val ? (::atoi(env_var_val)) : 3;
  }
  sc_object* create ( const string& name ) {
    string hierach_name = getHierarchicalName(name);
    int _ticks = scml_property_registry::inst().getIntProperty(
	      scml_property_registry::CONSTRUCTOR, hierach_name, "_ticks");

    if (scml_property_registry::inst().hasProperty(scml_property_registry::MODULE, scml_property_registry::BOOL, hierach_name, "runtime_disabled") && 
        scml_property_registry::inst().getBoolProperty(scml_property_registry::MODULE, hierach_name, "runtime_disabled")) {
      sc_module_name n(name.c_str());
      if (creationVerboseMode() >= 6) { std::cout << "Reset/Reset: STUB for " << hierach_name << " created." << std::endl; }
      conf::stub *result = new conf::stub(n);
       conf::stub_port_registrator<>::register_stub_port(&Reset::rst, "rst" , string(static_cast<sc_object*>(result)->name()) + ".rst" );
      return result;
    } else {
      if (creationVerboseMode() >= 6) { std::cout << "Reset/Reset: " << hierach_name << " created." << std::endl; }
      Reset* result = new Reset(name.c_str(), _ticks);
       cwr_sc_object_registry::inst().addPort(&result->rst, string(static_cast<sc_object*>(result)->name()) + ".rst" );
      return result;
    }
  }
};


class decoder0Creator : public ScObjectCreatorBase
{
public:
  static unsigned int creationVerboseMode() {
    const char * const env_var_val = ::getenv("SNPS_SLS_DYNAMIC_CREATION_VERBOSE");
    return env_var_val ? (::atoi(env_var_val)) : 3;
  }
  sc_object* create ( const string& name ) {
    string hierach_name = getHierarchicalName(name);
    if (scml_property_registry::inst().hasProperty(scml_property_registry::MODULE, scml_property_registry::BOOL, hierach_name, "runtime_disabled") && 
        scml_property_registry::inst().getBoolProperty(scml_property_registry::MODULE, hierach_name, "runtime_disabled")) {
      sc_module_name n(name.c_str());
      if (creationVerboseMode() >= 6) { std::cout << "decoder/decoder: STUB for " << hierach_name << " created." << std::endl; }
      conf::stub *result = new conf::stub(n);
       conf::stub_port_registrator<>::register_stub_port(&decoder::instruction, "instruction" , string(static_cast<sc_object*>(result)->name()) + ".instruction" );
       conf::stub_port_registrator<>::register_stub_port(&decoder::opcode, "opcode" , string(static_cast<sc_object*>(result)->name()) + ".opcode" );
       conf::stub_port_registrator<>::register_stub_port(&decoder::rs, "rs" , string(static_cast<sc_object*>(result)->name()) + ".rs" );
       conf::stub_port_registrator<>::register_stub_port(&decoder::rt, "rt" , string(static_cast<sc_object*>(result)->name()) + ".rt" );
       conf::stub_port_registrator<>::register_stub_port(&decoder::immediate, "immediate" , string(static_cast<sc_object*>(result)->name()) + ".immediate" );
      return result;
    } else {
      if (creationVerboseMode() >= 6) { std::cout << "decoder/decoder: " << hierach_name << " created." << std::endl; }
      decoder* result = new decoder(name.c_str());
       cwr_sc_object_registry::inst().addPort(&result->instruction, string(static_cast<sc_object*>(result)->name()) + ".instruction" );
       cwr_sc_object_registry::inst().addPort(&result->opcode, string(static_cast<sc_object*>(result)->name()) + ".opcode" );
       cwr_sc_object_registry::inst().addPort(&result->rs, string(static_cast<sc_object*>(result)->name()) + ".rs" );
       cwr_sc_object_registry::inst().addPort(&result->rt, string(static_cast<sc_object*>(result)->name()) + ".rt" );
       cwr_sc_object_registry::inst().addPort(&result->immediate, string(static_cast<sc_object*>(result)->name()) + ".immediate" );
      return result;
    }
  }
};


class register_file0Creator : public ScObjectCreatorBase
{
public:
  static unsigned int creationVerboseMode() {
    const char * const env_var_val = ::getenv("SNPS_SLS_DYNAMIC_CREATION_VERBOSE");
    return env_var_val ? (::atoi(env_var_val)) : 3;
  }
  sc_object* create ( const string& name ) {
    string hierach_name = getHierarchicalName(name);
    if (scml_property_registry::inst().hasProperty(scml_property_registry::MODULE, scml_property_registry::BOOL, hierach_name, "runtime_disabled") && 
        scml_property_registry::inst().getBoolProperty(scml_property_registry::MODULE, hierach_name, "runtime_disabled")) {
      sc_module_name n(name.c_str());
      if (creationVerboseMode() >= 6) { std::cout << "register_file/register_file: STUB for " << hierach_name << " created." << std::endl; }
      conf::stub *result = new conf::stub(n);
       conf::stub_port_registrator<>::register_stub_port(&register_file::read_reg1, "read_reg1" , string(static_cast<sc_object*>(result)->name()) + ".read_reg1" );
       conf::stub_port_registrator<>::register_stub_port(&register_file::read_reg2, "read_reg2" , string(static_cast<sc_object*>(result)->name()) + ".read_reg2" );
       conf::stub_port_registrator<>::register_stub_port(&register_file::read_data1, "read_data1" , string(static_cast<sc_object*>(result)->name()) + ".read_data1" );
       conf::stub_port_registrator<>::register_stub_port(&register_file::read_data2, "read_data2" , string(static_cast<sc_object*>(result)->name()) + ".read_data2" );
      return result;
    } else {
      if (creationVerboseMode() >= 6) { std::cout << "register_file/register_file: " << hierach_name << " created." << std::endl; }
      register_file* result = new register_file(name.c_str());
       cwr_sc_object_registry::inst().addPort(&result->read_reg1, string(static_cast<sc_object*>(result)->name()) + ".read_reg1" );
       cwr_sc_object_registry::inst().addPort(&result->read_reg2, string(static_cast<sc_object*>(result)->name()) + ".read_reg2" );
       cwr_sc_object_registry::inst().addPort(&result->read_data1, string(static_cast<sc_object*>(result)->name()) + ".read_data1" );
       cwr_sc_object_registry::inst().addPort(&result->read_data2, string(static_cast<sc_object*>(result)->name()) + ".read_data2" );
      return result;
    }
  }
};



extern void scv_tr_cwrdb_init();

int sc_main(int argc, char* argv[])
{
  scv_tr_cwrdb_init();
  ScObjectFactory::inst().addCreator ("ALU0", new ALU0Creator());
  ScObjectFactory::inst().addCreator ("Clock0", new Clock0Creator());
  ScObjectFactory::inst().addCreator ("Monitor0", new Monitor0Creator());
  ScObjectFactory::inst().addCreator ("Pattern0", new Pattern0Creator());
  ScObjectFactory::inst().addCreator ("Reset0", new Reset0Creator());
  ScObjectFactory::inst().addCreator ("decoder0", new decoder0Creator());
  ScObjectFactory::inst().addCreator ("register_file0", new register_file0Creator());
  ScObjectFactory::inst().addCreator ("sc_signal<bool>", new ScPrimChannelCreator<sc_signal<bool> >());
  ScObjectFactory::inst().addCreator ("sc_signal<sc_uint<16> >", new ScPrimChannelCreator<sc_signal<sc_uint<16> > >());
  ScObjectFactory::inst().addCreator ("sc_signal<sc_uint<3> >", new ScPrimChannelCreator<sc_signal<sc_uint<3> > >());
  ScObjectFactory::inst().addCreator ("sc_signal<sc_uint<4> >", new ScPrimChannelCreator<sc_signal<sc_uint<4> > >());
  ScObjectFactory::inst().addCreator ("sc_signal<sc_uint<5> >", new ScPrimChannelCreator<sc_signal<sc_uint<5> > >());
  ScPortFactory::inst().addCreator ("sc_in<bool>", new ScPortCreator<sc_in<bool> >());
  ScPortFactory::inst().addCreator ("sc_in<sc_uint<16> >", new ScPortCreator<sc_in<sc_uint<16> > >());
  ScPortFactory::inst().addCreator ("sc_in<sc_uint<3> >", new ScPortCreator<sc_in<sc_uint<3> > >());
  ScPortFactory::inst().addCreator ("sc_in<sc_uint<4> >", new ScPortCreator<sc_in<sc_uint<4> > >());
  ScPortFactory::inst().addCreator ("sc_in<sc_uint<5> >", new ScPortCreator<sc_in<sc_uint<5> > >());
  ScPortFactory::inst().addCreator ("sc_inout<bool>", new ScPortCreator<sc_inout<bool> >());
  ScPortFactory::inst().addCreator ("sc_inout<sc_uint<16> >", new ScPortCreator<sc_inout<sc_uint<16> > >());
  ScPortFactory::inst().addCreator ("sc_inout<sc_uint<3> >", new ScPortCreator<sc_inout<sc_uint<3> > >());
  ScPortFactory::inst().addCreator ("sc_inout<sc_uint<4> >", new ScPortCreator<sc_inout<sc_uint<4> > >());
  ScPortFactory::inst().addCreator ("sc_inout<sc_uint<5> >", new ScPortCreator<sc_inout<sc_uint<5> > >());
  ScPortFactory::inst().addCreator ("sc_out<bool>", new ScPortCreator<sc_out<bool> >());
  ScPortFactory::inst().addCreator ("sc_out<sc_uint<16> >", new ScPortCreator<sc_out<sc_uint<16> > >());
  ScPortFactory::inst().addCreator ("sc_out<sc_uint<3> >", new ScPortCreator<sc_out<sc_uint<3> > >());
  ScPortFactory::inst().addCreator ("sc_out<sc_uint<4> >", new ScPortCreator<sc_out<sc_uint<4> > >());
  ScPortFactory::inst().addCreator ("sc_out<sc_uint<5> >", new ScPortCreator<sc_out<sc_uint<5> > >());
  if (::getenv("SNPS_SLS_DYNAMIC_LOADER_VERBOSE")) { std::cout << "ALU/ALU loaded." << std::endl; }
  if (::getenv("SNPS_SLS_DYNAMIC_LOADER_VERBOSE")) { std::cout << "Clock/Clock loaded." << std::endl; }
  if (::getenv("SNPS_SLS_DYNAMIC_LOADER_VERBOSE")) { std::cout << "Monitor/Monitor loaded." << std::endl; }
  if (::getenv("SNPS_SLS_DYNAMIC_LOADER_VERBOSE")) { std::cout << "Pattern/Pattern loaded." << std::endl; }
  if (::getenv("SNPS_SLS_DYNAMIC_LOADER_VERBOSE")) { std::cout << "Reset/Reset loaded." << std::endl; }
  if (::getenv("SNPS_SLS_DYNAMIC_LOADER_VERBOSE")) { std::cout << "decoder/decoder loaded." << std::endl; }
  if (::getenv("SNPS_SLS_DYNAMIC_LOADER_VERBOSE")) { std::cout << "register_file/register_file loaded." << std::endl; }

  scml_property_registry::inst().setXMLFile("Properties.xml");

  nSnps::nDynamicLoading::DynamicLoader dynamicLoader
    (scml_property_registry::inst().getStringProperty(scml_property_registry::GLOBAL, "", "/pct/runtime/dynamic_load_info"));

  string xml_file_path = scml_property_registry::inst().getPropertyXmlFilePath();
  string hierarchy_xml_file = xml_file_path + "/" + 
    scml_property_registry::inst().getStringProperty(
      scml_property_registry::GLOBAL, "", "system_hierarchy_xml_file");

  unique_ptr<cwr_sc_hierarch_module> HARDWARE ( new cwr_sc_hierarch_module("HARDWARE", hierarchy_xml_file));

  // Enable/disable backdoor accesses
  scml_abstraction_level_switch::instance().set_simulation_mode(scml_property_registry::inst().getStringProperty(scml_property_registry::GLOBAL, "", "/pct/runtime/simulation_mode")=="MODE_FULL_SIMULATION" ? scml_abstraction_level_switch::MODE_FULL_SIMULATION : scml_abstraction_level_switch::MODE_SPEED_OPTIMIZED);

  try {
    sc_start();
  } catch (const sc_core::sc_report& sce) { 
    std::cout << "Exception raised by sc_start() : " << sce.what() << std::endl;  
    return 1;  
  } 

  if (sc_is_running()) {
    sc_stop();
  }

  return 0;
}
