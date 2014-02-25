[t, m] = rainfall('UK.txt', 100);

figure(1)
plot(t, m) % Plot the mean rainfall each year.
axis([1900 2020 60 120])
title('Mean rainfall each year. Data obtained from the Met Office.')
xlabel('Year')
ylabel('Rainfall in mm')

print(1, 'rainfall_plot.png', '-dpng')
