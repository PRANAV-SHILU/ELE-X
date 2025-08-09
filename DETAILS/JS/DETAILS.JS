
// function goBack() {
//     history.back();
// }

// // Image switch function
// function switchImage(element) {
//     var mainImage = document.getElementById('mainImage');
//     mainImage.src = element.src;
//     mainImage.alt = element.alt;
// }

// // Review form submission
// document.getElementById('reviewForm').addEventListener('submit', function (e) {
//     e.preventDefault();

//     this.reset();
//     document.getElementById('successMessage').style.display = 'block';


// });

document.addEventListener('DOMContentLoaded', function () 
{
    var form = document.getElementById('reviewForm');
    var successMessage = document.getElementById('successMessage');

    if (form && successMessage) 
    {
        form.addEventListener('submit', function (e) 
        {
            e.preventDefault();

            form.reset();
            successMessage.style.display = 'block';

            setTimeout(function () 
            {
                successMessage.style.display = 'none';
            }, 3000);
        });
    }
});

function goBack() 
{
    history.back();
}

function switchImage(element) 
{
    var mainImage = document.getElementById('mainImage');
    mainImage.src = element.src;
    mainImage.alt = element.alt;
}
