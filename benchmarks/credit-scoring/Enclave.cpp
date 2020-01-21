//#include "source.h"

#include <iostream>
#include <vector>

#include "BPnet.h"
#define Rate 9 //´íÎóÂÊ
//#define Train 112   //ÑµÁ·Êý¾Ý×éÊý
//#define Test 32     //²âÊÔÊý¾Ý×éÊý
//#define F innode        //Ö¸±ê¸öÊý
using namespace std;

void ecall_train(BpNet testNet, vector<sample>& sampleGroup)
{
	testNet.training(sampleGroup, Rate);
}

void ecall_predict(BpNet testNet, vector<sample>& testGroup)
{
	testNet.predict(testGroup);
}
