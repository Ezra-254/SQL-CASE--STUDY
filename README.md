    Objectives:

Find Museums Open on Sunday and Monday
Identify museums that are open on both days and display their name and city.

Find the Museum with the Longest Operating Hours
Determine which museum has the longest hours on any given day, showing its name, state, and hours open.

Identify the City and Country with the Most Museums
Find the country and city with the highest number of museums.

Most and Least Popular Painting Styles
List the top 3 most popular and 3 least popular painting styles based on frequency.

Paintings Not Displayed in Any Museum
Find all paintings that are not currently displayed in any museum.

    
    Report:
This SQL script addresses various questions around museum operations, artwork trends, and availability:

Museums Open on Sunday and Monday:
The query finds museums that remain open on both Sunday and Monday by linking data from the museum_hours and museum tables. It ensures both days are covered with a HAVING clause, providing a list of museums open at the start and end of the week.

Longest Operating Museum:
By calculating the difference between opening and closing times (converted to timestamps), the query identifies the museum with the longest operating hours, showing which museum offers the most access to visitors on a given day.

City and Country with Most Museums:
This query aggregates museum data by country and city, helping to determine the geographical concentration of museums. It provides valuable insights into where most museums are located, highlighting the cities with the highest museum counts.

Most and Least Popular Painting Styles:
The query helps to identify the most and least popular painting styles by counting how often each style appears in the artist table. The results allow us to understand which styles are in demand and which are less common.

Paintings Not Displayed in Any Museum:
This query finds paintings that aren't being exhibited in any museum by checking for NULL values in the museum_id field of the work table. It helps identify works of art that are still without a place in any museum’s collection.
