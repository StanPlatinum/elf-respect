#include <stdio.h>
#include "source.h"
#define Rate 9 //错误率
#define Train 112   //训练数据组数
#define Test 32		//测试数据组数
#define F innode        //指标个数

int Readint(FILE* fp) {//读入数据
	char ch = '#';
	fscanf(fp, "%c", &ch);
	while (!(ch >= '0' && ch <= '9')) {
		fscanf(fp, "%c", &ch);
	}
	int data = 0;
	while (ch >= '0' && ch <= '9') {
		data = data * 10 + (ch - '0');
		fscanf(fp, "%c", &ch);
	}
	return data;
}

char Read(FILE* fp) {//读入数据
	char ch = fgetc(fp);
	while (1) {
		if (ch >= '0'&&ch <= '9')
			return ch;
		else if (ch == '#')  //从第一个数字字符到‘#’
			return NULL;
		else ch = fgetc(fp);
	}
}


//主程序
int main()
{
	BpNet testNet;
	//int innode;
	cout << "BP net for Credit Rating" << endl << "Version:5.19" << endl ;

	// 训练数据
	FILE *fp1,*fp2;
	int ch = 0;
	double rightrate = 0;
	fp1 = fopen("./trainset.txt", "r");    /*打开文字文件只读*/
	if (!fp1) {
		cout << "Open txt fail." << endl;
		return 0;
	}
	/* while (1) {    //显示读取结果
		ch = Readint(fp1);
		cout << ch << endl;
		if (ch == '(')
			break;
	}*/

	vector<double> samplein[Train];
	vector<double> sampleout[Train];
	for (int i = 0; i < Train; i++) {
		for (int j = 0; j < F; j++) {      //Train*F个指标
			ch = Readint(fp1);
			if (j == 12) ch = ch / 100;
			samplein[i].push_back(ch);
		}
		ch = Readint(fp1);               //Train*1个RESULT
		sampleout[i].push_back(ch);
	}

	sample sampleInOut[Train];
	for (int i = 0; i < Train; i++)
	{
		sampleInOut[i].in = samplein[i];
		sampleInOut[i].out = sampleout[i];
	}
	vector<sample> sampleGroup(sampleInOut, sampleInOut + Train);
	testNet.training(sampleGroup, Rate);

	// 测试数据
	vector<double> testin[Test];
	vector<int> testout[Test];
	fp2 = fopen("./testset.txt", "r");    /*打开文字文件只读*/        
	if (!fp2) {
		cout << "Open txt fail." << endl;
	}
	for (int i = 0; i < Test; i++) {
		for (int j = 0; j < F; j++) {
			ch = Readint(fp2);
			testin[i].push_back(ch);
		}
		testout[i].push_back(Readint(fp2));      //吸收测试集的结果
	}

	cout << "Result:" << endl;
	sample testInOut[Test];
	for (int i = 0; i < Test; i++) testInOut[i].in = testin[i];
	vector<sample> testGroup(testInOut, testInOut + Test);

	// 预测测试数据，并输出结果
	testNet.predict(testGroup);
	for (int i = 0; i < testGroup.size(); i++)
	{
		int j = 0;
		//for (int j = 0; j < testGroup[i].in.size(); j++) cout << testGroup[i].in[j] << "\t";
		cout << "-- prediction :";
		for (; j < testGroup[i].out.size(); j++) 
			cout << testGroup[i].out[j] << "\t";
		if (testGroup[i].out[0] > 0.5 && testout[i][0] == 1)
			rightrate += 1;
		else if (testGroup[i].out[0] <= 0.5 && testout[i][0] == 0)
			rightrate += 1;
		cout << endl;
	}
	cout << "Accuracy:" << rightrate / testGroup.size() << endl;
	fclose(fp1);
	fclose(fp2);
	return 0;
}
