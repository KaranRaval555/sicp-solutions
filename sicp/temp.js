const fact = (n) => {
  let result = 1;
  for (let i = 2; i <= n; i++) {
    result *= i;
  }
  return result;
};
const pascal = (n, r) => fact (n) / (fact (r) * fact (n - r));
console.log(pascal (87, 28))
