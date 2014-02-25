T = zeros([102, 1]); % Used to store the years.
A = zeros([102, 12]); % Used to store the rainfall data for each month in each year.
k = 0;

data_file = fopen('UK.txt', 'r'); % Open the data file for reading
line = fgets(data_file);
while ischar(line)
   s = strsplit(line, ' ', true);
   if(s{1} ~= '#') % We'll ignore any header lines.
      if(str2num(s{1}) ~= 2013) % Also ignore the year 2013, since rainfall data is not available for some months in 2013.
         k = k + 1;
         T(k) = str2num(s{1}); % The current year under consideration
         for l=2:13, % Loop over the 'month' columns
            A(k, l-1) = str2num(s{l}); % Record the rainfall value for month 'l-1' in year 'k'.
         end
      end
   end
   line = fgets(data_file); % Move onto the next line
end
fclose(data_file); % Close the data file once we've finished with it.

figure(1)
plot(T, mean(A, 2)) % Plot the mean rainfall each year.
axis([1900 2020 60 120])
title('Mean rainfall each year. Data obtained from the Met Office.')
xlabel('Year')
ylabel('Rainfall in mm')

print(1, 'rainfall_plot.png', '-dpng')
