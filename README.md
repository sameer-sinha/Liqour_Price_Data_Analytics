# Liqour_Price_Data_Analytics
R Shiny Application for visualization of basic analysis

# Running the app directly from RStudio   
shiny::runGitHub("Liqour_Price_Data_Analytics", "sameer-sinha")

# Screenshot
<img width="958" alt="liqour price" src="https://user-images.githubusercontent.com/23367652/27272247-3fd14aac-5497-11e7-95f2-14bd121f6f46.png">


# Data Details
The dataset used in this application contains information about all the products sold be **BC Liquor Store** and is publicly available in csv format on [this](https://www.opendatabc.ca/dataset/bc-liquor-store-product-price-list-current-prices) website. This data is pretty much clean, but I have carried out some preprocessing.

# R Packages
In this application data is summarised, according to user input, using dplyr and plotly library is used to plot some basic graphs. Htmlwidget DT DataTable is also used to provide better control of the table. Some Javascript functions are also used to provide different colors to graphs.

# Future agenda 
* Show this data on world map using leaflet library
* Using tree library to show some hierarchical structure
