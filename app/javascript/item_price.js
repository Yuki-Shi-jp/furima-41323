window.addEventListener('turbo:load', () => {
  console.log("OK");
  const priceInput = document.getElementById("item-price");
  if (priceInput) { 
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      console.log(inputValue);

      const addTaxDom = document.getElementById("add-tax-price");
      const profitDom = document.getElementById("profit");

      if (addTaxDom && profitDom) { // 両方の要素が存在するか確認

        // 数値のみの入力を許可するためのチェック
        const numericValue = parseFloat(inputValue);
        if (!isNaN(numericValue)) {
          // 入力値を元に販売手数料を計算 (例えば10%の手数料)
          const fee = numericValue * 0.1;
          const roundedFee = Math.floor(fee); // Math.floorで切り捨て

          // 販売利益の計算
          const profit = numericValue - roundedFee;

          const formattedFee = roundedFee.toLocaleString(); 
          const formattedProfit = profit.toLocaleString();

          // 結果の表示
          addTaxDom.innerHTML = `${formattedFee}`;
          profitDom.innerHTML = `${formattedProfit}`;
        } else {
          addTaxDom.innerHTML = '';
          profitDom.innerHTML = '';
        }
      }
    });
  }
});