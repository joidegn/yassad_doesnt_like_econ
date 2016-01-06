%# load data
data = csvread('th1.csv');

Y = data(:, 1);
X = data(:, 2:3);

%# Append age squared and prepend vector of ones
X = [ones(rows(X), 1) X X(:, 2).^2./100];

%# define instruments
Z = X(:, 3:4);

%# load header line (R is so much better at this)
fid1 = fopen('th1.csv', 'r');
Header = fgetl(fid1);
fclose(fid1);
%# Convert Header to cell array
Header = regexp(Header, '([^,]*)', 'tokens');
Header = cat(2, Header{:});
