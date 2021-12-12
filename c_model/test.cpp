#include<iostream>
#include "fixed_point_number.h"

using std::cout;

void test_class_fixed_point()
{
	uint16_t data_array[10] = {0x0001, 0x00FF, 0x0100, 0x7FFE, 0x7FFF, 0x8001, 0x80FF, 0x8100, 0xFFFE, 0xFFFF};
	FixedPointNum fix_sum;
	FixedPointNum fix_product;
	for(int i = 0; i < 10; ++i)
	{
		FixedPointNum a_fix(data_array[i]);
		for(int j = 0; j < 10; ++j)
		{
            FixedPointNum b_fix(data_array[j]);
            fix_sum = a_fix + b_fix;
			fix_product = a_fix * b_fix;
			cout << a_fix.to_double() << " + " << b_fix.to_double() << " = " << fix_sum.to_double() << endl;
			cout << a_fix.to_double() << " * " << b_fix.to_double() << " = " << fix_product.to_double() << endl;
		}
	}
}

int main(int argc, char **argv)
{
	test_class_fixed_point();
}
