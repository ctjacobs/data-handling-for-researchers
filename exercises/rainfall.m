function [t, m] = rainfall(filename, n)
   % Reads in a rainfall data file with name 'filename' and 'n' rows (excluding header lines)
   % and returns the years in an array 't', and the mean rainfall for each year in an array 'm'.
   T = zeros([n, 1]); % Used to store the years.
   A = zeros([n, 12]); % Used to store the rainfall data for each month in each year.
   k = 0;
   
   data_file = fopen(filename, 'r'); % Open the data file for reading
   line = fgets(data_file);
   while ischar(line)
      s = strsplit(line);
      if(s{1} ~= '#') % We'll ignore any header lines.
         k = k + 1;
         T(k) = str2num(s{1}); % The current year under consideration
         for l=2:13, % Loop over the 'month' columns
            A(k, l-1) = str2num(s{l}); % Record the rainfall value for month 'l-1' in year 'k'.
         end
      end
      line = fgets(data_file); % Move onto the next line
   end
   fclose(data_file); % Close the data file once we've finished with it.

   t = T;
   m = mean(A, 2);

end

