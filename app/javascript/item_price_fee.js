function count() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const priceValue = itemPrice.value;
    const priceTax = document.getElementById("add-tax-price");
    priceTax.innerHTML = Math.floor(priceValue * 0.1);
    const priceProfit = document.getElementById("profit");
    priceProfit.innerHTML = Math.ceil(priceValue - (priceValue * 0.1));
  });
}

window.addEventListener("load", count);