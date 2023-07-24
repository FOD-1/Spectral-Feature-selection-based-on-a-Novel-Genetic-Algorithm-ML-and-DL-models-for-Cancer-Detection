# Spectral-Feature-selection-based-on-a-Novel-Genetic-Algorithm-ML-and-DL-models-for-Cancer-Detection

## Aim
The goal of this project is to develop an efficient method that just select the relevant spectral features in order to perform the classification of endometrial (EC) and ovarian (OC) cancers.

## Project Overview
This repository contains the implementation of a novel genetic algorithm with a novel crossover operation based on logic OR for spectral feature selection for endometrial and ovarian cancers detection. Several ML and DL models are used as fitness evaluators to evaluate the fitness of the selected spectral features.

## Dataset Description
The dataset that was used in this method consists of 30 urine samples collected from 10 healthy individuals, 10 individuals with EC, and 10 individuals with OC. Each urine sample has 10 FTIR spectra, totaling 300 spectra in the dataset. The dataset is available online and can be found on https://figshare.com/articles/dataset/Potential_of_mid-infrared_spectroscopy_as_a_non-invasive_diagnostic_test_for_endometrial_or_ovarian_cancer_in_urine/5929516/1

For this project, the wavenumber information was removed from the data and the spectra of EC and OC were separated and combined with healthy ones in order to perform binary classification. 

## Usage
To run the genetic algorithm feature selection code, follow these steps:

1. Prepare your input data in csv or xlsx or mat formats. Your label column should be categorical
2. Open `Main.m` and modify the parameters such as population size (Nindiv), number of generations (maxIter), crossover type, selection Type, classifier etc., as per your requirements.
3. Run the script:
4. The program will output the best feature subset found and any additional results or evaluation metrics, depending on your implementation.

## Algorithm Description
The binary genetic algorithm used in this project follows the following steps:
1. **CreatePopulation**: Generate an initial population of candidate feature subsets.
2. **objfunction**: Assess the fitness of each candidate solution based on a specified evaluation metric. Here accuracy is implemented
3. **Selection**: Choose the best-performing individuals as parents for the next generation, with a higher probability for fitter individuals.
4. **Crossover**: Combine pairs of parents to create offspring using a crossover operator (e.g., one-point crossover, uniform crossover(Using LOGIC OR proposed by us)).
5. **Termination**: Repeat steps 2-4 for a specified number of generations or until a termination criterion is met (e.g., convergence).
