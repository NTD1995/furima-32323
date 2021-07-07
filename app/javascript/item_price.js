window.addEventListener('load', () => {
  // console.log("OK");
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitNumber= document.getElementById("profit");
console.log(priceInput);

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
  console.log(addTaxDom);
  profitNumber.innerHTML = Math.floor(inputValue * 0.9)
  console.log(profitNumber);
})
});
