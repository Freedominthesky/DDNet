#include "fixed_point_number.h"

FixedPointNum::FixedPointNum()
{
    fraction_width = 8; 
	integer_width  = 7;
	number         = 0;
	sign           = 0;
}

FixedPointNum::FixedPointNum(uint16_t in_number)
{
    fraction_width = 8; 
	integer_width  = 7;
	this->number   = in_number;
	sign           = (number & 0x8000); 
}

FixedPointNum::FixedPointNum(uint16_t in_number, uint16_t in_integer_width, uint16_t in_fraction_width)
{
	this->number  = in_number;
	this->sign    = (in_number & 0x8000);
	this->integer_width = in_integer_width;
	this->fraction_width = in_fraction_width;
}

double FixedPointNum::to_double()
{
	uint16_t valid_num = (this->number) << 1;
	double   result    = double(valid_num) / (2 << (this->fraction_width + 1));

	return (sign == 0) ? result : -result;
}

FixedPointNum operator+(const FixedPointNum &number_1, const FixedPointNum &number_2)
{
    FixedPointNum result;
	if(number_1.sign == 0 && number_2.sign == 0)
	{
        result.number = number_1.number + number_2.number;
		if(result.number > 0x7FFF)
		    result.number = 0x7FFF;
	}
	else if(number_1.sign != 0 && number_2.sign != 0)
	{
        result.number = (number_1.number & 0x7FFF) + (number_2.number & 0x7FFF);
		if(result.number > 0x7FFF)
			result.number = 0xFFFF;
		result.number = result.number | 0x8000;
	}
	else if(number_1.sign == 0 && number_2.sign != 0)
	{
		uint16_t number_2_data = (number_2.number & 0x7FFF);
		bool     greater = (number_1.number > number_2_data);
	    result.number = greater ? (number_1.number - number_2_data) : ((number_2_data - number_1.number) | 0x8000);	
	}
	else
	{
		uint16_t number_1_data = (number_1.number & 0x7FFF);
		bool     greater = (number_1_data > number_2.number);
		result.number = greater ? ((number_1_data - number_2.number) | 0x8000) : (number_2.number - number_1_data);
	}

	result.sign = result.number & 0x8000;
	
	return result;
}

FixedPointNum operator*(const FixedPointNum &number_1, const FixedPointNum &number_2)
{
	FixedPointNum result;
	result.sign = (number_1.sign == number_2.sign) ? 0x0000 : 0x8000;
    uint32_t product = uint32_t(number_1.number & 0x7FFF) * uint32_t(number_2.number & 0x7FFF);
	if(product > 0x007FFF00)
		result.number = (0x7FFF | result.sign);
	else
		result.number = (uint16_t((product & 0x007FFF00) >> 9) | result.sign);

	return result;
}

bool operator>(const FixedPointNum &number_1, const FixedPointNum &number_2)
{
    if(number_1.sign == 0 && number_2.sign != 0)
		return true;
	else if(number_1.sign != 0 && number_2.sign == 0)
		return false;
	else if(number_1.sign == 0 && number_2.sign == 0)
        return number_1.number > number_2.number;
    else
		return number_1.number < number_2.number;
}

ostream& operator<<(ostream&os, const FixedPointNum &fixed_num)
{
    os << hex << fixed_num.number;

	return os;
}
