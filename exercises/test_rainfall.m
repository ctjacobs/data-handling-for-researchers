[t, m] = rainfall('regression_data.txt', 5);

assert(m(1) == 6.5, 'Regression test for year 1 failed')
assert(m(2) == 0.0, 'Regression test for year 2 failed')
assert(m(3) == -6.5, 'Regression test for year 3 failed')
