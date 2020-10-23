# Capstone

This project takes a look at a set of lending data from Lending Club. I worked with Marc for this project. We analyzed the data and found that the number of loans really increased after 2013. We also found that the interst rate varied heavily based on grade of the loan. Lastly, we saw that the default and charged off rate could be pretty high for loans.

We took this data and decided to see if we could analyze the data to determine when a loan would default, for the purposes of investment. We cleaned the data first by analyzing each column. duplicates were removed and joint applicant's data was combined with the primary applicant. NaN's were replaced with logical values for that data field. This is in DataCleaning.ipynb

We performed a random tree and xgboost analysis. The models were cross validated and came up with an accuracy of 87% on determining if a person will pay off their loan or be in good standing. The main attributes that influenced this model were interest rate, length of the loan, DTI, and home ownership. This is in MachineLearning.ipynb
