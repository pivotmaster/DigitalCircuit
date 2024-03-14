//############################################################################
//   2024 DCS Spring Course
//   Lab02         : Port 2 Port Communication
//   Author        : HsuChiChen (chenneil90121@gmail.com)
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   Date          : 2024.03.13
//   Version       : v2.0
//   File Name     : port2port.cpp
//############################################################################
// moodule1 -> p -> module2 -> p2 -> module3 -> p3 -> checker
// implement the following communication path
// fill the 15 blanks in the code
// Note : module3 use SC_METHOD instead of SC_THREAD and SC_HAS_PROCESS(MODULE3) instead of SC_CTOR(MODULE3)

// moodule1 -> p_checker -> checker
// check the data transfer is correct or not

#include <systemc.h>
#include <string>
using namespace std;

#define SEND_INTERVAL 5
#define SIMULATION_TIME 50
#define CORRECT_COUNT (ceil((float)SIMULATION_TIME / SEND_INTERVAL))

// module1 writes to channel
SC_MODULE(MODULE1) {
    sc_port<sc_signal_out_if<string>> p;
    sc_port<sc_signal_out_if<string>> p_checker;
    SC_CTOR(MODULE1) {
        SC_THREAD(writer);
    }
    void writer() {
        string text = "DCS_Lab02_";
        while (true) {
            // append current simulation time to text
            string write_data = text + to_string((int)sc_time_stamp().to_seconds());
            p_checker->write(write_data);

            // 1. writes to channel through port p
            //================================================================
            p->write(write_data);
            //================================================================
            cout << sc_time_stamp() << ":" << name() << " writes to channel, string =" << write_data << endl;
            wait(SEND_INTERVAL, SC_SEC); // wait for 5 seconds
        }
    }
};

// module2 reads from channel p
// module2 writes to channel p2
SC_MODULE(MODULE2) {
    sc_port<sc_signal_in_if<string>> p;
    sc_port<sc_signal_out_if<string>> p2;
	string data;
    SC_CTOR(MODULE2) {
        SC_THREAD(transfer);
        sensitive << p; // triggered by value p change on the channel
        dont_initialize(); // do not initialize the thread
    }
    void transfer() {
        while (true) {
			this->data = p->read();
            cout << sc_time_stamp() << ":" << name() << " reads from channel, string=" << this->data << endl;
			// 2. writes to channel through port p2
            //================================================================
            p2->write(data);
            //================================================================
			cout << sc_time_stamp() << ":" << name() << " writes to channel, string=" << this->data << endl;
			
            // 3. wait on events in sensitivity list - receives from channel through port
            //================================================================
            wait();
            //================================================================
        }
    }
};

// module3 reads from channel p2
// module3 writes to channel p3
SC_MODULE(MODULE3) {
    sc_port<sc_signal_in_if<string>> p2;

    // 4. define a port for writing to channel p3
    //================================================================
    sc_port<sc_signal_out_if<string>> p3;
    //================================================================
    
    // 5. define a string data;
    //================================================================
    string data;
    //================================================================

    // 6. Use SC_HAS_PROCESS(MODULE3) instead of SC_CTOR(MODULE3)
    //================================================================
    SC_HAS_PROCESS(MODULE3);
    //================================================================
    
    // explicit constructor declaration
    MODULE3(sc_module_name name) : sc_module(name) {
        // 7. Use SC_METHOD instead of SC_THREAD for transfer
        //================================================================
        SC_METHOD(transfer);
        //================================================================

        // 8. trigger by value p2 change on the channel
        //================================================================
        sensitive << p2;
        //================================================================
        
        // 9. do not initialize the thread
        //================================================================
        dont_initialize();
        //================================================================
    }
    
    void transfer() {
        // do not use while loop in SC_METHOD
        // while (true) {
            // 10. read from channel through port and store in this->data
            //================================================================
            this->data = p2->read();
            //================================================================
			cout << sc_time_stamp() << ":" << name() << " reads from channel, string=" << this->data << endl;
            
            // 11. writes to channel through port p3
            //================================================================
            p3->write(data);
            //================================================================
			cout << sc_time_stamp() << ":" << name() << " writes to channel, string=" << this->data << endl;
			
            // do not use wait(); in SC_METHOD
            // 12. wait on events in sensitivity list - receives from channel through port
            //================================================================

            //================================================================
        // }
    }
};

// checker reads from channel p3
SC_MODULE(CHECKER) {
	sc_port<sc_signal_in_if<string>> p3;
	sc_port<sc_signal_in_if<string>> p_checker;
    int correct_count;
    string data;
    string golden_data;
    sc_event e;

	SC_CTOR(CHECKER) {
		SC_THREAD(checker);
        dont_initialize();
        sensitive << p3; // triggered by value change on the channel

        SC_THREAD(receiver);
        dont_initialize();    
		sensitive << e;
	}
	void checker() {
		while (true) {
			this->data = p3->read();
            cout << sc_time_stamp() << ":" << name() << " reads from channel, string=" << this->data << endl;
            e.notify(); // notify event
			wait(); // wait on events in sensitivity list - receives from channel through port
		}
	}

    void receiver() {
        this->correct_count = 0;
        while (true) {
            this->golden_data = p_checker->read();
            if (this->data == this->golden_data) {
                cout << "\033[32m" << "data is correct at time " << sc_time_stamp() << "\033[0m" << endl;
                correct_count++;
            } else {
                cout << "\033[31m" << "data is incorrect at time " << sc_time_stamp() << "\033[0m" << endl;
                cout << "\033[31m" << "data = " << data << " golden_data = " << golden_data << "\033[0m" << endl;
            }
            wait(e);
        }
    }

    ~CHECKER() {
        if(correct_count == CORRECT_COUNT) {
            cout << "\033[32m" << "All data is correct" << "\033[0m" << endl;
            cout << "\033[35m" << "Raise Hand and register your [DCS001 - DCS155] to TA" << "\033[0m" << endl;
        } else {
            cout << "\033[31m" << "Some data is incorrect" << "\033[0m" << endl;
        }
    }
};

int sc_main(int, char *[]) {
    MODULE1 module1("module1"); // instantiate module1
    MODULE2 module2("module2"); // instantiate module2
    MODULE3 module3("module3"); // instantiate module3
	CHECKER checker("checker"); // instantiate checker
    sc_signal<string> s;   // define channel outside module1 and module2
	sc_signal<string> s2;   // define channel outside module2 and module3
	// 13. define channel outside module3 and checker
    //================================================================
    sc_signal<string> s3;
    //================================================================
    sc_signal<string> s_checker; // define channel outside module1 and checker
    module1.p_checker(s_checker); // bind module1's port to channel, for writing purpose
    module1.p(s);               // bind module1's port to channel, for writing purpose
    module2.p(s);               // bind module2's port to channel, for reading purpose
	module2.p2(s2);             // bind module2's port to channel, for writing purpose
    module3.p2(s2);             // bind module3's port to channel, for reading purpose

    // 14. bind module3's port to channel, for writing purpose
    //================================================================      
    module3.p3(s3);
    //================================================================
    // 15. bind checker's port to channel, for reading purpose
    //================================================================
    checker.p3(s3);
    //================================================================

    checker.p_checker(s_checker); // bind checker's port to channel, for reading purpose

    sc_start(SIMULATION_TIME, SC_SEC);     // start simulation with 10 seconds
    return 0;
}