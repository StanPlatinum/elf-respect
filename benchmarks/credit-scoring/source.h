#pragma once
#include "BPnet.h"
#include <assert.h>
#include <algorithm>
using namespace std;
double lasterror = 0;

BpNet::BpNet()
{
	srand((unsigned)time(NULL));        // 随机数种子
	error = 100.f;                      // error初始值，极大值即可
	inputLayer.resize(innode);

	// 初始化输入层
	for (int i = 0; i < innode; i++)
	{
		inputLayer[i] = new inputNode();
		for (int j = 0; j < hidenode; j++)
		{
			inputLayer[i]->weight.push_back(get_11Random());
			inputLayer[i]->wDeltaSum.push_back(0.f);
		}
	}

	// 初始化隐藏层
	for (int i = 0; i < hidelayer; i++)
	{
		if (i == hidelayer - 1)
		{
			for (int j = 0; j < hidenode; j++)
			{
				hiddenLayer[i][j] = new hiddenNode();
				hiddenLayer[i][j]->bias = get_11Random();
				for (int k = 0; k < outnode; k++)
				{
					hiddenLayer[i][j]->weight.push_back(get_11Random());
					hiddenLayer[i][j]->wDeltaSum.push_back(0.f);
				}
			}
		}
		else
		{
			for (int j = 0; j < hidenode; j++)
			{
				hiddenLayer[i][j] = new hiddenNode();
				hiddenLayer[i][j]->bias = get_11Random();
				for (int k = 0; k < hidenode; k++) { hiddenLayer[i][j]->weight.push_back(get_11Random()); }
			}
		}
	}

	// 初始化输出层
	for (int i = 0; i < outnode; i++)
	{
		outputLayer[i] = new outputNode();
		outputLayer[i]->bias = get_11Random();
	}
}

void BpNet::forwardPropagationEpoc()
{
	// forward propagation on hidden layer
	for (int i = 0; i < hidelayer; i++)
	{
		if (i == 0)
		{
			for (int j = 0; j < hidenode; j++)
			{
				double sum = 0.f;
				for (int k = 0; k < innode; k++)
				{
					sum += inputLayer[k]->value * inputLayer[k]->weight[j];
				}
				sum += hiddenLayer[i][j]->bias;
				hiddenLayer[i][j]->value = sigmoid(sum);
			}
		}
		else
		{
			for (int j = 0; j < hidenode; j++)
			{
				double sum = 0.f;
				for (int k = 0; k < hidenode; k++)
				{
					sum += hiddenLayer[i - 1][k]->value * hiddenLayer[i - 1][k]->weight[j];
				}
				sum += hiddenLayer[i][j]->bias;
				hiddenLayer[i][j]->value = sigmoid(sum);
			}
		}
	}

	// forward propagation on output layer
	for (int i = 0; i < outnode; i++)
	{
		double sum = 0.f;
		for (int j = 0; j < hidenode; j++)
		{
			sum += hiddenLayer[hidelayer - 1][j]->value * hiddenLayer[hidelayer - 1][j]->weight[i];
		}
		sum += outputLayer[i]->bias;
		outputLayer[i]->value = sigmoid(sum);
	}
}

void BpNet::backPropagationEpoc()
{
	// backward propagation on output layer
	// -- compute delta
	for (int i = 0; i < outnode; i++)
	{
		double tmpe = fabs(outputLayer[i]->value - outputLayer[i]->rightout);
		error += tmpe * tmpe / 2;

		outputLayer[i]->delta
			= (outputLayer[i]->value - outputLayer[i]->rightout)*(1 - outputLayer[i]->value)*outputLayer[i]->value;
	}

	// backward propagation on hidden layer
	// -- compute delta
	for (int i = hidelayer - 1; i >= 0; i--)    // 反向计算
	{
		if (i == hidelayer - 1)
		{
			for (int j = 0; j < hidenode; j++)
			{
				double sum = 0.f;
				for (int k = 0; k<outnode; k++) { sum += outputLayer[k]->delta * hiddenLayer[i][j]->weight[k]; }
				hiddenLayer[i][j]->delta = sum * (1 - hiddenLayer[i][j]->value) * hiddenLayer[i][j]->value;
			}
		}
		else
		{
			for (int j = 0; j < hidenode; j++)
			{
				double sum = 0.f;
				for (int k = 0; k<hidenode; k++) { sum += hiddenLayer[i + 1][k]->delta * hiddenLayer[i][j]->weight[k]; }
				hiddenLayer[i][j]->delta = sum * (1 - hiddenLayer[i][j]->value) * hiddenLayer[i][j]->value;
			}
		}
	}

	// backward propagation on input layer
	// -- update weight delta sum
	for (int i = 0; i < innode; i++)
	{
		for (int j = 0; j < hidenode; j++)
		{
			inputLayer[i]->wDeltaSum[j] += inputLayer[i]->value * hiddenLayer[0][j]->delta;
		}
	}

	// backward propagation on hidden layer
	// -- update weight delta sum & bias delta sum
	for (int i = 0; i < hidelayer; i++)
	{
		if (i == hidelayer - 1)
		{
			for (int j = 0; j < hidenode; j++)
			{
				hiddenLayer[i][j]->bDeltaSum += hiddenLayer[i][j]->delta;
				for (int k = 0; k < outnode; k++)
				{
					hiddenLayer[i][j]->wDeltaSum[k] += hiddenLayer[i][j]->value * outputLayer[k]->delta;
				}
			}
		}
		else
		{
			for (int j = 0; j < hidenode; j++)
			{
				hiddenLayer[i][j]->bDeltaSum += hiddenLayer[i][j]->delta;
				for (int k = 0; k < hidenode; k++)
				{
					hiddenLayer[i][j]->wDeltaSum[k] += hiddenLayer[i][j]->value * hiddenLayer[i + 1][k]->delta;
				}
			}
		}
	}

	// backward propagation on output layer
	// -- update bias delta sum
	for (int i = 0; i < outnode; i++) outputLayer[i]->bDeltaSum += outputLayer[i]->delta;
}

