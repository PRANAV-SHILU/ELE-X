
var availableCoupons =
{
    "ELE-X50": "50% discount applied!",
    "MEGADEAL20": "20% discount applied!",
    "SPECIAL70": "70% discount applied!",
    "SUPER10": "10% discount applied"
};

function applyCoupon() {
    var couponCode = document.getElementById("couponInput").value.trim().toUpperCase();
    var messageElement = document.getElementById("message");

    if (couponCode in availableCoupons) {
        messageElement.innerHTML = `<span style="color: #ffcc00;">✅ ${availableCoupons[couponCode]}</span>`;
    }
    else {
        messageElement.innerHTML = `<span style="color: red;">❌ Invalid or Expired Coupon</span>`;
    }
}

function copyCoupon(code) {
    navigator.clipboard.writeText(code);
    alert("Coupon Code " + code + " copied!");
}

