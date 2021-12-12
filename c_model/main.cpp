#include <iostream>
#include <cstring>
#include "fixed_point_number.h"
#include "ddnet.h"

using std::cout;

void invalid_option()
{
	cout << "Invalid option! You should enter command `./ddnet [-p picture_file_name] [-w1 weight_1_file_name] [-w2 weight_2_file_name] [-w3 weight_3_file_name] [-w4 weight_4_file_name]` instead." << endl;

	exit(-1);
}

int char_seq_size(const char *char_seq)
{
	int size = 0;
	while(char_seq[size] != '\0')
        ++size;

	return size;
}

int main(int argc, char **argv)
{
	string picture_file_name;
	string weight_1_file_name;
	string weight_2_file_name;
	string weight_3_file_name;
	string weight_4_file_name;
	for(int i = 1; i < argc - 1; i = i + 2)
	{
        if(strcmp(argv[i], "-p") == 0)
            picture_file_name.assign(argv[i + 1], char_seq_size(argv[i + 1]));
		else if(strcmp(argv[i], "-w1") == 0)
			weight_1_file_name.assign(argv[i + 1], char_seq_size(argv[i + 1]));
		else if(strcmp(argv[i], "-w2") == 0)
			weight_2_file_name.assign(argv[i + 1], char_seq_size(argv[i + 1]));
		else if(strcmp(argv[i], "-w3") == 0)
			weight_3_file_name.assign(argv[i + 1], char_seq_size(argv[i + 1]));
		else if(strcmp(argv[i], "-w4") == 0)
			weight_4_file_name.assign(argv[i + 1], char_seq_size(argv[i + 1]));
        else
		{
			invalid_option();
		}
	}
    DDNet *net = new DDNet();
    net->parse_file(picture_file_name,  DATATYPE::PICTURE);
	net->parse_file(weight_1_file_name, DATATYPE::WEIGHT_1);
	net->parse_file(weight_2_file_name, DATATYPE::WEIGHT_2);
	net->parse_file(weight_3_file_name, DATATYPE::WEIGHT_3);
	net->parse_file(weight_4_file_name, DATATYPE::WEIGHT_4);
    net->forward();
	net->view_all();
}
