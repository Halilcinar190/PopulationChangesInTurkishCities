function [] = CmprPopulationChangeRate(string_years,selected_cities_names,change_rates)

bar(string_years,change_rates)

legend(selected_cities_names)
xlabel("Years");
ylabel("Change Rates");
grid("on");
title("Comparision of Population Change Rates By Year")
end