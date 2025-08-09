function showAll()
 {
    var items = document.querySelectorAll('.product');

    items.forEach(function (item) 
    {
        item.classList.remove('hidden');
    }
     );
}

function filterCategory(category) 
{
    var items = document.querySelectorAll('.product');

    items.forEach(function (item)
     {
        if (item.classList.contains(category)) 
        {
            item.classList.remove('hidden');
        } 
        else
         {
            item.classList.add('hidden');
        }
    }
    );
}