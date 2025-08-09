    let cart = [];

        window.onload = function () {
            cart = JSON.parse(localStorage.getItem('cart')) || [];
            renderCart();
        };

        function renderCart() {
            const container = document.getElementById('cart-items');
            const infoSection = document.getElementById('cart-info-section');
            container.innerHTML = '';
            let total = 0;

            if (cart.length === 0) {
                container.innerHTML = '<tr><td colspan="3" class="cart-empty-message">Your cart is empty. Add some products before proceeding.</td></tr>';
                document.getElementById('total-price').textContent = '0';
                infoSection.style.display = 'none';
                return;
            }

            cart.forEach((item, index) => {
                const row = document.createElement('tr');
                row.innerHTML = `
          <td>${item.name}</td>
          <td>₹ ${item.price}</td>
          <td><button class="remove-btn" onclick="removeItem(${index})">Remove</button></td>
        `;
                container.appendChild(row);
                total += item.price;
            });

            document.getElementById('total-price').textContent = total;
            infoSection.style.display = 'block';
        }

        function removeItem(index) {
            cart.splice(index, 1);
            localStorage.setItem('cart', JSON.stringify(cart));
            renderCart();
        }

        function buyNow() {
            const email = document.getElementById('email').value.trim();
            const phone = document.getElementById('phone').value.trim();
            const address = document.getElementById('address').value.trim();

            if (cart.length === 0) {
                alert("Your cart is empty! Add products first.");
                return;
            }

            if (!email || !phone || !address) {
                alert("Please fill in all the details (email, phone, address).");
                return;
            }

            generatePDFBill(email, phone, address);
            document.getElementById('thankYouModal').style.display = 'flex';

            // Clear the cart immediately
            localStorage.removeItem('cart');

            // Refresh to cart page after 3.5 seconds
            setTimeout(() => {
                window.location.href = window.location.href; // reloads the cart page
            }, 2500);
        }


        async function generatePDFBill(email, phone, address) {
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF();

            doc.setFontSize(18);
            doc.text("Ele-x Purchase Invoice", 20, 20);

            doc.setFontSize(12);
            doc.text(`Email: ${email}`, 20, 35);
            doc.text(`Phone: ${phone}`, 20, 42);
            doc.text("Shipping Address:", 20, 50);
            doc.text(address, 20, 58);

            doc.text("Purchased Items:", 20, 75);
            let y = 85;
            let total = 0;
            cart.forEach(item => {
                doc.text(`- ${item.name} | ₹ ${item.price}`, 25, y);
                y += 7;
                total += item.price;
            });

            doc.setFontSize(14);
            doc.text(`Total: ₹ ${total}`, 20, y + 10);

            doc.save("Ele-x_Invoice.pdf");
        }