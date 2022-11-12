window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  console.log(priceInput)
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue)
  const addTaxDom = document.getElementById("add-tax-price");
  const ProfitDom = document.getElementById("profit");
  // 販売手数料を計算
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
  // 出品価格-販売手数料
  ProfitDom.innerHTML = inputValue - addTaxDom.innerHTML;
  })
});