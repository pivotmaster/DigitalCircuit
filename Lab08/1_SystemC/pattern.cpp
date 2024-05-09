#include "pattern.h"

// ANSI escape codes for color
#define GREEN_TEXT "\033[32m"
#define RED_TEXT "\033[31m"
#define RESET_TEXT "\033[0m"

// Method to parse input signals
void pattern::input_pattern() {
    for (int i = 0; i < 6; i++) {
        in_Aid[i] = rand() % 16;
        in_CNT[i] = rand() % 101;
        for (int j = 0; j < 6; j++) {
            while (in_Aid[i] == in_Aid[j] && i != j) {
                in_Aid[i] = rand() % 16;
            }
        }
    }
    // test
    //  in_CNT[3] = in_CNT[2];

    temp_A = (in_Aid[5], in_Aid[4], in_Aid[3], in_Aid[2], in_Aid[1], in_Aid[0]);
    temp_C = (in_CNT[5], in_CNT[4], in_CNT[3], in_CNT[2], in_CNT[1], in_CNT[0]);
    in_Aid_all.write(
        (in_Aid[5], in_Aid[4], in_Aid[3], in_Aid[2], in_Aid[1], in_Aid[0]));
    in_CNT_all.write(
        (in_CNT[5], in_CNT[4], in_CNT[3], in_CNT[2], in_CNT[1], in_CNT[0]));

    // cout << "in_AId_all = " << temp_A << endl;
    // cout << "in_CNT_all = " << temp_C << endl;
    // cout << "temp = " << temp << endl;
}

