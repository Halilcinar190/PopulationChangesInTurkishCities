InitialTable = readtable("il-yil-nufus.csv");

plate_codes = input("Enter The Plate Codes Of The Cities To Compare(e.g.,[1 26 6]): ");
if min(plate_codes) <= 0 || max(plate_codes) > 81
    fprintf("Plate Codes Must Be Between 1-81\n")
    return
end
plate_codes = sort(plate_codes);
selected_city_count = size(plate_codes,2);

input_year = input("Enter years to compare, (e.g., [2014 2024]): ");
if min(input_year) < 2007 || max(input_year) > 2024
    fprintf("Years Must Be Between 2007-2024\n")
    return
end
selected_years = min(input_year) : max(input_year);
year_range = size(selected_years, 2) - 1;

string_years = strings;
for i = 1: year_range
    string_years(i) = strcat(num2str(selected_years(i)), "-" ,num2str(selected_years(i+1)));
end

index_of_selected_years = selected_years - 2007 + 2;

change_of_populations = zeros(selected_city_count, year_range); 
change_rates = zeros(selected_city_count, year_range);


selected_cities_names = InitialTable.Var1(plate_codes,1);
selected_cities_populations = table2array(InitialTable(plate_codes, index_of_selected_years));


for i = 1 : selected_city_count
    for j = 1 : year_range
    
    change_of_populations(i,j) = selected_cities_populations(i,j + 1) - selected_cities_populations(i,j); 
    change_rates(i,j) = (change_of_populations(i,j) / selected_cities_populations(i,j)) * 100; 
    end
end
CmprPopulationChangeRate(string_years, selected_cities_names, change_rates)

