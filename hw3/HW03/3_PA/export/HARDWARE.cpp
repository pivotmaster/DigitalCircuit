#include "systemc.h"
#include "../PATTERN_proxy.h"
#include "../huffman_proxy.h"
#include "../sort.h"
#include "cassert"
#include "cwr_dynamic_loader.h"
#include "cwr_sc_dynamic_stubs.h"
#include "cwr_sc_hierarch_module.h"
#include "cwr_sc_object_creator.h"
#include "scmlinc/scml_abstraction_level_switch.h"
#include "scmlinc/scml_property_registry.h"

using namespace conf;
using namespace std;

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



class PATTERN0Creator : public ScObjectCreatorBase
{
public:
  static unsigned int creationVerboseMode() {
    const char * const env_var_val = ::getenv("SNPS_SLS_DYNAMIC_CREATION_VERBOSE");
    return env_var_val ? (::atoi(env_var_val)) : 3;
  }
  sc_object* create ( const string& name ) {
    string hierach_name = getHierarchicalName(name);
    int CYCLE = scml_property_registry::inst().getIntProperty(
	      scml_property_registry::CONSTRUCTOR, hierach_name, "CYCLE");

    int MAX_LATENCY = scml_property_registry::inst().getIntProperty(
	      scml_property_registry::CONSTRUCTOR, hierach_name, "MAX_LATENCY");

    string hdlSrcPath = scml_property_registry::inst().getStringProperty(
	      scml_property_registry::CONSTRUCTOR, hierach_name, "hdlSrcPath");

    if (scml_property_registry::inst().hasProperty(scml_property_registry::MODULE, scml_property_registry::BOOL, hierach_name, "runtime_disabled") && 
        scml_property_registry::inst().getBoolProperty(scml_property_registry::MODULE, hierach_name, "runtime_disabled")) {
      sc_module_name n(name.c_str());
      if (creationVerboseMode() >= 6) { std::cout << "PATTERN/PATTERN: STUB for " << hierach_name << " created." << std::endl; }
      conf::stub *result = new conf::stub(n);
       conf::stub_port_registrator<>::register_stub_port(&PATTERN::clk, "clk" , string(static_cast<sc_object*>(result)->name()) + ".clk" );
       conf::stub_port_registrator<>::register_stub_port(&PATTERN::reset, "reset" , string(static_cast<sc_object*>(result)->name()) + ".reset" );
       conf::stub_port_registrator<>::register_stub_port(&PATTERN::gray_data, "gray_data" , string(static_cast<sc_object*>(result)->name()) + ".gray_data" );
       conf::stub_port_registrator<>::register_stub_port(&PATTERN::gray_valid, "gray_valid" , string(static_cast<sc_object*>(result)->name()) + ".gray_valid" );
       conf::stub_port_registrator<>::register_stub_port(&PATTERN::CNT, "CNT" , string(static_cast<sc_object*>(result)->name()) + ".CNT" );
       conf::stub_port_registrator<>::register_stub_port(&PATTERN::CNT_valid, "CNT_valid" , string(static_cast<sc_object*>(result)->name()) + ".CNT_valid" );
       conf::stub_port_registrator<>::register_stub_port(&PATTERN::HC, "HC" , string(static_cast<sc_object*>(result)->name()) + ".HC" );
       conf::stub_port_registrator<>::register_stub_port(&PATTERN::M, "M" , string(static_cast<sc_object*>(result)->name()) + ".M" );
       conf::stub_port_registrator<>::register_stub_port(&PATTERN::code_valid, "code_valid" , string(static_cast<sc_object*>(result)->name()) + ".code_valid" );
      return result;
    } else {
      if (creationVerboseMode() >= 6) { std::cout << "PATTERN/PATTERN: " << hierach_name << " created." << std::endl; }
      PATTERN* result = new PATTERN(name.c_str(), CYCLE, MAX_LATENCY, hdlSrcPath.c_str());
       cwr_sc_object_registry::inst().addPort(&result->clk, string(static_cast<sc_object*>(result)->name()) + ".clk" );
       cwr_sc_object_registry::inst().addPort(&result->reset, string(static_cast<sc_object*>(result)->name()) + ".reset" );
       cwr_sc_object_registry::inst().addPort(&result->gray_data, string(static_cast<sc_object*>(result)->name()) + ".gray_data" );
       cwr_sc_object_registry::inst().addPort(&result->gray_valid, string(static_cast<sc_object*>(result)->name()) + ".gray_valid" );
       cwr_sc_object_registry::inst().addPort(&result->CNT, string(static_cast<sc_object*>(result)->name()) + ".CNT" );
       cwr_sc_object_registry::inst().addPort(&result->CNT_valid, string(static_cast<sc_object*>(result)->name()) + ".CNT_valid" );
       cwr_sc_object_registry::inst().addPort(&result->HC, string(static_cast<sc_object*>(result)->name()) + ".HC" );
       cwr_sc_object_registry::inst().addPort(&result->M, string(static_cast<sc_object*>(result)->name()) + ".M" );
       cwr_sc_object_registry::inst().addPort(&result->code_valid, string(static_cast<sc_object*>(result)->name()) + ".code_valid" );
      return result;
    }
  }
};


