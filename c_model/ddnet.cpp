/*
 * Function: Model the inference process for DDNet
 * Author:   Yang Yang
 * Contact:  yyang16@126.com
 */
#include "fixed_point_number.h"
#include "ddnet.h"
#include <fstream>
#include <map>

using std::cout;
using std::ifstream;
using std::map;

void DDNet::init()
{
    _picture_data = new FixedPointNum[_picture_data_size];
    _weight_data_1 = new FixedPointNum[_picture_data_size * _inner_size];
    _weight_data_2 = new FixedPointNum[_inner_size * _inner_size];
    _weight_data_3 = new FixedPointNum[_inner_size * _inner_size];
    _weight_data_4 = new FixedPointNum[_inner_size * _final_layer_out_size];
    _first_layer_out = new FixedPointNum[_inner_size];
    _second_layer_inner = new FixedPointNum[_inner_size];
    _second_layer_out = new FixedPointNum[_inner_size];
    _third_layer_inner = new FixedPointNum[_inner_size];
    _third_layer_out = new FixedPointNum[_inner_size];
    _final_layer_out = new FixedPointNum[_final_layer_out_size];
}

DDNet::DDNet()
{
    _inner_size = 64;
    _picture_data_size = 724;
    _final_layer_out_size = 10;
    this->init();
}

DDNet::DDNet(int picture_data_size, int inner_size, int out_size)
{
    _inner_size = inner_size;
    _picture_data_size = picture_data_size;
    _final_layer_out_size = out_size;
    this->init();
}

DDNet::~DDNet()
{
    if(_picture_data)
        delete []_picture_data;
    if(_weight_data_1)
        delete []_weight_data_1;
    if(_weight_data_2)
        delete []_weight_data_2;
    if(_weight_data_3)
        delete []_weight_data_3;
    if(_weight_data_4)
        delete []_weight_data_4;
    if(_first_layer_out)
        delete []_first_layer_out;
    if(_second_layer_inner)
        delete []_second_layer_inner;
    if(_second_layer_out)
        delete []_second_layer_out;
    if(_third_layer_inner)
        delete []_third_layer_inner;
    if(_third_layer_out)
        delete []_third_layer_out;
    if(_final_layer_out)
        delete []_final_layer_out;

}

FixedPointNum line2fix(const string &line)
{
    map<char, int> alpha2int_map;    
    for(char elem = '0'; elem <= '9'; ++elem)
        alpha2int_map[elem] = int(elem - '0');
    for(char elem = 'a'; elem <= 'f'; ++elem)
        alpha2int_map[elem] = int(elem - 'a' + 10);
    uint16_t result_1 = (alpha2int_map[line[0]] * (2 << 12)) + (alpha2int_map[line[1]] * (2 << 8));
    uint16_t result_2 = (alpha2int_map[line[2]] * (2 << 4)) + alpha2int_map[line[3]];
    uint16_t result = result_1 + result_2;

    FixedPointNum fix_result(result);
    return fix_result;
}

void print_vector(const FixedPointNum *data_vec, int data_size, string vec_name)
{
    cout <<  vec_name << " is as follows:\n"; 
    for(int i = 0; i < data_size; ++i)
    {
        cout << data_vec[i] << '\t';
        if(i % 8 == 7)
            cout << '\n';
    }
    cout << endl;
}

