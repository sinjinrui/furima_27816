$(function(){
  $(".price-input").on('keyup', function(){
    let price = $(this).val();
    let fee = Math.floor(price / 10)
    let profit = price - fee

    if ($.isNumeric(price)) {
      $("#add-tax-price").html(fee.toLocaleString()).css('color', 'black');
      $("#profit").html(profit.toLocaleString()).css('color', 'black');
    } else {
      $("#add-tax-price").html("半角数字のみ入力可能").css('color', 'red');
      $("#profit").html("半角数字のみ入力可能").css('color', 'red');
    }
   
  });
});