class huffman0Creator : public ScObjectCreatorBase
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
      if (creationVerboseMode() >= 6) { std::cout << "huffman/huffman: STUB for " << hierach_name << " created." << std::endl; }
      conf::stub *result = new conf::stub(n);
       conf::stub_port_registrator<>::register_stub_port(&huffman::clk, "clk" , string(static_cast<sc_object*>(result)->name()) + ".clk" );
       conf::stub_port_registrator<>::register_stub_port(&huffman::reset, "reset" , string(static_cast<sc_object*>(result)->name()) + ".reset" );
       conf::stub_port_registrator<>::register_stub_port(&huffman::gray_valid, "gray_valid" , string(static_cast<sc_object*>(result)->name()) + ".gray_valid" );
       conf::stub_port_registrator<>::register_stub_port(&huffman::gray_data, "gray_data" , string(static_cast<sc_object*>(result)->name()) + ".gray_data" );
       conf::stub_port_registrator<>::register_stub_port(&huffman::CNT_valid, "CNT_valid" , string(static_cast<sc_object*>(result)->name()) + ".CNT_valid" );
       conf::stub_port_registrator<>::register_stub_port(&huffman::CNT, "CNT" , string(static_cast<sc_object*>(result)->name()) + ".CNT" );
       conf::stub_port_registrator<>::register_stub_port(&huffman::code_valid, "code_valid" , string(static_cast<sc_object*>(result)->name()) + ".code_valid" );
       conf::stub_port_registrator<>::register_stub_port(&huffman::HC, "HC" , string(static_cast<sc_object*>(result)->name()) + ".HC" );
       conf::stub_port_registrator<>::register_stub_port(&huffman::M, "M" , string(static_cast<sc_object*>(result)->name()) + ".M" );
       conf::stub_port_registrator<>::register_stub_port(&huffman::in_Aid_all, "in_Aid_all" , string(static_cast<sc_object*>(result)->name()) + ".in_Aid_all" );
       conf::stub_port_registrator<>::register_stub_port(&huffman::in_CNT_all, "in_CNT_all" , string(static_cast<sc_object*>(result)->name()) + ".in_CNT_all" );
       conf::stub_port_registrator<>::register_stub_port(&huffman::out_Aid_all, "out_Aid_all" , string(static_cast<sc_object*>(result)->name()) + ".out_Aid_all" );
       conf::stub_port_registrator<>::register_stub_port(&huffman::out_CNT_all, "out_CNT_all" , string(static_cast<sc_object*>(result)->name()) + ".out_CNT_all" );
      return result;
    } else {
      if (creationVerboseMode() >= 6) { std::cout << "huffman/huffman: " << hierach_name << " created." << std::endl; }
      huffman* result = new huffman(name.c_str(), hdlSrcPath.c_str());
       cwr_sc_object_registry::inst().addPort(&result->clk, string(static_cast<sc_object*>(result)->name()) + ".clk" );
       cwr_sc_object_registry::inst().addPort(&result->reset, string(static_cast<sc_object*>(result)->name()) + ".reset" );
       cwr_sc_object_registry::inst().addPort(&result->gray_valid, string(static_cast<sc_object*>(result)->name()) + ".gray_valid" );
       cwr_sc_object_registry::inst().addPort(&result->gray_data, string(static_cast<sc_object*>(result)->name()) + ".gray_data" );
       cwr_sc_object_registry::inst().addPort(&result->CNT_valid, string(static_cast<sc_object*>(result)->name()) + ".CNT_valid" );
       cwr_sc_object_registry::inst().addPort(&result->CNT, string(static_cast<sc_object*>(result)->name()) + ".CNT" );
       cwr_sc_object_registry::inst().addPort(&result->code_valid, string(static_cast<sc_object*>(result)->name()) + ".code_valid" );
       cwr_sc_object_registry::inst().addPort(&result->HC, string(static_cast<sc_object*>(result)->name()) + ".HC" );
       cwr_sc_object_registry::inst().addPort(&result->M, string(static_cast<sc_object*>(result)->name()) + ".M" );
       cwr_sc_object_registry::inst().addPort(&result->in_Aid_all, string(static_cast<sc_object*>(result)->name()) + ".in_Aid_all" );
       cwr_sc_object_registry::inst().addPort(&result->in_CNT_all, string(static_cast<sc_object*>(result)->name()) + ".in_CNT_all" );
       cwr_sc_object_registry::inst().addPort(&result->out_Aid_all, string(static_cast<sc_object*>(result)->name()) + ".out_Aid_all" );
       cwr_sc_object_registry::inst().addPort(&result->out_CNT_all, string(static_cast<sc_object*>(result)->name()) + ".out_CNT_all" );
      return result;
    }
  }
};


