/**
 * @file This file is part of stockast.
 *
 * @section LICENSE
 * MIT License
 *
 * Copyright (c) 2017-2019 Rajdeep Konwar
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 * @section DESCRIPTION
 * Stock Market Forecasting using parallel Monte-Carlo simulations
 * (src:wikipedia) The Black–Scholes model assumes that the market consists of
 * at least one risky asset, usually called the stock, and one riskless asset,
 * usually called the money market, cash, or bond. The rate of return on the
 * riskless asset is constant and thus called the risk-free interest rate.
 **/

//! Header files
#include <iostream>
//#include <fstream>
#include <string>
#include <sstream>
//#include <chrono>

//#include <omp.h>

#include <random>
#include <memory>

#if 0
//Weijie: add my own make_unique
#include <type_traits>
#include <utility>

template <typename T, typename... Args>
std::unique_ptr<T> make_unique_helper(std::false_type, Args&&... args) {
  return std::unique_ptr<T>(new T(std::forward<Args>(args)...));
}

template <typename T, typename... Args>
std::unique_ptr<T> make_unique_helper(std::true_type, Args&&... args) {
   static_assert(std::extent<T>::value == 0,
       "make_unique<T[N]>() is forbidden, please use make_unique<T[]>().");

   typedef typename std::remove_extent<T>::type U;
   return std::unique_ptr<T>(new U[sizeof...(Args)]{std::forward<Args>(args)...});
}

template <typename T, typename... Args>
std::unique_ptr<T> make_unique(Args&&... args) {
   return make_unique_helper<T>(std::is_array<T>(), std::forward<Args>(args)...);
}
#endif

//! ---------------------------------------------------------------------------
//! Calculates volatility from ml_data.csv file
//! ---------------------------------------------------------------------------
float calcVolatility(float spotPrice, int timesteps)
{
#if 0
	//! Open ml_data.csv in read-mode, exit on fail
	const std::string fileName("ml_data.csv");
	std::ifstream fp;
	fp.open(fileName, std::ifstream::in);
	if (!fp.is_open())
	{
		std::cerr << "Cannot open ml_data.csv! Exiting..\n";
		exit(EXIT_FAILURE);
	}

	std::string line;
	//! Read the first line then close file
	if (!std::getline(fp, line))
	{
		std::cerr << "Cannot read from ml_data.csv! Exiting..\n";
		fp.close();
		exit(EXIT_FAILURE);
	}
	fp.close();

	//Weijie: get data
	std::cout << line << std::endl;
#endif

	std::string line = "99.80311647,99.72990912,99.65636726,99.6556732,99.69786154,99.74150906,99.73389665,99.79820824,99.79761168,99.79823002,99.79823002,99.78262647,99.78262647,99.78262647,99.73969133,99.73773184,99.73797132,99.73490099,99.73490099,99.73490099,99.734149,99.734149,99.77562657,99.7592583,99.75836796,99.71464245,99.71464245,99.71562527,99.64409042,99.62799208,99.62799208,99.62799208,99.62799208,99.57002365,99.66995111,99.66896711,99.68228756,99.68365737,99.66949599,99.56961951,99.56893026,99.56844997,99.56717845,99.56717845,99.63750043,99.56438822,99.49161966,99.29320141,99.27805847,99.29122139,99.29122139,99.29122139,99.29057403,99.36138729,99.36223967,99.36223967,99.31930126,99.20495047,99.13329905,99.13339801,98.77920303,98.82217857,98.82098415,98.80793197,98.80830788,98.84958174,98.84852822,98.84852822,98.57965834,98.28474207,98.29742855,98.29860256,98.29842983,98.28496445,97.93797363,97.92403829,97.93724476,97.93919152,97.92627805,97.97024764,97.96947664,97.97006179,97.99765621,97.98403421,97.97144908,97.97192716,97.97139071,97.80561647,97.59646317,97.736,97.8226,97.8727,97.872,97.8722,97.8693,97.8675,97.8656,97.8617,97.8596,97.8676,97.8772,97.8849,97.8893,97.8925,97.8952,97.8981,97.9011,97.9043,97.9078,97.9115,97.9153,97.919,97.9225,97.9257,97.9289,97.9321,97.9352,97.9384,97.9415,97.9446,97.9477,97.9507,97.9537,97.9566,97.9595,97.9623,97.9652,97.968,97.9707,97.9735,97.9762,97.9788,97.9815,97.984,97.9866,97.9891,97.9916,97.9941,97.9965,97.9989,98.0013,98.0036,98.0059,98.0082,98.0105,98.0127,98.0149,98.0171,98.0192,98.0214,98.0234,98.0255,98.0275,98.0295,98.0316,98.0335,98.0354,98.0374,98.0393,98.0411,98.043,98.0448,98.0466,98.0484,98.0501,98.0519,98.0536,98.0553,98.0569,98.0586,98.0602,98.0618,98.0634,98.0649,98.0665,98.0681,98.0696,98.0711,98.0726";

	int i = 0, len = timesteps - 1;
	std::unique_ptr<float[]> priceArr = std::make_unique<float[]>(timesteps - 1);
	//Weijie: use my own make_unique
	//std::unique_ptr<float[]> priceArr = make_unique<float[]>(timesteps - 1);
	std::istringstream iss(line);
	std::string token;

	//! Get the return values of stock from file (min 2 to 180)
	while (std::getline(iss, token, ','))
		priceArr[i++] = std::stof(token);

	float sum = spotPrice;
	//! Find mean of the estimated minute-end prices
	for (i = 0; i < len; i++)
		sum += priceArr[i];
	float meanPrice = sum / (len + 1);

	//! Calculate market volatility as standard deviation
	sum = powf((spotPrice - meanPrice), 2.0f);
	for (i = 0; i < len; i++)
		sum += powf((priceArr[i] - meanPrice), 2.0f);

	float stdDev = sqrtf(sum);

	//! Return as percentage
	return (stdDev / 100.0f);
}