void DDNet::parse_file(string file_name, DATATYPE data_type)
{
    FixedPointNum *data_in_vec;
    int            data_in_size;
    if(data_type == DATATYPE::PICTURE)
    {
        data_in_vec  = _picture_data;
        data_in_size = _picture_data_size;
    }
    else if(data_type == DATATYPE::WEIGHT_1)
    {
        data_in_vec  = _weight_data_1;
        data_in_size = _picture_data_size * _inner_size;
    }
    else if(data_type == DATATYPE::WEIGHT_2)
    {
        data_in_vec  = _weight_data_2;
        data_in_size = _inner_size * _inner_size;
    }
    else if(data_type == DATATYPE::WEIGHT_3)
    {
        data_in_vec  = _weight_data_3;
        data_in_size = _inner_size * _inner_size;
    }
    else if(data_type == DATATYPE::WEIGHT_4)
    {
        data_in_vec  = _weight_data_4;
        data_in_size = _final_layer_out_size * _inner_size;
    }
    else
    {
        cout << "Illegal Data Type\n";
        exit(-1);
    }
    ifstream parse_data(file_name);
    if(!parse_data)
    {
        cout << "File " << file_name << " open fail!" << endl;
        exit(-1);
    }
    string line;
    FixedPointNum current_num;
    for(int i = 0; i < data_in_size; ++i)
    {
        getline(parse_data, line);
        current_num = line2fix(line);
        data_in_vec[i] = current_num;
    }
    print_vector(data_in_vec, data_in_size, file_name);
}


void DDNet::view_layer(int layer_id)
{
    if(layer_id == 1)
        print_vector(_first_layer_out, _inner_size, "The output data for the first fc");
    else if(layer_id == 2)
    {
        print_vector(_second_layer_inner, _inner_size, "The inner data for the first dd");
        print_vector(_second_layer_out, _inner_size, "The output data for the first dd");
    }
    else if(layer_id == 3)
    {
        print_vector(_third_layer_inner, _inner_size, "The inner data for the second dd");
        print_vector(_third_layer_out, _inner_size, "The output data for the second dd");
    }
    else if(layer_id == 4)
        print_vector(_final_layer_out, _final_layer_out_size, "The output data for the last fc");
    else
        cout << layer_id << " is not a valid layer id!" << endl;
}

void DDNet::view_all()
{
    for(int i = 1; i < 5; ++i)
        view_layer(i);
}

int DDNet::get_predict_result()
{
    int max_idx = 0;
    for(int i = 0; i < _final_layer_out_size; ++i)
    {
        if(_final_layer_out[i] > _final_layer_out[max_idx])
            max_idx = i;
    }

    return max_idx;
}

FixedPointNum* DDNet::forward_fc_layer(const FixedPointNum *data_vec,
                                       int data_size,
                                       const FixedPointNum *weight_vec,
                                       int weight_size,
                                       int layer_id)
{
    int data_out_size = (layer_id == 4) ? _final_layer_out_size : _inner_size;
    FixedPointNum *data_out = (layer_id == 4) ? _final_layer_out : _final_layer_out;

    for(int i = 0; i < _inner_size; ++i)
    {
        for(int j = 0; j < data_size; ++j)
            data_out[i] = data_vec[j] * weight_vec[i * _inner_size + j];
    }

    return data_out;
}

FixedPointNum* DDNet::forward_dd_layer(const FixedPointNum *data_vec,
                                       int data_size,
                                       const FixedPointNum *weight_vec,
                                       int weight_size,
                                       int layer_id)
{
    int data_out_size = _inner_size;
    FixedPointNum *data_inner = (layer_id == 2) ? _second_layer_inner : _third_layer_inner;
    FixedPointNum *data_out = (layer_id == 2) ? _second_layer_out : _third_layer_out;

    for(int i = 0; i < _inner_size; ++i)
    {
        for(int j = 0; j < data_size; ++j)
            data_inner[i] = data_vec[j] * weight_vec[i * _inner_size + j];
    }

    for(int i = 0; i < _inner_size; ++i)
        data_out[i] = data_inner[i] * _first_layer_out[i];

    return data_out;
}

void DDNet::forward()
{
    _first_layer_out = forward_fc_layer(_picture_data, _picture_data_size, _weight_data_1, _picture_data_size * _inner_size, 1);
    _second_layer_out = forward_dd_layer(_first_layer_out, _inner_size, _weight_data_2, _inner_size * _inner_size, 2);
    _third_layer_out = forward_dd_layer(_second_layer_out, _inner_size, _weight_data_3, _inner_size * _inner_size, 3);
    _final_layer_out = forward_fc_layer(_third_layer_out, _inner_size, _weight_data_4, _inner_size * _final_layer_out_size, 4);
}
