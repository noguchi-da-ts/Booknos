$(document).ready(function (){
  console.log('本の登録機能');
});

$(document).on('click', '#isbn_submit_button', function (){
  const $isbn = $('#isbn_form').val();

  console.log(`入力されたISBN: ${$isbn}`);
  $.ajax({
    type: "GET",
    url: "/books/ajax_book_register",
    data: { 
      isbn_code: $isbn
    }
  }).done(function(html) {
    $('#book_search_result').html(html);
  });
});