/** ---------------------------------------------------------------------------
  Finds mean of a 2D array across first index (inLoops)
  M is in/outLoops and N is timesteps
  ----------------------------------------------------------------------------*/
float * find2DMean(float **matrix, int numLoops, int timesteps)
{
	int j;
	float* avg = new float[timesteps];
	float sum = 0.0f;

	for (int i = 0; i < timesteps; i++)
	{
		/**
		A private copy of 'sum' variable is created for each thread.
		At the end of the reduction, the reduction variable is applied to all private copies of the shared variable, and the final result is written to the global shared variable.
		*/
		for (j = 0; j < numLoops; j++)
		{
			sum += matrix[j][i];
		}
		//! Calculating average across columns
		avg[i] = sum / numLoops;
		sum = 0.0f;
	}
	return avg;
}

/** ---------------------------------------------------------------------------
  Generates a random number seeded by system clock based on standard
  normal distribution on taking mean 0.0 and standard deviation 1.0
  ----------------------------------------------------------------------------*/
//Weijie: test
unsigned long int seed = 1;

float randGen(float mean, float stdDev)
{
	//Weijie: we cannot use sys clock ...
	//So here we set seed starting with 1 ...
	//auto seed = std::chrono::system_clock::now().time_since_epoch().count();
	seed++;
	if (seed > 4294967295)	seed = 1;
	//std::cout << "seed: " << seed << std::endl;

	std::default_random_engine generator(static_cast<unsigned int>(seed));
	std::normal_distribution<float> distribution(mean, stdDev);
	return distribution(generator);
}


