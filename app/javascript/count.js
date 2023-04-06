function count (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const addTaxPrice = document.getElementById('add-tax-price');
    const profit =  document.getElementById("profit");
    const profitPrice = itemPrice.value;
    const tax = Math.floor(profitPrice * 0.1);
    addTaxPrice.innerHTML = `${tax}`;
    profit.innerHTML = `${profitPrice - tax}`;
  });
};

window.addEventListener('load', count);