class stable_sort_6_value0Creator : public ScObjectCreatorBase
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
      if (creationVerboseMode() >= 6) { std::cout << "stable_sort_6_value/stable_sort_6_value: STUB for " << hierach_name << " created." << std::endl; }
      conf::stub *result = new conf::stub(n);
       conf::stub_port_registrator<>::register_stub_port(&stable_sort_6_value::in_Aid_all, "in_Aid_all" , string(static_cast<sc_object*>(result)->name()) + ".in_Aid_all" );
       conf::stub_port_registrator<>::register_stub_port(&stable_sort_6_value::in_CNT_all, "in_CNT_all" , string(static_cast<sc_object*>(result)->name()) + ".in_CNT_all" );
       conf::stub_port_registrator<>::register_stub_port(&stable_sort_6_value::out_Aid_all, "out_Aid_all" , string(static_cast<sc_object*>(result)->name()) + ".out_Aid_all" );
       conf::stub_port_registrator<>::register_stub_port(&stable_sort_6_value::out_CNT_all, "out_CNT_all" , string(static_cast<sc_object*>(result)->name()) + ".out_CNT_all" );
      return result;
    } else {
      if (creationVerboseMode() >= 6) { std::cout << "stable_sort_6_value/stable_sort_6_value: " << hierach_name << " created." << std::endl; }
      stable_sort_6_value* result = new stable_sort_6_value(name.c_str());
       cwr_sc_object_registry::inst().addPort(&result->in_Aid_all, string(static_cast<sc_object*>(result)->name()) + ".in_Aid_all" );
       cwr_sc_object_registry::inst().addPort(&result->in_CNT_all, string(static_cast<sc_object*>(result)->name()) + ".in_CNT_all" );
       cwr_sc_object_registry::inst().addPort(&result->out_Aid_all, string(static_cast<sc_object*>(result)->name()) + ".out_Aid_all" );
       cwr_sc_object_registry::inst().addPort(&result->out_CNT_all, string(static_cast<sc_object*>(result)->name()) + ".out_CNT_all" );
      return result;
    }
  }
};



extern void scv_tr_cwrdb_init();

int sc_main(int argc, char* argv[])
{
  scv_tr_cwrdb_init();
  ScObjectFactory::inst().addCreator ("PATTERN0", new PATTERN0Creator());
  ScObjectFactory::inst().addCreator ("huffman0", new huffman0Creator());
  ScObjectFactory::inst().addCreator ("sc_signal<bool>", new ScPrimChannelCreator<sc_signal<bool> >());
  ScObjectFactory::inst().addCreator ("sc_signal<sc_uint<48> >", new ScPrimChannelCreator<sc_signal<sc_uint<48> > >());
  ScObjectFactory::inst().addCreator ("sc_signal<sc_uint<8> >", new ScPrimChannelCreator<sc_signal<sc_uint<8> > >());
  ScObjectFactory::inst().addCreator ("stable_sort_6_value0", new stable_sort_6_value0Creator());
  ScPortFactory::inst().addCreator ("sc_in<bool>", new ScPortCreator<sc_in<bool> >());
  ScPortFactory::inst().addCreator ("sc_in<sc_uint<48> >", new ScPortCreator<sc_in<sc_uint<48> > >());
  ScPortFactory::inst().addCreator ("sc_in<sc_uint<8> >", new ScPortCreator<sc_in<sc_uint<8> > >());
  ScPortFactory::inst().addCreator ("sc_inout<bool>", new ScPortCreator<sc_inout<bool> >());
  ScPortFactory::inst().addCreator ("sc_inout<sc_uint<48> >", new ScPortCreator<sc_inout<sc_uint<48> > >());
  ScPortFactory::inst().addCreator ("sc_inout<sc_uint<8> >", new ScPortCreator<sc_inout<sc_uint<8> > >());
  ScPortFactory::inst().addCreator ("sc_out<bool>", new ScPortCreator<sc_out<bool> >());
  ScPortFactory::inst().addCreator ("sc_out<sc_uint<48> >", new ScPortCreator<sc_out<sc_uint<48> > >());
  ScPortFactory::inst().addCreator ("sc_out<sc_uint<8> >", new ScPortCreator<sc_out<sc_uint<8> > >());
  if (::getenv("SNPS_SLS_DYNAMIC_LOADER_VERBOSE")) { std::cout << "PATTERN/PATTERN loaded." << std::endl; }
  if (::getenv("SNPS_SLS_DYNAMIC_LOADER_VERBOSE")) { std::cout << "huffman/huffman loaded." << std::endl; }
  if (::getenv("SNPS_SLS_DYNAMIC_LOADER_VERBOSE")) { std::cout << "stable_sort_6_value/stable_sort_6_value loaded." << std::endl; }

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