//! ---------------------------------------------------------------------------
//! Simulates Black Scholes model
//! ---------------------------------------------------------------------------
float * runBlackScholesModel(float spotPrice, int timesteps, float riskRate, float volatility)
{
	float  mean = 0.0f, stdDev = 1.0f;			//! Mean and standard deviation
	float  deltaT = 1.0f / timesteps;			//! Timestep
	std::unique_ptr<float[]> normRand = std::make_unique<float[]>(timesteps - 1);	//! Array of normally distributed random nos.
	//Weijie: use my own make_unique
	//std::unique_ptr<float[]> normRand = make_unique<float[]>(timesteps - 1);	//! Array of normally distributed random nos.
	float* stockPrice = new float[timesteps];	//! Array of stock price at diff. times
	stockPrice[0] = spotPrice;					//! Stock price at t=0 is spot price

	//! Populate array with random nos.
	for (int i = 0; i < timesteps - 1; i++)
		normRand[i] = randGen(mean, stdDev);

	//! Apply Black Scholes equation to calculate stock price at next timestep
	for (int i = 0; i < timesteps - 1; i++)
		stockPrice[i + 1] = stockPrice[i] * exp(((riskRate - (powf(volatility, 2.0f) / 2.0f)) * deltaT) + (volatility * normRand[i] * sqrtf(deltaT)));

	return stockPrice;
}

//! ---------------------------------------------------------------------------
//! Main function
//! ---------------------------------------------------------------------------
int main(int argc, char **argv)
{
#if 0
	clock_t t = clock();
#endif
	int inLoops = 100;		//! Inner loop iterations
	int outLoops = 10000;	//! Outer loop iterations
	int timesteps = 180;	//! Stock market time-intervals (min)

	//! Matrix for stock-price vectors per iteration
	float **stock = new float *[inLoops];
	for (int i = 0; i < inLoops; i++)
		stock[i] = new float[timesteps];

	//! Matrix for mean of stock-price vectors per iteration
	float **avgStock = new float*[outLoops];
	for (int i = 0; i < outLoops; i++)
		avgStock[i] = new float[timesteps];

	//! Vector for most likely outcome stock price
	float *optStock = new float[timesteps];

	float riskRate = 0.001f;	//! Risk free interest rate (%)
	float spotPrice = 100.0f;	//! Spot price (at t = 0)

	//! Market volatility (calculated from ml_data.csv)
	float volatility = calcVolatility(spotPrice, timesteps);

#if 0
//Weijie: deleting all output messages ...
	//! Welcome message
	std::cout << "--Welcome to Stockast: Stock Forecasting Tool--\n";
	std::cout << "  Copyright (c) 2017-2019 Rajdeep Konwar\n\n";
	std::cout << "  Using market volatility = " << volatility << std::endl;
	std::cout << "  Have patience! Computing..";
#endif

	int i;
	for (i = 0; i < outLoops; i++)
	{
		for (int j = 0; j < inLoops; j++)
			stock[j] = runBlackScholesModel(spotPrice, timesteps, riskRate, volatility);

		avgStock[i] = find2DMean(stock, inLoops, timesteps);
	}
	optStock = find2DMean(avgStock, outLoops, timesteps);

//Weijie: deleting file output
#if 0
	std::ofstream fp;
	fp.open("opt.csv", std::ofstream::out);
	if (!fp.is_open())
	{
		std::cerr << "Couldn't open opt.csv! Exiting..\n";
		return EXIT_FAILURE;
	}

	for (i = 0; i < timesteps; i++)
		fp << optStock[i] << "\n";
	fp.close();
#endif

	for (i = 0; i < inLoops; i++)
		delete[] stock[i];
	delete[] stock;

	for (i = 0; i < outLoops; i++)
		delete[] avgStock[i];
	delete[] avgStock;

	delete[] optStock;
#if 0
	t = clock() - t;
	std::cout << " done!\n  Time taken = " << static_cast<float>(t / CLOCKS_PER_SEC) << "s";
	getchar();
#endif
	//Weijie: test
	//std::cout << "done\n";
	return EXIT_SUCCESS;
}
