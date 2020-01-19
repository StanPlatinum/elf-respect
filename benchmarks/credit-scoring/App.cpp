#include "source.h"

#include <stdio.h>
#include <iostream>

#define Rate 9 //������
#define Train 112   //ѵ����������
#define Test 32     //������������
#define F innode        //ָ�����

//Weijie: these following should be dealt with sgx8edger8 tool

void ecall_train(BpNet testNet, vector<sample> sampleGroup);

void ecall_predict(BpNet testNet, vector<sample> testGroup);

int Readint(FILE* fp) {//��������
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

char Read(FILE* fp) {//��������
	char ch = fgetc(fp);
	while (1) {
		if (ch >= '0'&&ch <= '9')
			return ch;
		else if (ch == '#')  //�ӵ�һ�������ַ�����#��
			return NULL;
		else ch = fgetc(fp);
	}
}

int main()
{
	//Weijie: testNet is the key structure
	BpNet testNet;

	//int innode;
	cout << "BP net for Credit Rating" << endl << "Version:5.19" << endl ;

	// ѵ������
	FILE *fp1,*fp2;
	int ch = 0;
	double rightrate = 0;
	fp1 = fopen("./trainset.txt", "r");    /*�������ļ�ֻ��*/
	if (!fp1) {
		cout << "Open txt fail." << endl;
		return 0;
	}
	/* while (1) {    //��ʾ��ȡ���
		ch = Readint(fp1);
		cout << ch << endl;
		if (ch == '(')
			break;
	}*/

	vector<double> samplein[Train];
	vector<double> sampleout[Train];
	for (int i = 0; i < Train; i++) {
		for (int j = 0; j < F; j++) {      //Train*F��ָ��
			ch = Readint(fp1);
			if (j == 12) ch = ch / 100;
			samplein[i].push_back(ch);
		}
		ch = Readint(fp1);               //Train*1��RESULT
		sampleout[i].push_back(ch);
	}

	sample sampleInOut[Train];
	for (int i = 0; i < Train; i++)
	{
		sampleInOut[i].in = samplein[i];
		sampleInOut[i].out = sampleout[i];
	}

	cout << "training..." << endl;
	vector<sample> sampleGroup(sampleInOut, sampleInOut + Train);
	//Weijie: ecall
	//testNet.training(sampleGroup, Rate);
	ecall_train(testNet, sampleGroup);

	// ��������
	vector<double> testin[Test];
	vector<int> testout[Test];
	fp2 = fopen("./testset.txt", "r");    /*�������ļ�ֻ��*/        
	if (!fp2) {
		cout << "Open txt fail." << endl;
	}
	for (int i = 0; i < Test; i++) {
		for (int j = 0; j < F; j++) {
			ch = Readint(fp2);
			testin[i].push_back(ch);
		}
		testout[i].push_back(Readint(fp2));      //���ղ��Լ��Ľ��
	}

	cout << "Result:" << endl;
	sample testInOut[Test];
	for (int i = 0; i < Test; i++) testInOut[i].in = testin[i];

	cout << "predicting..." << endl;
	vector<sample> testGroup(testInOut, testInOut + Test);
	//Weijie: ecall
	//testNet.predict(testGroup);
	ecall_predict(testNet, testGroup);

	//Weijie: do the output
	cout << "test group size: " << testGroup.size() << endl;
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