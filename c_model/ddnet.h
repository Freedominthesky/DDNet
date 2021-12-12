#ifndef OCEAN_DDNET_H
#define OCEAN_DDNET_H

#include "fixed_point_number.h"
#include <string>

using std::string;

enum DATATYPE {PICTURE = 0, WEIGHT_1, WEIGHT_2, WEIGHT_3, WEIGHT_4};

class DDNet
{
    public:
        DDNet();
        DDNet(int picture_data_size, int inner_size, int out_size);
        ~DDNet();

        void parse_file(string picture_file_name, DATATYPE data_type);

        void forward();

        void view_layer(int layer_id);
        void view_all();
        int  get_predict_result();

    private:
        int           _inner_size;

        FixedPointNum *_picture_data;
        int           _picture_data_size;

        FixedPointNum *_weight_data_1;
        FixedPointNum *_weight_data_2;
        FixedPointNum *_weight_data_3;
        FixedPointNum *_weight_data_4;

        FixedPointNum *_first_layer_out;
        FixedPointNum *_second_layer_inner;
        FixedPointNum *_second_layer_out;
        FixedPointNum *_third_layer_inner;
        FixedPointNum *_third_layer_out;

        FixedPointNum *_final_layer_out;
        int           _final_layer_out_size;

        void           init();
        FixedPointNum* forward_fc_layer(const FixedPointNum *data_vec,
                                        int data_size,
                                        const FixedPointNum *weight_vec,
                                        int weight_size,
                                        int layer_id);
        FixedPointNum* forward_dd_layer(const FixedPointNum *data_vec,
                                        int data_size,
                                        const FixedPointNum *weight_vec,
                                        int weight_size,
                                        int layer_id);
};

#endif
