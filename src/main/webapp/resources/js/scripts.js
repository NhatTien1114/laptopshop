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

    // === Product Detail page: sync +/- buttons with hidden quantity input ===
    var detailInput = document.querySelector('input[data-cart-detail-index]');
    if (detailInput) {
        var hiddenQty = document.getElementById('cartDetails0.quantity');
        var container = detailInput.closest('.input-group');

        container.querySelector('.btn-plus').addEventListener('click', function() {
            var val = parseInt(detailInput.value) || 1;
            detailInput.value = val + 1;
            if (hiddenQty) hiddenQty.value = val + 1;
        });

        container.querySelector('.btn-minus').addEventListener('click', function() {
            var val = parseInt(detailInput.value) || 1;
            if (val > 1) {
                detailInput.value = val - 1;
                if (hiddenQty) hiddenQty.value = val - 1;
            }
        });

        detailInput.addEventListener('change', function() {
            var val = parseInt(detailInput.value);
            if (isNaN(val) || val < 1) val = 1;
            detailInput.value = val;
            if (hiddenQty) hiddenQty.value = val;
        });
    }

    // === Cart page: +/- buttons ===
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

// handle filter products
$(document).ready(function() {

    // === Pre-populate checkboxes and sort radio from URL params on page load ===
    var params = new URLSearchParams(window.location.search);

    var factoryVal = params.get('factory');
    if (factoryVal) {
        factoryVal.split(',').forEach(function(v) {
            $('#factoryFilter .form-check-input[value="' + v + '"]').prop('checked', true);
        });
    }

    var targetVal = params.get('target');
    if (targetVal) {
        targetVal.split(',').forEach(function(v) {
            $('#targetFilter .form-check-input[value="' + v + '"]').prop('checked', true);
        });
    }

    var priceVal = params.get('price');
    if (priceVal) {
        priceVal.split(',').forEach(function(v) {
            $('#priceFilter .form-check-input[value="' + v + '"]').prop('checked', true);
        });
    }

    var sortVal = params.get('sort');
    if (sortVal) {
        $('input[name="radio-sort"][value="' + sortVal + '"]').prop('checked', true);
    }

    // === Filter button: collect checked values and navigate to filtered URL ===
    $('#btnFilter').click(function() {
        var factoryArr = [];
        var targetArr = [];
        var priceArr = [];

        $('#factoryFilter .form-check-input:checked').each(function() {
            factoryArr.push($(this).val());
        });

        $('#targetFilter .form-check-input:checked').each(function() {
            targetArr.push($(this).val());
        });

        $('#priceFilter .form-check-input:checked').each(function() {
            priceArr.push($(this).val());
        });

        var sortValue = $('input[name="radio-sort"]:checked').val();

        var currentUrl = new URL(window.location.href);
        var searchParams = currentUrl.searchParams;

        searchParams.set('page', '1');

        searchParams.delete('factory');
        searchParams.delete('target');
        searchParams.delete('price');
        if (sortValue) {
            searchParams.set('sort', sortValue);
        } else {
            searchParams.delete('sort');
        }

        if (factoryArr.length > 0) {
            searchParams.set('factory', factoryArr.join(','));
        } else {
            searchParams.delete('factory');
        }

        if (targetArr.length > 0) {
            searchParams.set('target', targetArr.join(','));
        } else {
            searchParams.delete('target');
        }

        if (priceArr.length > 0) {
            searchParams.set('price', priceArr.join(','));
        } else {
            searchParams.delete('price');
        }

        window.location.href = currentUrl.toString();
    });

    // === Pagination: preserve filter params when navigating pages ===
    $('.pagination a').on('click', function(e) {
        var href = $(this).attr('href');
        if (!href || href === 'javascript:void(0)') return;
        e.preventDefault();
        var linkUrl = new URL(href, window.location.origin);
        var currentParams = new URLSearchParams(window.location.search);
        ['factory', 'target', 'price', 'sort'].forEach(function(param) {
            var val = currentParams.get(param);
            if (val) {
                linkUrl.searchParams.set(param, val);
            }
        });
        window.location.href = linkUrl.toString();
    });

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