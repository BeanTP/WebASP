var cart = {
    init: function () {
        cart.regEvents();
    },
    regEvents: function () {
        $('#continueBtn').off('click').on('click', function () {
            window.location.href = "/products/all";
        });
        $('#updateBtn').off('click').on('click', function () {
            var listProduct = $('.quantity-select');
            var cartList = [];
            $.each(listProduct, function (i, item) {
                cartList.push({
                    Quantity: $(item).val(),
                    product: {
                        id: $(item).data('id')
                    }
                });
            });
            $.ajax({
                url: '/Cart/UpdateItem',
                data: { cartModel: JSON.stringify(cartList) },
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = '/cart';
                    }
                }
            });
        });
    }
}
cart.init();