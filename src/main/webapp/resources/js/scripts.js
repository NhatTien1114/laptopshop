/*!
 * Start Bootstrap - SB Admin v7.0.7 (https://startbootstrap.com/template/sb-admin)
 * Copyright 2013-2023 Start Bootstrap
 * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-sb-admin/blob/master/LICENSE)
 */
// 
// Scripts
// 

function formatCurrency(value) {
    return '$' + value.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,') + ' đ';
}

function updateCartTotals() {
    let total = 0;
    document.querySelectorAll('input[data-cart-detail-id]').forEach(function(input) {
        const qty = parseInt(input.value);
        const price = parseFloat(input.getAttribute('data-cart-detail-price'));
        const subtotal = price * qty;
        total += subtotal;

        const id = input.getAttribute('data-cart-detail-id');
        const subtotalEl = document.querySelector('[data-cart-detail-subtotal="' + id + '"]');
        if (subtotalEl) {
            subtotalEl.textContent = formatCurrency(subtotal);
        }
    });

    const cartSubtotal = document.getElementById('cartSubtotal');
    const cartTotal = document.getElementById('cartTotal');
    if (cartSubtotal) cartSubtotal.textContent = formatCurrency(total);
    if (cartTotal) cartTotal.textContent = formatCurrency(total);
}

function syncHiddenFormQuantities() {
    const form = document.getElementById('cart');
    if (!form) return;

    document.querySelectorAll('input[data-cart-detail-id]').forEach(function(visibleInput) {
        const cartDetailId = visibleInput.getAttribute('data-cart-detail-id');
        const qty = visibleInput.value;

        form.querySelectorAll('input').forEach(function(hiddenInput) {
            if (hiddenInput.name && hiddenInput.name.match(/cartDetails\[\d+\]\.id/) && hiddenInput.value == cartDetailId) {
                const qtyName = hiddenInput.name.replace('.id', '.quantity');
                const qtyInput = form.querySelector('input[name="' + qtyName + '"]');
                if (qtyInput) {
                    qtyInput.value = qty;
                }
            }
        });
    });
}

document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.btn-plus').forEach(function(btn) {
        btn.addEventListener('click', function() {
            const id = this.getAttribute('data-cart-detail-id');
            const input = document.querySelector('input[data-cart-detail-id="' + id + '"]');
            if (input) {
                input.value = parseInt(input.value) + 1;
                updateCartTotals();
                syncHiddenFormQuantities();
            }
        });
    });

    document.querySelectorAll('.btn-minus').forEach(function(btn) {
        btn.addEventListener('click', function() {
            const id = this.getAttribute('data-cart-detail-id');
            const input = document.querySelector('input[data-cart-detail-id="' + id + '"]');
            if (input) {
                const currentVal = parseInt(input.value);
                if (currentVal > 1) {
                    input.value = currentVal - 1;
                    updateCartTotals();
                    syncHiddenFormQuantities();
                }
            }
        });
    });

    // Handle checkout link - submit form with updated quantities instead of direct navigation
    const checkoutLink = document.querySelector('a[href="/checkout"]');
    if (checkoutLink) {
        checkoutLink.addEventListener('click', function(e) {
            e.preventDefault();
            syncHiddenFormQuantities();
            const form = document.getElementById('cart');
            if (form) {
                form.submit();
            }
        });
    }
});

window.addEventListener('DOMContentLoaded', event => {

    // Toggle the side navigation
    const sidebarToggle = document.body.querySelector('#sidebarToggle');
    if (sidebarToggle) {
        // Uncomment Below to persist sidebar toggle between refreshes
        // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
        //     document.body.classList.toggle('sb-sidenav-toggled');
        // }
        sidebarToggle.addEventListener('click', event => {
            event.preventDefault();
            document.body.classList.toggle('sb-sidenav-toggled');
            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
        });
    }

});