void pattern::output_pattern() {
    // golden
    sc_uint<48> sorted_Aid = in_Aid_all.read();
    sc_uint<48> sorted_CNT = in_CNT_all.read();

    // Perform stable sort (e.g., bubble sort)
    for (int i = 0; i < 6; ++i) {
        for (int j = 0; j < 6 - i - 1; ++j) {
            if (sorted_CNT.range(j * 8 + 7, j * 8).to_uint() >
                sorted_CNT.range((j + 1) * 8 + 7, (j + 1) * 8).to_uint()) {
                // Swap values
                sc_uint<48> temp_Aid =
                    sorted_Aid.range((j + 1) * 8 + 7, (j + 1) * 8);
                sc_uint<48> temp_CNT =
                    sorted_CNT.range((j + 1) * 8 + 7, (j + 1) * 8);

                sorted_Aid.range((j + 1) * 8 + 7, (j + 1) * 8) =
                    sorted_Aid.range(j * 8 + 7, j * 8);
                sorted_CNT.range((j + 1) * 8 + 7, (j + 1) * 8) =
                    sorted_CNT.range(j * 8 + 7, j * 8);

                sorted_Aid.range(j * 8 + 7, j * 8) = temp_Aid;
                sorted_CNT.range(j * 8 + 7, j * 8) = temp_CNT;
            }
        }
    }

    // Output sorted signals
    golden_out_Aid_all = sorted_Aid;
    golden_out_CNT_all = sorted_CNT;

    out_Aid[5] = out_Aid_all.read().range(47, 40);
    out_Aid[4] = out_Aid_all.read().range(39, 32);
    out_Aid[3] = out_Aid_all.read().range(31, 24);
    out_Aid[2] = out_Aid_all.read().range(23, 16);
    out_Aid[1] = out_Aid_all.read().range(15, 8);
    out_Aid[0] = out_Aid_all.read().range(7, 0);

    out_CNT[5] = out_CNT_all.read().range(47, 40).to_uint();
    out_CNT[4] = out_CNT_all.read().range(39, 32).to_uint();
    out_CNT[3] = out_CNT_all.read().range(31, 24).to_uint();
    out_CNT[2] = out_CNT_all.read().range(23, 16).to_uint();
    out_CNT[1] = out_CNT_all.read().range(15, 8).to_uint();
    out_CNT[0] = out_CNT_all.read().range(7, 0).to_uint();

    golden_out_Aid[5] = golden_out_Aid_all.range(47, 40);
    golden_out_Aid[4] = golden_out_Aid_all.range(39, 32);
    golden_out_Aid[3] = golden_out_Aid_all.range(31, 24);
    golden_out_Aid[2] = golden_out_Aid_all.range(23, 16);
    golden_out_Aid[1] = golden_out_Aid_all.range(15, 8);
    golden_out_Aid[0] = golden_out_Aid_all.range(7, 0);

    golden_out_CNT[5] = golden_out_CNT_all.range(47, 40).to_uint();
    golden_out_CNT[4] = golden_out_CNT_all.range(39, 32).to_uint();
    golden_out_CNT[3] = golden_out_CNT_all.range(31, 24).to_uint();
    golden_out_CNT[2] = golden_out_CNT_all.range(23, 16).to_uint();
    golden_out_CNT[1] = golden_out_CNT_all.range(15, 8).to_uint();
    golden_out_CNT[0] = golden_out_CNT_all.range(7, 0).to_uint();

    // cout << std::left << std::setw(10) << "in_Aid[0]  = "<< std::right <<
    // std::setw(3)  << in_Aid[0].to_uint() << "   "; cout << std::left <<
    // std::setw(10) << "in_Aid[1]  = "<< std::right << std::setw(3)  <<
    // in_Aid[1].to_uint() << "   "; cout << std::left << std::setw(10) <<
    // "in_Aid[2]  = "<< std::right << std::setw(3)  << in_Aid[2].to_uint() << "
    // "; cout << std::left << std::setw(10) << "in_Aid[3]  = "<< std::right <<
    // std::setw(3)  << in_Aid[3].to_uint() << "   "; cout << std::left <<
    // std::setw(10) << "in_Aid[4]  = "<< std::right << std::setw(3)  <<
    // in_Aid[4].to_uint() << "   "; cout << std::left << std::setw(10) <<
    // "in_Aid[5]  = "<< std::right << std::setw(3)  << in_Aid[5].to_uint() <<
    // endl;

    // cout << std::left << std::setw(10) << "in_CNT[0]  = "<< std::right <<
    // std::setw(3)  << in_CNT[0].to_uint() << "   "; cout << std::left <<
    // std::setw(10) << "in_CNT[1]  = "<< std::right << std::setw(3)  <<
    // in_CNT[1].to_uint() << "   "; cout << std::left << std::setw(10) <<
    // "in_CNT[2]  = "<< std::right << std::setw(3)  << in_CNT[2].to_uint() << "
    // "; cout << std::left << std::setw(10) << "in_CNT[3]  = "<< std::right <<
    // std::setw(3)  << in_CNT[3].to_uint() << "   "; cout << std::left <<
    // std::setw(10) << "in_CNT[4]  = "<< std::right << std::setw(3)  <<
    // in_CNT[4].to_uint() << "   "; cout << std::left << std::setw(10) <<
    // "in_CNT[5]  = "<< std::right << std::setw(3)  << in_CNT[5].to_uint() <<
    // endl; cout << endl;

    // cout << std::left << std::setw(10) << "out_Aid[0] = "<< std::right <<
    // std::setw(3)  << out_Aid[0].to_uint() << "   "; cout << std::left <<
    // std::setw(10) << "out_Aid[1] = "<< std::right << std::setw(3)  <<
    // out_Aid[1].to_uint() << "   "; cout << std::left << std::setw(10) <<
    // "out_Aid[2] = "<< std::right << std::setw(3)  << out_Aid[2].to_uint() <<
    // "   "; cout << std::left << std::setw(10) << "out_Aid[3] = "<< std::right
    // << std::setw(3)  << out_Aid[3].to_uint() << "   "; cout << std::left <<
    // std::setw(10) << "out_Aid[4] = "<< std::right << std::setw(3)  <<
    // out_Aid[4].to_uint() << "   "; cout << std::left << std::setw(10) <<
    // "out_Aid[5] = "<< std::right << std::setw(3)  << out_Aid[5].to_uint() <<
    // endl;

    // cout << std::left << std::setw(10) << "out_CNT[0] = "<< std::right <<
    // std::setw(3)  << out_CNT[0].to_uint() << "   "; cout << std::left <<
    // std::setw(10) << "out_CNT[1] = "<< std::right << std::setw(3)  <<
    // out_CNT[1].to_uint() << "   "; cout << std::left << std::setw(10) <<
    // "out_CNT[2] = "<< std::right << std::setw(3)  << out_CNT[2].to_uint() <<
    // "   "; cout << std::left << std::setw(10) << "out_CNT[3] = "<< std::right
    // << std::setw(3)  << out_CNT[3].to_uint() << "   "; cout << std::left <<
    // std::setw(10) << "out_CNT[4] = "<< std::right << std::setw(3)  <<
    // out_CNT[4].to_uint() << "   "; cout << std::left << std::setw(10) <<
    // "out_CNT[5] = "<< std::right << std::setw(3)  << out_CNT[5].to_uint() <<
    // endl; cout << endl;

    // cout << std::left << std::setw(10) << "golden_out_Aid[0] = "<< std::right
    // << std::setw(3)  << golden_out_Aid[0].to_uint() << "   "; cout <<
    // std::left << std::setw(10) << "golden_out_Aid[1] = "<< std::right <<
    // std::setw(3)  << golden_out_Aid[1].to_uint() << "   "; cout << std::left
    // << std::setw(10) << "golden_out_Aid[2] = "<< std::right << std::setw(3)
    // << golden_out_Aid[2].to_uint() << "   "; cout << std::left <<
    // std::setw(10) << "golden_out_Aid[3] = "<< std::right << std::setw(3)  <<
    // golden_out_Aid[3].to_uint() << "   "; cout << std::left << std::setw(10)
    // << "golden_out_Aid[4] = "<< std::right << std::setw(3)  <<
    // golden_out_Aid[4].to_uint() << "   "; cout << std::left << std::setw(10)
    // << "golden_out_Aid[5] = "<< std::right << std::setw(3)  <<
    // golden_out_Aid[5].to_uint() << endl;

    // cout << std::left << std::setw(10) << "golden_out_CNT[0] = "<< std::right
    // << std::setw(3)  << golden_out_CNT[0].to_uint() << "   "; cout <<
    // std::left << std::setw(10) << "golden_out_CNT[1] = "<< std::right <<
    // std::setw(3)  << golden_out_CNT[1].to_uint() << "   "; cout << std::left
    // << std::setw(10) << "golden_out_CNT[2] = "<< std::right << std::setw(3)
    // << golden_out_CNT[2].to_uint() << "   "; cout << std::left <<
    // std::setw(10) << "golden_out_CNT[3] = "<< std::right << std::setw(3)  <<
    // golden_out_CNT[3].to_uint() << "   "; cout << std::left << std::setw(10)
    // << "golden_out_CNT[4] = "<< std::right << std::setw(3)  <<
    // golden_out_CNT[4].to_uint() << "   "; cout << std::left << std::setw(10)
    // << "golden_out_CNT[5] = "<< std::right << std::setw(3)  <<
    // golden_out_CNT[5].to_uint() << endl; cout << endl;

    if (golden_out_Aid_all != out_Aid_all.read() ||
        golden_out_CNT_all != out_CNT_all.read()) {
        std::cout
            << RED_TEXT
            << "**************************************************************"
               "**************************************************************"
               "***********************************"
            << std::endl;
        std::cout
            << "**                                                            "
               "                                                              "
               "                                 **"
            << std::endl;
        std::cout
            << "**                                                            "
               "     Pattern no."
            << pattern_count
            << " FAIL                                                         "
               "               **"
            << std::endl;
        std::cout
            << "**                                                            "
               "                                                              "
               "                                 **"
            << std::endl;
        std::cout
            << "**************************************************************"
               "**************************************************************"
               "***********************************"
            << std::endl;
        std::cout << RESET_TEXT;  // Reset color
        std::cout
            << "**                                                            "
               "                                                              "
               "                                 **"
            << std::endl;
        std::cout
            << "**                                                            "
               "       Pattern input                                          "
               "                                 **"
            << std::endl;
        std::cout
            << "**                                                            "
               "                                                              "
               "                                 **"
            << std::endl;
        cout << "** " << std::left << std::setw(10)
             << "in_Aid[0]         = " << std::right << std::setw(3)
             << in_Aid[0].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "in_Aid[1]         = " << std::right << std::setw(3)
             << in_Aid[1].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "in_Aid[2]         = " << std::right << std::setw(3)
             << in_Aid[2].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "in_Aid[3]         = " << std::right << std::setw(3)
             << in_Aid[3].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "in_Aid[4]         = " << std::right << std::setw(3)
             << in_Aid[4].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "in_Aid[5]         = " << std::right << std::setw(3)
             << in_Aid[5].to_uint() << " **" << endl;

        cout << "** " << std::left << std::setw(10)
             << "in_CNT[0]         = " << std::right << std::setw(3)
             << in_CNT[0].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "in_CNT[1]         = " << std::right << std::setw(3)
             << in_CNT[1].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "in_CNT[2]         = " << std::right << std::setw(3)
             << in_CNT[2].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "in_CNT[3]         = " << std::right << std::setw(3)
             << in_CNT[3].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "in_CNT[4]         = " << std::right << std::setw(3)
             << in_CNT[4].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "in_CNT[5]         = " << std::right << std::setw(3)
             << in_CNT[5].to_uint() << " **" << endl;
        cout << "**                                                            "
                "                                                              "
                "                                 **"
             << endl;
        cout << "**************************************************************"
                "**************************************************************"
                "***********************************"
             << endl;

        cout << "**                                                            "
                "                                                              "
                "                                 **"
             << endl;
        cout << "**                                                            "
                "        Your output                                           "
                "                                 **"
             << endl;
        cout << "**                                                            "
                "                                                              "
                "                                 **"
             << endl;
        cout << "** " << std::left << std::setw(10)
             << "out_Aid[0]        = " << std::right << std::setw(3)
             << out_Aid[0].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "out_Aid[1]        = " << std::right << std::setw(3)
             << out_Aid[1].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "out_Aid[2]        = " << std::right << std::setw(3)
             << out_Aid[2].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "out_Aid[3]        = " << std::right << std::setw(3)
             << out_Aid[3].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "out_Aid[4]        = " << std::right << std::setw(3)
             << out_Aid[4].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "out_Aid[5]        = " << std::right << std::setw(3)
             << out_Aid[5].to_uint() << " **" << endl;

        cout << "** " << std::left << std::setw(10)
             << "out_CNT[0]        = " << std::right << std::setw(3)
             << out_CNT[0].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "out_CNT[1]        = " << std::right << std::setw(3)
             << out_CNT[1].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "out_CNT[2]        = " << std::right << std::setw(3)
             << out_CNT[2].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "out_CNT[3]        = " << std::right << std::setw(3)
             << out_CNT[3].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "out_CNT[4]        = " << std::right << std::setw(3)
             << out_CNT[4].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "out_CNT[5]        = " << std::right << std::setw(3)
             << out_CNT[5].to_uint() << " **" << endl;
        cout << "**                                                            "
                "                                                              "
                "                                 **"
             << endl;
        cout << "**************************************************************"
                "**************************************************************"
                "***********************************"
             << endl;

        cout << "**                                                            "
                "                                                              "
                "                                 **"
             << endl;
        cout << "**                                                            "
                "       Golden output                                          "
                "                                 **"
             << endl;
        cout << "**                                                            "
                "                                                              "
                "                                 **"
             << endl;
        cout << "** " << std::left << std::setw(10)
             << "golden_out_Aid[0] = " << std::right << std::setw(3)
             << golden_out_Aid[0].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "golden_out_Aid[1] = " << std::right << std::setw(3)
             << golden_out_Aid[1].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "golden_out_Aid[2] = " << std::right << std::setw(3)
             << golden_out_Aid[2].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "golden_out_Aid[3] = " << std::right << std::setw(3)
             << golden_out_Aid[3].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "golden_out_Aid[4] = " << std::right << std::setw(3)
             << golden_out_Aid[4].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "golden_out_Aid[5] = " << std::right << std::setw(3)
             << golden_out_Aid[5].to_uint() << " **" << endl;

        cout << "** " << std::left << std::setw(10)
             << "golden_out_CNT[0] = " << std::right << std::setw(3)
             << golden_out_CNT[0].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "golden_out_CNT[1] = " << std::right << std::setw(3)
             << golden_out_CNT[1].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "golden_out_CNT[2] = " << std::right << std::setw(3)
             << golden_out_CNT[2].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "golden_out_CNT[3] = " << std::right << std::setw(3)
             << golden_out_CNT[3].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "golden_out_CNT[4] = " << std::right << std::setw(3)
             << golden_out_CNT[4].to_uint() << "   ";
        cout << std::left << std::setw(10)
             << "golden_out_CNT[5] = " << std::right << std::setw(3)
             << golden_out_CNT[5].to_uint() << " **" << endl;
        cout << "**                                                            "
                "                                                              "
                "                                 **"
             << endl;
        cout << "**************************************************************"
                "**************************************************************"
                "***********************************"
             << endl;
        exit(1);
    } else {
        cout << GREEN_TEXT << "Pattern no." << pattern_count << " PASS"
             << RESET_TEXT << endl;

        pattern_count = pattern_count + 1;

        if (pattern_count == 10000) {
            std::cout << std::endl;
            std::cout << GREEN_TEXT
                      << "*****************************************************"
                         "******************"
                      << std::endl;
            std::cout << "**                                                   "
                         "                **"
                      << std::endl;
            std::cout << "**                         Congratulations           "
                         "                **"
                      << std::endl;
            std::cout << "**                         All Pattern Pass          "
                         "                **"
                      << std::endl;
            std::cout << "**                                                   "
                         "                **"
                      << std::endl;
            std::cout << "*****************************************************"
                         "******************"
                      << RESET_TEXT << std::endl;
        }
    }
}