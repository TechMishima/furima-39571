function price (){

  const price= document.getElementById("item-price")
  const tax = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  price.addEventListener('change', function(){
    let priceValue = parseInt(price.value, 10)
    let taxValue = Math.floor(priceValue * 0.1)
    tax.innerHTML = taxValue

    let profitValue = Math.floor(priceValue - taxValue)
    profit.innerHTML = profitValue
  })



}

window.addEventListener('turbo:load', price)