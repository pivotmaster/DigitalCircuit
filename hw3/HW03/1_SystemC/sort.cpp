#include "sort.h"

#include <array>
#include <algorithm>
#include <numeric>

using namespace std;

void stable_sort_6_value::process(){
    array<uint8_t, 6> values;
    array<uint8_t, 6> indices;
    for (int i = 0; i < 6; ++i) {
        values[i] = (in_CNT_all.read() >> (8 * i)) & 0xFF;
        indices[i] = (in_Aid_all.read() >> (8 * i)) & 0xFF;
    }
    array<int, 6> order;
    iota(order.begin(), order.end(), 0);
    stable_sort(order.begin(), order.end(),
        [&](int i, int j) { return values[i] < values[j]; });
    sc_uint<48> sorted_values = 0;
    sc_uint<48> sorted_indices = 0;
    for (int i = 0; i < 6; ++i) {
        sorted_values |= (sc_uint<48>(values[order[i]]) << (8 * i));
        sorted_indices |= (sc_uint<48>(indices[order[i]]) << (8 * i));
    }
    out_Aid_all.write(sorted_indices);
    out_CNT_all.write(sorted_values);
}