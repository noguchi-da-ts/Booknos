$(document).on('click', '#isbn_submit_button', function (){
  let isbn = $('#isbn_form').val();
  isbn = normalizationIsbn(isbn);

  if ( isbn != '' ) {
    console.log(`入力されたISBN: ${isbn}`);
    $.ajax({
      type: "GET",
      url: "/books/ajax_book_register",
      data: { 
        isbn_code: isbn
      }
    }).done(function(html) {
      $('#book_search_result').html(html);
    });
  } else {
    $('#book_search_result')
      .html(`<div style=\"margin-top: 2vh;\">\
                <strong style=\"font-size: 3vh;\">\
                  ※ISBNコードのチェックに引っかかりました。\
                  <br/>\
                  もう一度入力してください。\
                </strong>\
              </div>`);
  }
  
});

function normalizationIsbn(isbn) {
  isbn = isbn.replace(/\D/g, '');
  isbn = isbn.replace(/[Ａ-Ｚａ-ｚ０-９]/g, function(s) {
    return String.fromCharCode(s.charCodeAt(0) - 0xFEE0);
  });
  return isbn
}
