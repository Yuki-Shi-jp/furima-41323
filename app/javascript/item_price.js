function setUpPriceEventListener() {
  const priceInput = document.getElementById("item-price");

  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      console.log(inputValue);

      const addTaxDom = document.getElementById("add-tax-price");
      const profitDom = document.getElementById("profit");

      if (addTaxDom && profitDom) {
        const numericValue = parseFloat(inputValue);
        if (!isNaN(numericValue)) {
          const fee = numericValue * 0.1;
          const roundedFee = Math.floor(fee); 
          const profit = numericValue - roundedFee;

          const formattedFee = roundedFee.toLocaleString(); 
          const formattedProfit = profit.toLocaleString();

          addTaxDom.innerHTML = `${formattedFee}`;
          profitDom.innerHTML = `${formattedProfit}`;
        } else {
          addTaxDom.innerHTML = '';
          profitDom.innerHTML = '';
        }
      }
    });
  }
}

// turbo:load および turbo:render イベントが発生した時に関数を実行
document.addEventListener("turbo:load", setUpPriceEventListener);
document.addEventListener("turbo:render", setUpPriceEventListener);