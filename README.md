# Mapping with R Workshop

Materials for the [Mapping with R workshop](https://www.meetup.com/rladies-st-louis/events/313055670/) presented at R-Ladies St. Louis.

This workshop covers how to work with geospatial data in R, from understanding spatial data structures to creating publication-quality maps. Slides are built with [Quarto](https://quarto.org/) using the `rfortherestofus-slides-revealjs` format.

## Slide Decks

### 1. Simple Features Data (`slides-sf-data.qmd`)

An introduction to the {sf} package and the simple features data model. Covers:

- The six core geometry types: `POLYGON`, `POINT`, `LINESTRING`, `MULTIPOLYGON`, `MULTIPOINT`, and `MULTILINESTRING`
- Dimensions (XY, Z, M)
- Bounding boxes
- Coordinate Reference Systems (CRS) and reprojection with `st_transform()`
- The `geometry` column and how spatial data differs from regular tabular data

### 2. Accessing Raw Geospatial Data (`slides-accessing-raw-geospatial-data.qmd`)

How to import geospatial data files into R using the {sf} package. Covers:

- ESRI Shapefile format (`.shp`, `.shx`, `.dbf`, and companion files)
- GeoJSON format
- Other geospatial data formats
- Importing all formats with `read_sf()`

### 3. Accessing Geospatial Data Through Packages (`slides-accessing-geospatial-data-through-packages.qmd`)

How to download geospatial data directly in R without downloading raw files. Covers:

- **Global data**: {rnaturalearth} and {rgeoboundaries} for country boundaries at varying administrative levels
- **US data**: {tigris} for Census geographies (states, counties, etc.) and {tidycensus} for Census/ACS data with geometry attached
- Setting up a Census API key

### 4. Geocoding (`slides-geocoding.qmd`)

How to convert addresses into geographic coordinates using the {tidygeocoder} package. Covers:

- Geocoding a single address string
- Geocoding with separate address component columns (street, city, state, postal code, country)
- Converting geocoded results to {sf} objects with `st_as_sf()`
- Using different geocoding services/methods (default Nominatim vs. LocationIQ)

### 5. Mapping with ggplot (`slides-mapping-with-ggplot.qmd`)

An introduction to making static maps with {ggplot2} and `geom_sf()`. Covers:

- Fetching data from {tidycensus} (language spoken at home by county)
- Plotting spatial data with `geom_sf()`
- Shifting Alaska and Hawaii with `shift_geometry()` from {tigris}
- Mapping fill aesthetics to data values

### 6. Making Choropleth Maps with ggplot (`slides-choropleth-maps.qmd`)

How to create polished choropleth maps. Covers:

- Applying color scales with `scale_fill_viridis_c()`
- Removing visible county borders by matching fill and color aesthetics
- Adjusting legend size, position, and formatting
- Adding titles and using `scales::percent_format()` for readable legend labels

### 7. Making Dot and Bubble Maps with ggplot (`slides-dot-and-bubble-maps.qmd`)

How to create dot and bubble maps to show point data. Covers:

- **Dot maps**: plotting point geometries on top of polygon base layers
- **Bubble maps**: scaling point size to a numeric variable with `aes(size = ...)` and `scale_size_continuous()`
- Working with centroids (`st_centroid()`)

### 8. Learn More (`slides-learn-more.qmd`)

A resources slide pointing to books and references for further learning:

- [Data Visualization: A Practical Introduction](https://socviz.co/07-maps.html) by Kieran Healy
- [Analyzing US Census Data](https://walker-data.com/census-r/) by Kyle Walker
- [RSpatial Data](https://rspatialdata.github.io/)
- [Spatial Statistics for Data Science](https://www.paulamoraga.com/book-spatial/) by Paula Moraga
- [Geocomputation with R](https://r.geocompx.org/)

## Packages Used

- {sf} — reading, writing, and manipulating spatial data
- {ggplot2} — static map visualization
- {mapview} — quick interactive maps
- {tidycensus} — US Census and ACS data with geometry
- {tigris} — US Census geographic boundaries
- {rnaturalearth} — global country boundaries
- {rgeoboundaries} — global administrative boundaries
- {tidygeocoder} — address geocoding
- {scales} — formatting helpers for ggplot legends
