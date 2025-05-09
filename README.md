# Walmart Sales Data Analysis

This project explores sales data from Walmart stores to uncover key business insights. It involves cleaning the data, performing exploratory data analysis (EDA), and visualizing trends to help understand sales performance across different branches, products, and timeframes.

## Repository Structure

```
├── project.ipynb              # Main Jupyter notebook with analysis
├── Walmart.csv                # Original Walmart sales dataset
├── Walmart_cleaned.csv        # Cleaned version of the dataset
├── walmart.sql                # SQL file for database queries (optional)
├── Requirements.txt           # Python package dependencies
├── README.md                  # Project documentation
├── .gitignore                 # Files/folders to ignore in Git
└── .venv/                     # Virtual environment (ignored)
```

## Project Objectives

- Clean and preprocess the raw Walmart sales data
- Perform descriptive analysis to understand key metrics
- Explore patterns in sales by branch, product line, gender, and date
- Visualize findings using Python libraries

## Key Insights

- Top-performing product lines and branches
- Sales distribution across days of the week and months
- Customer demographics and purchasing trends

## Technologies Used

- Python (Pandas, NumPy, Matplotlib, Seaborn)
- Jupyter Notebook
- SQL
- Git and GitHub

## Getting Started

1. Clone the repository:

   ```
   git clone git@github.com:Sub-rat987/Walmart_Sales_Data_Analysis.git
   cd Walmart_Sales_Data_Analysis
   ```

2. Create and activate a virtual environment:

   ```
   python -m venv .venv
   source .venv/bin/activate        # On Windows: .venv\Scripts\activate
   ```

3. Install dependencies:

   ```
   pip install -r Requirements.txt
   ```

4. Open the Jupyter notebook:

   ```
   jupyter notebook project.ipynb
   ```

## To-Do / Future Work

- Predictive modeling for future sales
- Dashboard development with Plotly or Dash
- Enhanced SQL integration

## License

This project is licensed under the MIT License.

## Acknowledgements

Data source: Public Walmart sales dataset  
Developed and maintained by [Sub-rat987](https://github.com/Sub-rat987)
