# Liqour_Price_Data_Analytics
R Shiny Application for visualization of basic analysis

The dataset used in this application contains information about all the products sold be **BC Liquor Store** and is publicly available in csv format on [this](https://www.opendatabc.ca/dataset/bc-liquor-store-product-price-list-current-prices) website. This data is pretty much clean, but I have carried out some preprocessing.

In this application data is summarised, according to user input, using dplyr and plotly library is used to plot some basic graphs. Htmlwidget DT DataTable is also used to provide better control of the table. Some Javascript functions are also used to provide different colors to graphs.

**Future agenda includes :**
1. Show this data on world map using leaflet library
2. Using tree library to show some hierarchical structure


*To run the app directly from RStudio use*   
shiny::runGitHub("Liqour_Price_Data_Analytics", "sameer-sinha")
