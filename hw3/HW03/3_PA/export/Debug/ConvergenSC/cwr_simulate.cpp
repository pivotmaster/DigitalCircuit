#include <scext/runtime/cwr_simulation.h>
#include <scext/runtime/cwr_optimizer_api.h>
#include <systemc.h>
#include <sysc/kernel/sc_simcontext_int.h>

class cwr_optimizer_impl : public cwr_optimizer_api {
 public:
   cwr_optimizer_impl();
   virtual int get_default_sim_settings();
   virtual int match_schedule(const char*);
   virtual int register_clock(sc_core::sc_clock*, int, int);
   virtual int register_handles(cwr_edge_handles&, int);
   virtual void simulate_init(cwr_simcontext*, sc_core::sc_simcontext*, sc_dt::uint64*);
   virtual snps::sc::phase_callback_fn get_simulate_cb();
 private:
   static cwr_optimizer_impl gAPI;
};

cwr_optimizer_impl::cwr_optimizer_impl() { cwr_optimizer_api::gInstance = &gAPI; }

cwr_optimizer_impl cwr_optimizer_impl::gAPI;

int cwr_optimizer_impl::get_default_sim_settings() { return 0x06; }

int cwr_optimizer_impl::match_schedule(const char* key) {
  return -1;
}



int cwr_optimizer_impl::register_clock(sc_clock* clk, int i, int j) {
  // stub
  return -1;
}

int cwr_optimizer_impl::register_handles(cwr_edge_handles& handles, int i) {
  // stub
  return -1;
}

static cwr_simcontext* cwr_ctx;
static sc_simcontext* sim_ctx;
static uint64* m_cwr_next_time;
static int cwr_prev_duration_0;

void cwr_optimizer_impl::simulate_init(cwr_simcontext* cwr, sc_core::sc_simcontext* sim, sc_dt::uint64* next_time) {
  cwr_ctx = cwr;
  sim_ctx = sim;
  m_cwr_next_time = next_time;
  cwr_prev_duration_0 = -1;
}

void cwr_simulate(void* duration_p) {
  // stub
}

snps::sc::phase_callback_fn cwr_optimizer_impl::get_simulate_cb() { return &cwr_simulate; }
