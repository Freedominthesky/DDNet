#ifndef OCEAN_FIXED_POINT_NUMBER
#define OCEAN_FIXED_POINT_NUMBER

#include <cstdint>
#include <iostream>

using std::ostream;
using std::hex;
using std::endl;

struct FixedPointNum
{
	FixedPointNum();
    FixedPointNum(uint16_t number);
	FixedPointNum(uint16_t number, uint16_t integer_width, uint16_t fraction_width);
	~FixedPointNum(){};

	/*
	 *helper function used to test.
	 */
	double to_double();

	uint16_t number;
	uint16_t sign;
    uint16_t fraction_width;
	uint16_t integer_width;
};

FixedPointNum operator+(const FixedPointNum &number_1, const FixedPointNum &number_2);
FixedPointNum operator*(const FixedPointNum &number_1, const FixedPointNum &number_2);
bool          operator>(const FixedPointNum &number_1, const FixedPointNum &number_2);
ostream&      operator<<(ostream&os, const FixedPointNum &fixed_num);

#endif