void BpNet::training(vector<sample> sampleGroup, double threshold)
{
	int sampleNum = sampleGroup.size();

	while (error > threshold)
		//for (int curTrainingTime = 0; curTrainingTime < trainingTime; curTrainingTime++)
	{
		cout << "training error: " << error;
		cout << "       LearningRate: " << learningRate << endl;
		error = 0.f;         //重置error为0
		// initialize delta sum
		for (int i = 0; i < innode; i++) inputLayer[i]->wDeltaSum.assign(inputLayer[i]->wDeltaSum.size(), 0.f);
		for (int i = 0; i < hidelayer; i++) {
			for (int j = 0; j < hidenode; j++)
			{
				hiddenLayer[i][j]->wDeltaSum.assign(hiddenLayer[i][j]->wDeltaSum.size(), 0.f);
				hiddenLayer[i][j]->bDeltaSum = 0.f;
			}
		}
		for (int i = 0; i < outnode; i++) outputLayer[i]->bDeltaSum = 0.f;

		for (int iter = 0; iter < sampleNum; iter++)
		{
			setInput(sampleGroup[iter].in);
			setOutput(sampleGroup[iter].out);

			forwardPropagationEpoc();
			backPropagationEpoc();
		}

		// backward propagation on input layer
		// -- update weight
		for (int i = 0; i < innode; i++)
		{
			for (int j = 0; j < hidenode; j++)
			{
				inputLayer[i]->weight[j] -= learningRate * inputLayer[i]->wDeltaSum[j] / sampleNum;
			}
		}

		// backward propagation on hidden layer
		// -- update weight & bias
		for (int i = 0; i < hidelayer; i++)
		{
			if (i == hidelayer - 1)
			{
				for (int j = 0; j < hidenode; j++)
				{
					// bias
					hiddenLayer[i][j]->bias -= learningRate * hiddenLayer[i][j]->bDeltaSum / sampleNum;

					// weight
					for (int k = 0; k < outnode; k++)
					{
						hiddenLayer[i][j]->weight[k] -= learningRate * hiddenLayer[i][j]->wDeltaSum[k] / sampleNum;
					}
				}
			}
			else
			{
				for (int j = 0; j < hidenode; j++)
				{
					// bias
					hiddenLayer[i][j]->bias -= learningRate * hiddenLayer[i][j]->bDeltaSum / sampleNum;

					// weight
					for (int k = 0; k < hidenode; k++)
					{
						hiddenLayer[i][j]->weight[k] -= learningRate * hiddenLayer[i][j]->wDeltaSum[k] / sampleNum;
					}
				}
			}
		}

		// backward propagation on output layer
		// -- update bias
		for (int i = 0; i < outnode; i++)
		{
			outputLayer[i]->bias -= learningRate * outputLayer[i]->bDeltaSum / sampleNum;
		}

		//自适应学习率调整
		//if (error > 10.23)
			if (error > lasterror) {
				learningRate *= 0.5;
				learningRate = max(learningRate, 0.01);
			}
			else {
				learningRate *= 1.05;
				learningRate = min(learningRate, 1.0);
			}
		//assert(learningRate < 1.1 && learningRate >0);
		lasterror = error;
	}
}

void BpNet::predict(vector<sample>& testGroup)
{
	int testNum = testGroup.size();

	for (int iter = 0; iter < testNum; iter++)
	{
		testGroup[iter].out.clear();
		setInput(testGroup[iter].in);

		// forward propagation on hidden layer
		for (int i = 0; i < hidelayer; i++)
		{
			if (i == 0)
			{
				for (int j = 0; j < hidenode; j++)
				{
					double sum = 0.f;
					for (int k = 0; k < innode; k++)
					{
						sum += inputLayer[k]->value * inputLayer[k]->weight[j];
					}
					sum += hiddenLayer[i][j]->bias;
					hiddenLayer[i][j]->value = sigmoid(sum);
				}
			}
			else
			{
				for (int j = 0; j < hidenode; j++)
				{
					double sum = 0.f;
					for (int k = 0; k < hidenode; k++)
					{
						sum += hiddenLayer[i - 1][k]->value * hiddenLayer[i - 1][k]->weight[j];
					}
					sum += hiddenLayer[i][j]->bias;
					hiddenLayer[i][j]->value = sigmoid(sum);
				}
			}
		}

		// forward propagation on output layer
		for (int i = 0; i < outnode; i++)
		{
			double sum = 0.f;
			for (int j = 0; j < hidenode; j++)
			{
				sum += hiddenLayer[hidelayer - 1][j]->value * hiddenLayer[hidelayer - 1][j]->weight[i];
			}
			sum += outputLayer[i]->bias;
			outputLayer[i]->value = sigmoid(sum);
			testGroup[iter].out.push_back(outputLayer[i]->value);
		}
	}
}

void BpNet::setInput(vector<double> sampleIn)
{
	for (int i = 0; i < innode; i++) inputLayer[i]->value = sampleIn[i];
}

void BpNet::setOutput(vector<double> sampleOut)
{
	for (int i = 0; i < outnode; i++) outputLayer[i]->rightout = sampleOut[i];
}
